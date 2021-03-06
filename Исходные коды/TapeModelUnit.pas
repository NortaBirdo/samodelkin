unit TapeModelUnit;

interface

uses
  System.SysUtils, System.Classes, uADStanIntf, uADStanOption, uADStanParam,
  uADStanError, uADDatSManager, uADPhysIntf, uADDAptIntf, uADStanAsync,
  uADDAptManager, Data.DB, uADCompDataSet, uADCompClient;

type
  TTapeModel = class(TDataModule)
    ADQueryMindTape: TADQuery;
    DataSourceMindTape: TDataSource;
    procedure DataModuleCreate(Sender: TObject);
  private
    { Private declarations }
  public
    //�����
    procedure RefreshTape;
    //���������� �����
    procedure SortById;
    procedure SortByTask;
    procedure SortByPriorTask;
    procedure SortByDeadline;
    procedure SortByProject;
    procedure SortByPriorProject;

    function GetId:integer;
  end;

var
  TapeModel: TTapeModel;

implementation

{%CLASSGROUP 'Vcl.Controls.TControl'}

uses DataModuleMySQLUnit;

{$R *.dfm}

{ TTapeModel }

procedure TTapeModel.DataModuleCreate(Sender: TObject);
begin
  ADQueryMindTape.Active := true;
end;

function TTapeModel.GetId: integer;
begin
  result := ADQueryMindTape.FieldByName('id').AsInteger;
end;

procedure TTapeModel.RefreshTape;
begin
  ADQueryMindTape.Refresh;
end;

procedure TTapeModel.SortByDeadline;
var
  sQuery: string;
begin

  with ADQueryMindTape do
  begin
    Close;
    SQl.Clear;

    sQuery := 'SELECT T.*, P.* FROM TASK T, PROJECT P WHERE T.status <> ' + QuotedStr('�������') +
      ' AND T.status <> ' + QuotedStr('��������')+
      ' AND T.project_link = P.id AND P.status <> ' + QuotedStr('������') + ' AND P.status <> ' +
      QuotedStr('�������') + ' ORDER BY T.deadline DESC';
    SQL.Add(sQuery);
    Open;
  end;
end;

procedure TTapeModel.SortById;
var
  sQuery: string;
begin

  with ADQueryMindTape do
  begin
    Close;
    SQl.Clear;

    sQuery := 'SELECT T.*, P.* FROM TASK T, PROJECT P WHERE T.status <> ' + QuotedStr('�������') +
      ' AND T.status <> ' + QuotedStr('��������')+
      ' AND T.project_link = P.id AND P.status <> ' + QuotedStr('������') + ' AND P.status <> ' +
      QuotedStr('�������') + ' ORDER BY T.ID ASC';
    SQL.Add(sQuery);
    Open;
  end;
end;

procedure TTapeModel.SortByPriorProject;
var
  sQuery: string;
begin

  with ADQueryMindTape do
  begin
    Close;
    SQl.Clear;

    sQuery := 'SELECT T.*, P.* FROM TASK T, PROJECT P WHERE T.status <> ' + QuotedStr('�������') +
      ' AND T.status <> ' + QuotedStr('��������')+
      ' AND T.project_link = P.id AND P.status <> ' + QuotedStr('������') + ' AND P.status <> ' +
      QuotedStr('�������') + ' ORDER BY P.status ASC';
    SQL.Add(sQuery);
    Open;
  end;

end;

procedure TTapeModel.SortByPriorTask;
var
  sQuery: string;
begin

  with ADQueryMindTape do
  begin
    Close;
    SQl.Clear;

    sQuery := 'SELECT T.*, P.* FROM TASK T, PROJECT P WHERE T.status <> ' + QuotedStr('�������') +
      ' AND T.status <> ' + QuotedStr('��������')+
      ' AND T.project_link = P.id AND P.status <> ' + QuotedStr('������') + ' AND P.status <> ' +
      QuotedStr('�������') + ' ORDER BY T.status ASC';
    SQL.Add(sQuery);
    Open;
  end;
end;

procedure TTapeModel.SortByProject;
var
  sQuery: string;
begin

  with ADQueryMindTape do
  begin
    Close;
    SQl.Clear;

    sQuery := 'SELECT T.*, P.* FROM TASK T, PROJECT P WHERE T.status <> ' + QuotedStr('�������') +
      ' AND T.status <> ' + QuotedStr('��������')+
      ' AND T.project_link = P.id AND P.status <> ' + QuotedStr('������') + ' AND P.status <> ' +
      QuotedStr('�������') + ' ORDER BY P.caption ASC';
    SQL.Add(sQuery);
    Open;
  end;


end;

procedure TTapeModel.SortByTask;
var
  sQuery: string;
begin

  with ADQueryMindTape do
  begin
    Close;
    SQl.Clear;

    sQuery := 'SELECT T.*, P.* FROM TASK T, PROJECT P WHERE T.status <> ' + QuotedStr('�������') +
      ' AND T.status <> ' + QuotedStr('��������')+
      ' AND T.project_link = P.id AND P.status <> ' + QuotedStr('������') + ' AND P.status <> ' +
      QuotedStr('�������') + ' ORDER BY T.caption ASC';
    SQL.Add(sQuery);
    Open;
  end;

end;

end.
