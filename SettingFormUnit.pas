unit SettingFormUnit;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.Mask, Vcl.DBCtrls;

type
  TSettingForm = class(TForm)
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    DBEdit1: TDBEdit;
    DBEdit2: TDBEdit;
    DBEdit3: TDBEdit;
    DBEdit4: TDBEdit;
    OKButton: TButton;
    CancelButton: TButton;
    procedure CancelButtonClick(Sender: TObject);
    procedure OKButtonClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  SettingForm: TSettingForm;

implementation

{$R *.dfm}

uses DataModuleSQLite;

procedure TSettingForm.CancelButtonClick(Sender: TObject);
begin
  SettingForm.Close;
end;

//сохранение результатов
procedure TSettingForm.OKButtonClick(Sender: TObject);
begin
with SQLiteDataModule.ADTable1 do
begin
  edit;
  if Modified then
  begin
  post;
  ShowMessage('Новые параметры вступят в силу после перезагрузки программы.');
  end;
  SettingForm.Close;
end;

end;

end.
