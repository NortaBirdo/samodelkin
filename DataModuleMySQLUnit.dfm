object DataModuleMySQL: TDataModuleMySQL
  OldCreateOrder = False
  OnCreate = DataModuleCreate
  Height = 352
  Width = 499
  object ADConnection1: TADConnection
    Params.Strings = (
      'Server=bora.beget.ru'
      'Database=sokoloit_selfmad'
      'User_Name=sokoloit_selfmad'
      'Password=Y9Q7l34U'
      'LoginTimeout=50000'
      'ReadTimeout=50000'
      'WriteTimeout=50000'
      'DriverID=MySQL')
    LoginPrompt = False
    Transaction = ADTransaction1
    Left = 56
    Top = 56
  end
  object ADTransaction1: TADTransaction
    Connection = ADConnection1
    Left = 200
    Top = 56
  end
  object ADGUIxWaitCursor1: TADGUIxWaitCursor
    Left = 200
    Top = 120
  end
  object ADPhysMySQLDriverLink1: TADPhysMySQLDriverLink
    Left = 56
    Top = 128
  end
  object ADQueryTime: TADQuery
    Connection = ADConnection1
    SQL.Strings = (
      'SELECT sum(2+2)'
      '')
    Left = 424
    Top = 72
  end
  object Timer1: TTimer
    Interval = 10000
    OnTimer = Timer1Timer
    Left = 352
    Top = 72
  end
  object ADQueryTask: TADQuery
    Connection = ADConnection1
    SQL.Strings = (
      
        'Select TASK.*, FREELANCER.Id, FREELANCER.fio from TASK, FREELANC' +
        'ER'
      'WHERE TASK.freelancer_link = FREELANCER.id'
      'AND TASK.status <> '#39#1079#1072#1082#1088#1099#1090#1072#39)
    Left = 48
    Top = 216
  end
  object DataSourceTask: TDataSource
    DataSet = ADQueryTask
    Left = 152
    Top = 216
  end
  object ADQuerySQL: TADQuery
    Connection = ADConnection1
    Left = 424
    Top = 144
  end
  object ADQueryMindTape: TADQuery
    Connection = ADConnection1
    SQL.Strings = (
      'SELECT T.*, P.* FROM TASK T, PROJECT P'
      'WHERE T.status <> '#39#1079#1072#1082#1088#1099#1090#1072#39' AND T.status <> '#39#1086#1090#1083#1086#1078#1077#1085#1072#39
      'AND T.project_link = P.id AND P.status <> '#39#1079#1072#1082#1088#1099#1090#39' '
      'AND P.status <> '#39#1086#1090#1084#1077#1085#1077#1085#39
      'ORDER BY T.deadline DESC')
    Left = 48
    Top = 288
  end
  object DataSourceMindTape: TDataSource
    DataSet = ADQueryMindTape
    Left = 152
    Top = 288
  end
end
