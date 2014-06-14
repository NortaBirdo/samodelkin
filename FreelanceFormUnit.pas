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
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FreelanceForm: TFreelanceForm;

implementation

{$R *.dfm}

uses DataModuleMySQLUnit, FreelancerModelUnit;

procedure TFreelanceForm.ComboBox1Change(Sender: TObject);
begin
case ComboBox1.ItemIndex of
0: begin
   ToolBtnArch.Caption := '������������';
   ToolBtnBlackList.Caption := '� ������ ������';
   FreelancerModel.ShowActiveFreelancer;
   end;
1: begin
   ToolBtnArch.Caption := '������������';
   ToolBtnBlackList.Caption := '� ������ ������';
   FreelancerModel.ShowArchiveFreelancer;
   end;
2: begin
   ToolBtnArch.Caption := '������������';
   ToolBtnBlackList.Caption := '������� �� ������� ������';
   FreelancerModel.ShowBlackListFreelancer;
   end;
end;
end;

procedure TFreelanceForm.DBGrid1CellClick(Column: TColumn);
begin
  FreelancerModel.RefreshOperationFl;
  BalanceLabel.Caption := IntToStr(FreelancerModel.GetBalance);
end;

procedure TFreelanceForm.FormShow(Sender: TObject);
begin
  FreelancerModel.FirstStart := false;
  BalanceLabel.Caption := IntToStr(FreelancerModel.GetBalance);
end;

procedure TFreelanceForm.ToolBtnAddClick(Sender: TObject);
begin
  FreelancerModel.AddFreelancer;
end;

procedure TFreelanceForm.ToolBtnSaveClick(Sender: TObject);
begin
  if FreelancerModel.ADQueryFreelancer.Modified then
    FreelancerModel.ADQueryFreelancer.Post;
  FreelancerModel.RefreshFreelancer;
end;

procedure TFreelanceForm.ToolBtnArchClick(Sender: TObject);
begin
if ToolBtnArch.Caption = '������������' then
  FreelancerModel.SetFreelancerFlag(1)
  else
  FreelancerModel.SetFreelancerFlag(0);

FreelancerModel.ADQueryFreelancer.Post;
FreelancerModel.RefreshFreelancer;
end;

procedure TFreelanceForm.ToolBtnBlackListClick(Sender: TObject);
begin
if ToolBtnBlackList.Caption = '� ������ ������' then
  FreelancerModel.SetFreelancerFlag(2)
  else
  FreelancerModel.SetFreelancerFlag(0);

FreelancerModel.ADQueryFreelancer.Post;
FreelancerModel.RefreshFreelancer;
end;

end.
