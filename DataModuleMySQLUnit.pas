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
    ADQueryClients: TADQuery;
    ADGUIxWaitCursor1: TADGUIxWaitCursor;
    ADPhysMySQLDriverLink1: TADPhysMySQLDriverLink;
    DataSource1: TDataSource;
    ADQueryFreelancer: TADQuery;
    DataSource2: TDataSource;
    ADQueryProject: TADQuery;
    DataSource3: TDataSource;
    ADQueryClientList: TADQuery;
    DataSourceClientList: TDataSource;
    ADQueryTime: TADQuery;
    Timer1: TTimer;
    ADQueryTask: TADQuery;
    DataSourceTask: TDataSource;
    ADQuerySQL: TADQuery;
    ADQueryClientAccount: TADQuery;
    DataSourceClientAccount: TDataSource;
    ADQueryFreelancerAccount: TADQuery;
    DataSourceFreelancerAccount: TDataSource;
    ADQueryMindTape: TADQuery;
    DataSourceMindTape: TDataSource;
    ADQueryProjectSuch: TADQuery;
    procedure DataModuleCreate(Sender: TObject);
    procedure Timer1Timer(Sender: TObject);
    procedure ADQueryProjectAfterGetRecord(DataSet: TADDataSet);
    procedure ADQueryProjectAfterScroll(DataSet: TDataSet);
    procedure ADQueryProjectAfterRefresh(DataSet: TDataSet);
    procedure ADQueryClientsAfterScroll(DataSet: TDataSet);
    procedure ADQueryFreelancerAfterGetRecord(DataSet: TADDataSet);
    procedure ADQueryFreelancerAfterScroll(DataSet: TDataSet);
    procedure ADQueryClientsAfterGetRecord(DataSet: TADDataSet);
  private
    ShowCloseTask: boolean;

  public
  type
    TStatusTask = (Closer, Work, Prior, Delayed, Wait);

    //�������
    procedure SetClientFlag(flag:integer);
    function GetClientID: integer;
    function GetClientName:string;
    procedure ShowActiveClient;
    procedure ShowArchiveClient;
    procedure ShowBlackListClient;
    procedure RefreshClient;
    procedure RefreshClientList;
    //����������
    procedure SetFreelancerFlag(flag:integer);
    function GetNameFreelancer: string;
    function GetIdFreelancer: integer;
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
    function GetIDProject: integer;
    //������
    procedure GetTasks;
    function GetIdTask:integer;
    function GetSalaryTask:integer;
    procedure SetProjectLink(id:integer);
    procedure SetFreelancerLink(id: integer);
    procedure SetDeadline(Dt: TDate);
    procedure RefreshTask;
    procedure SetShowCloseTask(show: boolean);

    //������
    procedure RegOperationClientBal(sum: string);
    procedure CalcProjectBudget(id: integer);
    procedure CalcProjectBalance(id: integer);
    procedure CalcTaskBalance;
    procedure CalcProjectSalary;
    procedure CalcTaskSalary(sum: integer);
    procedure RefreshOperationFL;
    procedure RefreshOperationClient;
    function GetBalance: integer;
    function GetBalanceClient: integer;

    //����� ������
//    procedure SetStatusTask(newStatus: TStatusTask);
    procedure RefreshTape;

    //���������� �����
    procedure SortById;
    procedure SortByTask;
    procedure SortByPriorTask;
    procedure SortByDeadline;
    procedure SortByProject;
    procedure SortByPriorProject;

    var
      BalanceClient: integer;
      FirstStart: boolean;

 end;

var
  DataModuleMySQL: TDataModuleMySQL;

implementation

{%CLASSGROUP 'Vcl.Controls.TControl'}

uses DataModuleSQLite, ClientsFormUnit, FreelanceFormUnit;

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

FirstStart := true;

ADConnection1.Connected := true;
ADQueryClients.Active := true;
ADQueryClientList.Active := true;
ADQueryFreelancer.Active := true;
ADQueryProject.Active := true;
ADQueryClientAccount.Active := true;
ADQueryFreelancerAccount.Active := true;
ADQueryMindTape.Active := true;


end;

//����������� ����������
procedure TDataModuleMySQL.Timer1Timer(Sender: TObject);
begin
  ADQueryTime.Close;
  ADQueryTime.Open;
end;

//=========================================
//������ � ���������
function TDataModuleMySQL.GetClientID: integer;
begin
  result := ADQueryClientList.FieldByName('id').AsInteger;
end;

function TDataModuleMySQL.GetClientName: string;
begin
  result := ADQueryClientList.FieldByName('fio').AsString;
end;


procedure TDataModuleMySQL.RefreshClient;
begin
  ADQueryClients.Refresh;
end;

procedure TDataModuleMySQL.RefreshClientList;
begin
  ADQueryClientList.Refresh;
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

function TDataModuleMySQL.GetIdFreelancer: integer;
begin
result := ADQueryFreelancer.FieldByName('id').AsInteger;
end;

function TDataModuleMySQL.GetNameFreelancer: string;
begin
result := ADQueryFreelancer.FieldByName('fio').AsString;
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

function TDataModuleMySQL.GetIDProject: integer;
begin
  result := ADQueryProject.FieldByName('id').AsInteger;
end;


//======================================
//������ � �������

//��������/������ �������� �����
procedure TDataModuleMySQL.SetShowCloseTask(show: boolean);
begin
ShowCloseTask := show;
end;

//����� ������� � �����
{procedure TDataModuleMySQL.SetStatusTask(newStatus: TStatusTask);
var
  sQuery: string;

begin
  case newStatus of
  closer: sQuery := '�������';
  Work: sQuery := '� ������';
  Prior: sQuery := '���������';
  Delayed: sQuery := '��������';
  Wait: sQuery := '������ ���������';
  end;

  with ADQuerySQL do
  begin
    close;
    sql.Clear;
    squery := 'UPDATE TASK SET status = ' + QuotedStr(sQuery) + ' WHERE id = ' + ADQueryMindTape.FieldByName('id').AsString;
    sql.Add(sQuery);
    ExecSQL;
  end;
end;   }

procedure TDataModuleMySQL.GetTasks;
begin
  with ADQueryTask do
  begin
    close;
    Sql.Clear;

    if ShowCloseTask then
    Sql.Add('Select TASK.*, FREELANCER.Id, FREELANCER.fio from TASK, FREELANCER ' +
      'WHERE TASK.freelancer_link = FREELANCER.id AND TASK.project_link = ' + IntToStr(GetIDProject))
    else
    Sql.Add('Select TASK.*, FREELANCER.Id, FREELANCER.fio from TASK, FREELANCER ' +
      'WHERE TASK.freelancer_link = FREELANCER.id AND TASK.project_link = ' + IntToStr(GetIDProject) +
      ' AND TASK.status <> ' + QuotedStr('�������'));
    open;
  end;
end;

function TDataModuleMySQL.GetIdTask: integer;
begin
 result := DataModuleMySQL.ADQueryTask.FieldByName('id').AsInteger
end;


procedure TDataModuleMySQL.ADQueryProjectAfterGetRecord(DataSet: TADDataSet);
begin
  GetTasks;
end;

procedure TDataModuleMySQL.ADQueryProjectAfterRefresh(DataSet: TDataSet);
begin
  GetTasks;
end;

procedure TDataModuleMySQL.ADQueryProjectAfterScroll(DataSet: TDataSet);
begin
  GetTasks;
end;

function TDataModuleMySQL.GetSalaryTask: integer;
begin
  result := DataModuleMySQL.ADQueryTask.FieldByName('salary').AsInteger
end;

procedure TDataModuleMySQL.SetProjectLink(id: integer);
begin
  ADQueryTask.Edit;
  ADQueryTask.FieldByName('project_link').Value := id;
end;

procedure TDataModuleMySQL.SetFreelancerLink(id: integer);
begin
  ADQueryTask.Edit;
  ADQueryTask.FieldByName('freelancer_link').Value := id;
end;

procedure TDataModuleMySQL.SetDeadline(Dt: TDate);
begin
  ADQueryTask.Edit;
  ADQueryTask.FieldByName('deadline').Value := Dt;
end;

procedure TDataModuleMySQL.RefreshTape;
begin
  ADQueryMindTape.Refresh;
end;

procedure TDataModuleMySQL.RefreshTask;
begin
  ADQueryTask.Refresh;
  ADQueryMindTape.Refresh;
end;

//=================================
//������

procedure TDataModuleMySQL.RegOperationClientBal(sum: string);
begin
 // ADQuery
end;


procedure TDataModuleMySQL.CalcProjectBalance(id: integer);
begin
with ADQueryProject do
  begin
  edit;
  FieldByName('balance').Value := FieldByName('salary').AsInteger - FieldByName('budget').AsInteger;
  post;
  end;
end;

procedure TDataModuleMySQL.CalcProjectBudget(id: integer);
begin
ADQueryProject.Edit;

with ADQuerySQL do
begin
  close;
  sql.Clear;
  sql.Add('SELECT SUM(budget) AS total_budget FROM TASK WHERE project_link = ' + IntToStr(id));
  open;
end;

ADQueryProject.FieldByName('budget').Value := ADQuerySQL.FieldByName('total_budget').AsInteger;
ADQueryProject.Post;

end;

procedure TDataModuleMySQL.CalcProjectSalary;
begin
ADQueryProject.Edit;

with ADQuerySQL do
begin
  close;
  sql.Clear;
  sql.Add('SELECT SUM(salary) AS total_salary FROM TASK WHERE project_link = ' + ADQueryProject.FieldByName('id').AsString);
  open;
end;

ADQueryProject.FieldByName('salary').Value := ADQuerySQL.FieldByName('total_salary').AsInteger;
ADQueryProject.Post;
end;

procedure TDataModuleMySQL.CalcTaskBalance;
begin
with ADQueryTask do
  begin
  edit;
  FieldByName('balance').Value := FieldByName('salary').AsInteger - FieldByName('budget').AsInteger;
  post;
  end;
end;

procedure TDataModuleMySQL.CalcTaskSalary(sum: integer);
begin

with ADQueryTask do
  begin
  edit;
  FieldByName('salary').Value := FieldByName('salary').AsInteger + sum;
  post;
  end;

end;

procedure TDataModuleMySQL.RefreshOperationFL;
var
query: string;
begin
with ADQueryFreelancerAccount do
begin
  close;
  sql.Clear;
  query := 'SELECT * FROM PERSONAL_ACCOUNT ' +
    'WHERE account_type = 1 AND link = ' + ADQueryFreelancer.FieldByName('id').AsString;
  sql.Add(query);
  open;
end;
end;

procedure TDataModuleMySQL.RefreshOperationClient;
var
query: string;
begin
with ADQueryClientAccount do
begin
  close;
  sql.Clear;
  query := 'SELECT * FROM PERSONAL_ACCOUNT ' +
    'WHERE account_type = 0 AND link = ' + ADQueryClients.FieldByName('id').AsString +
    ' ORDER BY date_operation DESC';
  sql.Add(query);
  open;
end;
end;

//����� �������� ������� �������
procedure TDataModuleMySQL.ADQueryClientsAfterGetRecord(DataSet: TADDataSet);
begin
  RefreshOperationClient;
  BalanceClient := GetBalanceClient;

  if not FirstStart then ClientsForm.BalLabel.Caption := IntToStr(BalanceClient);

end;

procedure TDataModuleMySQL.ADQueryClientsAfterScroll(DataSet: TDataSet);
begin
  RefreshOperationClient;
  BalanceClient := GetBalanceClient;

  if not FirstStart then ClientsForm.BalLabel.Caption := IntToStr(BalanceClient);


end;

//����� �������� ������� �����������
procedure TDataModuleMySQL.ADQueryFreelancerAfterGetRecord(DataSet: TADDataSet);
begin
  if not FirstStart then FreelanceForm.BalanceLabel.Caption := IntToStr(GetBalance);

  RefreshOperationFL;
end;


procedure TDataModuleMySQL.ADQueryFreelancerAfterScroll(DataSet: TDataSet);
begin
  if not FirstStart then FreelanceForm.BalanceLabel.Caption := IntToStr(GetBalance);

  RefreshOperationFL;
end;

//������ ������� �����������
function TDataModuleMySQL.GetBalance: integer;
var
debet, kredit: integer;
sQuery: string;
begin
with ADQuerySQL do
begin
  close;
  sql.Clear;
  sQuery := 'SELECT SUM(operation) as kredit FROM PERSONAL_ACCOUNT WHERE account_type = 1 AND link = '
   + ADQueryFreelancer.FieldByName('id').AsString;

  sql.Add(sQuery);
  open;
  kredit := FieldByName('kredit').AsInteger;

  close;
  sql.Clear;

  sQuery := 'SELECT SUM(budget) as debet FROM TASK WHERE freelancer_link = '
   + ADQueryFreelancer.FieldByName('id').AsString;
  sql.Add(sQuery);
  open;
  debet := FieldByName('debet').AsInteger;

  result := debet - kredit;
end;
end;

//������� ������ �������
function TDataModuleMySQL.GetBalanceClient: integer;
var
  sQuery: string;
begin
  with ADQuerySQL do
  begin
    close;
    sql.Clear;
    sQuery := 'SELECT SUM(operation) as bal FROM PERSONAL_ACCOUNT WHERE account_type = 0 AND link = '
     + ADQueryClients.FieldByName('id').AsString;
    sql.Add(sQuery);
    open;
    result := FieldByName('bal').AsInteger;

  end;

end;

//========================================
//���������� � �����


procedure TDataModuleMySQL.SortByDeadline;
var
  sQuery: string;
begin

  with ADQueryMindTape do
  begin
    Close;
    SQl.Clear;

    sQuery := 'SELECT T.*, P.* FROM TASK T, PROJECT P WHERE T.status <> ' + QuotedStr('�������') +
      ' AND T.status <> ' + QuotedStr('��������')+
      ' AND T.project_link = P.id AND P.status <> ' + QuotedStr('������') + ' AND P.status <> ' +
      QuotedStr('�������') + ' ORDER BY T.deadline DESC';
    SQL.Add(sQuery);
    Open;
  end;
end;

procedure TDataModuleMySQL.SortById;
var
  sQuery: string;
begin

  with ADQueryMindTape do
  begin
    Close;
    SQl.Clear;

    sQuery := 'SELECT T.*, P.* FROM TASK T, PROJECT P WHERE T.status <> ' + QuotedStr('�������') +
      ' AND T.status <> ' + QuotedStr('��������')+
      ' AND T.project_link = P.id AND P.status <> ' + QuotedStr('������') + ' AND P.status <> ' +
      QuotedStr('�������') + ' ORDER BY T.ID ASC';
    SQL.Add(sQuery);
    Open;
  end;
end;

procedure TDataModuleMySQL.SortByPriorProject;
var
  sQuery: string;
begin

  with ADQueryMindTape do
  begin
    Close;
    SQl.Clear;

    sQuery := 'SELECT T.*, P.* FROM TASK T, PROJECT P WHERE T.status <> ' + QuotedStr('�������') +
      ' AND T.status <> ' + QuotedStr('��������')+
      ' AND T.project_link = P.id AND P.status <> ' + QuotedStr('������') + ' AND P.status <> ' +
      QuotedStr('�������') + ' ORDER BY P.status ASC';
    SQL.Add(sQuery);
    Open;
  end;

end;

procedure TDataModuleMySQL.SortByPriorTask;
var
  sQuery: string;
begin

  with ADQueryMindTape do
  begin
    Close;
    SQl.Clear;

    sQuery := 'SELECT T.*, P.* FROM TASK T, PROJECT P WHERE T.status <> ' + QuotedStr('�������') +
      ' AND T.status <> ' + QuotedStr('��������')+
      ' AND T.project_link = P.id AND P.status <> ' + QuotedStr('������') + ' AND P.status <> ' +
      QuotedStr('�������') + ' ORDER BY T.status ASC';
    SQL.Add(sQuery);
    Open;
  end;

end;

procedure TDataModuleMySQL.SortByProject;
var
  sQuery: string;
begin

  with ADQueryMindTape do
  begin
    Close;
    SQl.Clear;

    sQuery := 'SELECT T.*, P.* FROM TASK T, PROJECT P WHERE T.status <> ' + QuotedStr('�������') +
      ' AND T.status <> ' + QuotedStr('��������')+
      ' AND T.project_link = P.id AND P.status <> ' + QuotedStr('������') + ' AND P.status <> ' +
      QuotedStr('�������') + ' ORDER BY P.caption ASC';
    SQL.Add(sQuery);
    Open;
  end;

end;

procedure TDataModuleMySQL.SortByTask;
var
  sQuery: string;
begin

  with ADQueryMindTape do
  begin
    Close;
    SQl.Clear;

    sQuery := 'SELECT T.*, P.* FROM TASK T, PROJECT P WHERE T.status <> ' + QuotedStr('�������') +
      ' AND T.status <> ' + QuotedStr('��������')+
      ' AND T.project_link = P.id AND P.status <> ' + QuotedStr('������') + ' AND P.status <> ' +
      QuotedStr('�������') + ' ORDER BY T.caption ASC';
    SQL.Add(sQuery);
    Open;
  end;

end;

end.
