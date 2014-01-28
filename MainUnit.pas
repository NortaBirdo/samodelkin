unit MainUnit;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.Menus, Vcl.Grids, Vcl.DBGrids,
  Vcl.StdCtrls, Vcl.DBCtrls, Vcl.Mask;

type
  TMainForm = class(TForm)
    N1: TMenuItem;
    N2: TMenuItem;
    N3: TMenuItem;
    N4: TMenuItem;
    N5: TMenuItem;
    N6: TMenuItem;
    N7: TMenuItem;
    N8: TMenuItem;
    N9: TMenuItem;
    N10: TMenuItem;
    N11: TMenuItem;
    Label1: TLabel;
    Label2: TLabel;
    DBGrid1: TDBGrid;
    DBGrid2: TDBGrid;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    ComboBox1: TComboBox;
    Label6: TLabel;
    N13: TMenuItem;
    N14: TMenuItem;
    DBText1: TDBText;
    DBText2: TDBText;
    DBMemo1: TDBMemo;
    MainMenu1: TMainMenu;
    N12: TMenuItem;
    procedure N5Click(Sender: TObject);
    procedure N7Click(Sender: TObject);
    procedure N8Click(Sender: TObject);
    procedure N4Click(Sender: TObject);
    procedure N2Click(Sender: TObject);
    procedure N10Click(Sender: TObject);
    procedure N12Click(Sender: TObject);
    procedure ComboBox1Change(Sender: TObject);

  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  MainForm: TMainForm;

implementation

{$R *.dfm}

uses SettingFormUnit, ClientsFormUnit, FreelanceFormUnit, DataModuleMySQLUnit,
  EditProjectFormUnit;

procedure TMainForm.N2Click(Sender: TObject);
begin
  MainForm.Close;
end;

procedure TMainForm.N4Click(Sender: TObject);
begin
  ShowMessage('����������: ���������� ������� (sokolovskynik@gmail.com), ������ 2014');
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

//==========================================
//������� � ���������

//���������� �������
procedure TMainForm.N10Click(Sender: TObject);
begin
  DataModuleMySQL.ADQueryProject.Insert;
  EditProjectForm.ShowModal;
end;

//��������
procedure TMainForm.N12Click(Sender: TObject);
begin
  EditProjectForm.ShowModal;
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

end.
