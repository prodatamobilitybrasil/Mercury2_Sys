unit uListaDescontos;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, Grids, DBGrids, StdCtrls, Buttons;

type
  TFrmListaDescontos = class(TForm)
    dbgDescontos: TDBGrid;
    Panel1: TPanel;
    btnOK: TBitBtn;
    BitBtn2: TBitBtn;
    procedure BitBtn2Click(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure btnOKClick(Sender: TObject);
  private
    { Private declarations }
  public
    Selecionado : Boolean;
    { Public declarations }
  end;

var
  FrmListaDescontos: TFrmListaDescontos;

implementation

Uses udmSys;

{$R *.dfm}

procedure TFrmListaDescontos.BitBtn2Click(Sender: TObject);
begin
  Close;
end;

procedure TFrmListaDescontos.FormShow(Sender: TObject);
begin
Selecionado := False;
If DmSys.cdsLineDiscounts.RecordCount = 0 Then
   btnOK.Enabled := False;
end;

procedure TFrmListaDescontos.btnOKClick(Sender: TObject);
begin
 Selecionado := True;
 Close;
end;

end.
