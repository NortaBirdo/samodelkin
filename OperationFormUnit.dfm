object OperationForm: TOperationForm
  Left = 0
  Top = 0
  BorderIcons = [biSystemMenu]
  BorderStyle = bsSingle
  Caption = #1056#1077#1075#1080#1089#1090#1088#1072#1094#1080#1103' '#1086#1087#1077#1088#1072#1094#1080#1080
  ClientHeight = 239
  ClientWidth = 442
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poDesktopCenter
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object Label1: TLabel
    Left = 8
    Top = 16
    Width = 54
    Height = 13
    Caption = #1058#1080#1087' '#1089#1095#1077#1090#1072':'
  end
  object Label2: TLabel
    Left = 8
    Top = 59
    Width = 31
    Height = 13
    Caption = #1057#1091#1084#1084#1072
  end
  object Label3: TLabel
    Left = 8
    Top = 83
    Width = 117
    Height = 13
    Caption = #1055#1088#1080#1084#1077#1095#1072#1085#1080#1103' '#1082' '#1087#1083#1072#1090#1077#1078#1091
  end
  object LabelType: TLabel
    Left = 144
    Top = 16
    Width = 54
    Height = 13
    Caption = #1058#1080#1087' '#1089#1095#1077#1090#1072':'
  end
  object Label4: TLabel
    Left = 8
    Top = 35
    Width = 61
    Height = 13
    Caption = #1055#1086#1083#1091#1095#1072#1090#1077#1083#1100
  end
  object LabelName: TLabel
    Left = 144
    Top = 35
    Width = 52
    Height = 13
    Caption = 'LabelName'
  end
  object DBEditSUM: TDBEdit
    Left = 144
    Top = 56
    Width = 121
    Height = 21
    DataField = 'operation'
    DataSource = DataModuleMySQL.DataSourceClientAccount
    TabOrder = 0
  end
  object DBMemoNOTE: TDBMemo
    Left = 144
    Top = 83
    Width = 289
    Height = 110
    DataField = 'note'
    DataSource = DataModuleMySQL.DataSourceClientAccount
    ScrollBars = ssVertical
    TabOrder = 1
  end
  object Button1: TButton
    Left = 8
    Top = 208
    Width = 75
    Height = 25
    Caption = 'OK'
    TabOrder = 2
    OnClick = Button1Click
  end
  object Button2: TButton
    Left = 358
    Top = 208
    Width = 75
    Height = 25
    Caption = #1054#1090#1084#1077#1085#1072
    TabOrder = 3
    OnClick = Button2Click
  end
end
