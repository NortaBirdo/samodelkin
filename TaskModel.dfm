object TaskDataModule: TTaskDataModule
  OldCreateOrder = False
  Height = 200
  Width = 294
  object ADQueryTask: TADQuery
    Connection = DataModuleMySQL.ADConnection1
    SQL.Strings = (
      
        'Select TASK.*, FREELANCER.Id, FREELANCER.fio from TASK, FREELANC' +
        'ER'
      'WHERE TASK.freelancer_link = FREELANCER.id'
      'AND TASK.status <> '#39#1079#1072#1082#1088#1099#1090#1072#39)
    Left = 32
    Top = 40
  end
  object DataSourceTask: TDataSource
    DataSet = ADQueryTask
    Left = 128
    Top = 32
  end
  object ADQuerySQL: TADQuery
    Left = 32
    Top = 104
  end
end
