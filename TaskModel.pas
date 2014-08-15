unit TaskModel;

interface

uses
  System.SysUtils, System.Classes, uADStanIntf, uADStanOption, uADStanParam,
  uADStanError, uADDatSManager, uADPhysIntf, uADDAptIntf, uADStanAsync,
  uADDAptManager, Data.DB, uADCompDataSet, uADCompClient;

type
  TTaskDataModule = class(TDataModule)
    ADQueryTask: TADQuery;
    DataSourceTask: TDataSource;
    ADQuerySQL: TADQuery;
  private
    ShowCloseTask: boolean;
  public
    procedure GetTasks;
    function GetIdTask:integer;
    function GetSalaryTask:integer;
    function GetCaption: string;
    function GetFio: string;
    procedure SetProjectLink(id:integer);
    procedure SetFreelancerLink(id: integer);
    procedure SetDeadline(Dt: TDate);
    procedure RefreshTask;
    procedure SetShowCloseTask(show: boolean);
    procedure Cancel;
    function IsModified: boolean;
    procedure Insert;
    procedure Post;

    //деньги
    procedure CalcTaskBalance;
    procedure CalcTaskSalary(sum: integer);
  end;

var
  TaskDataModule: TTaskDataModule;

implementation

{%CLASSGROUP 'Vcl.Controls.TControl'}

uses DataModuleMySQLUnit, ProjectModelUnit;

{$R *.dfm}

{ TTaskDataModule }

procedure TTaskDataModule.CalcTaskBalance;
begin
  with ADQueryTask do
  begin
    edit;
    FieldByName('balance').Value := FieldByName('salary').AsInteger - FieldByName('budget').AsInteger;
    post;
  end;
end;

procedure TTaskDataModule.CalcTaskSalary(sum: integer);
begin
  with ADQueryTask do
  begin
    edit;
    FieldByName('salary').Value := FieldByName('salary').AsInteger + sum;
    post;
  end;
end;

procedure TTaskDataModule.Cancel;
begin
  ADQueryTask.Cancel;
end;

function TTaskDataModule.GetCaption: string;
begin
  result := ADQueryTask.FieldByName('caption').AsString
end;

function TTaskDataModule.GetFio: string;
begin
  result := ADQueryTask.FieldByName('fio').AsString;
end;

function TTaskDataModule.GetIdTask: integer;
begin
  result := ADQueryTask.FieldByName('id').AsInteger
end;

function TTaskDataModule.GetSalaryTask: integer;
begin
  result := ADQueryTask.FieldByName('salary').AsInteger
end;

procedure TTaskDataModule.GetTasks;
begin
  with ADQueryTask do
  begin
    close;
    Sql.Clear;

    if ShowCloseTask then
     Sql.Add('Select TASK.*, FREELANCER.Id, FREELANCER.fio from TASK, FREELANCER ' +
      'WHERE TASK.freelancer_link = FREELANCER.id AND TASK.project_link = ' + IntToStr(ProjectModel.GetIDProject))
    else
     Sql.Add('Select TASK.*, FREELANCER.Id, FREELANCER.fio from TASK, FREELANCER ' +
      'WHERE TASK.freelancer_link = FREELANCER.id AND TASK.project_link = ' + IntToStr(ProjectModel.GetIDProject) +
      ' AND TASK.status <> ' + QuotedStr('закрыта'));
    open;
  end;
end;

procedure TTaskDataModule.Insert;
begin
  ADQueryTask.Insert;
end;

function TTaskDataModule.IsModified: boolean;
begin
  result := ADQueryTask.Modified;
end;

procedure TTaskDataModule.Post;
begin
  if IsModified then ADQueryTask.Post;
end;

procedure TTaskDataModule.RefreshTask;
begin
  ADQueryTask.Refresh;
end;

procedure TTaskDataModule.SetDeadline(Dt: TDate);
begin
  ADQueryTask.Edit;
  ADQueryTask.FieldByName('deadline').Value := Dt;
end;

procedure TTaskDataModule.SetFreelancerLink(id: integer);
begin
  ADQueryTask.Edit;
  ADQueryTask.FieldByName('freelancer_link').Value := id;
end;

procedure TTaskDataModule.SetProjectLink(id: integer);
begin
  ADQueryTask.Edit;
  ADQueryTask.FieldByName('project_link').Value := id;
end;

//показать/скрыть закрытые таски
procedure TTaskDataModule.SetShowCloseTask(show: boolean);
begin
  ShowCloseTask := show;
end;

end.
