unit XMLSocketStream;
{
    Copyright 2001, Peter Millard

    This file is part of Exodus.

    Exodus is free software; you can redistribute it and/or modify
    it under the terms of the GNU General Public License as published by
    the Free Software Foundation; either version 2 of the License, or
    (at your option) any later version.

    Exodus is distributed in the hope that it will be useful,
    but WITHOUT ANY WARRANTY; without even the implied warranty of
    MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
    GNU General Public License for more details.

    You should have received a copy of the GNU General Public License
    along with Exodus; if not, write to the Free Software
    Foundation, Inc., 59 Temple Place, Suite 330, Boston, MA  02111-1307  USA
}

{$ifdef VER150}
    {$define INDY9}
{$endif}

interface
uses
    XMLTag, XMLStream, PrefController,

    {$ifdef linux}
    QExtCtrls, IdSSLIntercept,
    {$else}

    {$ifdef INDY9}
    IdIOHandlerSocket,
    {$endif}
    Windows, ExtCtrls, IdSSLOpenSSL,

    {$endif}

    IdTCPConnection, IdTCPClient, IdException, IdThread, IdSocks,
    SysUtils, SyncObjs;

type

    TSSLVerifyError = (SVE_NONE, SVE_CNAME, SVE_NOTVALIDYET, SVE_EXPIRED);

    TSocketThread = class;
    TXMLSocketStream = class(TXMLStream)
    private
        _socket:    TidTCPClient;
        _sock_lock: TCriticalSection;
        {$ifdef Linux}
            _ssl_int: TIdSSLConnectionIntercept;
        {$else}
            {$ifdef INDY9}
            _ssl_int: TIdSSLIOHandlerSocket;
            _socks_info: TIdSocksInfo;
            _iohandler: TIdIOHandlerSocket;
            {$else}
            _ssl_int: TIdConnectionInterceptOpenSSL;
            _socks_info: TObject;
            {$endif}
        {$endif}
        _ssl_check: boolean;
        _ssl_ok:    boolean;
        _timer:     TTimer;
        _profile:   TJabberProfile;
        _ssl_cert:  string;
        _ssl_err:   string;

        procedure Keepalive(Sender: TObject);
        procedure KillSocket();

        procedure _setupSSL();

        {$ifdef INDY9}
        procedure _connectIndy9();
        {$elseif Linux}
        procedure _connectLinux();
        {$else}
        procedure _connectIndy8();
        {$ifend}

    protected
        // TODO: make this a real event handler, so that other subclasses
        // know how to get these events more explicitly.
        procedure MsgHandler(var msg: TJabberMsg); message WM_JABBER;

        {$ifdef INDY9}
        function VerifyPeer(Certificate: TIdX509): TSSLVerifyError;
        {$endif}

    public
        constructor Create(root: String); override;
        destructor Destroy; override;

        procedure Connect(profile: TJabberProfile); override;
        procedure Send(xml: Widestring); override;
        procedure Disconnect; override;
        function  isSSLCapable(): boolean; override;
        procedure EnableSSL(); override;

    end;


    TSocketThread = class(TParseThread)
    private
        _socket: TidTCPClient;
        _stage: integer;
        _data: WideString;
        _remain_utf: string;
    protected
        procedure Run; override;
        procedure Sock_Connect(Sender: TObject);
        procedure Sock_Disconnect(Sender: TObject);
    public
        // I don't think this needs reintroduce.
        constructor Create(strm: TXMLStream; Socket: TidTCPClient; root: string);

        procedure DataTerminate (Sender: TObject);
        {$ifdef INDY9}
        procedure GotException (Sender: TIdThread; E: Exception);
        procedure StatusInfo(info: string);
        {$else}
        procedure GotException (Sender: TObject; E: Exception);
        {$endif}
        procedure SSLGetPassword(var Password: string);

end;
implementation

uses
    {$ifdef INDY9}
    HttpProxyIOHandler, IdSSLOpenSSLHeaders, 
    {$endif}
    Session, StrUtils, Classes;

var
    _check_ssl: boolean;

{---------------------------------------}
{---------------------------------------}
{---------------------------------------}
{$ifdef linux}
function checkSSL(): boolean;
begin
    Result := true;
end;
{$else}
function checkSSL(): boolean;
var
    c, s: THandle;
begin
    if (not _check_ssl) then begin
        c := LoadLibrary('libeay32.dll');
        s := LoadLibrary('ssleay32.dll');

        Result := ((c > 0) and (s > 0));

        FreeLibrary(c);
        FreeLibrary(s);

        if (Result) then
            _check_ssl := true;
    end
    else
        Result := _check_ssl;
end;
{$endif}


{---------------------------------------}
{      TSocketThread Class              }
{---------------------------------------}
constructor TSocketThread.Create(strm: TXMLStream; Socket: TidTCPClient; root: string);
begin
    inherited Create(strm, root);
    _Socket := Socket;
    _Socket.OnConnected := Sock_Connect;
    _Socket.OnDisconnected := Sock_Disconnect;

    OnException := GotException;
    OnTerminate := DataTerminate;

    _Stage := 0;
    _Data := '';
end;

{---------------------------------------}
procedure TSocketThread.DataTerminate(Sender: TObject);
begin
    // destructor for the thread
    ThreadCleanUp();
end;


{---------------------------------------}
procedure TSocketThread.Run;
var
    l, i, bytes: longint;
    inp, utf: string;
    buff: WideString;
begin
    {
    This procedure gets run continuously, until
    the the thread is told to stop.

    Read stuff from the socket and feed it into the
    parser.
    }
    if (Self.Terminated) then exit;

    if _Stage = 0 then begin
        // try to connect
        if (_socket.Connected) then
            _Socket.Disconnect();

        try
            _Socket.Connect;
        except
            _socket := nil;
            doMessage(WM_DISCONNECTED);
            Self.Terminate();
            exit;
        end;

        {
        If we successfully connect, change the stage of the
        thread so that we switch to reading the socket
        instead of trying to connect.

        If we can't connect, an exception will be thrown
        which will cause the GotException method of the
        thread to fire, since we don't have to explicitly
        catch exceptions in this thread.
        }
        _Stage := 1;
    end
    else begin
        // Read in the current buffer, yadda.
        if (_socket = nil) then
            Self.Terminate
        else if not _Socket.Connected then begin
            _socket.CheckForGracefulDisconnect(false);
            if (not _socket.ClosedGracefully) then begin
                _socket := nil;
                doMessage(WM_COMMERROR);
            end
            else begin
                _socket := nil;
                doMessage(WM_DISCONNECTED);
            end;
            Self.Terminate;
        end
        else begin
            // Get any pending incoming data
            // utf := _Socket.CurrentReadBuffer;
            _socket.ReadFromStack();
            utf := _socket.InputBuffer.Extract(_socket.InputBuffer.Size);
            if ((_remain_utf) <> '') then begin
                inp := _remain_utf + utf;
                _remain_utf := '';
            end
            else
                inp := utf;

            // look for incomplete UTF chars, anything < $80 is ok
            // to truncate at.
            l := Length(inp);
            i := l;
            while ((i > 0) and (ord(inp[i]) > $80)) do
                dec(i);

            if (i < l) then begin
                _remain_utf := RightStr(inp, l - i);
                inp := LeftStr(inp, i);
            end
            else
                _remain_utf := '';

            buff := UTF8Decode(inp);

            // We are shutting down, or we've got an exception, so just bail
            if ((Self.Stopped) or (Self.Suspended) or (Self.Terminated)) then
                exit;

            bytes := length(buff);
            if bytes > 0 then
                // stuff the socket data into the stream
                // add the raw txt to the indata list
                Push(buff);
        end;
    end;
end;

{---------------------------------------}
procedure TSocketThread.SSLGetPassword(var Password: string);
begin
    Password := '';
end;

{---------------------------------------}
procedure TSocketThread.Sock_Connect(Sender: TObject);
begin
    // Socket is connected, signal the main thread
    doMessage(WM_CONNECTED);
end;

{$ifdef INDY9}
{---------------------------------------}
procedure TSocketThread.StatusInfo(Info: string);
begin
    Debug(Info);
end;
{$endif}

{---------------------------------------}
procedure TSocketThread.Sock_Disconnect(Sender: TObject);
begin
    // Socket is disconnected
end;

{---------------------------------------}
{$ifdef INDY9}
procedure TSocketThread.GotException(Sender: TIdThread; E: Exception);
{$else}
procedure TSocketThread.GotException (Sender: TObject; E: Exception);
{$endif}
var
    se: EIdSocketError;
begin
    // Handle gracefull connection closures
    if _Stage = 0 then begin
        // We can't connect
        _socket := nil;
        if (E is EIdOSSLCouldNotLoadSSLLibrary) then begin
            _Data := 'Failed to load the OpenSSL libraries.';
        end
        else if (E is EIdSocketError) then begin
            se := E as EIdSocketError;
            if (se.LastError = 10060) then begin
                _Data := 'Server not listening on that port.';
                doMessage(WM_TIMEOUT);
                exit;
            end;
            _Data := 'Could not connect to the server.';
        end
        else
            _Data := 'Exception: ' + E.Message;
        doMessage(WM_COMMERROR);
    end
    else begin
        // Some exception occured during Read ops
        _socket := nil;
        if E is EIdConnClosedGracefully then begin
            doMessage(WM_DISCONNECTED);
            exit;
        end;

        if E is EIdSocketError then begin
            se := E as EIdSocketError;
            if se.LastError = 10038 then
                // normal disconnect
                doMessage(WM_DISCONNECTED)
            else begin
                // some other socket exception
                _Data := E.Message;
                doMessage(WM_COMMERROR);
            end;
        end
        else begin
            _Data := E.Message;
            doMessage(WM_COMMERROR);
        end;

        // reset the stage
        _Stage := 0;
    end;
end;

{---------------------------------------}
function LoadCryptoFunc(fceName: string; libhandle: integer): pointer;
begin
    fceName := fceName + #0;
    Result := GetProcAddress(libhandle, @FceName[1]);
end;

{---------------------------------------}
procedure FixIndy9SSL();
var
    libeay: integer;
begin
    // Hack around bugs in Indy9..
    if (@IdSslX509NameHash = nil) then begin
        {$ifdef linux}
        {$else}
        libeay := LoadLibrary('libeay32.dll');
        @IdSslX509NameHash := LoadCryptoFunc('X509_NAME_hash', libeay);
        @IdSslX509Digest := LoadCryptoFunc('X509_digest', libeay);
        @IdSslEvpMd5 := LoadCryptoFunc('EVP_md5', libeay);
        FreeLibrary(libeay);
        {$endif}
    end;
end;


{---------------------------------------}
{---------------------------------------}
{---------------------------------------}
constructor TXMLSocketStream.Create(root: string);
begin
    {
    Create a window handle for sending messages between
    the thread reader socket and the main object.

    Also create the socket here, and setup the callback lists.
    }
    inherited;

    _ssl_int    := nil;
    _ssl_check  := false;
    _ssl_ok     := false;
    _socket     := nil;
    _sock_lock  := TCriticalSection.Create();
    _socks_info := nil;

    _timer := TTimer.Create(nil);
    _timer.Interval := 60000;
    _timer.Enabled := false;
    _timer.OnTimer := KeepAlive;
end;

{---------------------------------------}
destructor TXMLSocketStream.Destroy;
begin
    inherited;
    _timer.Free();
    KillSocket();
    _sock_lock.Free;
end;

{$ifdef INDY9}
function TXMLSocketStream.VerifyPeer(Certificate: TIdX509): TSSLVerifyError;
var
    res : TSSLVerifyError;
    sl  : TStringList;
    i   : integer;
    n   : TDateTime;
    tmps: string;
begin
    _ssl_err := '';
    sl := TStringList.Create();
    sl.Delimiter := '/';
    sl.QuoteChar := #0;
    sl.DelimitedText := Certificate.Subject.OneLine;

    tmps := Lowercase(_profile.server);
    res := SVE_NONE;
    for i := 0 to sl.Count - 1 do begin
        if (Lowercase(sl[i]) = ('cn=' + tmps)) then begin
            _ssl_ok := true;
            break;
        end;
    end;
    sl.Free();

    if (not _ssl_ok) then begin
        res := SVE_CNAME;
        _ssl_ok := false;
        _ssl_err := 'Certificate does not match host: ' + Certificate.Subject.OneLine;
    end;

    // TODO: Check issuer of SSL cert?

    n := Now();
    if (n < Certificate.NotBefore) then begin
        res := SVE_NOTVALIDYET;
        _ssl_ok := false;
        _ssl_err := 'Certificate not valid until ' + DateTimeToStr(Certificate.NotBefore);
    end;

    if (n > Certificate.NotAfter) then begin
        res := SVE_EXPIRED;
        _ssl_ok := false;
        _ssl_err := 'Certificate expired on ' + DateTimeToStr(Certificate.NotAfter);
    end;
    Result := res;
end;
{$endif}

{---------------------------------------}
procedure TXMLSocketStream.Keepalive(Sender: TObject);
var
    xml: string;
begin
    // send a keep alive
    if _socket.Connected then begin
        xml := '    ';
        DoDataCallbacks(true, xml);
        try
            _socket.Write(xml);
        except
            on EIdSocketError do Disconnect();
        end;
    end;
end;

{---------------------------------------}
procedure TXMLSocketStream.MsgHandler(var msg: TJabberMsg);
var
    fp, tmps: WideString;
    tag: TXMLTag;
    cert: TIdX509;
begin
    {
    handle all of our funky messages..
    These are window msgs put in the stack by the thread so that
    we can get thread -> mainprocess IPC
    }
    case msg.lparam of
        WM_CONNECTED: begin
            // Socket is connected
            {$ifdef INDY9}
            _local_ip := _socket.Socket.Binding.IP;

            if ((_profile.ssl = ssl_port) and (_profile.SocksType <> proxy_none) and
                (_ssl_int.PassThrough)) then begin
                if (_profile.SocksType = proxy_http) then begin
                    HttpProxyConnect(_iohandler, _profile.ResolvedIP, _profile.ResolvedPort);
                end;

                _ssl_int.PassThrough := false;
            end;

            // Validate here, not in onVerifyPeer
            if ((_profile.ssl = ssl_port) and (_ssl_int <> nil)) then begin
                FixIndy9SSL();
                cert := _ssl_int.SSLSocket.PeerCert;
                if (VerifyPeer(cert) <> SVE_NONE) then begin
                    tag := TXMLTag.Create('ssl');
                    tag.AddCData(_ssl_err);
                    fp := cert.FingerprintAsString;
                    tag.setAttribute('fingerprint', fp);
                    DoCallbacks('ssl-error', tag);
                end;
            end;

            {$else}
            _local_ip := _Socket.Binding.IP;
            {$endif}
            _active := true;
            _timer.Enabled := true;
            DoCallbacks('connected', nil);
        end;

        WM_DISCONNECTED: begin
            // Socket is disconnected
            _active := false;
            KillSocket();
            if (_thread <> nil) then
                _thread.Terminate();
            _timer.Enabled := false;
            _thread := nil;
            DoCallbacks('disconnected', nil);
        end;

        WM_SOCKET: begin
            // We are getting something on the socket
            tmps := _thread.Data;
            if tmps <> '' then
                DoDataCallbacks(false, tmps);
        end;

        WM_XML: begin
            // We are getting XML data from the thread
            if _thread = nil then exit;

            tag := _thread.GetTag;
            if tag <> nil then begin
                DoCallbacks('xml', tag);
            end;
        end;

        WM_TIMEOUT: begin
            // That server isn't listening on that port.
            _active := false;
            KillSocket();
            if _thread <> nil then
                tmps := _thread.Data
            else
                tmps := '';

            // show the exception
            DoDataCallbacks(false, tmps);

            _timer.Enabled := false;
            _thread := nil;
            DoCallbacks('commtimeout', nil);
            DoCallbacks('disconnected', nil);
        end;
            
        WM_COMMERROR: begin
            // There was a COMM ERROR
            _active := false;
            KillSocket();
            if _thread <> nil then
                tmps := _thread.Data
            else
                tmps := '';

            // show the exception
            DoDataCallbacks(false, tmps);

            _timer.Enabled := false;
            _thread := nil;
            DoCallbacks('commerror', nil);
            DoCallbacks('disconnected', nil);
        end;

        WM_DROPPED: begin
            // something dropped our connection
            if (_socket.Connected) then
                _socket.Disconnect();
            _thread := nil;
            _timer.Enabled := false;
        end;

        else
            inherited;
    end;
end;

{---------------------------------------}
procedure TXMLSocketStream._setupSSL();
begin
    with _ssl_int do begin
        SSLOptions.Mode := sslmClient;
        SSLOptions.Method :=  sslvTLSv1;

        // TODO: get certs from profile, that would be *cool*.
        SSLOptions.CertFile := '';
        SSLOptions.RootCertFile := '';

        if (_ssl_cert <> '') then begin
            SSLOptions.CertFile := _ssl_cert;
            SSLOptions.KeyFile := _ssl_cert;
        end;

        // TODO: Add verification options here!
    end;
end;

{---------------------------------------}
{$ifdef INDY9}
procedure TXMLSocketStream._connectIndy9();
var
    hhost: string;
    hport: integer;
begin
    // Setup everything for Indy9 objects
    _ssl_int := nil;
    _socks_info := TIdSocksInfo.Create(nil);
    _iohandler := nil;

    // Let's always use SSL if we can, then we can always do TLS
    if (checkSSL()) then begin
        _ssl_int := TIdSSLIOHandlerSocket.Create(nil);
        if ((_profile.ssl <> ssl_port) or (_profile.SocksType <> proxy_none)) then
            _ssl_int.PassThrough := true;
        _ssl_int.UseNagle := false;
        _setupSSL();
        _iohandler := _ssl_int;
        _ssl_int.OnStatusInfo := TSocketThread(_thread).StatusInfo;
        _ssl_int.OnGetPassword := TSocketThread(_thread).SSLGetPassword;
    end;

    // Create an HTTP Proxy if we need one
    if (_profile.SocksType = proxy_http) then begin
        // no ssl.  we'll have to deal with CONNECT on connect
        if (_iohandler = nil) then
            _iohandler := THttpProxyIOHandler.Create(nil);
    end;

    // Create a default IOHandler if we don't have on yet
    if (_iohandler = nil) then
        _iohandler := TIdIOHandlerSocket.Create(nil);

    // Link our socket to our IOHandler
    _iohandler.UseNagle := false;
    _socket.IOHandler := _iohandler;

    if (_profile.SocksType <> proxy_none) then begin
        // setup the socket to point to the handler..
        // and the handler to point to our SOCKS stuff
        with _socks_info do begin
            case _profile.SocksType of
                proxy_socks4:  Version := svSocks4;
                proxy_socks4a: Version := svSocks4a;
                proxy_socks5:  Version := svSocks5;
            end;

            Authentication := saNoAuthentication;

            if (_profile.SocksType = proxy_http) then begin
                MainSession.Prefs.getHttpProxy(hhost, hport);
                // yes, this is confusing.  If we are doing http connect, and
                // we're doing SSL, then jump through hoops by having the
                // socket connect to the proxy, and don't actually do ssl for now.
                // once the proxy connects us, (manually: see WM_CONNECT),
                // we'll turn on SSL.
                if (_profile.ssl = ssl_port) then begin
                    _socket.Host := hhost;
                    _socket.Port := hport;
                end else begin
                    // if doing http connect, and not ssl, pass the proxy info
                    // in 'correctly'.
                    Host := hhost;
                    Port := hport;
                end;

                if (MainSession.Prefs.getBool('http_proxy_auth')) then begin
                    Authentication := saUsernamePassword;
                    Username := MainSession.Prefs.getString('http_proxy_user');
                    Password := MainSession.Prefs.getString('http_proxy_password');
                end;
            end
            else begin
                Host := _profile.SocksHost;
                Port := _profile.SocksPort;
                if (_profile.SocksAuth) then begin
                    Authentication := saUsernamePassword;
                    Username := _profile.SocksUsername;
                    Password := _profile.SocksPassword;
                end;
            end;
        end;
        _iohandler.SocksInfo := _socks_info;
    end;
end;
{$endif}

{---------------------------------------}
{$ifndef INDY9}
procedure TXMLSocketStream._connectIndy8();
begin
    // Setup everything for Indy8
    if (_profile.ssl = ssl_port) then begin
        _ssl_int := TIdConnectionInterceptOpenSSL.Create(nil);
        _setupSSL();
    end;

    _socket.UseNagle := false;
    _socket.Intercept := _ssl_int;
    _socket.InterceptEnabled := (_profile.ssl = ssl_port);

    if (_profile.SocksType <> proxy_none) then begin
        with _socket.SocksInfo do begin
            case _profile.SocksType of
            proxy_socks4: Version := svSocks4;
            proxy_socks4a: Version := svSocks4a;
            proxy_socks5: Version := svSocks5;
            end;

            Host := _profile.SocksHost;
            Port := _profile.SocksPort;
            Authentication := saNoAuthentication;
            if (_profile.SocksAuth) then begin
                UserID := _profile.SocksUsername;
                Password := _profile.SocksPassword;
                Authentication := saUsernamePassword;
            end;
        end;
    end;
end;
{$endif}

{---------------------------------------}
{$ifdef Linux}
procedure TXMLSocketStream._connectLinux();
begin
    //
    _ssl_int := TIdSSLConnectionIntercept.Create(nil);
end;
{$endif}

{---------------------------------------}
procedure TXMLSocketStream.Connect(profile: TJabberProfile);
begin
    if (_active) then exit;

    _active := true;
    _profile := profile;

    // Not sure we even need this, since we're using ResolvedPort, ResolvedIP
    _server := _profile.Server;

    // Create our socket
    _socket := TIdTCPClient.Create(nil);
    // SUCK, make the recv buffer freaken' gigantic to avoid weird SSL issues
    //_socket.RecvBufferSize := 4096;
    _socket.RecvBufferSize := (1024 * 1024);

    _socket.Port := _profile.ResolvedPort;
    _socket.Host := _profile.ResolvedIP;

    _ssl_cert := _profile.SSL_Cert;

    // Create the socket reader thread and start it.
    // The thread will open the socket and read all of the data.
    _thread := TSocketThread.Create(Self, _socket, _root_tag);

    {$ifdef INDY9}
    _connectIndy9();
    {$elseif Linux}
    _connectLinux();
    {$else}
    _connectIndy8();
    {$ifend}

    _thread.Start;
end;

{---------------------------------------}
function TXMLSocketStream.isSSLCapable(): boolean;
begin
    if (_ssl_int <> nil) then
        Result := _ssl_int.PassThrough
    else
        Result := false;
end;

{---------------------------------------}
procedure TXMLSocketStream.EnableSSL();
var
    fp: Widestring;
    cert: TIdX509;
    tag: TXMLTag;
begin
    if (_ssl_int = nil) then exit;

    if (_ssl_int.PassThrough = false) then
        exit
    else begin
        _ssl_int.PassThrough := false;
        FixIndy9SSL();
        cert := _ssl_int.SSLSocket.PeerCert;
        if (VerifyPeer(cert) <> SVE_NONE) then begin
            tag := TXMLTag.Create('ssl');
            tag.AddCData(_ssl_err);
            fp := cert.FingerprintAsString;
            tag.setAttribute('fingerprint', fp);
            DoCallbacks('ssl-error', tag);
        end;
    end;
end;

{---------------------------------------}
procedure TXMLSocketStream.Disconnect;
begin
    // Disconnect the stream and stop the thread
    _timer.Enabled := false;
    if ((_socket <> nil) and (_socket.Connected)) then begin
        {$ifdef INDY9}
        if (_ssl_int <> nil) then begin
            _ssl_int.PassThrough := true;
        end;
        {$endif}
        _socket.Disconnect();
    end
    else if (_active) then begin
        _active := false;
        if (_thread <> nil) then
            _thread.Terminate;
        _timer.Enabled := false;
        _thread := nil;
    end;
end;

{---------------------------------------}
procedure TXMLSocketStream.KillSocket();
begin
    _sock_lock.Acquire();

    if (_socket <> nil) then begin
        {$ifndef INDY9}
        _socket.InterceptEnabled := false;
        _socket.Intercept := nil;
        {$endif}

        if (_ssl_int <> nil) then
            FreeAndNil(_ssl_int);

        if (_socks_info <> nil) then
            FreeAndNil(_socks_info);

        _socket.Free();
        _socket := nil;
    end;

    _sock_lock.Release();
end;

{---------------------------------------}
procedure TXMLSocketStream.Send(xml: Widestring);
var
    buff: UTF8String;
begin
    // Send this text out the socket
    if (_socket = nil) then exit;

    DoDataCallbacks(true, xml);
    buff := UTF8Encode(xml);
    try
        _Socket.Write(buff);
        _timer.Enabled := false;
        _timer.Enabled := true;
    except
        on E: EIdException do
            _timer.Enabled := false;
    end;
end;

initialization
    _check_ssl := false;

end.