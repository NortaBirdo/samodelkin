object ClientModel: TClientModel
  OldCreateOrder = False
  OnCreate = DataModuleCreate
  Height = 364
  Width = 535
  object ADQueryClients: TADQuery
    AfterScroll = ADQueryClientsAfterScroll
    AfterGetRecord = ADQueryClientsAfterGetRecord
    Connection = DataModuleMySQL.ADConnection1
    Transaction = DataModuleMySQL.ADTransaction1
    SQL.Strings = (
      'SELECT * FROM CLIENT'
      'WHERE flag = 0')
    Left = 95
    Top = 40
  end
  object DataSourceClient: TDataSource
    DataSet = ADQueryClients
    Left = 263
    Top = 40
  end
  object ADQueryClientList: TADQuery
    Connection = DataModuleMySQL.ADConnection1
    Transaction = DataModuleMySQL.ADTransaction1
    SQL.Strings = (
      'SELECT * FROM CLIENT'
      'WHERE flag = 0')
    Left = 95
    Top = 136
  end
  object DataSourceClientList: TDataSource
    DataSet = ADQueryClientList
    Left = 263
    Top = 144
  end
  object ADQueryClientAccount: TADQuery
    Connection = DataModuleMySQL.ADConnection1
    Transaction = DataModuleMySQL.ADTransaction1
    SQL.Strings = (
      'SELECT PERSONAL_ACCOUNT.*,'
      'CLIENT.id'
      'FROM PERSONAL_ACCOUNT, CLIENT'
      'WHERE PERSONAL_ACCOUNT.link = CLIENT.id'
      ' AND account_type = 0'
      'ORDER BY date_operation DESC')
    Left = 95
    Top = 236
  end
  object DataSourceClientAccount: TDataSource
    DataSet = ADQueryClientAccount
    Left = 263
    Top = 236
  end
  object ADQuerySQL: TADQuery
    Connection = DataModuleMySQL.ADConnection1
    Transaction = DataModuleMySQL.ADTransaction1
    Left = 96
    Top = 304
  end
end
