object ClientsForm: TClientsForm
  Left = 0
  Top = 0
  BorderIcons = [biSystemMenu]
  BorderStyle = bsSingle
  Caption = #1050#1083#1080#1077#1085#1090#1099
  ClientHeight = 405
  ClientWidth = 969
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poDesktopCenter
  PixelsPerInch = 96
  TextHeight = 13
  object Label1: TLabel
    Left = 743
    Top = 48
    Width = 61
    Height = 13
    Caption = #1055#1088#1080#1084#1077#1095#1072#1085#1080#1103
  end
  object Label2: TLabel
    Left = 8
    Top = 48
    Width = 64
    Height = 13
    Caption = #1054#1090#1086#1073#1088#1072#1078#1072#1090#1100
  end
  object DBGrid1: TDBGrid
    Left = 8
    Top = 67
    Width = 729
    Height = 326
    DataSource = DataModuleMySQL.DataSource1
    TabOrder = 0
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'Tahoma'
    TitleFont.Style = []
    Columns = <
      item
        Expanded = False
        FieldName = 'id'
        Visible = False
      end
      item
        Expanded = False
        FieldName = 'fio'
        Title.Caption = #1060'.'#1048'.'#1054'.'
        Width = 150
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'phone'
        Title.Caption = #1058#1077#1083#1077#1092#1086#1085
        Width = 100
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'email'
        Title.Caption = 'E-mail'
        Width = 100
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'skype'
        Title.Caption = 'Skype'
        Width = 100
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'website'
        Title.Caption = #1057#1072#1081#1090
        Width = 100
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'fl_link'
        Title.Caption = #1057#1089#1099#1083#1082#1072' '#1085#1072' '#1087#1088#1086#1092#1080#1083#1100
        Width = 150
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'note'
        Title.Caption = #1055#1088#1080#1084#1077#1095#1072#1085#1080#1103
        Visible = False
      end
      item
        Expanded = False
        FieldName = 'flag'
        Visible = False
      end>
  end
  object DBMemo1: TDBMemo
    Left = 743
    Top = 67
    Width = 218
    Height = 326
    DataField = 'note'
    DataSource = DataModuleMySQL.DataSource1
    ScrollBars = ssVertical
    TabOrder = 1
  end
  object ControlBar1: TControlBar
    Left = 0
    Top = 0
    Width = 969
    Height = 33
    Align = alTop
    TabOrder = 2
    object ToolBar1: TToolBar
      Left = 11
      Top = 2
      Width = 390
      Height = 22
      ButtonHeight = 21
      ButtonWidth = 91
      Caption = 'ToolBar1'
      ShowCaptions = True
      TabOrder = 0
      object ToolButton1: TToolButton
        Left = 0
        Top = 0
        AutoSize = True
        Caption = #1044#1086#1073#1072#1074#1080#1090#1100
        ImageIndex = 0
        OnClick = ToolButton1Click
      end
      object ToolButton2: TToolButton
        Left = 61
        Top = 0
        AutoSize = True
        Caption = #1057#1086#1093#1088#1072#1085#1080#1090#1100
        ImageIndex = 1
        OnClick = ToolButton2Click
      end
      object ToolButton4: TToolButton
        Left = 127
        Top = 0
        Width = 8
        Caption = 'ToolButton4'
        ImageIndex = 3
        Style = tbsSeparator
      end
      object ToolBtnArch: TToolButton
        Left = 135
        Top = 0
        AutoSize = True
        Caption = #1040#1088#1093#1080#1074#1080#1088#1086#1074#1072#1090#1100
        ImageIndex = 2
      end
      object ToolBtnBlackList: TToolButton
        Left = 219
        Top = 0
        AutoSize = True
        Caption = #1042' '#1095#1077#1088#1085#1099#1081' '#1089#1087#1080#1089#1086#1082
        ImageIndex = 3
      end
    end
  end
  object ComboBox1: TComboBox
    Left = 88
    Top = 39
    Width = 145
    Height = 21
    ItemIndex = 0
    TabOrder = 3
    Text = #1040#1082#1090#1080#1074#1085#1099#1077
    OnChange = ComboBox1Change
    Items.Strings = (
      #1040#1082#1090#1080#1074#1085#1099#1077
      #1042' '#1072#1088#1093#1080#1074#1077
      #1063#1077#1088#1085#1099#1081' '#1089#1087#1080#1089#1086#1082)
  end
end
