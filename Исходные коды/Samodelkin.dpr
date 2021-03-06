program Samodelkin;

uses
  Vcl.Forms,
  MainUnit in 'MainUnit.pas' {MainForm},
  DataModuleSQLite in 'DataModuleSQLite.pas' {SQLiteDataModule: TDataModule},
  SettingFormUnit in 'SettingFormUnit.pas' {SettingForm},
  ClientsFormUnit in 'ClientsFormUnit.pas' {ClientsForm},
  FreelanceFormUnit in 'FreelanceFormUnit.pas' {FreelanceForm},
  DataModuleMySQLUnit in 'DataModuleMySQLUnit.pas' {DataModuleMySQL: TDataModule},
  EditProjectFormUnit in 'EditProjectFormUnit.pas' {EditProjectForm},
  EditTaskFormUnit in 'EditTaskFormUnit.pas' {EditTaskForm},
  OperationFormUnit in 'OperationFormUnit.pas' {OperationForm},
  TaskModelUnit in 'TaskModelUnit.pas',
  TrtansferTaskFormUnit in 'TrtansferTaskFormUnit.pas' {TransferTaskForm},
  ProjectModelUnit in 'ProjectModelUnit.pas' {ProjectModel: TDataModule},
  ClientModelUnit in 'ClientModelUnit.pas' {ClientModel: TDataModule},
  FreelancerModelUnit in 'FreelancerModelUnit.pas' {FreelancerModel: TDataModule},
  TaskModel in 'TaskModel.pas' {TaskDataModule: TDataModule},
  TapeModelUnit in 'TapeModelUnit.pas' {TapeModel: TDataModule};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TSQLiteDataModule, SQLiteDataModule);
  Application.CreateForm(TDataModuleMySQL, DataModuleMySQL);
  Application.CreateForm(TTaskDataModule, TaskDataModule);
  Application.CreateForm(TTapeModel, TapeModel);
  Application.CreateForm(TProjectModel, ProjectModel);
  Application.CreateForm(TFreelancerModel, FreelancerModel);
  Application.CreateForm(TMainForm, MainForm);
  Application.CreateForm(TSettingForm, SettingForm);
  Application.CreateForm(TClientsForm, ClientsForm);
  Application.CreateForm(TFreelanceForm, FreelanceForm);
  Application.CreateForm(TEditProjectForm, EditProjectForm);
  Application.CreateForm(TEditTaskForm, EditTaskForm);
  Application.CreateForm(TOperationForm, OperationForm);
  Application.CreateForm(TTransferTaskForm, TransferTaskForm);
  Application.CreateForm(TClientModel, ClientModel);
  Application.Run;
end.
