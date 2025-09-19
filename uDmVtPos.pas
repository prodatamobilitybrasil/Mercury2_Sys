unit uDmVtPos;

interface

uses
  SysUtils, Classes, DB, DBClient, MConnect;

type
  TDmVtPos = class(TDataModule)
    cdsPaymentModes: TClientDataSet;
    dsPaymentModes: TDataSource;
    ConnBrkMaster: TConnectionBroker;
    shrConnMaster: TSharedConnection;
    cdsDetailsIn: TClientDataSet;
    dsDetailsIn: TDataSource;
    cdsDetailsOut: TClientDataSet;
    dsDetalisOut: TDataSource;
    cdsTmp: TClientDataSet;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  DmVtPos: TDmVtPos;

implementation

uses uDmConexao;

{$R *.dfm}

end.
