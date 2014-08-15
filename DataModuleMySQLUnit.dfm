object DataModuleMySQL: TDataModuleMySQL
  OldCreateOrder = False
  OnCreate = DataModuleCreate
  Height = 216
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
    Top = 48
  end
  object Timer1: TTimer
    Interval = 10000
    OnTimer = Timer1Timer
    Left = 352
    Top = 48
  end
  object ADQuerySQL: TADQuery
    Connection = ADConnection1
    Left = 424
    Top = 120
  end
end
