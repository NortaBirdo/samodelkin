unit MainUnit;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.Menus, Vcl.Grids, Vcl.DBGrids,
  Vcl.StdCtrls, Vcl.DBCtrls, Vcl.Mask, Vcl.ComCtrls, DB, ShellAPI, Vcl.ToolWin,
  Vcl.ExtCtrls;

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
    GitText: TDBText;
    Label6: TLabel;
    ProjectGrid: TDBGrid;
    TaskGrid: TDBGrid;
    ComboBox1: TComboBox;
    DBMemo1: TDBMemo;
    DBMemo2: TDBMemo;
    PopupMenuProject: TPopupMenu;
    N18: TMenuItem;
    TaskTape: TDBGrid;
    Label7: TLabel;
    Label8: TLabel;
    DBMemo3: TDBMemo;
    ShowTaskCheckBox: TCheckBox;
    N24: TMenuItem;
    N25: TMenuItem;
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
    PopupMenuTask: TPopupMenu;
    N29: TMenuItem;
    N30: TMenuItem;
    N36: TMenuItem;
    N40: TMenuItem;
    N38: TMenuItem;
    N39: TMenuItem;
    N37: TMenuItem;
    N41: TMenuItem;
    N42: TMenuItem;
    N43: TMenuItem;
    N44: TMenuItem;
    N45: TMenuItem;
    N46: TMenuItem;
    N47: TMenuItem;
    N48: TMenuItem;
    N49: TMenuItem;
    N50: TMenuItem;
    N51: TMenuItem;
    N52: TMenuItem;
    N53: TMenuItem;
    N54: TMenuItem;
    ControlBar1: TControlBar;
    ToolBar1: TToolBar;
    ChangeTask: TToolButton;
    ToolButton2: TToolButton;
    ChangeProject: TToolButton;
    N55: TMenuItem;
    N56: TMenuItem;
    N57: TMenuItem;
    N58: TMenuItem;
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
    procedure N25Click(Sender: TObject);
    procedure N30Click(Sender: TObject);
    procedure N36Click(Sender: TObject);
    procedure N38Click(Sender: TObject);
    procedure N39Click(Sender: TObject);
    procedure N40Click(Sender: TObject);
    procedure N41Click(Sender: TObject);
    procedure N42Click(Sender: TObject);
    procedure N44Click(Sender: TObject);
    procedure GitTextClick(Sender: TObject);
    procedure N37Click(Sender: TObject);
    procedure TaskTapeTitleClick(Column: TColumn);
    procedure N46Click(Sender: TObject);
    procedure N47Click(Sender: TObject);
    procedure N54Click(Sender: TObject);
    procedure N53Click(Sender: TObject);
    procedure N51Click(Sender: TObject);
    procedure N52Click(Sender: TObject);
    procedure N50Click(Sender: TObject);
    procedure ChangeTaskClick(Sender: TObject);
    procedure ChangeProjectClick(Sender: TObject);
    procedure PageControl1Change(Sender: TObject);
    procedure N55Click(Sender: TObject);
    procedure N56Click(Sender: TObject);
    procedure N57Click(Sender: TObject);

  private

  public

  end;

var
  MainForm: TMainForm;
  grids: string;


implementation

{$R *.dfm}

uses SettingFormUnit, ClientsFormUnit, FreelanceFormUnit, DataModuleMySQLUnit,
  EditProjectFormUnit, EditTaskFormUnit, OperationFormUnit, Clipbrd,
  TaskModelUnit, TrtansferTaskFormUnit, ProjectModelUnit, ClientModelUnit,
  FreelancerModelUnit;

var
  MyTask: TTaskModel;

//������� ������
procedure TMainForm.N25Click(Sender: TObject);
begin
  if MessageDlg('�� ������������ ������ ������� ������?', mtConfirmation, mbYesNo, 0) = idYes then
  begin

    MyTask.QueryConnect := DataModuleMySQL.ADQuerySQL;
    MyTask.DeleteTask(DataModuleMySQL.ADQueryTask.FieldByName('id').AsInteger);
    MyTask.Free;

    DataModuleMySQL.RefreshTask;


    ProjectModel.CalcProjectBudget(ProjectModel.ADQueryProject.FieldByName('id').AsInteger);
    ProjectModel.CalcProjectBalance(ProjectModel.ADQueryProject.FieldByName('id').AsInteger);
    ProjectModel.RefreshProject;

    ProjectModel.RefreshProject;
  end;

end;



procedure TMainForm.N2Click(Sender: TObject);
begin
  MainForm.Close;
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
  MyTask := TTaskModel.Create(DataModuleMySQL.ADConnection1);
end;

//������� �� ������ git
procedure TMainForm.GitTextClick(Sender: TObject);
begin
if GitText.Caption <> '' then
  ShellExecute(Handle, 'open', PChar(GitText.Caption), nil, nil, SW_SHOW);
end;

procedure TMainForm.N4Click(Sender: TObject);
begin
  ShowMessage('����������: ����������� ������� (sokolovskynik@gmail.com), ������ 2014. ������ 1.12');
end;

//����� ������� �������
//=====================================================
//���� �������� + ���� ����� �� ����� ��������!!

//����� ������� �������  - � ������
procedure TMainForm.N54Click(Sender: TObject);
begin
  ProjectModel.SetStatusWork;

  ProjectModel.RefreshProject;
  DataModuleMySQL.RefreshTape;
end;



//����� ������� �������  - ���������
procedure TMainForm.N53Click(Sender: TObject);
begin
  ProjectModel.SetStatusPrior;

  ProjectModel.RefreshProject;
  DataModuleMySQL.RefreshTape;
end;

//����� ������� �������  - ������
procedure TMainForm.N51Click(Sender: TObject);
begin
  ProjectModel.SetStatusClose;

  ProjectModel.RefreshProject;
  DataModuleMySQL.RefreshTape;
end;

//����� ������� �������  - ���������
procedure TMainForm.N52Click(Sender: TObject);
begin
  ProjectModel.SetStatusFreeze;

  ProjectModel.RefreshProject;
  DataModuleMySQL.RefreshTape;
end;

//����� ������� �������  - ������
procedure TMainForm.N50Click(Sender: TObject);
begin
  ProjectModel.SetStatusCancel;

  ProjectModel.RefreshProject;
  DataModuleMySQL.RefreshTape;
end;

//������� ������ ������
procedure TMainForm.N55Click(Sender: TObject);
begin
  ProjectModel.SetStatusWaitPay;

  ProjectModel.RefreshProject;
  DataModuleMySQL.RefreshTape;
end;


//==========================================
//������� � ���������
//���������� �������
procedure TMainForm.N10Click(Sender: TObject);
begin
  ProjectModel.ADQueryProject.Insert;
  EditProjectForm.ShowModal;

  ProjectModel.RefreshProject;
  DataModuleMySQL.RefreshTape;
end;

procedure TMainForm.N46Click(Sender: TObject);
begin
  N10Click(sender);
end;

procedure TMainForm.N11Click(Sender: TObject);
begin
  DataModuleMySQL.ADQueryTask.Insert;
  DataModuleMySQL.SetProjectLink(ProjectModel.GetIDProject);
  EditTaskForm.ShowModal;
  DataModuleMySQL.RefreshTask;
  DataModuleMySQL.RefreshTape;
end;


procedure TMainForm.N47Click(Sender: TObject);
begin
  N12Click(sender);
end;


//��������
procedure TMainForm.N12Click(Sender: TObject);
begin
  EditProjectForm.ShowModal;
  ProjectModel.RefreshProject;
  DataModuleMySQL.RefreshTape;
end;

//�������� ������ �� ������ ����������
procedure TMainForm.ChangeProjectClick(Sender: TObject);
begin
  N12Click(Sender);
end;

procedure TMainForm.N14Click(Sender: TObject);
begin
  EditTaskForm.ShowModal;
  DataModuleMySQL.RefreshTask;
  DataModuleMySQL.RefreshTape;
end;

//����� ������ �� ������� ������
procedure TMainForm.N41Click(Sender: TObject);
begin
  N11Click(Sender);
end;

//����� ������ �� ������� ��������
procedure TMainForm.N42Click(Sender: TObject);
begin
  N11Click(Sender);
end;

//�������� ������ �� ������� ��������
procedure TMainForm.N44Click(Sender: TObject);
begin
  N14Click(Sender);
end;

//�������� ������ �� ������ ����������
procedure TMainForm.ChangeTaskClick(Sender: TObject);
begin
  N14Click(Sender);
end;

//���������� ��������
procedure TMainForm.ComboBox1Change(Sender: TObject);
begin

case ComboBox1.ItemIndex of
0: ProjectModel.ShowAllActiveProject;
1: ProjectModel.ShowWorkProject;
2: ProjectModel.ShowFreezProject;
3: ProjectModel.ShowPriorProject;
4: ProjectModel.ShowCloseProject;
5: ProjectModel.ShowCancelProject;
6: ProjectModel.ShowWaitPayProject;
end;

end;

//������ �������
procedure TMainForm.N16Click(Sender: TObject);
begin
  OperationForm.LabelType.caption := '������';
  OperationForm.LabelName.Caption := ProjectModel.ADQueryProject.FieldByName('cl_fio').AsString;
  OperationForm.SetDataSet(ClientModel.DataSourceClientAccount);
  OperationForm.notes := '���� �� ������� ' + ProjectModel.ADQueryProject.FieldByName('caption').AsString;
  OperationForm.ShowModal;
end;

//������� �� ������
procedure TMainForm.N17Click(Sender: TObject);
begin
  OperationForm.LabelType.caption := '���������';
  OperationForm.LabelName.Caption := DataModuleMySQL.ADQueryTask.FieldByName('fio').AsString;
  OperationForm.SetDataSet(FreelancerModel.DataSourceFreelancerAccount);
  OperationForm.id_client := ProjectModel.ADQueryProject.FieldByName('client_link').AsInteger;
  OperationForm.notes := '������� �� �������: ' + ProjectModel.ADQueryProject.FieldByName('caption').AsString +
    ', ������: ' + DataModuleMySQL.ADQueryTask.FieldByName('caption').AsString;

  OperationForm.ShowModal;
  DataModuleMySQL.ADQueryTask.Refresh;
end;

//����������� � �����
procedure TMainForm.N18Click(Sender: TObject);
begin
  Clipboard.SetTextBuf(PChar(ProjectGrid.DataSource.DataSet.FieldByName(ProjectGrid.SelectedField.FieldName).AsString));
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

//���������� �� ��������
procedure TMainForm.TaskTapeTitleClick(Column: TColumn);
begin
  if Column.Title.Caption = '#' then
  begin
    DataModuleMySQL.SortById;
  end;

  if Column.Title.Caption = '������' then
  begin
    DataModuleMySQL.SortByTask;
  end;

  if Column.Title.Caption = '������ ������' then
  begin
    DataModuleMySQL.SortByPriorTask;
  end;

  if Column.Title.Caption = 'Deadline' then
  begin
    DataModuleMySQL.SortByDeadline;
  end;

  if Column.Title.Caption = '������' then
  begin
    DataModuleMySQL.SortByProject;
  end;

  if Column.Title.Caption = '������ �������' then
  begin
    DataModuleMySQL.SortByPriorProject;
  end;
end;

//���������� ������������ ������ � ������ ����������
procedure TMainForm.PageControl1Change(Sender: TObject);
begin
  if PageControl1.TabIndex = 0 then
  begin
    ChangeTask.Enabled := false;
    ChangeProject.Enabled := false;
  end
  else
  begin
    ChangeTask.Enabled := true;
    ChangeProject.Enabled := true;
  end;
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

if ProjectGrid.DataSource.DataSet.FieldByName('status').AsString = '������ ������' then
  begin
  ProjectGrid.Canvas.Brush.Color := clGray;
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

//=====================================
//������������� �������� ����� � �������� � �����
//=====================================

//������/�������� �������� �����
procedure TMainForm.ShowTaskCheckBoxClick(Sender: TObject);
begin
DataModuleMySQL.SetShowCloseTask(ShowTaskCheckBox.Checked);
DataModuleMySQL.GetTasks;
end;

//����� - � ������
procedure TMainForm.N31Click(Sender: TObject);
begin
  MyTask.SetStatusTask(TaskModelUnit.Work, DataModuleMySQL.ADQueryMindTape.FieldByName('id').AsInteger);
  DataModuleMySQL.RefreshTape;
  ProjectModel.RefreshProject;
  DataModuleMySQL.RefreshTask;
end;

//����� -  ��������
procedure TMainForm.N32Click(Sender: TObject);
begin
  MyTask.SetStatusTask(TaskModelUnit.prior, DataModuleMySQL.ADQueryMindTape.FieldByName('id').AsInteger);
  DataModuleMySQL.RefreshTape;
  ProjectModel.RefreshProject;
  DataModuleMySQL.RefreshTask;
end;

//����� - � �������� ���������
procedure TMainForm.N33Click(Sender: TObject);
begin
  MyTask.SetStatusTask(TaskModelUnit.wait, DataModuleMySQL.ADQueryMindTape.FieldByName('id').AsInteger);
  DataModuleMySQL.RefreshTape;
  ProjectModel.RefreshProject;
  DataModuleMySQL.RefreshTask;
end;

//����� - ��������
procedure TMainForm.N34Click(Sender: TObject);
begin
  MyTask.SetStatusTask(TaskModelUnit.Delayed, DataModuleMySQL.ADQueryMindTape.FieldByName('id').AsInteger);
  DataModuleMySQL.RefreshTape;
  ProjectModel.RefreshProject;
  DataModuleMySQL.RefreshTask;
end;

//����� - �������
procedure TMainForm.N35Click(Sender: TObject);
begin
  MyTask.SetStatusTask(TaskModelUnit.Closer, DataModuleMySQL.ADQueryMindTape.FieldByName('id').AsInteger);
  DataModuleMySQL.RefreshTape;
  ProjectModel.RefreshProject;
  DataModuleMySQL.RefreshTask;
end;

//������� ������ ������
procedure TMainForm.N56Click(Sender: TObject);
begin
  MyTask.SetStatusTask(TaskModelUnit.WaitPay, DataModuleMySQL.ADQueryMindTape.FieldByName('id').AsInteger);
  DataModuleMySQL.RefreshTape;
  ProjectModel.RefreshProject;
  DataModuleMySQL.RefreshTask;
end;

//===========================================
//����, �� �� ���� ������

//� ������
procedure TMainForm.N30Click(Sender: TObject);
begin
  MyTask.SetStatusTask(TaskModelUnit.work, DataModuleMySQL.ADQueryTask.FieldByName('id').AsInteger);
  ProjectModel.RefreshProject;
  DataModuleMySQL.RefreshTask;
  DataModuleMySQL.RefreshTape;
end;

//���������
procedure TMainForm.N36Click(Sender: TObject);
begin
  MyTask.SetStatusTask(TaskModelUnit.prior, DataModuleMySQL.ADQueryTask.FieldByName('id').AsInteger);
  ProjectModel.RefreshProject;
  DataModuleMySQL.RefreshTask;
  DataModuleMySQL.RefreshTape;
end;

//������ ���������
procedure TMainForm.N40Click(Sender: TObject);
begin
  MyTask.SetStatusTask(TaskModelUnit.wait, DataModuleMySQL.ADQueryTask.FieldByName('id').AsInteger);
  ProjectModel.RefreshProject;
  DataModuleMySQL.RefreshTask;
  DataModuleMySQL.RefreshTape;
end;

//��������
procedure TMainForm.N38Click(Sender: TObject);
begin
  MyTask.SetStatusTask(TaskModelUnit.Delayed, DataModuleMySQL.ADQueryTask.FieldByName('id').AsInteger);
  ProjectModel.RefreshProject;
  DataModuleMySQL.RefreshTask;
  DataModuleMySQL.RefreshTape;
end;

//�������
procedure TMainForm.N39Click(Sender: TObject);
begin
  MyTask.SetStatusTask(TaskModelUnit.Closer, DataModuleMySQL.ADQueryTask.FieldByName('id').AsInteger);
  ProjectModel.RefreshProject;
  DataModuleMySQL.RefreshTask;
  DataModuleMySQL.RefreshTape;
end;

//������� ������ ������
procedure TMainForm.N57Click(Sender: TObject);
begin
  MyTask.SetStatusTask(TaskModelUnit.WaitPay, DataModuleMySQL.ADQueryMindTape.FieldByName('id').AsInteger);
  DataModuleMySQL.RefreshTape;
  ProjectModel.RefreshProject;
  DataModuleMySQL.RefreshTask;
end;



//===========================
//������� ������ ����� ���������

procedure TMainForm.N37Click(Sender: TObject);
begin
  TransferTaskForm.id_task := TaskGrid.DataSource.DataSet.FieldByName('id').AsInteger;
  TransferTaskForm.ShowModal;

  ProjectModel.RefreshProject;
  DataModuleMySQL.RefreshTask;
  DataModuleMySQL.RefreshTape;
end;

end.
