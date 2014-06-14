object FreelancerModel: TFreelancerModel
  OldCreateOrder = False
  OnCreate = DataModuleCreate
  Height = 427
  Width = 616
  object ADQueryFreelancer: TADQuery
    AfterScroll = ADQueryFreelancerAfterScroll
    AfterGetRecord = ADQueryFreelancerAfterGetRecord
    Connection = DataModuleMySQL.ADConnection1
    Transaction = DataModuleMySQL.ADTransaction1
    SQL.Strings = (
      'SELECT * FROM FREELANCER'
      'WHERE flag = 0')
    Left = 72
    Top = 48
  end
  object DataSourceFreelancer: TDataSource
    DataSet = ADQueryFreelancer
    Left = 224
    Top = 56
  end
  object ADQueryFreelancerAccount: TADQuery
    Connection = DataModuleMySQL.ADConnection1
    Transaction = DataModuleMySQL.ADTransaction1
    SQL.Strings = (
      'SELECT PERSONAL_ACCOUNT.*,'
      'FREELANCER.id'
      'FROM PERSONAL_ACCOUNT, FREELANCER'
      'WHERE PERSONAL_ACCOUNT.link = FREELANCER.id'
      ' AND account_type = 1')
    Left = 72
    Top = 112
  end
  object DataSourceFreelancerAccount: TDataSource
    DataSet = ADQueryFreelancerAccount
    Left = 224
    Top = 112
  end
  object ADQuerySQL: TADQuery
    Connection = DataModuleMySQL.ADConnection1
    Transaction = DataModuleMySQL.ADTransaction1
    Left = 72
    Top = 208
  end
end
