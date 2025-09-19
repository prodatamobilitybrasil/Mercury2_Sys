unit uFrmBits; //cidel+ SU-47526

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, ExtCtrls, CheckLst, IniFiles;

type
  TFrmBits = class(TForm)
    lbBIT: TCheckListBox;
    Panel1: TPanel;
    Panel2: TPanel;
    btnOK: TBitBtn;
    BitBtn2: TBitBtn;
    pnValor: TPanel;
    btnAltera: TButton;
    procedure FormShow(Sender: TObject);
    procedure lbBITClickCheck(Sender: TObject);
    procedure btnOKClick(Sender: TObject);
    procedure btnAlteraClick(Sender: TObject);
    procedure lbBITKeyUp(Sender: TObject; var Key: Word;
      Shift: TShiftState);
  private
    { Private declarations }
    Spark_Conf: TIniFile;
    secao : TStringList;
    procedure CriaINI;
    procedure SalvaINI;
  public
    { Public declarations }
  end;

var
  FrmBits: TFrmBits;

implementation

{$R *.dfm}

{%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%}
procedure TFrmBits.FormShow(Sender: TObject);
Var p,t,v: DWord; i: Integer;
    buffer     : array[0..144] of Char;
    S,systemDir: String;
begin

secao:=TStringList.Create;
GetSystemDirectory(Buffer,144);
systemDir := StrPas(Buffer);
Spark_Conf:=TIniFile.Create(systemDir+'\Spark_Conf.ini');

IF not Spark_Conf.SectionExists('Sys_Bits') THEN CriaINI;

Spark_Conf.ReadSectionValues('Sys_Bits', secao);
FOR i:=0 to 31
DO BEGIN
   S:=secao[i];;
   p:=Pos('=',S)+1;
   t:=Length(S)-p+1;
   secao[i]:=Copy(S,p,t);
   END;

v:=StrToInt64(pnValor.Caption);
lbBIT.Clear;
FOR i:=0 to 31
DO BEGIN
   lbBIT.Items.Add('BIT '+FormatFloat('00',i)+' - '+secao[i]);
   IF (v and (1 shl i)) <> 0 THEN lbBIT.Checked[i]:=true;
   END;

end;
{%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%}
procedure TFrmBits.lbBITClickCheck(Sender: TObject);
Var i: Integer; v: DWord;
begin
//lbBIT.Checked[lbBIT.ItemIndex]:=not lbBIT.Checked[lbBIT.ItemIndex];
V:=0;
FOR i:=0 to 31
DO IF lbBIT.Checked[i] THEN V:=V+(1 shl i);
pnValor.Caption:=IntToStr(v);
end;
{%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%}
procedure TFrmBits.SalvaINI;
Var i: Integer;
begin
  FOR i:=0 to 31
  DO Spark_Conf.WriteString('Sys_Bits','BIT'+IntToStr(i),secao[i]);
end;
{%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%}
procedure TFrmBits.CriaINI;
begin
  secao.Add('IGNORE_TRAN_SIZE_DISPLAY');
  secao.Add('PERFORM_2ND_BLOCK_CHECK');
  secao.Add('SECC_ADJUST_FARE_MODE_FULL');
  secao.Add('ABORT_ON_READ_ERROR');
  secao.Add('RETRY_EVENTS_ON_MAGN_WRITE');
  secao.Add('GET_RECHARGE_SECTOR');
  secao.Add('ACCEPT_REMOTE_COMMANDS');
  secao.Add('DISABLE_SOL_SW2');
  secao.Add('DISABLE_UPLOAD_DISPLAY');
  secao.Add('COBR_CARD_CONF');
  secao.Add('ITG_ONLY_WITH_SAME_APP');
  secao.Add('HELP_MODE_WITH_TIMEOUT');
  secao.Add('FILES_IN_BD3010');
  secao.Add('SAVE_MULA_SERVICE');
  secao.Add('GEN_TRAN_WITH_SIGN');
  secao.Add('WRITE_STUDENT_APP');
  secao.Add('FIX_BUMUN_DATE');
  secao.Add('ACCEPT_VIRTUAL_MAIS');
  secao.Add('LOOSE_USER_ON_SWALLOW_ERROR');
  secao.Add('FREE_1');
  secao.Add('RESTORE_MVB_CARD');
  secao.Add('ACCEPT_CORRUPTED_MVB');
  secao.Add('WORK_WITH_BLOCKED_SWALLOW');
  secao.Add('DISPLAY_BACKLIGHT_CONTROL');
  secao.Add('FIX_RIR_CARDS');
  secao.Add('OPER_ONLY_RESPECTIVE_VEHICLE');
  secao.Add('CHECK_VALOP_FILE');
  secao.Add('INSERT_ESPECIAL');
  secao.Add('IGNORE_CRC_ERROR');
  secao.Add('FREE_2');
  secao.Add('FREE_3');
  secao.Add('FREE_4');
  SalvaINI;
end;
{%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%}
procedure TFrmBits.btnOKClick(Sender: TObject);
begin
SalvaINI;
end;
{%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%}
procedure TFrmBits.btnAlteraClick(Sender: TObject);
Var S: String; i: Integer;
begin
i:=lbBIT.ItemIndex;
IF i = -1
THEN BEGIN
     ShowMessage('Falta selecionar Item');
     Exit;
     END;
S:=secao[i];
IF not InputQuery('Alteração da Descrição', 'Nova Descrição', S) THEN Exit;
secao[i]:=Trim(S);
lbBIT.Items[i]:='BIT '+FormatFloat('00',i)+' - '+secao[i];
SalvaINI;
end;
{%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%}
procedure TFrmBits.lbBITKeyUp(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
IF Key = vk_F2 THEN btnAlteraClick(Sender);
end;
{%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%}
end.
