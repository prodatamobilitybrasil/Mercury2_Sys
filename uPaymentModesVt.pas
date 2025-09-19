unit uPaymentModesVt;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, uFrmBaseSys, Menus, DB, ActnList, ImgList, StdCtrls, ExtCtrls,
  Grids, DBGrids, ComCtrls, ToolWin, Buttons, DBTables, Global;

type
  TFrmPaymentModesVt = class(TFrmBaseSys)
    Label1: TLabel;
    edtFormas: TEdit;
    pcManutencao: TPageControl;
    tsPaymentModes: TTabSheet;
    tsPaymentDetails: TTabSheet;
    dbgDetailsIn: TDBGrid;
    Label3: TLabel;
    dbgDetailsOut: TDBGrid;
    Label4: TLabel;
    sbOut: TSpeedButton;
    sbIn: TSpeedButton;
    lblPaymentModes: TLabel;
    edtPaymentModes: TEdit;
    SpeedButton1: TSpeedButton;
    SpeedButton2: TSpeedButton;
    procedure dbgDetailsInDrawColumnCell(Sender: TObject;
      const Rect: TRect; DataCol: Integer; Column: TColumn;
      State: TGridDrawState);
    procedure dbgDetailsInDblClick(Sender: TObject);
    procedure pcBaseCadastroChange(Sender: TObject);
    procedure actFilterExecute(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FrmPaymentModesVt: TFrmPaymentModesVt;

implementation

uses uDmVtPos, Math, DBClient;

{$R *.dfm}

procedure TFrmPaymentModesVt.dbgDetailsInDrawColumnCell(Sender: TObject;
  const Rect: TRect; DataCol: Integer; Column: TColumn;
  State: TGridDrawState);
var
  Bmp: TBitmap;
  Offset: TRect;
begin
  inherited;
  if DataCol = 1 then
  begin
    Bmp := TBitmap.Create;
    if DmVtPos.cdsDetailsIn.FieldByName('Pmpd_Mandatory').AsInteger = 1 then
      Bmp.LoadFromFile('..\Spark Client\Sys\Chk_Checked.bmp')
    else
      Bmp.LoadFromFile('..\Spark Client\Sys\Chk_Unchecked.bmp');
    Offset.Left := ( Column.Width - Bmp.Width ) div 2;
    Offset.Top  := 3;
    dbgDetailsIn.Canvas.Draw( Offset.Left + Rect.Left, Offset.Top + Rect.Top, Bmp );
    Bmp.Free;
  end;
  
end;


procedure TFrmPaymentModesVt.dbgDetailsInDblClick(Sender: TObject);
var
  bm: TBookmark;
  NewVal: Integer;
begin
  inherited;
  if DmVtPos.cdsDetailsIn.RecordCount = 0 then
    Abort;

  If DmVtPos.cdsDetailsIn.fieldbyname('Pmpd_Mandatory').AsInteger = 1 then
    NewVal := 0
  else   NewVal := 1;

  bm := DmVtPos.cdsDetailsIn.GetBookmark;
  with DmVtPos.cdsTmp do
  begin
    CommandText := 'UPDATE ' +
                   '  PaymentModesXPaymentDetails ' +
                   'SET' +
                   '  Pmpd_Mandatory = :NewVal ' +
                   'WHERE' +
                   '  Pm_Code = :PmCode ' +
                   '  AND ' +
                   '  Pd_Code = :PdCode ' ;

    Params[0].AsInteger := NewVal;
    Params[1].AsInteger := DmVtPos.cdsDetailsIn.fieldbyname('Pm_Code').AsInteger;
    Params[2].AsInteger := DmVtPos.cdsDetailsIn.fieldbyname('Pd_Code').AsInteger;
    Execute;
  end;
  DmVtPos.cdsDetailsIn.Close;
  DmVtPos.cdsDetailsIn.Open;
  DmVtPos.cdsDetailsIn.GotoBookmark( bm );

end;

procedure TFrmPaymentModesVt.pcBaseCadastroChange(Sender: TObject);
begin
  inherited;
  if DmVtPos.cdsPaymentModes.RecordCount = 0 then
    pcBaseCadastro.ActivePage := tsBaseCadastroFiltro
  else
    pcManutencao.ActivePage := tsPaymentModes;
end;

procedure TFrmPaymentModesVt.actFilterExecute(Sender: TObject);
begin
  inherited;
  with DmVtPos.cdsPaymentModes do
  begin
    Close;
    CommandText := ' select * from PaymentModes '+
                   ' where Pm_Desc like '+''''+'%'+edtFormas.Text+'%'+''''+
                   ' order by Pm_Desc ';
    Open;
  end;
end;

end.
