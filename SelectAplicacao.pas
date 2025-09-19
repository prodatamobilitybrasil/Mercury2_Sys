unit SelectAplicacao;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Grids, DBGrids, Buttons, ExtCtrls;

type
  TFormSelectAplicacao = class(TForm)
    DBGrid: TDBGrid;
    Panel1: TPanel;
    Panel2: TPanel;
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
    Panel3: TPanel;
    Label1: TLabel;
    EditAPP: TEdit;
    Label2: TLabel;
    EditDesc: TEdit;
    procedure FormShow(Sender: TObject);
    procedure EditChange(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure EditExit(Sender: TObject);
    procedure EditEnter(Sender: TObject);
    procedure DBGridDblClick(Sender: TObject);
  private
    { Private declarations }
  public
    strAPP, strISS: String;
    { Public declarations }
  end;

var
  FormSelectAplicacao: TFormSelectAplicacao;

implementation

uses uDmSys;

{$R *.dfm}

procedure TFormSelectAplicacao.FormShow(Sender: TObject);
begin
IF not DmSys.cdsAux.Active THEN DmSys.cdsAux.Open;
EditAPP.SetFocus;
// APP_ID; APP_DESCSHORT; ISS_DESCLONG
end;

procedure TFormSelectAplicacao.EditChange(Sender: TObject);
Var S: String;
begin
IF EditAPP.Text = ''
THEN S:=''
ELSE S:='APP_ID = '+EditAPP.Text;
IF EditDesc.Text <> ''
THEN IF S <> ''
     THEN S:=S+' AND APP_DESCSHORT LIKE '''+EditDesc.Text+'%'''
     ELSE S:='APP_DESCSHORT LIKE '''+EditDesc.Text+'%''';

DmSys.cdsAux.Filter:=S;
DbGrid.Hint:=DmSys.cdsAux.Filter;
DmSys.cdsAux.First;
//DBGrid.SetFocus;
end;

procedure TFormSelectAplicacao.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
strAPP:=DMSys.cdsAux.FieldByName('APP_ID').AsString;
strISS:=DMSys.cdsAux.FieldByName('ISS_ID').AsString;
end;

procedure TFormSelectAplicacao.EditExit(Sender: TObject);
begin (Sender as TEdit).Color:=clWindow; end;

procedure TFormSelectAplicacao.EditEnter(Sender: TObject);
begin (Sender as TEdit).Color:=clYellow; end;

procedure TFormSelectAplicacao.DBGridDblClick(Sender: TObject);
begin
ModalResult:=mrOK;
end;

end.
