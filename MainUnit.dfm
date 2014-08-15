object MainForm: TMainForm
  Left = 0
  Top = 0
  BorderIcons = [biSystemMenu, biMinimize]
  BorderStyle = bsSingle
  Caption = #1057#1072#1084#1086#1076#1077#1083#1082#1080#1085
  ClientHeight = 640
  ClientWidth = 1093
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  Menu = MainMenu1
  OldCreateOrder = False
  Position = poDesktopCenter
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object PageControl1: TPageControl
    Left = 0
    Top = 33
    Width = 1093
    Height = 607
    ActivePage = MindTapeSheet
    Align = alClient
    TabOrder = 0
    OnChange = PageControl1Change
    object MindTapeSheet: TTabSheet
      Caption = #1051#1077#1085#1090#1072
      object Label7: TLabel
        Left = 3
        Top = 21
        Width = 109
        Height = 16
        Caption = #1058#1077#1082#1091#1097#1080#1077' '#1079#1072#1076#1072#1095#1080
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object Label8: TLabel
        Left = 839
        Top = 18
        Width = 136
        Height = 16
        Caption = #1055#1086#1103#1089#1085#1077#1085#1080#1077' '#1082' '#1079#1072#1076#1072#1095#1077
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object TaskTape: TDBGrid
        Left = 3
        Top = 43
        Width = 830
        Height = 533
        DataSource = TapeModel.DataSourceMindTape
        PopupMenu = PopupMenuTape
        ReadOnly = True
        TabOrder = 0
        TitleFont.Charset = DEFAULT_CHARSET
        TitleFont.Color = clWindowText
        TitleFont.Height = -11
        TitleFont.Name = 'Tahoma'
        TitleFont.Style = []
        OnDrawColumnCell = TaskTapeDrawColumnCell
        OnTitleClick = TaskTapeTitleClick
        Columns = <
          item
            Expanded = False
            FieldName = 'id'
            Title.Alignment = taCenter
            Title.Caption = '#'
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'note'
            Title.Alignment = taCenter
            Visible = False
          end
          item
            Expanded = False
            FieldName = 'caption'
            Title.Alignment = taCenter
            Title.Caption = #1047#1072#1076#1072#1095#1072
            Width = 200
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'status'
            Title.Alignment = taCenter
            Title.Caption = #1057#1090#1072#1090#1091#1089' '#1079#1072#1076#1072#1095#1080
            Width = 120
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'deadline'
            Title.Alignment = taCenter
            Title.Caption = 'Deadline'
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'project_link'
            Title.Alignment = taCenter
            Visible = False
          end
          item
            Expanded = False
            FieldName = 'caption_1'
            Title.Alignment = taCenter
            Title.Caption = #1055#1088#1086#1077#1082#1090
            Width = 200
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'status_1'
            Title.Alignment = taCenter
            Title.Caption = #1057#1090#1072#1090#1091#1089' '#1087#1088#1086#1077#1082#1090#1072
            Width = 120
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'budget'
            Title.Alignment = taCenter
            Visible = False
          end
          item
            Expanded = False
            FieldName = 'balance'
            Title.Alignment = taCenter
            Title.Caption = #1041#1072#1083#1072#1085#1089
            Visible = False
          end>
      end
      object DBMemo3: TDBMemo
        Left = 839
        Top = 40
        Width = 243
        Height = 536
        DataField = 'note'
        ReadOnly = True
        ScrollBars = ssVertical
        TabOrder = 1
      end
    end
    object ProjectTaskSheet: TTabSheet
      Caption = #1055#1088#1086#1077#1082#1090#1099' '#1080' '#1079#1072#1076#1072#1095#1080
      ImageIndex = 1
      object Label1: TLabel
        Left = 8
        Top = 16
        Width = 99
        Height = 13
        Caption = #1057#1087#1080#1089#1086#1082' '#1087#1088#1086#1077#1082#1090#1086#1074
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object Label2: TLabel
        Left = 8
        Top = 309
        Width = 112
        Height = 13
        Caption = #1047#1072#1076#1072#1095#1080' '#1087#1086' '#1087#1088#1086#1077#1082#1090#1091
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object Label3: TLabel
        Left = 823
        Top = 43
        Width = 69
        Height = 13
        Caption = #1057#1089#1099#1083#1082#1072' '#1085#1072' Git'
      end
      object Label4: TLabel
        Left = 823
        Top = 101
        Width = 61
        Height = 13
        Caption = #1055#1088#1080#1084#1077#1095#1072#1085#1080#1077
      end
      object Label5: TLabel
        Left = 8
        Top = 43
        Width = 64
        Height = 13
        Caption = #1054#1090#1086#1073#1088#1072#1078#1072#1090#1100
      end
      object GitText: TDBText
        Left = 823
        Top = 62
        Width = 250
        Height = 33
        Cursor = crHandPoint
        DataField = 'git'
        DataSource = ProjectModel.DataSourceProject
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlue
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = [fsBold, fsUnderline]
        ParentFont = False
        PopupMenu = PopupMenuProject
        WordWrap = True
        OnClick = GitTextClick
      end
      object Label6: TLabel
        Left = 823
        Top = 330
        Width = 61
        Height = 13
        Caption = #1055#1088#1080#1084#1077#1095#1072#1085#1080#1077
      end
      object ProjectGrid: TDBGrid
        Left = 8
        Top = 62
        Width = 801
        Height = 241
        DataSource = ProjectModel.DataSourceProject
        PopupMenu = PopupMenuProject
        ReadOnly = True
        TabOrder = 0
        TitleFont.Charset = DEFAULT_CHARSET
        TitleFont.Color = clWindowText
        TitleFont.Height = -11
        TitleFont.Name = 'Tahoma'
        TitleFont.Style = []
        OnDrawColumnCell = ProjectGridDrawColumnCell
        Columns = <
          item
            Expanded = False
            FieldName = 'id'
            Title.Alignment = taCenter
            Title.Caption = '#'
            Width = 40
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'caption'
            Title.Alignment = taCenter
            Title.Caption = #1053#1072#1079#1074#1072#1085#1080#1077
            Width = 200
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'id_1'
            Title.Alignment = taCenter
            Visible = False
          end
          item
            Expanded = False
            FieldName = 'cl_fio'
            Title.Alignment = taCenter
            Title.Caption = #1047#1072#1082#1072#1079#1095#1080#1082
            Width = 200
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'status'
            Title.Alignment = taCenter
            Title.Caption = #1057#1090#1072#1090#1091#1089
            Width = 100
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'client_link'
            Title.Alignment = taCenter
            Visible = False
          end
          item
            Expanded = False
            FieldName = 'note'
            Title.Alignment = taCenter
            Visible = False
          end
          item
            Expanded = False
            FieldName = 'git'
            Title.Alignment = taCenter
            Title.Caption = 'Git'
            Visible = False
          end
          item
            Expanded = False
            FieldName = 'budget'
            Title.Alignment = taCenter
            Title.Caption = #1057#1090#1086#1080#1084#1086#1089#1090#1100
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'salary'
            Title.Alignment = taCenter
            Title.Caption = #1054#1087#1083#1072#1090#1072
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'balance'
            Title.Alignment = taCenter
            Title.Caption = #1041#1072#1083#1072#1085#1089
            Visible = True
          end>
      end
      object TaskGrid: TDBGrid
        Left = 8
        Top = 351
        Width = 801
        Height = 217
        DataSource = TaskDataModule.DataSourceTask
        PopupMenu = PopupMenuTask
        ReadOnly = True
        TabOrder = 1
        TitleFont.Charset = DEFAULT_CHARSET
        TitleFont.Color = clWindowText
        TitleFont.Height = -11
        TitleFont.Name = 'Tahoma'
        TitleFont.Style = []
        OnDrawColumnCell = TaskGridDrawColumnCell
        Columns = <
          item
            Expanded = False
            FieldName = 'id'
            Title.Alignment = taCenter
            Title.Caption = '#'
            Width = 30
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'caption'
            Title.Alignment = taCenter
            Title.Caption = #1047#1072#1076#1072#1095#1072
            Width = 200
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'note'
            Title.Alignment = taCenter
            Visible = False
          end
          item
            Expanded = False
            FieldName = 'status'
            Title.Alignment = taCenter
            Title.Caption = #1057#1090#1072#1090#1091#1089
            Width = 120
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'fio'
            Title.Alignment = taCenter
            Title.Caption = #1048#1089#1087#1086#1083#1085#1080#1090#1077#1083#1100
            Width = 150
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'deadline'
            Title.Alignment = taCenter
            Title.Caption = 'Deadline'
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'project_link'
            Title.Alignment = taCenter
            Visible = False
          end
          item
            Expanded = False
            FieldName = 'budget'
            Title.Alignment = taCenter
            Title.Caption = #1041#1102#1076#1078#1077#1090
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'salary'
            Title.Alignment = taCenter
            Title.Caption = #1042#1099#1087#1083#1072#1090#1072
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'balance'
            Title.Alignment = taCenter
            Title.Caption = #1041#1072#1083#1072#1085#1089
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'freelancer_link'
            Title.Alignment = taCenter
            Visible = False
          end
          item
            Expanded = False
            FieldName = 'Id_1'
            Title.Alignment = taCenter
            Visible = False
          end>
      end
      object ComboBox1: TComboBox
        Left = 78
        Top = 35
        Width = 145
        Height = 21
        TabOrder = 2
        Text = #1074#1089#1077' '#1085#1077' '#1079#1072#1082#1088#1099#1090#1099#1077
        OnChange = ComboBox1Change
        Items.Strings = (
          #1074#1089#1077' '#1085#1077' '#1079#1072#1082#1088#1099#1090#1099#1077
          #1074' '#1088#1072#1073#1086#1090#1077
          #1079#1072#1084#1086#1088#1086#1078#1077#1085
          #1087#1088#1080#1086#1088#1080#1090#1077#1090
          #1079#1072#1082#1088#1099#1090
          #1086#1090#1084#1077#1085#1077#1085
          #1086#1078#1080#1076#1072#1102' '#1086#1087#1083#1072#1090#1099)
      end
      object DBMemo1: TDBMemo
        Left = 823
        Top = 120
        Width = 250
        Height = 183
        DataField = 'note'
        DataSource = ProjectModel.DataSourceProject
        ReadOnly = True
        ScrollBars = ssVertical
        TabOrder = 3
      end
      object DBMemo2: TDBMemo
        Left = 823
        Top = 349
        Width = 250
        Height = 220
        DataField = 'note'
        ReadOnly = True
        ScrollBars = ssVertical
        TabOrder = 4
      end
      object ShowTaskCheckBox: TCheckBox
        Left = 8
        Top = 328
        Width = 193
        Height = 17
        Caption = #1054#1090#1086#1073#1088#1072#1078#1072#1090#1100' '#1079#1072#1082#1088#1099#1090#1099#1077' '#1079#1072#1076#1072#1095#1080
        TabOrder = 5
        OnClick = ShowTaskCheckBoxClick
      end
    end
  end
  object ControlBar1: TControlBar
    Left = 0
    Top = 0
    Width = 1093
    Height = 33
    Align = alTop
    TabOrder = 1
    object ToolBar1: TToolBar
      Left = 11
      Top = 2
      Width = 206
      Height = 22
      ButtonHeight = 21
      ButtonWidth = 94
      Caption = 'ToolBar1'
      ShowCaptions = True
      TabOrder = 0
      object ChangeTask: TToolButton
        Left = 0
        Top = 0
        Caption = #1048#1079#1084#1077#1085#1080#1090#1100' '#1079#1072#1076#1072#1095#1091
        Enabled = False
        ImageIndex = 0
        OnClick = ChangeTaskClick
      end
      object ToolButton2: TToolButton
        Left = 94
        Top = 0
        Width = 8
        Caption = 'ToolButton2'
        ImageIndex = 1
        Style = tbsSeparator
      end
      object ChangeProject: TToolButton
        Left = 102
        Top = 0
        Caption = #1048#1079#1084#1077#1085#1080#1090#1100' '#1087#1088#1086#1077#1082#1090
        Enabled = False
        ImageIndex = 1
        OnClick = ChangeProjectClick
      end
    end
  end
  object MainMenu1: TMainMenu
    Left = 416
    Top = 64
    object N1: TMenuItem
      Caption = #1060#1072#1081#1083
      object N2: TMenuItem
        Caption = #1042#1099#1093#1086#1076
        OnClick = N2Click
      end
    end
    object N6: TMenuItem
      Caption = #1056#1077#1076#1072#1082#1090#1080#1088#1086#1074#1072#1090#1100
      object N7: TMenuItem
        Caption = #1050#1083#1080#1077#1085#1090#1099
        OnClick = N7Click
      end
      object N8: TMenuItem
        Caption = #1060#1088#1080#1083#1072#1085#1089#1077#1088#1099
        OnClick = N8Click
      end
      object N9: TMenuItem
        Caption = '-'
      end
      object N10: TMenuItem
        Caption = #1053#1086#1074#1099#1081' '#1087#1088#1086#1077#1082#1090
        OnClick = N10Click
      end
      object N12: TMenuItem
        Caption = #1056#1077#1076#1072#1082#1090#1080#1088#1086#1074#1072#1090#1100' '#1087#1088#1086#1077#1082#1090
        OnClick = N12Click
      end
      object N13: TMenuItem
        Caption = '-'
      end
      object N11: TMenuItem
        Caption = #1053#1086#1074#1072#1103' '#1079#1072#1076#1072#1095#1072
        OnClick = N11Click
      end
      object N14: TMenuItem
        Caption = #1056#1077#1076#1072#1082#1090#1080#1088#1086#1074#1072#1090#1100' '#1079#1072#1076#1072#1095#1091
        OnClick = N14Click
      end
      object N24: TMenuItem
        Caption = #1055#1077#1088#1077#1085#1077#1089#1090#1080' '#1079#1072#1076#1072#1095#1091
      end
      object N25: TMenuItem
        Caption = #1059#1076#1072#1083#1080#1090#1100' '#1079#1072#1076#1072#1095#1091
        OnClick = N25Click
      end
    end
    object N15: TMenuItem
      Caption = #1041#1091#1093#1075#1072#1083#1090#1077#1088#1080#1103
      object N17: TMenuItem
        Caption = #1042#1099#1087#1083#1072#1090#1072' '#1087#1086' '#1079#1072#1076#1072#1095#1077
        OnClick = N17Click
      end
      object N16: TMenuItem
        Caption = #1054#1087#1077#1088#1072#1094#1080#1103' '#1089#1086' '#1089#1095#1077#1090#1086#1084' '#1079#1072#1082#1072#1079#1095#1080#1082#1072
        OnClick = N16Click
      end
    end
    object N5: TMenuItem
      Caption = #1053#1072#1089#1090#1088#1086#1081#1082#1080
      OnClick = N5Click
    end
    object N3: TMenuItem
      Caption = #1055#1086#1084#1086#1097#1100
      object N4: TMenuItem
        Caption = #1054' '#1087#1088#1086#1075#1088#1072#1084#1084#1077
        OnClick = N4Click
      end
    end
  end
  object PopupMenuProject: TPopupMenu
    Left = 976
    Top = 56
    object N46: TMenuItem
      Caption = #1053#1086#1074#1099#1081' '#1087#1088#1086#1077#1082#1090
      OnClick = N46Click
    end
    object N47: TMenuItem
      Caption = #1048#1079#1084#1077#1085#1080#1090#1100' '#1087#1088#1086#1077#1082#1090
      OnClick = N47Click
    end
    object N49: TMenuItem
      Caption = #1057#1090#1072#1090#1091#1089' '#1087#1088#1086#1077#1082#1090#1072
      object N54: TMenuItem
        Caption = #1042' '#1088#1072#1073#1086#1090#1077
        OnClick = N54Click
      end
      object N53: TMenuItem
        Caption = #1055#1088#1080#1086#1088#1080#1090#1077#1090
        OnClick = N53Click
      end
      object N51: TMenuItem
        Caption = #1047#1072#1082#1088#1099#1090
        OnClick = N51Click
      end
      object N52: TMenuItem
        Caption = #1047#1072#1084#1086#1088#1086#1078#1077#1085
        OnClick = N52Click
      end
      object N50: TMenuItem
        Caption = #1054#1090#1084#1077#1085#1077#1085
        OnClick = N50Click
      end
      object N58: TMenuItem
        Caption = #1054#1078#1080#1076#1072#1102' '#1086#1087#1083#1072#1090#1099
        OnClick = N55Click
      end
    end
    object N45: TMenuItem
      Caption = '-'
    end
    object N42: TMenuItem
      Caption = #1053#1086#1074#1072#1103' '#1079#1072#1076#1072#1095#1072
      OnClick = N42Click
    end
    object N48: TMenuItem
      Caption = '-'
    end
    object N18: TMenuItem
      Caption = #1050#1086#1087#1080#1088#1086#1074#1072#1090#1100
      OnClick = N18Click
    end
  end
  object PopupMenuTape: TPopupMenu
    Left = 80
    Top = 200
    object N20: TMenuItem
      Caption = #1057#1084#1077#1085#1080#1090#1100' '#1089#1090#1072#1090#1091#1089' '#1087#1088#1086#1077#1082#1090#1072
      object N22: TMenuItem
        Caption = #1042' '#1088#1072#1073#1086#1090#1077
        OnClick = N54Click
      end
      object N23: TMenuItem
        Caption = #1055#1088#1080#1086#1088#1080#1090#1077#1090
        OnClick = N53Click
      end
      object N26: TMenuItem
        Caption = #1047#1072#1082#1088#1099#1090
        OnClick = N51Click
      end
      object N27: TMenuItem
        Caption = #1047#1072#1084#1086#1088#1086#1078#1077#1085
        OnClick = N52Click
      end
      object N28: TMenuItem
        Caption = #1054#1090#1084#1077#1085#1077#1085
        OnClick = N50Click
      end
      object N55: TMenuItem
        Caption = #1054#1078#1080#1076#1072#1077#1090' '#1086#1087#1083#1072#1090#1099
        OnClick = N55Click
      end
    end
    object N21: TMenuItem
      Caption = '-'
    end
    object N19: TMenuItem
      Caption = #1057#1084#1077#1085#1080#1090#1100' '#1089#1090#1072#1090#1091#1089' '#1079#1072#1076#1072#1095#1080
      object N31: TMenuItem
        Caption = #1042' '#1088#1072#1073#1086#1090#1077
        OnClick = N31Click
      end
      object N32: TMenuItem
        Caption = #1055#1088#1080#1086#1088#1080#1090#1077#1090
        OnClick = N32Click
      end
      object N33: TMenuItem
        Caption = #1054#1078#1080#1076#1072#1102' '#1079#1072#1082#1072#1079#1095#1080#1082#1072
        OnClick = N33Click
      end
      object N34: TMenuItem
        Caption = #1054#1090#1083#1086#1078#1077#1085#1072
        OnClick = N34Click
      end
      object N35: TMenuItem
        Caption = #1047#1072#1082#1088#1099#1090#1072
        OnClick = N35Click
      end
      object N56: TMenuItem
        Caption = #1054#1078#1080#1076#1072#1077#1090' '#1086#1087#1083#1072#1090#1099
        OnClick = N56Click
      end
    end
  end
  object PopupMenuTask: TPopupMenu
    Left = 664
    Top = 456
    object N29: TMenuItem
      Caption = #1057#1084#1077#1085#1080#1090#1100' '#1089#1090#1072#1090#1091#1089
      object N30: TMenuItem
        Caption = #1042' '#1088#1072#1073#1086#1090#1077
        OnClick = N30Click
      end
      object N36: TMenuItem
        Caption = #1055#1088#1080#1086#1088#1080#1090#1077#1090
        OnClick = N36Click
      end
      object N40: TMenuItem
        Caption = #1054#1078#1080#1076#1072#1102' '#1079#1072#1082#1072#1079#1095#1080#1082#1072
        OnClick = N40Click
      end
      object N38: TMenuItem
        Caption = #1054#1090#1083#1086#1078#1077#1085#1072
        OnClick = N38Click
      end
      object N39: TMenuItem
        Caption = #1047#1072#1082#1088#1099#1090#1072
        OnClick = N39Click
      end
      object N57: TMenuItem
        Caption = #1054#1078#1080#1076#1072#1102' '#1086#1087#1083#1072#1090#1099
        OnClick = N57Click
      end
    end
    object N37: TMenuItem
      Caption = #1055#1077#1088#1077#1085#1086#1089' '#1079#1072#1076#1072#1095#1080
      OnClick = N37Click
    end
    object N43: TMenuItem
      Caption = '-'
    end
    object N41: TMenuItem
      Caption = #1053#1086#1074#1072#1103' '#1079#1072#1076#1072#1095#1072
      OnClick = N41Click
    end
    object N44: TMenuItem
      Caption = #1048#1079#1084#1077#1085#1080#1090#1100' '#1079#1072#1076#1072#1095#1091
      OnClick = N44Click
    end
  end
end
