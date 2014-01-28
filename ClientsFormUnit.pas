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
    ToolButton1: TToolButton;
    ToolButton2: TToolButton;
    ToolBtnArch: TToolButton;
    ToolButton4: TToolButton;
    ToolBtnBlackList: TToolButton;
    ComboBox1: TComboBox;
    Label2: TLabel;
    procedure ComboBox1Change(Sender: TObject);
    procedure ToolButton1Click(Sender: TObject);
    procedure ToolButton2Click(Sender: TObject);
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
   ToolBtnArch.Caption := 'Архивировать';
   ToolBtnBlackList.Caption := 'В черный список';
   end;
1: begin
   ToolBtnArch.Caption := 'Активировать';
   ToolBtnBlackList.Caption := 'В черный список';
   end;
2: begin
   ToolBtnArch.Caption := 'Архивировать';
   ToolBtnBlackList.Caption := 'Удалить из черного списка';
   end;
end;
end;

procedure TClientsForm.ToolButton1Click(Sender: TObject);
begin
 DataModuleMySQL.ADQueryClients.Insert;
end;

procedure TClientsForm.ToolButton2Click(Sender: TObject);
begin
  if DataModuleMySQL.ADQueryClients.Modified then
    begin
      DataModuleMySQL.ADQueryClients.FieldByName('flag').Value := 0;
      DataModuleMySQL.ADQueryClients.Post;
    end;
end;
end.
