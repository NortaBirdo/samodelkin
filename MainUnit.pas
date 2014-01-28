unit MainUnit;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.Menus;

type
  TMainForm = class(TForm)
    MainMenu1: TMainMenu;
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
    procedure N5Click(Sender: TObject);
    procedure N7Click(Sender: TObject);
    procedure N8Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  MainForm: TMainForm;

implementation

{$R *.dfm}

uses SettingFormUnit, ClientsFormUnit, FreelanceFormUnit;

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

end.
