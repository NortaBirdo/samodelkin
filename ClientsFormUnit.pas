unit ClientsFormUnit;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.Grids, Vcl.DBGrids, Vcl.StdCtrls,
  Vcl.DBCtrls, Vcl.ToolWin, Vcl.ComCtrls, Vcl.ExtCtrls;

type
  TClientsForm = class(TForm)
    DBGrid1: TDBGrid;
    Label1: TLabel;
    DBMemo1: TDBMemo;
    ControlBar1: TControlBar;
    ToolBar1: TToolBar;
    ToolBtnAdd: TToolButton;
    ToolBtnSave: TToolButton;
    ToolBtnArch: TToolButton;
    ToolButton4: TToolButton;
    ToolBtnBlackList: TToolButton;
    ComboBox1: TComboBox;
    Label2: TLabel;
    Label4: TLabel;
    DBGrid2: TDBGrid;
    Label3: TLabel;
    BalLabel: TLabel;
    ToolButton1: TToolButton;
    AddMoneyToolBtn: TToolButton;
    procedure ComboBox1Change(Sender: TObject);
    procedure ToolBtnAddClick(Sender: TObject);
    procedure ToolBtnSaveClick(Sender: TObject);
    procedure ToolBtnArchClick(Sender: TObject);
    procedure ToolBtnBlackListClick(Sender: TObject);
    procedure DBGrid1CellClick(Column: TColumn);
    procedure FormShow(Sender: TObject);
    procedure AddMoneyToolBtnClick(Sender: TObject);

  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  ClientsForm: TClientsForm;

implementation

{$R *.dfm}

uses DataModuleMySQLUnit, OperationFormUnit;

//��������� �� ����
procedure TClientsForm.AddMoneyToolBtnClick(Sender: TObject);
begin
  OperationForm.LabelType.caption := '������';
  OperationForm.LabelName.Caption := DataModuleMySQL.ADQueryClients.FieldByName('fio').AsString;
  OperationForm.SetDataSet(DataModuleMySQL.DataSourceClientAccount);
  OperationForm.notes := '���������� ������';
  OperationForm.ShowModal;
end;

procedure TClientsForm.ComboBox1Change(Sender: TObject);
begin
case ComboBox1.ItemIndex of
0: begin
   ToolBtnArch.Caption := '������������';
   ToolBtnBlackList.Caption := '� ������ ������';
   DataModuleMySQL.ShowActiveClient;
   end;
1: begin
   ToolBtnArch.Caption := '������������';
   ToolBtnBlackList.Caption := '� ������ ������';
   DataModuleMySQL.ShowArchiveClient;
   end;
2: begin
   ToolBtnArch.Caption := '������������';
   ToolBtnBlackList.Caption := '������� �� ������� ������';
   DataModuleMySQL.ShowBlackListClient;
   end;
end;
end;

//���������� �������
procedure TClientsForm.ToolBtnArchClick(Sender: TObject);
begin
if ToolBtnArch.Caption = '������������' then
  DataModuleMySQL.SetClientFlag(1)
  else
  DataModuleMySQL.SetClientFlag(0);

DataModuleMySQL.ADQueryClients.Post;
DataModuleMySQL.RefreshClient;
end;

//���������� ������ �������
procedure TClientsForm.ToolBtnBlackListClick(Sender: TObject);
begin
if ToolBtnBlackList.Caption = '� ������ ������' then
  DataModuleMySQL.SetClientFlag(2)
  else
  DataModuleMySQL.SetClientFlag(0);

DataModuleMySQL.ADQueryClients.Post;
DataModuleMySQL.RefreshClient;
end;

//���������� �������
procedure TClientsForm.DBGrid1CellClick(Column: TColumn);
begin
  DataModuleMySQL.FirstStart := false;
  ClientsForm.BalLabel.Caption := IntToStr(DataModuleMySQL.BalanceClient);
end;

procedure TClientsForm.FormShow(Sender: TObject);
begin
  DataModuleMySQL.FirstStart := false;
  ClientsForm.BalLabel.Caption := IntToStr(DataModuleMySQL.BalanceClient);
end;

//���������� ������ �������
procedure TClientsForm.ToolBtnAddClick(Sender: TObject);
begin
 DataModuleMySQL.ADQueryClients.Insert;
 DataModuleMySQL.SetClientFlag(0);
end;

//���������� �������
procedure TClientsForm.ToolBtnSaveClick(Sender: TObject);
begin
  if DataModuleMySQL.ADQueryClients.Modified then
    DataModuleMySQL.ADQueryClients.Post;
  DataModuleMySQL.RefreshClientList;
end;

end.
