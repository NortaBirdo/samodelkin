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
    ADQueryFreelancer: TADQuery;
    DataSource2: TDataSource;
    ADQueryProject: TADQuery;
    DataSource3: TDataSource;
    procedure DataModuleCreate(Sender: TObject);
  private
    { Private declarations }
  public
    //�������
    procedure SetClientFlag(flag:integer);
    function GetClientID: integer;
    function GetClientName:string;
    procedure ShowActiveClient;
    procedure ShowArchiveClient;
    procedure ShowBlackListClient;
    procedure RefreshClient;
    //����������
    procedure SetFreelancerFlag(flag:integer);
    procedure ShowActiveFreelancer;
    procedure ShowArchiveFreelancer;
    procedure ShowBlackListFreelancer;
    procedure RefreshFreelancer;
    //�������
    procedure SetClient(id: integer);
    procedure RefreshProject;
    procedure ShowAllActiveProject;
    procedure ShowWorkProject;
    procedure ShowFreezProject;
    procedure ShowPriorProject;
    procedure ShowCloseProject;
    procedure ShowCancelProject;

 end;

var
  DataModuleMySQL: TDataModuleMySQL;

implementation

{%CLASSGROUP 'Vcl.Controls.TControl'}

uses DataModuleSQLite;

{$R *.dfm}
//====================================================================
//�����������
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

ADConnection1.Connected := true;
ADQueryClients.Active := true;
ADQueryFreelancer.Active := true;
ADQueryProject.Active := true;
end;

//=========================================
//������ � ���������
function TDataModuleMySQL.GetClientID: integer;
begin
  result := ADQueryClients.FieldByName('id').AsInteger;
end;

function TDataModuleMySQL.GetClientName: string;
begin
  result := ADQueryClients.FieldByName('fio').AsString;
end;

procedure TDataModuleMySQL.RefreshClient;
begin
  ADQueryClients.Refresh;
end;

procedure TDataModuleMySQL.SetClientFlag(flag: integer);
begin
  ADQueryClients.Edit;
  ADQueryClients.FieldByName('flag').Value := flag;
end;

procedure TDataModuleMySQL.ShowActiveClient;
begin
  with ADQueryClients do
  begin
    close;
    sql.Clear;
    sql.Add('SELECT * FROM CLIENT WHERE flag = 0');
    open;
  end;
end;

procedure TDataModuleMySQL.ShowArchiveClient;
begin
  with ADQueryClients do
  begin
    close;
    sql.Clear;
    sql.Add('SELECT * FROM CLIENT WHERE flag = 1');
    open;
  end;
end;

procedure TDataModuleMySQL.ShowBlackListClient;
begin
  with ADQueryClients do
  begin
    close;
    sql.Clear;
    sql.Add('SELECT * FROM CLIENT WHERE flag = 2');
    open;
  end;
end;

//=============================================
//������ � ������������

procedure TDataModuleMySQL.RefreshFreelancer;
begin
   ADQueryFreelancer.Refresh;
end;

procedure TDataModuleMySQL.SetFreelancerFlag(flag: integer);
begin
  ADQueryFreelancer.Edit;
  ADQueryFreelancer.FieldByName('flag').Value := flag;
end;

procedure TDataModuleMySQL.ShowActiveFreelancer;
begin
  with ADQueryFreelancer do
  begin
    close;
    sql.Clear;
    sql.Add('SELECT * FROM FREELANCER WHERE flag = 0');
    open;
  end;
end;

procedure TDataModuleMySQL.ShowBlackListFreelancer;
begin
  with ADQueryFreelancer do
  begin
    close;
    sql.Clear;
    sql.Add('SELECT * FROM FREELANCER WHERE flag = 2');
    open;
  end;
end;

procedure TDataModuleMySQL.ShowArchiveFreelancer;
begin
  with ADQueryFreelancer do
  begin
    close;
    sql.Clear;
    sql.Add('SELECT * FROM FREELANCER WHERE flag = 1');
    open;
  end;
end;


//=========================================
//�������

procedure TDataModuleMySQL.SetClient(id: integer);
begin
  ADQueryProject.Edit;
  ADQueryProject.FieldByName('client_link').Value := id;
end;

procedure TDataModuleMySQL.RefreshProject;
begin
  ADQueryProject.Refresh;
end;

procedure TDataModuleMySQL.ShowAllActiveProject;
begin
  with ADQueryProject do
  begin
    close;
    sql.Clear;
    sql.Add('SELECT P.*, CLIENT.fio as cl_fio, CLIENT.id FROM PROJECT P, CLIENT WHERE '+
      'P.status <> ' + QuotedStr('�������') + ' AND P.status <> ' + QuotedStr('������') +
      ' AND CLIENT.id = P.client_link');
    open;
  end;
end;

procedure TDataModuleMySQL.ShowCancelProject;
begin
  with ADQueryProject do
  begin
    close;
    sql.Clear;
    sql.Add('SELECT P.*, CLIENT.fio as cl_fio, CLIENT.id FROM PROJECT P, CLIENT WHERE '+
      'P.status = ' + QuotedStr('�������') + ' AND CLIENT.id = P.client_link');
    open;
  end;
end;

procedure TDataModuleMySQL.ShowCloseProject;
begin
  with ADQueryProject do
  begin
    close;
    sql.Clear;
    sql.Add('SELECT P.*, CLIENT.fio as cl_fio, CLIENT.id FROM PROJECT P, CLIENT WHERE '+
      'P.status = ' + QuotedStr('������') + ' AND CLIENT.id = P.client_link');
    open;
  end;
end;

procedure TDataModuleMySQL.ShowFreezProject;
begin
  with ADQueryProject do
  begin
    close;
    sql.Clear;
    sql.Add('SELECT P.*, CLIENT.fio as cl_fio, CLIENT.id FROM PROJECT P, CLIENT WHERE '+
      'P.status = ' + QuotedStr('���������') + ' AND CLIENT.id = P.client_link');
    open;
  end;
end;

procedure TDataModuleMySQL.ShowPriorProject;
begin
  with ADQueryProject do
  begin
    close;
    sql.Clear;
    sql.Add('SELECT P.*, CLIENT.fio as cl_fio, CLIENT.id FROM PROJECT P, CLIENT WHERE '+
      'P.status = ' + QuotedStr('���������') + ' AND CLIENT.id = P.client_link');
    open;
  end;
end;

procedure TDataModuleMySQL.ShowWorkProject;
begin
  with ADQueryProject do
  begin
    close;
    sql.Clear;
    sql.Add('SELECT P.*, CLIENT.fio as cl_fio, CLIENT.id FROM PROJECT P, CLIENT WHERE '+
      'P.status = ' + QuotedStr('� ������') + ' AND CLIENT.id = P.client_link');
    open;
  end;
end;

end.