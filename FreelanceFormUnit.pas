unit FreelanceFormUnit;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.DBCtrls, Vcl.Grids,
  Vcl.DBGrids, Vcl.ComCtrls, Vcl.ToolWin, Vcl.ExtCtrls;

type
  TFreelanceForm = class(TForm)
    ControlBar1: TControlBar;
    ToolBar1: TToolBar;
    ToolBtnAdd: TToolButton;
    ToolBtnSave: TToolButton;
    ToolButton4: TToolButton;
    ToolBtnArch: TToolButton;
    ToolBtnBlackList: TToolButton;
    DBGrid1: TDBGrid;
    Label1: TLabel;
    DBMemo1: TDBMemo;
    ComboBox1: TComboBox;
    Label2: TLabel;
    Label3: TLabel;
    DBMemo2: TDBMemo;
    Label4: TLabel;
    DBGrid2: TDBGrid;
    BalanceLabel: TLabel;
    Label5: TLabel;
    procedure ToolBtnArchClick(Sender: TObject);
    procedure ComboBox1Change(Sender: TObject);
    procedure ToolBtnBlackListClick(Sender: TObject);
    procedure ToolBtnAddClick(Sender: TObject);
    procedure ToolBtnSaveClick(Sender: TObject);
    procedure DBGrid1CellClick(Column: TColumn);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FreelanceForm: TFreelanceForm;

implementation

{$R *.dfm}

uses DataModuleMySQLUnit;

procedure TFreelanceForm.ComboBox1Change(Sender: TObject);
begin
case ComboBox1.ItemIndex of
0: begin
   ToolBtnArch.Caption := 'Архивировать';
   ToolBtnBlackList.Caption := 'В черный список';
   DataModuleMySQL.ShowActiveFreelancer;
   end;
1: begin
   ToolBtnArch.Caption := 'Активировать';
   ToolBtnBlackList.Caption := 'В черный список';
   DataModuleMySQL.ShowArchiveFreelancer;
   end;
2: begin
   ToolBtnArch.Caption := 'Архивировать';
   ToolBtnBlackList.Caption := 'Удалить из черного списка';
   DataModuleMySQL.ShowBlackListFreelancer;
   end;
end;
end;

procedure TFreelanceForm.DBGrid1CellClick(Column: TColumn);
begin
DataModuleMySQL.RefreshOperationFl;
end;

procedure TFreelanceForm.ToolBtnAddClick(Sender: TObject);
begin
 DataModuleMySQL.ADQueryFreelancer.Insert;
 DataModuleMySQL.SetFreelancerFlag(0);
end;

procedure TFreelanceForm.ToolBtnSaveClick(Sender: TObject);
begin
  if DataModuleMySQL.ADQueryFreelancer.Modified then
    DataModuleMySQL.ADQueryFreelancer.Post;
  DataModuleMySQL.RefreshFreelancer;
end;

procedure TFreelanceForm.ToolBtnArchClick(Sender: TObject);
begin
if ToolBtnArch.Caption = 'Архивировать' then
  DataModuleMySQL.SetFreelancerFlag(1)
  else
  DataModuleMySQL.SetFreelancerFlag(0);

DataModuleMySQL.ADQueryFreelancer.Post;
DataModuleMySQL.RefreshFreelancer;
end;

procedure TFreelanceForm.ToolBtnBlackListClick(Sender: TObject);
begin
if ToolBtnBlackList.Caption = 'В черный список' then
  DataModuleMySQL.SetFreelancerFlag(2)
  else
  DataModuleMySQL.SetFreelancerFlag(0);

DataModuleMySQL.ADQueryFreelancer.Post;
DataModuleMySQL.RefreshFreelancer;
end;

end.
