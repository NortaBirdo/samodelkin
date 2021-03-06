unit OperationFormUnit;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.DBCtrls, Vcl.Mask, DB;

type
  TOperationForm = class(TForm)
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    DBEditSUM: TDBEdit;
    DBMemoNOTE: TDBMemo;
    Button1: TButton;
    Button2: TButton;
    LabelType: TLabel;
    Label4: TLabel;
    LabelName: TLabel;
    procedure Button2Click(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure FormShow(Sender: TObject);
  private
    CurrentDS: TDataSource;
  public
    procedure SetDataSet(ds: TDataSource);

    var
    notes: string;
    id_client: integer;
  end;

var
  OperationForm: TOperationForm;

implementation

{$R *.dfm}

uses DataModuleMySQLUnit, ProjectModelUnit, TaskModel;

{ TOperationForm }

procedure TOperationForm.Button1Click(Sender: TObject);
var
  sum: integer;
begin
with CurrentDS.DataSet do
begin
edit;
FieldByName('date_operation').Value := now;
if LabelType.Caption = '������' then
  begin
    FieldByName('account_type').Value := 0;
    FieldByName('link').Value := ProjectModel.ADQueryProject.FieldByName('Id_1').AsInteger;
    post;
  end
  else
  begin
    FieldByName('account_type').Value := 1;
    FieldByName('link').Value := TaskDataModule.ADQueryTask.FieldByName('Id_1').AsInteger;
    sum := StrToInt(DBEditSUM.Text);
    post;

    //���������� ������ �� ������ � �������
    TaskDataModule.CalcTaskSalary(StrToInt(DBEditSUM.Text));
    TaskDataModule.CalcTaskBalance;
    ProjectModel.CalcProjectSalary;
    ProjectModel.CalcProjectBudget(ProjectModel.GetIDProject);
    ProjectModel.CalcProjectBalance(ProjectModel.GetIDProject);

    //��������� � �������
    insert;
    FieldByName('date_operation').Value := now;
    FieldByName('account_type').Value := 0;
    FieldByName('link').Value := id_client;
    FieldByName('operation').Value := sum;
    FieldByName('note').Value := notes;
    post;
  end;

end;
OperationForm.Close;
end;

procedure TOperationForm.Button2Click(Sender: TObject);
begin
  CurrentDS.DataSet.Cancel;
  OperationForm.Close;
end;

procedure TOperationForm.FormShow(Sender: TObject);
begin
  CurrentDS.DataSet.Insert;
  DBMemoNOTE.Lines.Clear;
  DBMemoNOTE.Lines.Add(Notes);

end;

procedure TOperationForm.SetDataSet(ds: TDataSource);
begin
  DBEditSUM.DataSource := ds;
  DBMemoNOTE.DataSource := ds;
  CurrentDS := ds;

end;

end.
