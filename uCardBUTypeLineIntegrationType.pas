unit uCardBUTypeLineIntegrationType;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ComCtrls, ToolWin, ExtCtrls, StdCtrls, RxDBComb, ImgList,
  DBCtrls;

type
  TFrmCardBUTypeLineIntegrationType = class(TForm)
    GroupBox1: TGroupBox;
    Label5: TLabel;
    GroupBox3: TGroupBox;
    GroupBox4: TGroupBox;
    lbDisponiveis: TListBox;
    GroupBox5: TGroupBox;
    lbSelecionadas: TListBox;
    Panel1: TPanel;
    imglstBase: TImageList;
    cbLineMt: TCoolBar;
    tbLineMt: TToolBar;
    tbtnNewLineMt: TToolButton;
    btnAddAllLineMt: TToolButton;
    btnDelAllLineMt: TToolButton;
    tbtnDeleteLineMt: TToolButton;
    Button1: TButton;
    dblCardBUType: TDBLookupComboBox;
    procedure FormCreate(Sender: TObject);
    procedure dblCardBUTypeClick(Sender: TObject);
    procedure lista(P_CBUTID: INTEGER);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure tbtnNewLineMtClick(Sender: TObject);
    procedure btnAddAllLineMtClick(Sender: TObject);
    procedure btnDelAllLineMtClick(Sender: TObject);
    procedure tbtnDeleteLineMtClick(Sender: TObject);
    procedure Button1Click(Sender: TObject);
  private

     { Private declarations }

  public
    { Public declarations }

  end;

var
  FrmCardBUTypeLineIntegrationType: TFrmCardBUTypeLineIntegrationType;

implementation

uses uDmSys, uDmConexao;

{$R *.dfm}


procedure TFrmCardBUTypeLineIntegrationType.lista(P_CBUTID: INTEGER);
var
i:integer;

begin
   with DmSys do
   begin
       cdsLineIntegrationTypes.Close;
       cdsLineIntegrationTypes.Open;
       cdsCardBUTypeXLineintegrationtypes.Close;
       cdsCardBUTypeXLineintegrationtypes.Params.ParamByName('P_CBUTID').Value := P_CBUTID;
       cdsCardBUTypeXLineintegrationtypes.Open;
       lbDisponiveis.Items.Clear;
       cdsLineIntegrationTypes.First;
       cdsCardBUTypeXLineintegrationtypes.First;
       lbDisponiveis.Items.BeginUpdate;
       lbSelecionadas.Items.BeginUpdate;
       lbSelecionadas.clear;
       lbDisponiveis.Clear;

       While not cdsLineIntegrationTypes.eof do
         Begin
            IF cdsCardBUTypeXLineintegrationtypes.Locate('LITP_ID', cdsLineIntegrationTypes.FieldByName('LITP_ID').AsInteger, [])
              Then lbSelecionadas.Items.AddObject(cdsLineIntegrationTypes.FieldByName('LITP_DESCRIPTION').AsString,
                                                       TObject(cdsLineIntegrationTypes.fieldByName('LITP_ID').AsInteger))
              Else lbDisponiveis.Items.AddObject(cdsLineIntegrationTypes.FieldByName('LITP_DESCRIPTION').AsString,
                                                       TObject(cdsLineIntegrationTypes.fieldByName('LITP_ID').AsInteger));
             cdsLineIntegrationTypes.Next;
         End;
       lbDisponiveis.Items.EndUpdate;
       lbSelecionadas.Items.EndUpdate;

   End;


end;

procedure TFrmCardBUTypeLineIntegrationType.FormCreate(Sender: TObject);
begin
   DmSys.cdsCardBUType.Close;
   DmSys.cdsCardBUType.Open;
end;

procedure TFrmCardBUTypeLineIntegrationType.dblCardBUTypeClick(
  Sender: TObject);
begin
   lbDisponiveis.Items.Clear;
   lbSelecionadas.Items.Clear;
   if dblCardBUType.Text<>'' then
     lista(dblCardBUType.KeyValue);
end;

procedure TFrmCardBUTypeLineIntegrationType.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  Action := caFree;
  FrmCardBUTypeLineIntegrationType := nil;
end;

procedure TFrmCardBUTypeLineIntegrationType.tbtnNewLineMtClick(
  Sender: TObject);
begin
  lbDisponiveis.SelectAll;
  lbDisponiveis.MoveSelection(lbSelecionadas);
end;

procedure TFrmCardBUTypeLineIntegrationType.btnAddAllLineMtClick(
  Sender: TObject);
begin
  lbDisponiveis.MoveSelection(lbSelecionadas);
end;

procedure TFrmCardBUTypeLineIntegrationType.btnDelAllLineMtClick(
  Sender: TObject);
begin
  lbSelecionadas.MoveSelection(lbDisponiveis);
end;

procedure TFrmCardBUTypeLineIntegrationType.tbtnDeleteLineMtClick(
  Sender: TObject);
begin
  lbSelecionadas.SelectAll;
  lbSelecionadas.MoveSelection(lbDisponiveis);

end;

procedure TFrmCardBUTypeLineIntegrationType.Button1Click(Sender: TObject);
var
i: integer;
begin
   with DmSys do
   begin
     cdsGeral.Close;
     cdsGeral.CommandText:='Delete CARDBUTYPEXLINEINTEGRATIONTYPE where CBUT_ID='+INTTOSTR(dblCardBUType.KeyValue);
     cdsGeral.Execute;

     cdsGeral.Close;
     cdsGeral.CommandText:='INSERT INTO CARDBUTYPEXLINEINTEGRATIONTYPE (CBUT_ID, LITP_ID) VALUES (:P_CBUT_ID, :P_LITP_ID)';
     For I :=  0 TO lbSelecionadas.Items.Count - 1  do
     Begin
       cdsGeral.Params.ParamByName('P_CBUT_ID').Value := dblCardBUType.KeyValue;
       cdsGeral.Params.ParamByName('P_LITP_ID').Value := Integer(lbSelecionadas.Items.Objects[I]);
       cdsGeral.Execute;
     END;
   end;
end;

end.
