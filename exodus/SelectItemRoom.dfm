inherited frmSelectItemRoom: TfrmSelectItemRoom
  OnDestroy = FormDestroy
  ExplicitWidth = 320
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlInput: TPanel
    object TntSplitter1: TTntSplitter [0]
      Left = 0
      Top = 174
      Width = 279
      Height = 3
      Cursor = crVSplit
      Align = alBottom
      ExplicitTop = 0
      ExplicitWidth = 41
    end
    inherited pnlSelect: TPanel
      Height = 168
      ExplicitHeight = 168
    end
    inherited pnlEntry: TPanel
      inherited lblJID: TTntLabel
        Height = 13
      end
    end
    object pnlJoinedRooms: TTntPanel
      Left = 0
      Top = 177
      Width = 279
      Height = 77
      Align = alBottom
      BevelOuter = bvNone
      ParentColor = True
      TabOrder = 2
      object lblJoinedRooms: TTntLabel
        AlignWithMargins = True
        Left = 3
        Top = 3
        Width = 114
        Height = 13
        Align = alTop
        Caption = 'Currently Joined Rooms'
      end
      object lstJoinedRooms: TTntListView
        AlignWithMargins = True
        Left = 3
        Top = 22
        Width = 273
        Height = 52
        Align = alClient
        Columns = <
          item
            AutoSize = True
            Caption = 'foo'
          end>
        IconOptions.Arrangement = iaLeft
        IconOptions.WrapText = False
        ReadOnly = True
        ShowColumnHeaders = False
        SmallImages = frmExodus.ImageList1
        SortType = stText
        TabOrder = 0
        ViewStyle = vsReport
        OnChange = lstJoinedRoomsChange
      end
    end
  end
end
