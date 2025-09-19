unit ufrmDetalhe;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Mask, DBCtrls, DB, Buttons, ExtCtrls, Menus;

type
  TfrmDetalhe = class(TForm)
    Label1: TLabel;
    EditBINID: TEdit;
    Label2: TLabel;
    EditDESC: TEdit;
    lblCOMMENT: TLabel;
    EditCOMMENT: TEdit;
    Label3: TLabel;
    EditID: TEdit;
    Label4: TLabel;
    EditSTATUS: TEdit;
    Label5: TLabel;
    EditREGDATE: TEdit;
    Label6: TLabel;
    EditREGUSER: TEdit;
    MainMenu1: TMainMenu;
    meniSistema: TMenuItem;
    menuAvanca: TMenuItem;
    menuVolta: TMenuItem;
    menuFinaliza: TMenuItem;
    N1: TMenuItem;
    Panel1: TPanel;
    btnVolta: TSpeedButton;
    btnAvanca: TSpeedButton;
    lblTotalItem: TLabel;
    procedure menuFinalizaClick(Sender: TObject);
    procedure menuAvancaClick(Sender: TObject);
    procedure menuVoltaClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
  private
    ind: Integer;
    procedure Mostra(quem: Integer);
  public
    ipID: String;
  end;

var
  frmDetalhe: TfrmDetalhe;

implementation

uses uDmSys, Aguarde;

{$R *.dfm}

procedure TfrmDetalhe.Mostra(quem: Integer);
begin
WITH dmSys
DO BEGIN
   cdsGeral.Close;
   cdsGeral.CommandText:='select * from INFOPARAMETERS where IP_ID = '+GS[quem];
   cdsGeral.Open;
   EditID.Text:=cdsGeral.Fields[0].AsString;
   EditBINID.Text:=cdsGeral.Fields[1].AsString;
   EditDESC.Text:=cdsGeral.Fields[2].AsString;
   EditCOMMENT.Text:=cdsGeral.Fields[3].AsString;
   EditSTATUS.Text:=cdsGeral.Fields[4].AsString;
   EditREGDATE.Text:=cdsGeral.Fields[5].AsString;
   EditREGUSER.Text:=cdsGeral.Fields[6].AsString;
   END;
end;

procedure TfrmDetalhe.FormShow(Sender: TObject);
begin
GetItem(',',ipID);
Ind:=1;
lblTotalItem.Caption:='Itens Selecionados: '+IntToStr(NI);
Mostra(ind);
end;

procedure TfrmDetalhe.menuFinalizaClick(Sender: TObject);
begin Close; end;

procedure TfrmDetalhe.menuAvancaClick(Sender: TObject);
begin
Inc(ind);
IF ind > NI THEN ind:=1;
Mostra(ind);
end;

procedure TfrmDetalhe.menuVoltaClick(Sender: TObject);
begin
Dec(ind);
IF ind = 0 THEN ind:=NI;
Mostra(ind);
end;

end.
