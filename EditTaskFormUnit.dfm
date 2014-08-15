object EditTaskForm: TEditTaskForm
  Left = 0
  Top = 0
  BorderIcons = [biSystemMenu]
  BorderStyle = bsSingle
  Caption = #1056#1077#1076#1072#1082#1090#1080#1088#1086#1074#1072#1085#1080#1077' '#1079#1072#1076#1072#1095#1080
  ClientHeight = 470
  ClientWidth = 602
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
    Left = 8
    Top = 16
    Width = 112
    Height = 13
    Caption = #1053#1072#1080#1084#1077#1085#1086#1074#1072#1085#1080#1077' '#1079#1072#1076#1072#1095#1080
  end
  object Label2: TLabel
    Left = 8
    Top = 43
    Width = 42
    Height = 13
    Caption = #1041#1102#1076#1078#1077#1090
  end
  object Label4: TLabel
    Left = 8
    Top = 65
    Width = 113
    Height = 13
    Caption = #1058#1077#1082#1091#1097#1080#1081' '#1080#1089#1087#1086#1083#1085#1080#1090#1077#1083#1100
  end
  object Label5: TLabel
    Left = 8
    Top = 129
    Width = 61
    Height = 13
    Caption = #1055#1088#1080#1084#1077#1095#1072#1085#1080#1077
  end
  object DBText1: TDBText
    Left = 136
    Top = 65
    Width = 209
    Height = 17
    DataField = 'fio'
    DataSource = TaskDataModule.DataSourceTask
  end
  object Label6: TLabel
    Left = 8
    Top = 97
    Width = 36
    Height = 13
    Caption = #1057#1090#1072#1090#1091#1089
  end
  object LabelChange: TLabel
    Left = 8
    Top = 288
    Width = 105
    Height = 13
    Caption = #1053#1086#1074#1099#1081' '#1080#1089#1087#1086#1083#1085#1080#1090#1077#1083#1100':'
  end
  object Label3: TLabel
    Left = 392
    Top = 219
    Width = 41
    Height = 13
    Caption = 'Deadline'
  end
  object DBText2: TDBText
    Left = 439
    Top = 219
    Width = 85
    Height = 12
    DataField = 'deadline'
    DataSource = TaskDataModule.DataSourceTask
  end
  object DBMemo1: TDBMemo
    Left = 8
    Top = 148
    Width = 369
    Height = 125
    DataField = 'note'
    DataSource = TaskDataModule.DataSourceTask
    ScrollBars = ssVertical
    TabOrder = 0
  end
  object DBEdit2: TDBEdit
    Left = 136
    Top = 35
    Width = 121
    Height = 21
    DataField = 'budget'
    DataSource = TaskDataModule.DataSourceTask
    TabOrder = 1
  end
  object DBEdit3: TDBEdit
    Left = 136
    Top = 8
    Width = 121
    Height = 21
    DataField = 'caption'
    DataSource = TaskDataModule.DataSourceTask
    TabOrder = 2
  end
  object DBComboBox1: TDBComboBox
    Left = 136
    Top = 94
    Width = 121
    Height = 21
    DataField = 'status'
    DataSource = TaskDataModule.DataSourceTask
    Items.Strings = (
      #1074' '#1088#1072#1073#1086#1090#1077
      #1087#1088#1080#1086#1088#1080#1090#1077#1090
      #1079#1072#1082#1088#1099#1090#1072
      #1086#1090#1083#1086#1078#1077#1085#1072
      #1086#1078#1080#1076#1072#1102' '#1079#1072#1082#1072#1079#1095#1080#1082#1072
      #1086#1078#1080#1076#1072#1102' '#1086#1087#1083#1072#1090#1099)
    TabOrder = 3
  end
  object DBGrid1: TDBGrid
    Left = 8
    Top = 307
    Width = 369
    Height = 150
    DataSource = FreelancerModel.DataSourceFreelancer
    ReadOnly = True
    TabOrder = 4
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
        Width = 212
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'phone'
        Visible = False
      end
      item
        Expanded = False
        FieldName = 'email'
        Visible = False
      end
      item
        Expanded = False
        FieldName = 'skype'
        Visible = False
      end
      item
        Expanded = False
        FieldName = 'website'
        Visible = False
      end
      item
        Expanded = False
        FieldName = 'condition'
        Visible = False
      end
      item
        Expanded = False
        FieldName = 'note'
        Visible = False
      end
      item
        Expanded = False
        FieldName = 'fl_link'
        Visible = False
      end
      item
        Expanded = False
        FieldName = 'flag'
        Visible = False
      end
      item
        Expanded = False
        FieldName = 'spezialization'
        Title.Caption = #1057#1087#1077#1094#1080#1072#1083#1080#1079#1072#1094#1080#1103
        Width = 119
        Visible = True
      end>
  end
  object BtnChangeFreelancer: TButton
    Left = 302
    Top = 279
    Width = 75
    Height = 25
    Caption = #1042#1099#1073#1088#1072#1090#1100
    TabOrder = 5
    OnClick = BtnChangeFreelancerClick
  end
  object BtnOk: TButton
    Left = 392
    Top = 401
    Width = 139
    Height = 25
    Caption = 'OK'
    TabOrder = 6
    OnClick = BtnOkClick
  end
  object BtnCancel: TButton
    Left = 392
    Top = 432
    Width = 139
    Height = 25
    Caption = #1054#1090#1084#1077#1085#1072
    TabOrder = 7
    OnClick = BtnCancelClick
  end
  object MonthCalendar1: TMonthCalendar
    Left = 392
    Top = 43
    Width = 191
    Height = 160
    Date = 41668.486931469910000000
    TabOrder = 8
    OnClick = MonthCalendar1Click
  end
  object NullDeadlineBtn: TButton
    Left = 392
    Top = 238
    Width = 111
    Height = 25
    Caption = #1054#1073#1085#1091#1083#1080#1090#1100' deadline'
    TabOrder = 9
    OnClick = NullDeadlineBtnClick
  end
end
