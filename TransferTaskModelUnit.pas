unit TransferTaskModelUnit;

interface

uses
  System.SysUtils, System.Classes, uADStanIntf, uADStanOption, uADStanParam,
  uADStanError, uADDatSManager, uADPhysIntf, uADDAptIntf, uADStanAsync,
  uADDAptManager, Data.DB, uADCompDataSet, uADCompClient;

type
  TTransferTaskModel = class(TDataModule)
    ADQueryProjectList: TADQuery;
    DataSource1: TDataSource;
    ADQuerySQL: TADQuery;
    procedure DataModuleCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    procedure TransferTask(id_task: integer);
  end;

var
  TransferTaskModel: TTransferTaskModel;

implementation

{%CLASSGROUP 'Vcl.Controls.TControl'}

uses DataModuleMySQLUnit;

{$R *.dfm}

{ TTransferTaskModel }

procedure TTransferTaskModel.DataModuleCreate(Sender: TObject);
begin
  ADQueryProjectList.Active := true;
end;

procedure TTransferTaskModel.TransferTask(id_task: integer);
var
  sQuery: string;
begin
  with ADQuerySQL do
  begin
    close;
    sql.Clear;
    sQuery := 'UPDATE TASK SET project_link = ' + ADQueryProjectList.FieldByName('id').AsString + ' WHERE id = ' + IntToStr(id_task) ;
    sql.Add(sQuery);
    ExecSQL;
  end;
end;

end.
