unit MainUnit;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.Menus, Vcl.Grids, Vcl.DBGrids,
  Vcl.StdCtrls, Vcl.DBCtrls, Vcl.Mask, Vcl.ComCtrls, DB;

type
  TMainForm = class(TForm)
    MainMenu1: TMainMenu;
    N1: TMenuItem;
    N2: TMenuItem;
    N6: TMenuItem;
    N7: TMenuItem;
    N8: TMenuItem;
    N9: TMenuItem;
    N10: TMenuItem;
    N12: TMenuItem;
    N13: TMenuItem;
    N11: TMenuItem;
    N14: TMenuItem;
    N15: TMenuItem;
    N17: TMenuItem;
    N16: TMenuItem;
    N5: TMenuItem;
    N3: TMenuItem;
    N4: TMenuItem;
    PageControl1: TPageControl;
    MindTapeSheet: TTabSheet;
    ProjectTaskSheet: TTabSheet;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    DBText1: TDBText;
    Label6: TLabel;
    ProjectGrid: TDBGrid;
    TaskGrid: TDBGrid;
    ComboBox1: TComboBox;
    DBMemo1: TDBMemo;
    DBMemo2: TDBMemo;
    PopupMenu1: TPopupMenu;
    N18: TMenuItem;
    TaskTape: TDBGrid;
    Label7: TLabel;
    Label8: TLabel;
    DBMemo3: TDBMemo;
    ShowTaskCheckBox: TCheckBox;
    PopupMenuTape: TPopupMenu;
    N20: TMenuItem;
    N22: TMenuItem;
    N23: TMenuItem;
    N26: TMenuItem;
    N27: TMenuItem;
    N28: TMenuItem;
    N21: TMenuItem;
    N19: TMenuItem;
    N31: TMenuItem;
    N32: TMenuItem;
    N33: TMenuItem;
    N34: TMenuItem;
    N35: TMenuItem;
    procedure N5Click(Sender: TObject);
    procedure N7Click(Sender: TObject);
    procedure N8Click(Sender: TObject);
    procedure N4Click(Sender: TObject);
    procedure N2Click(Sender: TObject);
    procedure N10Click(Sender: TObject);
    procedure N12Click(Sender: TObject);
    procedure ComboBox1Change(Sender: TObject);
    procedure N11Click(Sender: TObject);
    procedure N14Click(Sender: TObject);
    procedure N16Click(Sender: TObject);
    procedure N17Click(Sender: TObject);
    procedure N18Click(Sender: TObject);
    procedure TaskTapeDrawColumnCell(Sender: TObject; const Rect: TRect;
      DataCol: Integer; Column: TColumn; State: TGridDrawState);
    procedure ProjectGridDrawColumnCell(Sender: TObject; const Rect: TRect;
      DataCol: Integer; Column: TColumn; State: TGridDrawState);
    procedure TaskGridDrawColumnCell(Sender: TObject; const Rect: TRect;
      DataCol: Integer; Column: TColumn; State: TGridDrawState);
    procedure ShowTaskCheckBoxClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure N31Click(Sender: TObject);
    procedure N32Click(Sender: TObject);
    procedure N33Click(Sender: TObject);
    procedure N34Click(Sender: TObject);
    procedure N35Click(Sender: TObject);


  private

  public

  end;

var
  MainForm: TMainForm;
  grids: string;

implementation

{$R *.dfm}

uses SettingFormUnit, ClientsFormUnit, FreelanceFormUnit, DataModuleMySQLUnit,
  EditProjectFormUnit, EditTaskFormUnit, OperationFormUnit, Clipbrd;

procedure TMainForm.N2Click(Sender: TObject);
begin
  MainForm.Close;
end;

procedure TMainForm.N4Click(Sender: TObject);
begin
  ShowMessage('����������: ����������� ������� (sokolovskynik@gmail.com), ������ 2014');
end;

procedure TMainForm.N5Click(Sender: TObject);
begin
  SettingForm.ShowModal;
end;

procedure TMainForm.N7Click(Sender: TObject);
begin
  ClientsForm.ShowModal;
end;

procedure TMainForm.N8Click(Sender: TObject);
begin
  FreelanceForm.ShowModal;
end;

procedure TMainForm.FormCreate(Sender: TObject);
begin
PageControl1.TabIndex := 0;
end;

//==========================================
//������� � ���������

//���������� �������
procedure TMainForm.N10Click(Sender: TObject);
begin
  DataModuleMySQL.ADQueryProject.Insert;
  EditProjectForm.ShowModal;
end;

procedure TMainForm.N11Click(Sender: TObject);
begin
  DataModuleMySQL.ADQueryTask.Insert;
  DataModuleMySQL.SetProjectLink(DataModuleMySQL.GetIDProject);
  EditTaskForm.ShowModal;
  DataModuleMySQL.RefreshTask;
end;

//��������
procedure TMainForm.N12Click(Sender: TObject);
begin
  EditProjectForm.ShowModal;
end;

procedure TMainForm.N14Click(Sender: TObject);
begin
  EditTaskForm.ShowModal;
  DataModuleMySQL.RefreshTask;
end;

//���������� ��������
procedure TMainForm.ComboBox1Change(Sender: TObject);
begin

case ComboBox1.ItemIndex of
0: DataModuleMySQL.ShowAllActiveProject;
1: DataModuleMySQL.ShowWorkProject;
2: DataModuleMySQL.ShowFreezProject;
3: DataModuleMySQL.ShowPriorProject;
4: DataModuleMySQL.ShowCloseProject;
5: DataModuleMySQL.ShowCancelProject;
end;
end;

//������ �������
procedure TMainForm.N16Click(Sender: TObject);
begin
  OperationForm.LabelType.caption := '������';
  OperationForm.SetDataSet(DataModuleMySQL.DataSourceClientAccount);
  OperationForm.ShowModal;
end;

//������� �� ������
procedure TMainForm.N17Click(Sender: TObject);
begin
  OperationForm.LabelType.caption := '���������';
  OperationForm.SetDataSet(DataModuleMySQL.DataSourceFreelancerAccount);
  OperationForm.ShowModal;
  DataModuleMySQL.ADQueryTask.Refresh;
end;

//����������� � �����
procedure TMainForm.N18Click(Sender: TObject);
begin
   Clipboard.SetTextBuf(PChar(DBText1.DataSource.DataSet.FieldByName(DBText1.DataField).AsString));
end;

//�������� �������� �� ����� �����
procedure TMainForm.TaskTapeDrawColumnCell(Sender: TObject; const Rect: TRect;
  DataCol: Integer; Column: TColumn; State: TGridDrawState);
begin
if (TaskTape.DataSource.DataSet.FieldByName('status').AsString = '���������') OR
  (TaskTape.DataSource.DataSet.FieldByName('status_1').AsString = '���������')then
  begin
  TaskTape.Canvas.Brush.Color := clRed;
  TaskTape.Canvas.Font.Color := clWhite;
  end;

if (TaskTape.DataSource.DataSet.FieldByName('deadline').AsDateTime < now)  AND
  (TaskTape.DataSource.DataSet.FieldByName('deadline').AsString <> '') AND
  (TaskTape.DataSource.DataSet.FieldByName('status').AsString <> '������ ���������') then
  begin
  TaskTape.Canvas.Brush.Color := clMaroon;
  TaskTape.Canvas.Font.Color := clWhite;
  end;

TaskTape.DefaultDrawColumnCell(Rect,DataCol,Column,State);
end;

//�������� ��������
procedure TMainForm.ProjectGridDrawColumnCell(Sender: TObject; const Rect: TRect;
  DataCol: Integer; Column: TColumn; State: TGridDrawState);
begin
if ProjectGrid.DataSource.DataSet.FieldByName('status').AsString = '���������' then
  begin
  ProjectGrid.Canvas.Brush.Color := clRed;
  ProjectGrid.Canvas.Font.Color := clWhite;
  end;

if ProjectGrid.DataSource.DataSet.FieldByName('status').AsString = '���������' then
  begin
  ProjectGrid.Canvas.Brush.Color := clBlue;
  ProjectGrid.Canvas.Font.Color := clWhite;
  end;

ProjectGrid.DefaultDrawColumnCell(Rect,DataCol,Column,State);
end;

//�������� �����
procedure TMainForm.TaskGridDrawColumnCell(Sender: TObject; const Rect: TRect;
  DataCol: Integer; Column: TColumn; State: TGridDrawState);
begin
if TaskGrid.DataSource.DataSet.FieldByName('status').AsString = '���������' then
  begin
  TaskGrid.Canvas.Brush.Color := clRed;
  TaskGrid.Canvas.Font.Color := clWhite;
  end;

if (TaskGrid.DataSource.DataSet.FieldByName('deadline').AsDateTime < now)  AND
  (TaskGrid.DataSource.DataSet.FieldByName('deadline').AsString <> '') AND
  (TaskGrid.DataSource.DataSet.FieldByName('status').AsString <> '������ ���������') AND
  (TaskGrid.DataSource.DataSet.FieldByName('status').AsString <> '�������') then
  begin
  TaskGrid.Canvas.Brush.Color := clMaroon;
  TaskGrid.Canvas.Font.Color := clWhite;
  end;

TaskGrid.DefaultDrawColumnCell(Rect,DataCol,Column,State);
end;

//������/�������� �������� �����
procedure TMainForm.ShowTaskCheckBoxClick(Sender: TObject);
begin
DataModuleMySQL.SetShowCloseTask(ShowTaskCheckBox.Checked);
DataModuleMySQL.GetTasks;
end;

//����� - � ������
procedure TMainForm.N31Click(Sender: TObject);
begin
  DataModuleMySQL.SetStatusTask(work);
  DataModuleMySQL.RefreshTape;
end;

//����� -  ��������
procedure TMainForm.N32Click(Sender: TObject);
begin
  DataModuleMySQL.SetStatusTask(prior);
  DataModuleMySQL.RefreshTape;
end;

//����� - � �������� ���������
procedure TMainForm.N33Click(Sender: TObject);
begin
  DataModuleMySQL.SetStatusTask(wait);
  DataModuleMySQL.RefreshTape;
end;

//����� - ��������
procedure TMainForm.N34Click(Sender: TObject);
begin
  DataModuleMySQL.SetStatusTask(Delayed);
  DataModuleMySQL.RefreshTape;
end;

//����� - �������
procedure TMainForm.N35Click(Sender: TObject);
begin
  DataModuleMySQL.SetStatusTask(Closer);
  DataModuleMySQL.RefreshTape;
end;

end.
