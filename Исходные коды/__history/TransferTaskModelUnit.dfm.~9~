object TransferTaskModel: TTransferTaskModel
  OldCreateOrder = False
  OnCreate = DataModuleCreate
  Height = 292
  Width = 377
  object ADQueryProjectList: TADQuery
    Connection = DataModuleMySQL.ADConnection1
    Transaction = DataModuleMySQL.ADTransaction1
    SQL.Strings = (
      'SELECT * FROM PROJECT'
      'where status <> '#39#1086#1090#1084#1077#1085#1077#1085#39' AND status <> '#39#1079#1072#1082#1088#1099#1090#39
      'order by caption')
    Left = 80
    Top = 40
  end
  object DataSource1: TDataSource
    DataSet = ADQueryProjectList
    Left = 216
    Top = 40
  end
  object ADQuerySQL: TADQuery
    Connection = DataModuleMySQL.ADConnection1
    Transaction = DataModuleMySQL.ADTransaction1
    Left = 64
    Top = 136
  end
end
