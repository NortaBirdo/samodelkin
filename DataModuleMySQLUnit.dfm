object DataModuleMySQL: TDataModuleMySQL
  OldCreateOrder = False
  OnCreate = DataModuleCreate
  Height = 428
  Width = 661
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
    Left = 456
    Top = 64
  end
  object DataSourceClientList: TDataSource
    DataSet = ADQueryClientList
    Left = 560
    Top = 64
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
      'WHERE TASK.freelancer_link = FREELANCER.id')
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
    Active = True
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
    Left = 360
    Top = 312
  end
  object ADQueryFreelancerAccount: TADQuery
    Active = True
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
end
