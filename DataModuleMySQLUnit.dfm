object DataModuleMySQL: TDataModuleMySQL
  OldCreateOrder = False
  OnCreate = DataModuleCreate
  Height = 240
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
    Left = 256
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
    Top = 64
  end
end
