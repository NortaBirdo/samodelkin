unit DataModuleSQLite;

interface

uses
  System.SysUtils, System.Classes, uADStanIntf, uADStanOption, uADStanError,
  uADGUIxIntf, uADPhysIntf, uADStanDef, uADStanPool, uADStanAsync,
  uADPhysManager, Data.DB, uADCompClient, uADStanParam, uADDatSManager,
  uADDAptIntf, uADDAptManager, uADGUIxFormsWait, uADCompDataSet, uADCompGUIx,
  uADStanExprFuncs, uADPhysSQLite,
  Vcl.Dialogs,Vcl.Forms;

type
  TSQLiteDataModule = class(TDataModule)
    ADConnectionSQLite: TADConnection;
    ADTransaction1: TADTransaction;
    ADTable1: TADTable;
    ADGUIxWaitCursor1: TADGUIxWaitCursor;
    ADTable1ID: TADAutoIncField;
    ADTable1ip: TStringField;
    ADTable1db_name: TStringField;
    ADTable1login: TStringField;
    ADTable1pass: TStringField;
    DataSource1: TDataSource;
    ADPhysSQLiteDriverLink1: TADPhysSQLiteDriverLink;
    procedure DataModuleCreate(Sender: TObject);
  private
    { Private declarations }
  public
    function GetHostName: string;
    function GetDBName: string;
    function GetLogin: string;
    function GetPass: string;
  end;

var
  SQLiteDataModule: TSQLiteDataModule;

implementation

{%CLASSGROUP 'Vcl.Controls.TControl'}

{$R *.dfm}

procedure TSQLiteDataModule.DataModuleCreate(Sender: TObject);
var
 Path: string;
begin
try
  with SQLiteDataModule do
  begin
    //���������� �������
    Path := Application.ExeName;
    Path := ExtractFilePath(Path) + 'sqlite3.dll';
    ADPhysSQLiteDriverLink1.VendorLib := Path;

    Path := Application.ExeName;
    Path := ExtractFilePath(Path) + 'SettingDB.db';

    with ADConnectionSQLite do
    begin
      Params.Clear;
      Params.Add('Database=' + Path);
      Params.Add('LockingMode=Normal');
      Params.Add('DriverID=SQLite');
      Connected := true;
    end;

    ADTable1.Active := true;
  end;
except
  ShowMessage('�� ������� ������������ � ���� ������ ��������.');
  exit;
end;

end;

function TSQLiteDataModule.GetDBName: string;
begin
try
  result := ADTable1.FieldByName('db_name').AsString;
except
  ShowMessage('�� �������� ��������� ��������� ����� ����.');
end;

end;

function TSQLiteDataModule.GetHostName: string;
begin
try
  result := ADTable1.FieldByName('ip').AsString;
except
  ShowMessage('�� �������� ��������� ��������� ip.');
end;

end;

function TSQLiteDataModule.GetLogin: string;
begin
try
  result := ADTable1.FieldByName('login').AsString;
except
  ShowMessage('�� �������� ��������� ��������� �������.');
end;
end;

function TSQLiteDataModule.GetPass: string;
begin
try
  result := ADTable1.FieldByName('pass').AsString;
except
  ShowMessage('�� �������� ��������� ��������� �������.');
end;
end;

end.
