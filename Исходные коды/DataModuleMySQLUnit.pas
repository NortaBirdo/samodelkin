unit DataModuleMySQLUnit;

interface

uses
  System.SysUtils, System.Classes, uADStanIntf, uADStanOption, uADStanError,
  uADGUIxIntf, uADPhysIntf, uADStanDef, uADStanPool, uADStanAsync,
  uADPhysManager, uADStanParam, uADDatSManager, uADDAptIntf, uADDAptManager,
  uADGUIxFormsWait, uADPhysMySQL, uADCompGUIx, uADCompClient, Data.DB,
  uADCompDataSet, vcl.forms, Vcl.ExtCtrls;

type
  TDataModuleMySQL = class(TDataModule)
    ADConnection1: TADConnection;
    ADTransaction1: TADTransaction;
    ADGUIxWaitCursor1: TADGUIxWaitCursor;
    ADPhysMySQLDriverLink1: TADPhysMySQLDriverLink;
    ADQueryTime: TADQuery;
    Timer1: TTimer;
    ADQuerySQL: TADQuery;
    procedure DataModuleCreate(Sender: TObject);
    procedure Timer1Timer(Sender: TObject);

  private

  public

    var
      FirstStart: boolean;

 end;

var
  DataModuleMySQL: TDataModuleMySQL;

implementation

{%CLASSGROUP 'Vcl.Controls.TControl'}

uses DataModuleSQLite, ClientsFormUnit, FreelanceFormUnit, ProjectModelUnit;

{$R *.dfm}
//====================================================================
//подключение
//
procedure TDataModuleMySQL.DataModuleCreate(Sender: TObject);
var
ip, DBName, Login, Pass, DriverPath: string;
begin

ip := SQLiteDataModule.GetHostName;
DBName := SQLiteDataModule.GetDBName;
Login := SQLiteDataModule.GetLogin;
Pass := SQLiteDataModule.GetPass;

ADConnection1.Connected := false;

DriverPath := Application.ExeName;
DriverPath := ExtractFilePath(DriverPath) + 'libmysql.dll';
ADPhysMySQLDriverLink1.VendorLib := DriverPath;


with ADConnection1.Params do
begin
  Clear;
  Add('Server='+ip);
  Add('Database='+DBName);
  Add('User_Name='+login);
  Add('Password='+pass);
  Add('CharacterSet=utf8');
  Add('DriverID=MySQL');
end;

  FirstStart := true;

  ADConnection1.Connected := true;

end;

//поддержание соединения
procedure TDataModuleMySQL.Timer1Timer(Sender: TObject);
begin
  ADQueryTime.Close;
  ADQueryTime.Open;
end;

end.
