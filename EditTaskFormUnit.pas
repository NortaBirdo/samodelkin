unit EditTaskFormUnit;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.Mask, Vcl.DBCtrls,
  Vcl.Grids, Vcl.DBGrids, Vcl.ComCtrls;

type
  TEditTaskForm = class(TForm)
    Label1: TLabel;
    Label2: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    DBMemo1: TDBMemo;
    DBText1: TDBText;
    DBEdit2: TDBEdit;
    DBEdit3: TDBEdit;
    Label6: TLabel;
    DBComboBox1: TDBComboBox;
    DBGrid1: TDBGrid;
    LabelChange: TLabel;
    BtnChangeFreelancer: TButton;
    BtnOk: TButton;
    BtnCancel: TButton;
    Label3: TLabel;
    MonthCalendar1: TMonthCalendar;
    procedure BtnOkClick(Sender: TObject);
    procedure BtnChangeFreelancerClick(Sender: TObject);
    procedure BtnCancelClick(Sender: TObject);
    procedure MonthCalendar1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  EditTaskForm: TEditTaskForm;

implementation

{$R *.dfm}

uses DataModuleMySQLUnit;

procedure TEditTaskForm.BtnCancelClick(Sender: TObject);
begin
 DataModuleMySQL.ADQueryTask.Cancel;
 EditTaskForm.Close;
end;

procedure TEditTaskForm.BtnChangeFreelancerClick(Sender: TObject);
begin
LabelChange.Caption := '����� �����������: ' + DataModuleMySQL.GetNameFreelancer;
DataModuleMySQL.SetFreelancerLink(DataModuleMySQL.GetIdFreelancer);
end;

procedure TEditTaskForm.BtnOkClick(Sender: TObject);
begin
if DataModuleMySQL.ADQueryTask.Modified then
begin
  with DataModuleMySQL do
  begin

    ADQueryTask.Post;
    //����������� ������� �������
    CalcProjectBudget(GetIDProject);
    CalcProjectBalance(GetIDProject);
    CalcTaskBalance;
  end;
EditTaskForm.Close;
end;

end;

procedure TEditTaskForm.MonthCalendar1Click(Sender: TObject);
begin
  DataModuleMySQL.SetDeadline(MonthCalendar1.Date);
end;

end.
