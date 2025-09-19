unit uLines_Integrations;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, Grids, DBGrids, uGeralFunctions, ExtCtrls, DB, ActnList;

type
  TFrmLinha_Integracao = class(TForm)
    Panel1: TPanel;
    dbgLinesIntegration: TDBGrid;
    edLine: TEdit;
    Label1: TLabel;
    btnOK: TBitBtn;
    BitBtn3: TBitBtn;
    dbgIntegration: TDBGrid;
    ActionList1: TActionList;
    actConfirmar: TAction;
    actCancelar: TAction;
    procedure edLineChange(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure actConfirmarExecute(Sender: TObject);
    procedure actCancelarExecute(Sender: TObject);
  private
    t_form_objects : t_Object_List;
    { Private declarations }
  public
     Result : Boolean;
    { Public declarations }
  end;

var
  FrmLinha_Integracao: TFrmLinha_Integracao;

implementation

Uses uDmSys, uDmSys1, uDataBaseFunctions, uNewIntegration, uDmConexao;

{$R *.dfm}

procedure TFrmLinha_Integracao.edLineChange(Sender: TObject);
begin
  If dbgLinesIntegration.Visible Then
     dmsys.cdsLineMT.Locate('LM_DESC',edLine.Text, [loPartialKey])
  Else
  If dbgIntegration.Visible Then
      DmSys1.cdsLineIntegrationCons.Locate('LI_ID',edLine.Text, [loPartialKey]); 
end;

procedure TFrmLinha_Integracao.FormCreate(Sender: TObject);
begin
  if not FillObjectsList(TForm(Sender).Tag, dmConexao.SystemUser_Id, dmConexao.cdsGeral, t_form_objects) then
    begin
      DisplayMsg(t_form_objects, '%T', [2828], []);
      TForm(Sender).Close;
    end;
  SetDisplayValues(t_form_objects,TForm(Sender));

end;

procedure TFrmLinha_Integracao.actConfirmarExecute(Sender: TObject);
begin
  Result := True;
  Close;
end;

procedure TFrmLinha_Integracao.actCancelarExecute(Sender: TObject);
begin
 Result := False;
 Close;
end;

end.
