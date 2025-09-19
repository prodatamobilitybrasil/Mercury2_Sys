unit udlg_Ins_TransprovXVehTypesXApps;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons;

type
  Tdlg_Ins_TransprovXVehTypesXApps = class(TForm)
    cb_tipos_veiculos: TComboBox;
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
    Label1: TLabel;
    Label2: TLabel;
    cb_empresas: TComboBox;
    procedure FormShow(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
    procedure BitBtn2Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    procedure Preenche_Listas;
  end;

var
  dlg_Ins_TransprovXVehTypesXApps: Tdlg_Ins_TransprovXVehTypesXApps;

implementation

uses uDmSys;

{$R *.dfm}

procedure Tdlg_Ins_TransprovXVehTypesXApps.FormShow(Sender: TObject);
begin
  Preenche_Listas;
end;

procedure Tdlg_Ins_TransprovXVehTypesXApps.Preenche_Listas;
begin
  with dmSys do
  begin
    cdsGeral.Close;
    cdsGeral.CommandText := 'SELECT TP_ID, TP_DESC FROM TRANSPORTPROVIDERS ORDER BY TP_DESC';
    cdsGeral.Open;
    while not cdsGeral.Eof do
    begin
      cb_empresas.Items.AddObject(cdsGeral.fieldByName('TP_DESC').AsString, TObject(cdsGeral.fieldByName('TP_ID').AsInteger));
      cdsGeral.Next;
    end;

    cdsGeral.Close;
    cdsGeral.CommandText := 'SELECT VEHT_ID, VEHT_DESC FROM VEHICLETYPES' + #13
                          + 'WHERE VEHT_DESC <> ' + QuotedStr('N/A') + 'AND VEHT_DESC <> ' + QuotedStr('DEFAULT') + #13
                          + 'ORDER BY VEHT_DESC';
    cdsGeral.Open;
    while not cdsGeral.Eof do
    begin
      cb_tipos_veiculos.Items.AddObject(cdsGeral.fieldByName('VEHT_DESC').AsString, TObject(cdsGeral.fieldByName('VEHT_ID').AsInteger));
      cdsGeral.Next;
    end;
  end;
end;

procedure Tdlg_Ins_TransprovXVehTypesXApps.BitBtn1Click(Sender: TObject);
begin
  if (cb_empresas.ItemIndex <> -1) and (cb_tipos_veiculos.ItemIndex <> -1) then
    ModalResult := mrOk
  else
  begin
    MessageDlg('Você deve selecionar uma empresa e um tipo de veículo.',mtWarning,[mbOk],0);
    ModalResult := mrNone;
  end;
end;

procedure Tdlg_Ins_TransprovXVehTypesXApps.BitBtn2Click(Sender: TObject);
begin
  ModalResult := mrCancel;
end;

end.
