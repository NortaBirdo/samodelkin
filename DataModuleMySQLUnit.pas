unit DataModuleMySQLUnit;

interface

uses
  System.SysUtils, System.Classes, uADStanIntf, uADStanOption, uADStanError,
  uADGUIxIntf, uADPhysIntf, uADStanDef, uADStanPool, uADStanAsync,
  uADPhysManager, uADStanParam, uADDatSManager, uADDAptIntf, uADDAptManager,
  uADGUIxFormsWait, uADPhysMySQL, uADCompGUIx, uADCompClient, Data.DB,
  uADCompDataSet, vcl.forms;

type
  TDataModuleMySQL = class(TDataModule)
    ADConnection1: TADConnection;
    ADTransaction1: TADTransaction;
    ADQueryClients: TADQuery;
    ADGUIxWaitCursor1: TADGUIxWaitCursor;
    ADPhysMySQLDriverLink1: TADPhysMySQLDriverLink;
    DataSource1: TDataSource;
    procedure DataModuleCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  DataModuleMySQL: TDataModuleMySQL;

implementation

{%CLASSGROUP 'Vcl.Controls.TControl'}

uses DataModuleSQLite;

{$R *.dfm}

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
  Add('CharacterSet=cp1251');
  Add('DriverID=MySQL');
end;

ADConnection1.Connected := true;
ADQueryClients.Active := true;

end;

end.
