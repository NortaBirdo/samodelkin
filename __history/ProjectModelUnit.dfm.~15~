object ProjectModel: TProjectModel
  OldCreateOrder = False
  OnCreate = DataModuleCreate
  Height = 213
  Width = 415
  object ADQueryProject: TADQuery
    AfterScroll = ADQueryProjectAfterScroll
    AfterRefresh = ADQueryProjectAfterRefresh
    AfterGetRecord = ADQueryProjectAfterGetRecord
    Connection = DataModuleMySQL.ADConnection1
    Transaction = DataModuleMySQL.ADTransaction1
    SQL.Strings = (
      'SELECT P.*, '
      'CLIENT.fio as cl_fio, '
      'CLIENT.id'
      'FROM PROJECT P, CLIENT'
      'WHERE P.status <> '#39#1086#1090#1084#1077#1085#1077#1085#39' AND P.status <> '#39#1079#1072#1082#1088#1099#1090#39
      'AND CLIENT.id = P.client_link')
    Left = 40
    Top = 40
  end
  object DataSourceProject: TDataSource
    DataSet = ADQueryProject
    Left = 160
    Top = 40
  end
  object ADQueryProjectSuch: TADQuery
    SQL.Strings = (
      'SELECT P.*, '
      'CLIENT.fio as cl_fio, '
      'CLIENT.id'
      'FROM PROJECT P, CLIENT'
      'WHERE P.status <> '#39#1086#1090#1084#1077#1085#1077#1085#39' AND P.status <> '#39#1079#1072#1082#1088#1099#1090#39
      'AND CLIENT.id = P.client_link')
    Left = 296
    Top = 40
  end
  object ADQuerySQL: TADQuery
    Connection = DataModuleMySQL.ADConnection1
    Transaction = DataModuleMySQL.ADTransaction1
    Left = 296
    Top = 120
  end
  object ADQueryProjectList: TADQuery
    Connection = DataModuleMySQL.ADConnection1
    Transaction = DataModuleMySQL.ADTransaction1
    SQL.Strings = (
      'SELECT * FROM PROJECT'
      'where status <> '#39#1086#1090#1084#1077#1085#1077#1085#39' AND status <> '#39#1079#1072#1082#1088#1099#1090#39
      'order by caption')
    Left = 40
    Top = 120
  end
  object DataSourceProjectList: TDataSource
    DataSet = ADQueryProjectList
    Left = 168
    Top = 120
  end
end
