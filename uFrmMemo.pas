unit uFrmMemo;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, ExtCtrls;

type
  TfrmMemo = class(TForm)
    Panel1: TPanel;
    Panel2: TPanel;
    BitBtn1: TBitBtn;
    Memo: TMemo;
    procedure FormKeyPress(Sender: TObject; var Key: Char);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmMemo: TfrmMemo;

implementation

{$R *.dfm}

procedure TfrmMemo.FormKeyPress(Sender: TObject; var Key: Char);
begin
IF Key = #27 THEN Close;
end;

end.
