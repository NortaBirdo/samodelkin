object DataModuleMySQL: TDataModuleMySQL
  OldCreateOrder = False
  OnCreate = DataModuleCreate
  Height = 267
  Width = 585
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
    Active = True
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
    Active = True
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
end