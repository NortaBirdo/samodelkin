object SettingForm: TSettingForm
  Left = 0
  Top = 0
  BorderIcons = [biSystemMenu]
  BorderStyle = bsSingle
  Caption = #1053#1072#1089#1090#1088#1086#1081#1082#1080' '#1089#1086#1077#1076#1080#1085#1077#1085#1080#1103
  ClientHeight = 222
  ClientWidth = 343
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -13
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poDesktopCenter
  PixelsPerInch = 96
  TextHeight = 16
  object Label1: TLabel
    Left = 24
    Top = 24
    Width = 63
    Height = 16
    Caption = 'IP '#1089#1077#1088#1074#1077#1088#1072
  end
  object Label2: TLabel
    Left = 24
    Top = 54
    Width = 103
    Height = 16
    Caption = #1048#1084#1103' '#1073#1072#1079#1099' '#1076#1072#1085#1085#1099#1093
  end
  object Label3: TLabel
    Left = 24
    Top = 84
    Width = 35
    Height = 16
    Caption = #1051#1086#1075#1080#1085
  end
  object Label4: TLabel
    Left = 24
    Top = 114
    Width = 43
    Height = 16
    Caption = #1055#1072#1088#1086#1083#1100
  end
  object DBEdit1: TDBEdit
    Left = 160
    Top = 21
    Width = 153
    Height = 24
    DataField = 'ip'
    DataSource = SQLiteDataModule.DataSource1
    TabOrder = 0
  end
  object DBEdit2: TDBEdit
    Left = 160
    Top = 51
    Width = 153
    Height = 24
    DataField = 'db_name'
    DataSource = SQLiteDataModule.DataSource1
    TabOrder = 1
  end
  object DBEdit3: TDBEdit
    Left = 160
    Top = 81
    Width = 153
    Height = 24
    DataField = 'login'
    DataSource = SQLiteDataModule.DataSource1
    TabOrder = 2
  end
  object DBEdit4: TDBEdit
    Left = 160
    Top = 111
    Width = 153
    Height = 24
    DataField = 'pass'
    DataSource = SQLiteDataModule.DataSource1
    PasswordChar = #7
    TabOrder = 3
  end
  object OKButton: TButton
    Left = 24
    Top = 168
    Width = 103
    Height = 25
    Caption = 'OK'
    TabOrder = 4
    OnClick = OKButtonClick
  end
  object CancelButton: TButton
    Left = 216
    Top = 168
    Width = 97
    Height = 25
    Caption = #1054#1090#1084#1077#1085#1072
    TabOrder = 5
    OnClick = CancelButtonClick
  end
end
