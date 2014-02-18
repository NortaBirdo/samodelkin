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
    procedure ComboBox1Change(Sender: TObject);
    procedure ToolBtnAddClick(Sender: TObject);
    procedure ToolBtnSaveClick(Sender: TObject);
    procedure ToolBtnArchClick(Sender: TObject);
    procedure ToolBtnBlackListClick(Sender: TObject);
    procedure DBGrid2CellClick(Column: TColumn);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  ClientsForm: TClientsForm;

implementation

{$R *.dfm}

uses DataModuleMySQLUnit;

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

//���������� ������ �������
procedure TClientsForm.DBGrid2CellClick(Column: TColumn);
begin
DataModuleMySQL.RefreshOperationClient;
end;

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
