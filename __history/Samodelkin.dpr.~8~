program Samodelkin;

uses
  Vcl.Forms,
  MainUnit in 'MainUnit.pas' {MainForm},
  DataModuleSQLite in 'DataModuleSQLite.pas' {SQLiteDataModule: TDataModule},
  SettingFormUnit in 'SettingFormUnit.pas' {SettingForm},
  ClientsFormUnit in 'ClientsFormUnit.pas' {ClientsForm},
  FreelanceFormUnit in 'FreelanceFormUnit.pas' {FreelanceForm},
  DataModuleMySQLUnit in 'DataModuleMySQLUnit.pas' {DataModuleMySQL: TDataModule};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TSQLiteDataModule, SQLiteDataModule);
  Application.CreateForm(TDataModuleMySQL, DataModuleMySQL);
  Application.CreateForm(TMainForm, MainForm);
  Application.CreateForm(TSettingForm, SettingForm);
  Application.CreateForm(TClientsForm, ClientsForm);
  Application.CreateForm(TFreelanceForm, FreelanceForm);
  Application.Run;
end.
