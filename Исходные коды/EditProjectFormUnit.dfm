object EditProjectForm: TEditProjectForm
  Left = 0
  Top = 0
  BorderIcons = [biSystemMenu]
  BorderStyle = bsSingle
  Caption = #1056#1077#1076#1072#1082#1090#1080#1088#1086#1074#1072#1085#1080#1077' '#1087#1088#1086#1077#1082#1090#1072
  ClientHeight = 348
  ClientWidth = 540
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poDesktopCenter
  OnClose = FormClose
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object Label1: TLabel
    Left = 24
    Top = 16
    Width = 73
    Height = 13
    Caption = #1053#1072#1080#1084#1077#1085#1086#1074#1072#1085#1080#1077
  end
  object Label2: TLabel
    Left = 24
    Top = 50
    Width = 48
    Height = 26
    Caption = #1058#1077#1082#1091#1097#1080#1081' '#1079#1072#1082#1072#1079#1095#1080#1082
    WordWrap = True
  end
  object Label3: TLabel
    Left = 336
    Top = 21
    Width = 89
    Height = 13
    Caption = #1053#1086#1074#1099#1081' '#1079#1072#1082#1072#1079#1095#1080#1082': '
    WordWrap = True
  end
  object Label4: TLabel
    Left = 24
    Top = 83
    Width = 53
    Height = 13
    Caption = #1057#1089#1099#1083#1082#1072' git'
  end
  object Label5: TLabel
    Left = 24
    Top = 115
    Width = 36
    Height = 13
    Caption = #1057#1090#1072#1090#1091#1089
  end
  object Label6: TLabel
    Left = 24
    Top = 147
    Width = 61
    Height = 13
    Caption = #1055#1088#1080#1084#1077#1095#1072#1085#1080#1077
  end
  object DBText1: TDBText
    Left = 103
    Top = 50
    Width = 132
    Height = 17
    DataField = 'cl_fio'
    DataSource = ProjectModel.DataSourceProject
  end
  object DBEdit1: TDBEdit
    Left = 103
    Top = 13
    Width = 132
    Height = 21
    DataField = 'caption'
    DataSource = ProjectModel.DataSourceProject
    TabOrder = 0
  end
  object DBEdit2: TDBEdit
    Left = 103
    Top = 80
    Width = 132
    Height = 21
    DataField = 'git'
    DataSource = ProjectModel.DataSourceProject
    TabOrder = 1
  end
  object DBGrid1: TDBGrid
    Left = 336
    Top = 80
    Width = 201
    Height = 222
    DataSource = ClientModel.DataSourceClientList
    TabOrder = 2
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'Tahoma'
    TitleFont.Style = []
    Columns = <
      item
        Expanded = False
        FieldName = 'fio'
        Title.Caption = #1060'.'#1048'.'#1054'.'
        Width = 150
        Visible = True
      end>
  end
  object BtnChangeClient: TButton
    Left = 336
    Top = 308
    Width = 75
    Height = 25
    Caption = #1042#1099#1073#1088#1072#1090#1100
    TabOrder = 3
    OnClick = BtnChangeClientClick
  end
  object BtnSave: TButton
    Left = 22
    Top = 308
    Width = 75
    Height = 25
    Caption = #1054#1082
    TabOrder = 4
    OnClick = BtnSaveClick
  end
  object BtnCancel: TButton
    Left = 160
    Top = 308
    Width = 75
    Height = 25
    Caption = #1054#1090#1084#1077#1085#1072
    TabOrder = 5
    OnClick = BtnCancelClick
  end
  object DBMemo1: TDBMemo
    Left = 22
    Top = 166
    Width = 213
    Height = 136
    DataField = 'note'
    DataSource = ProjectModel.DataSourceProject
    ScrollBars = ssVertical
    TabOrder = 6
  end
  object DBComboBox1: TDBComboBox
    Left = 103
    Top = 107
    Width = 132
    Height = 21
    DataField = 'status'
    DataSource = ProjectModel.DataSourceProject
    Items.Strings = (
      #1074' '#1088#1072#1073#1086#1090#1077
      #1079#1072#1084#1086#1088#1086#1078#1077#1085
      #1087#1088#1080#1086#1088#1080#1090#1077#1090
      #1079#1072#1082#1088#1099#1090
      #1086#1090#1084#1077#1085#1077#1085
      #1086#1078#1080#1076#1072#1102' '#1086#1087#1083#1072#1090#1099)
    TabOrder = 7
  end
end
