        ��  ��                  v_  4   X M L   D E F A U L T S         0 	        <exodus version="0.9">
  <prefs>

    <!-------------------SYSTEM---------------------->
    
    <auto_start value="0" control="chkAutoStart" state="rw"/>
    <min_start value="0" control="chkStartMin" state="rw"/>
    <debug value="0" control="chkDebug" state="rw"/>
    <autologin value="0" control="chkAutoLogin" state="rw"/>
    <restore_window_state value="1" control="chkSaveWindowState" state="rw"/>
    <restore_desktop value="0" control="chkRestoreDesktop" state="rw"/>
    <start_docked value="1" state="rw"/>

    <!-- Advanced system prefs -->
    <auto_update_url value="http://exodus.googlecode.com/files/exodus-released.exe"/>
    <auto_update_changelog_url value="http://code.google.com/p/exodus/wiki/ChangeLog"/>
    <auto_updates value="1" control="chkAutoUpdate" state="rw"/>
    <window_ontop value="0" control="chkOnTop" state="rw"/>
    <window_toolbox value="0" control="chkToolbox" state="rw"/>
    <close_min value="1" control="chkCloseMin" state="rw"/>
    <single_instance value="1" control="chkSingleInstance" state="rw"/>
    <locale value="Default" state="rw"/>

    <!-- AutoAway Options -->
    <auto_away value="1" control="chkAutoAway" state="rw"/>
    <aa_reduce_pri value="1" control="chkAAReducePri" state="rw"/>
    <auto_xa value="1" control="chkAutoXA" state="rw"/>
    <auto_disconnect value="0" control="chkAutoDisconnect" state="rw"/>
    <away_time value="5" control="txtAwayTime" state="rw">
    	<control name="lblAwayTime"/>
    </away_time>
    <xa_time value="30" control="txtXATime" state="rw">
    	<control name="lblXATime"/>
    </xa_time>
    <disconnect_time value="180" control="txtDisconnectTime" state="rw">
    	<control name="lblDisconnectTime"/>
    </disconnect_time>
    <away_status control="txtAway" state="rw">
      <control name="lblAwayStatus"/>
    </away_status>
    <xa_status control="txtXA" state="rw">
      <control name="lblXAStatus" state="rw"/>
    </xa_status>
    <away_auto_response value="0" control="chkAwayAutoResponse" state="rw"/>

     <!---------------------- ROSTER ------------------------->
    <!-- Roster prefs -->
    <roster_hide_block value="0" control="chkHideBlocked" state="rw"/>
    <inline_status value="0" control="chkInlineStatus" state="rw"/>
    <roster_collapsed value="0" control="chkCollapsed" state="rw"/>
    <displayname_profile_enabled value='1' control="chkUseProfileDN" state="rw"/>
    <roster_groupcounts value="0" control="chkGroupCounts" state="rw"/>
    <roster_only_online value="1" control="chkOnlineOnly" state="rw"/>
    <roster_default value="Friends" control="txtDefaultGrp" state="rw">
      <control name="lblDefaultGrp"/>
    </roster_default>
    <default_nick control="txtDefaultNick" state="rw">
      <control name="lblDefaultNick"/>
    </default_nick>

    <!-- advanced roster prefs -->
    <displayname_profile_map value='{GIVEN} {FAMILY}' control="txtDNProfileMap" state="rw">
    	<control name="lblDNProfileMap"/>
    </displayname_profile_map>
    <inline_color value="$808000" control="cboStatusColor" state="rw">
          <control name="lblStatusColor"/>
    </inline_color>
    <nested_groups value="0" control="chkNestedGrps" state="rw"/>

    <!-- DEPRICATED (unsupported) roster prefs -->
    <roster_avatars value="0" control="chkRosterAvatars" state="inv"/>
    <roster_unicode value="1" control="chkRosterUnicode" state="inv"/>
    <roster_chat value="2" control="cboDblClick" state="inv">
      <control name="lblDblClick"/>
    </roster_chat>
    <roster_show_unsub value="0" control="chkShowUnsubs" state="inv"/>
    <roster_show_pending value="1" control="chkShowPending" state="inv"/>
    <roster_pres_errors  value="0" control="chkPresErrors" state="inv"/>
    <group_seperator value="/" control="txtGrpSeperator" state="inv">
    	<control name="lblGrpSeperator"/>
    </group_seperator>
    <roster_offline_group value="0" control="chkOfflineGrp" state="inv"/>
    <roster_transport_grp value="Transports" control="txtGatewayGrp" state="inv">
      <control name="lblGatewayGrp"/>
    </roster_transport_grp>
    <roster_filter value="2" control="cboVisible" state="inv">
      <control name="lblFilter"/>
    </roster_filter>
    <roster_sort value="0" control="chkSort" state="inv"/>
    <roster_alpha value="0" control="chkRosterAlpha" state="inv"/>
    <roster_alpha_val value="255" control="txtRosterAlpha" state="inv">
      <control name="trkRosterAlpha"/>
    </roster_alpha_val>



    <hotkeys_keys state='rw'/>
    <hotkeys_text state='rw'/>


    <!---------------------- Display Preferences ------------------------->
    <font_name value="Arial"/>
    <font_size value="10"/>
    <font_color value="$000000"/>
    <font_charset value="1"/>
    <font_bold value="0"/>
    <font_italic value="0"/>
    <font_underline value="0"/>
    <color_bg value="$ffffff"/>
    <color_me value="$ff0000"/>
    <color_other value="$0000ff"/>
    <color_time value="$808080"/>
    <color_priority value="$00ff00"/>
    <color_action value="$800080"/>
    <color_server value="$008000"/>
    <roster_bg value="$80000005"/>
    <roster_font_color value="$000000"/>
    <roster_font_size value="10"/>
    <roster_font_charset value="1"/>

    <!-- other display preferences -->
    <msglist_type value="0" control="cboMsgList"/>
    <ie_css value="" control="cboIEStylesheet"/>
    <timestamp value="1" control="chkTimestamp"/>
    <timestamp_format value="h:mm am/pm" control="txtTimestampFmt">
    	<control name="lblTimestampFmt"/>
    </timestamp_format>
    <richtext_enabled value="1" control="chkRTEnabled"/>
    <emoticons value="1" control="chkEmoticons"/>
    <chat_avatars value="0" control="chkChatAvatars"/>
    <show_priority value="1" control="chkShowPriority"/>

    <!-- advanced Display prefs -->
    <richtext_ignored_font_styles value="font-size;font-family;"/>
    <snap_on value="1" control="chkSnap"/>
    <edge_snap value="15" control="txtSnap">
    	<control name="trkSnap"/>
    </edge_snap>
    <warn_closebusy value="1" control="chkBusy"/>
    <chat_memory value="60" control="txtChatMemory">
    	<control name="trkChatMemory"/>
	<control name="lblMem1"/>
	<control name="lblMem2"/>
    </chat_memory>
    <esc_close value="1" control="chkEscClose"/>
    <close_hotkey value="None" control="txtCloseHotkey">
    	<control name="lblClose"/>
    </close_hotkey>

    <emoticon_dlls>
    	<s>msn_emoticons.dll</s>
      	<s>yahoo_emoticons.dll</s>
    </emoticon_dlls>
    <!-- emosettings button keys off of this pref for show state -->
    <custom_icondefs value="custom-icons.xml"/>

    <!-- Message Handling Options -->
    <block_nonroster value="1" control="chkBlockNonRoster" state="rw"/>
    <auto_join_on_invite value="2" control="chkInviteAutoJoin" state="rw"/>
    <s10n_auto_accept value="2" state="rw"/>
    <s10n_auto_add value="1" control="chkIncomingS10nAdd" state="rw"/>

    <!-- deprecated message handling options -->
    <msg_queue value="0" control="chkMsgQueue"/>
    <log value="1" control="chkLog"/>
    <log_rooms value="0" control="chkLogRooms"/>
    <log_roster value="0" control="chkLogRoster"/>
    <log_path control="txtLogPath"/>

    <spool_path control="txtSpoolPath">
      <control name="lblSpoolPath"/>
    </spool_path>

    <invite_treatment value="0" control="cboInviteOptions">
      <control name="lblInviteOptions"/>
    </invite_treatment>

    <msg_treatment value="0" control="cboMsgOptions">
      <control name="lblMsgOptions"/>
    </msg_treatment>

    <queue_offline value="0" control="chkQueueOffline"/>
    <queue_dnd_chats value="0" control="chkQueueDNDChats"/>
    <queue_not_avail value="1" control="chkQueueNotAvail"/>

    <!-- Emoticon Options -->


    <!-- Layouts DEPRICATED -->
    <expanded value="1"/>
    <dock_locked value="0"/>
    <stacked_tabs value="1" control="chkStacked" state="inv"/>

    <event_width value="400"/>
    <roster_width value="215"/>

    <!-- Network Options -->
    <recon_tries value="25" control="txtAttempts">
      <control name="lblAttempts"/>
    </recon_tries>
    <recon_time value="0" control="txtTime">
      	<control name="lblTime"/>
	<control name="lblTime2"/>
        <control name="lblSeconds"/>
    </recon_time>

    <!-- proxy approach is used to set the state of all proxy info -->
    <http_proxy_approach value="0" />
    <http_proxy_auth value="false" control="chkProxyAuth"/>
    <http_proxy_host control="txtProxyHost">
      <control name="lblProxyHost"/>
    </http_proxy_host>
    <http_proxy_port value="8080" control="txtProxyPort">
      <control name="lblProxyPort"/>
    </http_proxy_port>
    <http_proxy_password control="txtProxyPassword">
      <control name="lblProxyPassword"/>
    </http_proxy_password>
    <http_proxy_user control="txtProxyUsername">
      <control name="lblProxyUsername"/>
    </http_proxy_user>

    <!-- Notification Options -->
    <notify_sounds value="0" control="chkSound"/>
    <!-- send notifications if application is active? -->
    <notify_active value="1" control="chkNotifyActive"/>
    <!-- send notifications to currently active form? -->
    <notify_active_win value="0" control="chkNotifyActiveWindow"/>
    <!-- flash taskbar until form receives focus, if flase, flashes N times and stops --> 
    <notify_flasher value="1" control="chkFlashInfinite"/>
    <!-- flash dock manager taskbar until all notified tabs have been seen -->
    <notify_docked_flasher value="0" control="chkFlashTabInfinite"/>
    <!-- actually flash the tab's image until no longer notifying -->
    <notify_tab_flasher value="1"/> <!-- control="chkFlashTabInfinite"/> -->
    
    <!-- types of notifications. This section allows branders to hide
         types. NOTE  If a noptification type is not allowed make sure
         the values set for the sources below do not contain that type--> 
    <notify_type_toast/>
    <notify_type_flash/>
    <notify_type_tray/>
    <notify_type_front/>
    <notify_type_sound/>

    <!-- events that cause notifications (sources). Value is a bit flag
    	 indicating what type of notification should occur, where
    	 toast = 1;
    	 event = 2;
    	 flash = 4;
    	 sound = 8;
    	 tray  = 16;
    	 front = 32;
         for example, toast + flash + sound = 13 -->
         
    <notify_online value="0"/>
    <notify_offline value="0"/>
    <notify_newchat value="1"/>
    <notify_normalmsg value="1"/>
    <notify_s10n value="1"/>
    <notify_invite value="1"/>
    <notify_keyword value="1"/>
    <notify_chatactivity value="4"/>
    <notify_priority_chatactivity value="4"/>
    <notify_roomactivity value="4"/>
    <notify_priority_roomactivity value="4"/>
    <notify_oob value="1"/>
    <notify_autoresponse value="0"/>

    <toast_alpha value="0"/>
    <toast_alpha_val value="255"/>
    <toast_duration value="5"/>

    <!-- Presence Options -->
    <pres_tracking value="0" control="cboPresTracking">
      <control name="lblPresTracking"/>
    </pres_tracking>
    <presence_message_listen value="1" control="chkPresenceSync"/>
    <presence_message_send value="1" control="chkPresenceSync"/>
    <client_caps value="1" control="chkClientCaps"/>
    <client_caps_uri value="http://exodus.jabberstudio.org/caps"/>
    <room_joins value="0" control="chkRoomJoins"/>

    <!-- Subscription Options -->

    <!-- file xfer Options -->
    <xfer_path control="txtXferPath">
	  <control name="lblXferPath"/>
	  <control name="btnTransferBrowse"/>
    </xfer_path>        
    <xfer_port value="5280" control="txtXferPort">
      <control name="lblXferPort"/>
    </xfer_port>
    <xfer_ip control="txtXferIP">
      <control name="chkXferIP"/>
    </xfer_ip>
    <xfer_davhost control="txtDavHost">
      <control name="lblDavHost"/>
    </xfer_davhost>
    <xfer_davport control="txtDavPort">
      <control name="lblDavPort"/>
    </xfer_davport>
    <xfer_davpath control="txtDavPath">
      <control name="lblDavPath"/>
    </xfer_davpath>
    <xfer_davusername control="txtDavUsername">
      <control name="lblDavUsername"/>
    </xfer_davusername>
    <xfer_davpassword control="txtDavPassword">
      <control name="lblDavPassword"/>
    </xfer_davpassword>
    <xfer_prefproxy control="txt65Proxy">
      <control name="lbl65Proxy"/>
    </xfer_prefproxy>

    <!-- ACTIVITY WINDOW PREFS -->
    <!-- Activity Window Colors -->
    <activity_window_selected_color>
    	<start>$00D0C3AF</start>
        <end>$00D0C3AF</end>
    </activity_window_selected_color>
    <activity_window_high_priority_color>
    	<start>$000000ff</start>
        <end>$000000aa</end>
    </activity_window_high_priority_color>
    <activity_window_new_window_color>
    	<start>$0000ffff</start>
        <end>$0000aaaa</end>
    </activity_window_new_window_color>

    <!-- Activity Window Selection Colors -->
    <activity_window_selected_font_color value="$00000000"/>
    <activity_window_non_selected_font_color value="$00000000"/>
    <activity_window_unread_msgs_font_color value="$000000ff"/>
    <activity_window_high_priority_font_color value="$00000000"/>
    <activity_window_unread_msgs_high_priority_font_color value="$000000ff"/>

    <!-- Sort type -->
    <activity_window_sort value="1"/>
    <!-- /ACTIVITY WINDOW PREFS -->

    <!-- unfiled -->
    <toolbar value="1" />
    <chat_toolbar value="1" />
    <always_lang value="0"></always_lang>

    <!-- temp password used by auth plugins -->
    <temp-pw encoded="yes"></temp-pw>
    <!-- Only show searchable jids that have no node. Default value is false,
         all searchable jids are shown.
        This option is never exposed to the user -->
    <search_component_only value="0"/>

<!--
    These values only matter if USE_TWEBBROWSER is defined on compile
    and msglist_type has a value of 1 and not 0
-->
    <display_date_seperator value="0" /> <!-- Should the date be displayed between 2 messages that are on different days -->
    <maximum_displayed_messages value="0" /> <!-- Maximum number of messages in a history window before cleanup (for memory management).  0 means no maximum -->
    <maximum_displayed_messages_drop_down_to value="0" /> <!-- When messages deleted for memory management (see above), what is the number of messages that should be left in the window -->

    <!-- Branding items -->
    <brand_ad ></brand_ad>
    <brand_ad_url ></brand_ad_url>
    <!-- application ID is different than caption. It is used for
         file, path, resource identification and must be a legal value
         in any of those contexts. Caption may be anything. -->
    <brand_application_id value="Exodus"></brand_application_id>
    <brand_caption value="Exodus"></brand_caption>
    
    <brand_help_menu_list>
      <s>Jabber User Guide</s>
      <s>Exodus Website</s>
      <s>Report Bug</s>
      <s>Jabber.org Website</s>
    </brand_help_menu_list>
    <brand_help_url_list>
      <s>http://www.jabber.org/user/userguide/</s>
      <s>http://exodus.googlecode.com/</s>
      <s>http://code.google.com/p/exodus/issues/list</s>
      <s>http://www.jabber.org/</s>
    </brand_help_url_list>
    <brand_icon ></brand_icon>
    <brand_profile_conn_type value="0"></brand_profile_conn_type>
    <brand_profile_new_account_default value="true" control="chkRegister" state="rw"></brand_profile_new_account_default>
    <brand_profile_host ></brand_profile_host>
    <brand_profile_http_poll value="1000"></brand_profile_http_poll>
    <brand_profile_http_url ></brand_profile_http_url>
    <brand_profile_num_poll_keys value="256"></brand_profile_num_poll_keys>
    <brand_profile_password ></brand_profile_password>
    <brand_profile_port value="5222"></brand_profile_port>
    <brand_profile_priority value="1"></brand_profile_priority>
    <brand_profile_realm value="" control="txtRealm"></brand_profile_realm>
    <brand_profile_kerberos value="false" control="chkKerberos"></brand_profile_kerberos>
    <brand_profile_x509auth value="false" control="chkx509"></brand_profile_x509auth>

    <!--brand_profile_resource value="Exodus"></brand_profile_resource-->

    <brand_profile_resource_list>
      <s>Home</s>
      <s>Work</s>
      <s>Exodus</s>
    </brand_profile_resource_list>

    <brand_profile_save_password ></brand_profile_save_password>
    <brand_profile_server value="jabber.org"></brand_profile_server>
    <brand_profile_winlogin value="false"></brand_profile_winlogin>

    <brand_profile_server_list>
      <s>jabber.org</s>
      <s>jabber.com</s>
    </brand_profile_server_list>

    <brand_profile_socks_auth value="false"></brand_profile_socks_auth>
    <brand_profile_socks_host ></brand_profile_socks_host>
    <brand_profile_socks_password ></brand_profile_socks_password>
    <brand_profile_socks_port value="1080"></brand_profile_socks_port>
    <brand_profile_socks_type value="0"></brand_profile_socks_type>
    <brand_profile_socks_user ></brand_profile_socks_user>
    <brand_profile_ssl value="false"></brand_profile_ssl>
    <brand_profile_srv value="true"></brand_profile_srv>
    <brand_profile_username ></brand_profile_username>
    <brand_profile_enable_connect_btn value="true"></brand_profile_enable_connect_btn>
    <brand_profile_show_download_public_servers value="true"></brand_profile_show_download_public_servers>

    <brand_invisible_pres value="1"></brand_invisible_pres>
    <brand_muc value="1"></brand_muc>
    <brand_ft value="1"></brand_ft>
    <brand_print value="1"></brand_print>
    <brand_plugs value="1"></brand_plugs>
    <brand_addcontact_gateways value="1"/>
    <brand_registration value="1"/>
    <brand_browser value="1"/>
    <brand_vcard value="1"></brand_vcard>
    <!-- lock down our nickname -->
    <brand_prevent_change_nick value="0"/>
    <!-- add roster network prefs.
        This brandable pref defines networks that will show in the
        Add to Roster dialog. The pref is a tuple of display name, network type
        and type specific data. tuple looks like this
        <delim>display name<delim>transport|in-network<delim>data<delim>
        <delim> can be any non xml reserved character.
        display name cannot be empty or the tuple is ignored.

        Types recognized by Exodus are "transport" and "in-network", any other
        type will cause the tuple to be ignored.
        A transport is a gateway, the type specific data asscoiated with this
        type is the disco id of the transport (MSN -> msn etc). Exdous will
        attempt to disco a server for the transport and force registration etc.
        in-network means xmpp is used for subscription, with no additional
        requirements. The extra data asociated with this type is an autocompletion
        domain. For instance, the Jinc AIM "gateway" is implemented as part of
        s2s, not a gateway. The user simply s10n with foo@aol.com.

        The Jabber network is assumed and treated as in-network with an
        autocompletion of the users domain.

        All parts of the tuple must be defined or the entire thing is ignored.

    -->
    <brand_networks>
        <s>|MSN|transport|msn|</s>
        <s>|Yahoo|transport|yahoo|</s>
        <s>|AIM|transport|aim|</s>
        <s>|ICQ|transport|icq|</s>
    </brand_networks>

    <!-- end roster network prefs -->

    <!-- use JID autocompletion where possible -->
    <brand_auto_complete_jids value="1"/>
    
    <browse_view value="0"></browse_view>

    <fade_limit value="100"></fade_limit>
    <profile_active value="0"></profile_active>
    <wrap_input value="1"></wrap_input>

    <brand_required_plugins>
    </brand_required_plugins>
    <brand_required_plugins_message
      value ="This installation is not in compliance with Hermes Instant Messaging Policy: A mandatory component %s has been disabled." />
    <branding_disable_outflow value="0"></branding_disable_outflow>
    <!-- indicates if priority notification feature should be used -->
    <branding_priority_notifications value="1"></branding_priority_notifications>
    <!-- indicates if nested subgroup feature should be available -->
    <branding_nested_subgroup value="1"></branding_nested_subgroup>
    <!-- indicates if all messages should be queued to offline queue when I am not available -->
    <branding_queue_not_available_msgs value="1"></branding_queue_not_available_msgs>

    <!-- Should Exodus display a error box when trying to close when Exodus is being used as a COM server? -->
    <brand_warn_close_com_server value="1"/>

    <!-- Should Exodus show a warning when trying to register a new account with a server that doesn't advertise in-band registration? -->
    <brand_show_in_band_registration_warning value="1"/>

    <!-- Should Exodus allow users to block messages from other users -->
    <brand_allow_blocking_jids value="1"/>

    <!-- Should the ability to show the debug window be available to the user through the main menu system -->
    <brand_show_debug_in_menu value="1"/>

	<!-- Brand text to place in an edit box on the profiles screen.
                 Important!: If <brand_disclaimer_text/> is not empty, then <brand_logo/> will NOT be shown!

		 Example(s): <brand_disclaimer_text type="dll" resname="example_text_res_name" source="brand.dll" height="100"/>
                             <brand_disclaimer_text type="text" height="150">example disclaimer text</brand_disclaimer_text>

		 Attributes:	type   (required): either "dll" or "file" or "text"
                 		source (required/option): name of dll file for type="dll" or name of file for type="file". Not needed for type="text"
				resname(required/optional): Number of string in string table in dll file (required for "dll" type)
                                                            This MUST be the NUMBER of the string in the string table.
                                height (required): Height of textbox

                 Note: The text to be displayed can be RTF.
                 Note: If type="text", then the tag's CDATA is the text that will be displayed.
		 Note: <brand_min_profiles_window_height/> and <brand_min_profiles_window_width_*/> should be such that the text box is properly shown
	-->
        <brand_disclaimer_text/>

	<!-- Brand the logo box in the profiles screen with an image
                 Important!: If <brand_disclaimer_text/> is not empty, then <brand_logo/> will NOT be shown!

		 Example: <brand_logo type="dll" resname="example_image_res_name" source="brand.dll" height="100"/>

		 Attributes:	type   (required): either "dll" or "file"
                 		source (required): name of dll file for type="dll" or name of file for type="file".
				resname(required/optional): name of resource in dll file (required for "dll" type)
                                height (required): Height of image

		 Note: <brand_min_profiles_window_height/> and <brand_min_profiles_window_width_*/> should be such that the logo is properly shown
	-->
	<brand_logo/>

	<!-- Brand the minimum size of the window -->
        <!-- brand_min_roster_* is minimum size (in pixels) when user is logged into a server -->
	<brand_min_roster_window_height value="230"/>
	<brand_min_roster_window_width_docked value="600"/> <!-- When 1 or more windows are docked -->
        <brand_min_roster_window_width_undocked value="250"/> <!-- No docked windows -->
        <brand_min_roster_spliter_width value="250"/>

        <!-- brand_min_profiles_* is minimum size (in pixels) when user is NOT logged into a server -->
	<brand_min_profiles_window_height value="230"/>
	<brand_min_profiles_window_width_docked value="600"/> <!-- When 1 or more windows are docked -->
	<brand_min_profiles_window_width_undocked value="250"/> <!-- No docked windows -->
        <brand_min_profiles_spliter_width value="250"/>

  <!-- Stringlist with additional data to be added to the about box -->
  <brand_about_additional_list/>
  </prefs>

  <!-- default custom presence stuff -->
  <presii>
  </presii>

</exodus>
  ?
  ,   X M L   L A N G S       0 	        <langs>
<om>(Afan) Oromo</om>
<ab>Abkhazian</ab>
<aa>Afar</aa>
<af>Afrikaans</af>
<sq>Albanian</sq>
<am>Amharic</am>
<ar>Arabic</ar>
<hy>Armenian</hy>
<as>Assamese</as>
<ay>Aymara</ay>
<az>Azerbaijani</az>
<ba>Bashkir</ba>
<eu>Basque</eu>
<bn>Bengali</bn>
<dz>Bhutani</dz>
<bh>Bihari</bh>
<bi>Bislama</bi>
<br>Breton</br>
<bg>Bulgarian</bg>
<my>Burmese</my>
<be>Byelorussian</be>
<km>Cambodian</km>
<ca>Catalan</ca>
<zh>Chinese</zh>
<co>Corsican</co>
<hr>Croatian</hr>
<cs>Czech</cs>
<cz>Czech</cz>
<da>Danish</da>
<dk>Danish</dk>
<nl>Dutch</nl>
<en>English</en>
<eo>Esperanto</eo>
<et>Estonian</et>
<fo>Faeroese</fo>
<fj>Fiji</fj>
<fi>Finnish</fi>
<fr>French</fr>
<fy>Frisian</fy>
<gl>Galician</gl>
<ka>Georgian</ka>
<de>German</de>
<el>Greek</el>
<kl>Greenlandic</kl>
<gn>Guarani</gn>
<gu>Gujarati</gu>
<ha>Hausa</ha>
<he>Hebrew </he>
<hi>Hindi</hi>
<hu>Hungarian</hu>
<is>Icelandic</is>
<id>Indonesian </id>
<ia>Interlingua</ia>
<ie>Interlingue</ie>
<ik>Inupiak</ik>
<iu>Inuktitut (Eskimo)</iu>
<ga>Irish</ga>
<it>Italian</it>
<ja>Japanese</ja>
<jw>Javanese</jw>
<kn>Kannada</kn>
<ks>Kashmiri</ks>
<kk>Kazakh</kk>
<rw>Kinyarwanda</rw>
<ky>Kirghiz</ky>
<rn>Kirundi</rn>
<ko>Korean</ko>
<ku>Kurdish</ku>
<lo>Laothian</lo>
<la>Latin</la>
<lv>Latvian, Lettish</lv>
<ln>Lingala</ln>
<lt>Lithuanian</lt>
<mk>Macedonian</mk>
<mg>Malagasy</mg>
<ms>Malay</ms>
<ml>Malayalam</ml>
<mt>Maltese</mt>
<mi>Maori</mi>
<mr>Marathi</mr>
<mo>Moldavian</mo>
<mn>Mongolian</mn>
<na>Nauru</na>
<ne>Nepali</ne>
<no>Norwegian</no>
<oc>Occitan</oc>
<or>Oriya</or>
<ps>Pashto, Pushto</ps>
<fa>Persian</fa>
<pl>Polish</pl>
<pt>Portuguese</pt>
<pa>Punjabi</pa>
<qu>Quechua</qu>
<rm>Rhaeto-Romance</rm>
<ro>Romanian</ro>
<ru>Russian</ru>
<sm>Samoan</sm>
<sg>Sangro</sg>
<sa>Sanskrit</sa>
<gd>Scots Gaelic</gd>
<sr>Serbian</sr>
<sh>Serbo-Croatian</sh>
<st>Sesotho</st>
<tn>Setswana</tn>
<sn>Shona</sn>
<sd>Sindhi</sd>
<si>Singhalese</si>
<ss>Siswati</ss>
<sk>Slovak</sk>
<sl>Slovenian</sl>
<so>Somali</so>
<es>Spanish</es>
<su>Sudanese</su>
<sw>Swahili</sw>
<sv>Swedish</sv>
<tl>Tagalog</tl>
<tg>Tajik</tg>
<ta>Tamil</ta>
<tt>Tatar</tt>
<te>Tegulu</te>
<th>Thai</th>
<bo>Tibetan</bo>
<ti>Tigrinya</ti>
<to>Tonga</to>
<ts>Tsonga</ts>
<tr>Turkish</tr>
<tk>Turkmen</tk>
<tw>Twi</tw>
<ug>Uigur</ug>
<uk>Ukrainian</uk>
<ur>Urdu</ur>
<uz>Uzbek</uz>
<vi>Vietnamese</vi>
<vo>Volapuk</vo>
<cy>Welch</cy>
<wo>Wolof</wo>
<xh>Xhosa</xh>
<yi>Yiddish (former ji)</yi>
<yo>Yoruba</yo>
<za>Zhuang</za>
<zu>Zulu</zu>
</langs> �  4   X M L   C O U N T R I E S       0 	        <countries>
<AD>Andorra, Principality of</AD>
<AE>United Arab Emirates</AE>
<AF>Afghanistan, Islamic State of</AF>
<AG>Antigua and Barbuda</AG>
<AI>Anguilla</AI>
<AL>Albania</AL>
<AM>Armenia</AM>
<AN>Netherlands Antilles</AN>
<AO>Angola</AO>
<AQ>Antarctica</AQ>
<AR>Argentina</AR>
<AS>American Samoa</AS>
<AT>Austria</AT>
<AU>Australia</AU>
<AW>Aruba</AW>
<AZ>Azerbaidjan</AZ>
<BA>Bosnia-Herzegovina</BA>
<BB>Barbados</BB>
<BD>Bangladesh</BD>
<BE>Belgium</BE>
<BF>Burkina Faso</BF>
<BG>Bulgaria</BG>
<BH>Bahrain</BH>
<BI>Burundi</BI>
<BJ>Benin</BJ>
<BM>Bermuda</BM>
<BN>Brunei Darussalam</BN>
<BO>Bolivia</BO>
<BR>Brazil</BR>
<BS>Bahamas</BS>
<BT>Bhutan</BT>
<BV>Bouvet Island</BV>
<BW>Botswana</BW>
<BY>Belarus</BY>
<BZ>Belize</BZ>
<CA>Canada</CA>
<CC>Cocos (Keeling) Islands</CC>
<CF>Central African Republic</CF>
<CD>Congo, The Democratic Republic of the</CD>
<CG>Congo</CG>
<CH>Switzerland</CH>
<CI>Ivory Coast (Cote D'Ivoire)</CI>
<CK>Cook Islands</CK>
<CL>Chile</CL>
<CM>Cameroon</CM>
<CN>China</CN>
<CO>Colombia</CO>
<CR>Costa Rica</CR>
<CS>Former Czechoslovakia</CS>
<CU>Cuba</CU>
<CV>Cape Verde</CV>
<CX>Christmas Island</CX>
<CY>Cyprus</CY>
<CZ>Czech Republic</CZ>
<DE>Germany</DE>
<DJ>Djibouti</DJ>
<DK>Denmark</DK>
<DM>Dominica</DM>
<DO>Dominican Republic</DO>
<DZ>Algeria</DZ>
<EC>Ecuador</EC>
<EDU>Educational</EDU>
<EE>Estonia</EE>
<EG>Egypt</EG>
<EH>Western Sahara</EH>
<ER>Eritrea</ER>
<ES>Spain</ES>
<ET>Ethiopia</ET>
<FI>Finland</FI>
<FJ>Fiji</FJ>
<FK>Falkland Islands</FK>
<FM>Micronesia</FM>
<FO>Faroe Islands</FO>
<FR>France</FR>
<FX>France (European Territory)</FX>
<GA>Gabon</GA>
<GB>Great Britain</GB>
<GD>Grenada</GD>
<GE>Georgia</GE>
<GF>French Guyana</GF>
<GH>Ghana</GH>
<GI>Gibraltar</GI>
<GL>Greenland</GL>
<GM>Gambia</GM>
<GN>Guinea</GN>
<GP>Guadeloupe (French)</GP>
<GQ>Equatorial Guinea</GQ>
<GR>Greece</GR>
<GS>S. Georgia & S. Sandwich Isls.</GS>
<GT>Guatemala</GT>
<GU>Guam (USA)</GU>
<GW>Guinea Bissau</GW>
<GY>Guyana</GY>
<HK>Hong Kong</HK>
<HM>Heard and McDonald Islands</HM>
<HN>Honduras</HN>
<HR>Croatia</HR>
<HT>Haiti</HT>
<HU>Hungary</HU>
<ID>Indonesia</ID>
<IE>Ireland</IE>
<IL>Israel</IL>
<IN>India</IN>
<IO>British Indian Ocean Territory</IO>
<IQ>Iraq</IQ>
<IR>Iran</IR>
<IS>Iceland</IS>
<IT>Italy</IT>
<JM>Jamaica</JM>
<JO>Jordan</JO>
<JP>Japan</JP>
<KE>Kenya</KE>
<KG>Kyrgyz Republic (Kyrgyzstan)</KG>
<KH>Cambodia, Kingdom of</KH>
<KI>Kiribati</KI>
<KM>Comoros</KM>
<KN>Saint Kitts & Nevis Anguilla</KN>
<KP>North Korea</KP>
<KR>South Korea</KR>
<KW>Kuwait</KW>
<KY>Cayman Islands</KY>
<KZ>Kazakhstan</KZ>
<LA>Laos</LA>
<LB>Lebanon</LB>
<LC>Saint Lucia</LC>
<LI>Liechtenstein</LI>
<LK>Sri Lanka</LK>
<LR>Liberia</LR>
<LS>Lesotho</LS>
<LT>Lithuania</LT>
<LU>Luxembourg</LU>
<LV>Latvia</LV>
<LY>Libya</LY>
<MA>Morocco</MA>
<MC>Monaco</MC>
<MD>Moldavia</MD>
<MG>Madagascar</MG>
<MH>Marshall Islands</MH>
<MIL>USA Military</MIL>
<MK>Macedonia</MK>
<ML>Mali</ML>
<MM>Myanmar</MM>
<MN>Mongolia</MN>
<MO>Macau</MO>
<MP>Northern Mariana Islands</MP>
<MQ>Martinique (French)</MQ>
<MR>Mauritania</MR>
<MS>Montserrat</MS>
<MT>Malta</MT>
<MU>Mauritius</MU>
<MV>Maldives</MV>
<MW>Malawi</MW>
<MX>Mexico</MX>
<MY>Malaysia</MY>
<MZ>Mozambique</MZ>
<NA>Namibia</NA>
<NC>New Caledonia (French)</NC>
<NE>Niger</NE>
<NET>Network</NET>
<NF>Norfolk Island</NF>
<NG>Nigeria</NG>
<NI>Nicaragua</NI>
<NL>Netherlands</NL>
<NO>Norway</NO>
<NP>Nepal</NP>
<NR>Nauru</NR>
<NT>Neutral Zone</NT>
<NU>Niue</NU>
<NZ>New Zealand</NZ>
<OM>Oman</OM>
<PA>Panama</PA>
<PE>Peru</PE>
<PF>Polynesia (French)</PF>
<PG>Papua New Guinea</PG>
<PH>Philippines</PH>
<PK>Pakistan</PK>
<PL>Poland</PL>
<PM>Saint Pierre and Miquelon</PM>
<PN>Pitcairn Island</PN>
<PR>Puerto Rico</PR>
<PT>Portugal</PT>
<PW>Palau</PW>
<PY>Paraguay</PY>
<QA>Qatar</QA>
<RE>Reunion (French)</RE>
<RO>Romania</RO>
<RU>Russian Federation</RU>
<RW>Rwanda</RW>
<SA>Saudi Arabia</SA>
<SB>Solomon Islands</SB>
<SC>Seychelles</SC>
<SD>Sudan</SD>
<SE>Sweden</SE>
<SG>Singapore</SG>
<SH>Saint Helena</SH>
<SI>Slovenia</SI>
<SJ>Svalbard and Jan Mayen Islands</SJ>
<SK>Slovak Republic</SK>
<SL>Sierra Leone</SL>
<SM>San Marino</SM>
<SN>Senegal</SN>
<SO>Somalia</SO>
<SR>Suriname</SR>
<ST>Saint Tome (Sao Tome) and Principe</ST>
<SU>Former USSR</SU>
<SV>El Salvador</SV>
<SY>Syria</SY>
<SZ>Swaziland</SZ>
<TC>Turks and Caicos Islands</TC>
<TD>Chad</TD>
<TF>French Southern Territories</TF>
<TG>Togo</TG>
<TH>Thailand</TH>
<TJ>Tadjikistan</TJ>
<TK>Tokelau</TK>
<TM>Turkmenistan</TM>
<TN>Tunisia</TN>
<TO>Tonga</TO>
<TP>East Timor</TP>
<TR>Turkey</TR>
<TT>Trinidad and Tobago</TT>
<TV>Tuvalu</TV>
<TW>Taiwan</TW>
<TZ>Tanzania</TZ>
<UA>Ukraine</UA>
<UG>Uganda</UG>
<UK>United Kingdom</UK>
<UM>USA Minor Outlying Islands</UM>
<US>United States</US>
<UY>Uruguay</UY>
<UZ>Uzbekistan</UZ>
<VA>Holy See (Vatican City State)</VA>
<VC>Saint Vincent & Grenadines</VC>
<VE>Venezuela</VE>
<VG>Virgin Islands (British)</VG>
<VI>Virgin Islands (USA)</VI>
<VN>Vietnam</VN>
<VU>Vanuatu</VU>
<WF>Wallis and Futuna Islands</WF>
<WS>Samoa</WS>
<YE>Yemen</YE>
<YT>Mayotte</YT>
<YU>Yugoslavia</YU>
<ZA>South Africa</ZA>
<ZM>Zambia</ZM>
<ZR>Zaire</ZR>
<ZW>Zimbabwe</ZW>
</countries>   