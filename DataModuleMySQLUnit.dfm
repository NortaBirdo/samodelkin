object DataModuleMySQL: TDataModuleMySQL
  OldCreateOrder = False
  OnCreate = DataModuleCreate
  Height = 428
  Width = 802
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
    Connected = True
    LoginPrompt = False
    Transaction = ADTransaction1
    Left = 56
    Top = 56
  end
  object ADTransaction1: TADTransaction
    Connection = ADConnection1
    Left = 152
    Top = 56
  end
  object ADQueryClients: TADQuery
    AfterScroll = ADQueryClientsAfterScroll
    AfterGetRecord = ADQueryClientsAfterGetRecord
    Connection = ADConnection1
    SQL.Strings = (
      'SELECT * FROM CLIENT'
      'WHERE flag = 0')
    Left = 256
    Top = 56
  end
  object ADGUIxWaitCursor1: TADGUIxWaitCursor
    Left = 168
    Top = 120
  end
  object ADPhysMySQLDriverLink1: TADPhysMySQLDriverLink
    VendorLib = 'C:\Users\Nikolay\Documents\GitHub\samodelkin\libmysql.dll'
    Left = 56
    Top = 120
  end
  object DataSource1: TDataSource
    DataSet = ADQueryClients
    Left = 360
    Top = 56
  end
  object ADQueryFreelancer: TADQuery
    AfterScroll = ADQueryFreelancerAfterScroll
    AfterGetRecord = ADQueryFreelancerAfterGetRecord
    Connection = ADConnection1
    SQL.Strings = (
      'SELECT * FROM FREELANCER'
      'WHERE flag = 0')
    Left = 256
    Top = 120
  end
  object DataSource2: TDataSource
    DataSet = ADQueryFreelancer
    Left = 360
    Top = 120
  end
  object ADQueryProject: TADQuery
    AfterScroll = ADQueryProjectAfterScroll
    AfterRefresh = ADQueryProjectAfterRefresh
    AfterGetRecord = ADQueryProjectAfterGetRecord
    Connection = ADConnection1
    SQL.Strings = (
      'SELECT P.*, '
      'CLIENT.fio as cl_fio, '
      'CLIENT.id'
      'FROM PROJECT P, CLIENT'
      'WHERE P.status <> '#39#1086#1090#1084#1077#1085#1077#1085#39' AND P.status <> '#39#1079#1072#1082#1088#1099#1090#39
      'AND CLIENT.id = P.client_link')
    Left = 256
    Top = 184
  end
  object DataSource3: TDataSource
    DataSet = ADQueryProject
    Left = 360
    Top = 184
  end
  object ADQueryClientList: TADQuery
    Connection = ADConnection1
    SQL.Strings = (
      'SELECT * FROM CLIENT'
      'WHERE flag = 0')
    Left = 552
    Top = 56
  end
  object DataSourceClientList: TDataSource
    DataSet = ADQueryClientList
    Left = 656
    Top = 56
  end
  object ADQueryTime: TADQuery
    Connection = ADConnection1
    SQL.Strings = (
      'SELECT sum(2+2)'
      '')
    Left = 48
    Top = 208
  end
  object Timer1: TTimer
    Interval = 10000
    OnTimer = Timer1Timer
    Left = 120
    Top = 208
  end
  object ADQueryTask: TADQuery
    Connection = ADConnection1
    SQL.Strings = (
      
        'Select TASK.*, FREELANCER.Id, FREELANCER.fio from TASK, FREELANC' +
        'ER'
      'WHERE TASK.freelancer_link = FREELANCER.id'
      'AND TASK.status <> '#39#1079#1072#1082#1088#1099#1090#1072#39)
    Left = 256
    Top = 256
  end
  object DataSourceTask: TDataSource
    DataSet = ADQueryTask
    Left = 360
    Top = 256
  end
  object ADQuerySQL: TADQuery
    Connection = ADConnection1
    Left = 48
    Top = 264
  end
  object ADQueryClientAccount: TADQuery
    Connection = ADConnection1
    SQL.Strings = (
      'SELECT PERSONAL_ACCOUNT.*,'
      'CLIENT.id'
      'FROM PERSONAL_ACCOUNT, CLIENT'
      'WHERE PERSONAL_ACCOUNT.link = CLIENT.id'
      ' AND account_type = 0')
    Left = 256
    Top = 312
  end
  object DataSourceClientAccount: TDataSource
    DataSet = ADQueryClientAccount
    Left = 392
    Top = 312
  end
  object ADQueryFreelancerAccount: TADQuery
    Connection = ADConnection1
    SQL.Strings = (
      'SELECT PERSONAL_ACCOUNT.*,'
      'FREELANCER.id'
      'FROM PERSONAL_ACCOUNT, FREELANCER'
      'WHERE PERSONAL_ACCOUNT.link = FREELANCER.id'
      ' AND account_type = 1')
    Left = 256
    Top = 376
  end
  object DataSourceFreelancerAccount: TDataSource
    DataSet = ADQueryFreelancerAccount
    Left = 408
    Top = 376
  end
  object ADQueryMindTape: TADQuery
    Active = True
    Connection = ADConnection1
    SQL.Strings = (
      'SELECT T.*, P.* FROM TASK T, PROJECT P'
      'WHERE T.status <> '#39#1079#1072#1082#1088#1099#1090#1072#39' AND T.status <> '#39#1086#1090#1083#1086#1078#1077#1085#1072#39
      'AND T.project_link = P.id AND P.status <> '#39#1079#1072#1082#1088#1099#1090#39' '
      'AND P.status <> '#39#1086#1090#1084#1077#1085#1077#1085#39
      'ORDER BY T.deadline DESC')
    Left = 552
    Top = 120
  end
  object DataSourceMindTape: TDataSource
    DataSet = ADQueryMindTape
    Left = 656
    Top = 120
  end
end
