unit EditProjectFormUnit;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.Mask, Vcl.DBCtrls,
  Vcl.Grids, Vcl.DBGrids;

type
  TEditProjectForm = class(TForm)
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    DBEdit1: TDBEdit;
    DBEdit2: TDBEdit;
    DBGrid1: TDBGrid;
    BtnChangeClient: TButton;
    BtnSave: TButton;
    BtnCancel: TButton;
    DBMemo1: TDBMemo;
    DBComboBox1: TDBComboBox;
    DBText1: TDBText;
    procedure BtnCancelClick(Sender: TObject);
    procedure BtnSaveClick(Sender: TObject);
    procedure BtnChangeClientClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  EditProjectForm: TEditProjectForm;

implementation

{$R *.dfm}

uses DataModuleMySQLUnit;

procedure TEditProjectForm.BtnCancelClick(Sender: TObject);
begin
  DataModuleMySQL.ADQueryProject.Cancel;
  EditProjectForm.Close;
end;

procedure TEditProjectForm.BtnChangeClientClick(Sender: TObject);
begin
  DataModuleMySQL.SetClient(DataModuleMySQL.GetClientID);
  Label3.Caption := 'Новый заказчик: ' + DataModuleMySQL.GetClientName;
end;

procedure TEditProjectForm.BtnSaveClick(Sender: TObject);
begin
  if DataModuleMySQL.ADQueryProject.Modified then
    DataModuleMySQL.ADQueryProject.Post;

 DataModuleMySQL.RefreshClient;
 DataModuleMySQL.RefreshProject;
 EditProjectForm.Close;
end;

procedure TEditProjectForm.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  BtnCancelClick(Sender);
end;

procedure TEditProjectForm.FormShow(Sender: TObject);
begin
  Label3.Caption := 'Новый заказчик: ';
end;

end.
