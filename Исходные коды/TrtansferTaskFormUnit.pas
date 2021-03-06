unit TrtansferTaskFormUnit;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.Grids, Vcl.DBGrids;

type
  TTransferTaskForm = class(TForm)
    DBGrid1: TDBGrid;
    Label1: TLabel;
    OkBtn: TButton;
    CancelBtn: TButton;
    procedure CancelBtnClick(Sender: TObject);
    procedure OkBtnClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    id_task: integer;
  end;

var
  TransferTaskForm: TTransferTaskForm;

implementation

{$R *.dfm}

uses TransferTaskModelUnit, ProjectModelUnit;

//������ ��������
procedure TTransferTaskForm.CancelBtnClick(Sender: TObject);
begin
  TransferTaskForm.Close;
end;

//�������
procedure TTransferTaskForm.OkBtnClick(Sender: TObject);
begin
  ProjectModel.TransferTask(id_task);
  TransferTaskForm.Close;
end;

end.
