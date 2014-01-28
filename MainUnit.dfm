object MainForm: TMainForm
  Left = 0
  Top = 0
  BorderIcons = [biSystemMenu]
  BorderStyle = bsSingle
  Caption = #1057#1072#1084#1086#1076#1077#1083#1082#1080#1085
  ClientHeight = 567
  ClientWidth = 916
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  Menu = MainMenu1
  OldCreateOrder = False
  Position = poDesktopCenter
  PixelsPerInch = 96
  TextHeight = 13
  object Label1: TLabel
    Left = 8
    Top = 16
    Width = 87
    Height = 13
    Caption = #1057#1087#1080#1089#1086#1082' '#1087#1088#1086#1077#1082#1090#1086#1074
  end
  object Label2: TLabel
    Left = 8
    Top = 309
    Width = 97
    Height = 13
    Caption = #1047#1072#1076#1072#1095#1080' '#1087#1086' '#1087#1088#1086#1077#1082#1090#1091
  end
  object Label3: TLabel
    Left = 607
    Top = 96
    Width = 69
    Height = 13
    Caption = #1057#1089#1099#1083#1082#1072' '#1085#1072' Git'
  end
  object Label4: TLabel
    Left = 607
    Top = 122
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
  object Label6: TLabel
    Left = 607
    Top = 69
    Width = 36
    Height = 13
    Caption = #1057#1090#1072#1090#1091#1089
  end
  object DBText1: TDBText
    Left = 682
    Top = 96
    Width = 223
    Height = 17
    DataField = 'git'
    DataSource = DataModuleMySQL.DataSource3
  end
  object DBText2: TDBText
    Left = 682
    Top = 69
    Width = 223
    Height = 17
    DataField = 'status'
    DataSource = DataModuleMySQL.DataSource3
  end
  object DBGrid1: TDBGrid
    Left = 8
    Top = 62
    Width = 593
    Height = 241
    DataSource = DataModuleMySQL.DataSource3
    ReadOnly = True
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
        Title.Caption = '#'
        Width = 50
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'caption'
        Title.Caption = #1053#1072#1079#1074#1072#1085#1080#1077
        Width = 150
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'id_1'
        Visible = False
      end
      item
        Expanded = False
        FieldName = 'cl_fio'
        Title.Caption = #1047#1072#1082#1072#1079#1095#1080#1082
        Width = 150
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'status'
        Title.Caption = #1057#1090#1072#1090#1091#1089
        Width = -1
        Visible = False
      end
      item
        Expanded = False
        FieldName = 'client_link'
        Visible = False
      end
      item
        Expanded = False
        FieldName = 'note'
        Visible = False
      end
      item
        Expanded = False
        FieldName = 'git'
        Title.Caption = 'Git'
        Visible = False
      end
      item
        Expanded = False
        FieldName = 'budget'
        Title.Caption = #1057#1090#1086#1080#1084#1086#1089#1090#1100
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'salary'
        Title.Caption = #1054#1087#1083#1072#1090#1072
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'balance'
        Title.Caption = #1041#1072#1083#1072#1085#1089
        Visible = True
      end>
  end
  object DBGrid2: TDBGrid
    Left = 8
    Top = 328
    Width = 585
    Height = 217
    TabOrder = 1
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'Tahoma'
    TitleFont.Style = []
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
      #1086#1090#1084#1077#1085#1077#1085)
  end
  object DBMemo1: TDBMemo
    Left = 607
    Top = 141
    Width = 298
    Height = 162
    DataField = 'note'
    DataSource = DataModuleMySQL.DataSource3
    ReadOnly = True
    ScrollBars = ssVertical
    TabOrder = 3
  end
  object MainMenu1: TMainMenu
    Left = 400
    Top = 8
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
      end
      object N14: TMenuItem
        Caption = #1057#1086#1093#1088#1072#1085#1080#1090#1100' '#1079#1072#1076#1072#1095#1091
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
end
