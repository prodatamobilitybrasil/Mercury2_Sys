unit UFrmRptDialog;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ppProd, ppClass, ppReport, Buttons, StdCtrls, Mask, ToolEdit,
  RxLookup, ppComm, ppRelatv, ppDB, ppDBPipe, ExtCtrls, ppBands, ppCache,
  ppCtrls, ppPrnabl, ppVar;

type
  TFrmRptDialog = class(TForm)
    PanelRptLines: TPanel;
    rxLookup: TRxDBLookupCombo;
    Label1: TLabel;
    SpeedButton1: TSpeedButton;
    edtDate: TDateEdit;
    Label2: TLabel;
    RptDBMaster: TppDBPipeline;
    GroupBox1: TGroupBox;
    cmbReports: TComboBox;
    RptLinePrices: TppReport;
    ppHeaderBand2: TppHeaderBand;
    ppLabel14: TppLabel;
    ppLabel15: TppLabel;
    ppDBText9: TppDBText;
    ppDBText10: TppDBText;
    ppLabel16: TppLabel;
    ppLine5: TppLine;
    ppLine6: TppLine;
    ppLabel18: TppLabel;
    ppLabel20: TppLabel;
    ppSystemVariable4: TppSystemVariable;
    ppLabel21: TppLabel;
    ppImage2: TppImage;
    ppLabel22: TppLabel;
    ppLabel24: TppLabel;
    ppDetailBand2: TppDetailBand;
    ppDBText13: TppDBText;
    ppDBText14: TppDBText;
    ppFooterBand2: TppFooterBand;
    ppLine8: TppLine;
    ppSystemVariable5: TppSystemVariable;
    ppLabel25: TppLabel;
    ppSystemVariable6: TppSystemVariable;
    ppLabel26: TppLabel;
    ppDBText11: TppDBText;
    ppLabel19: TppLabel;
    ppDBText12: TppDBText;
    ppDBText17: TppDBText;
    ppLabel27: TppLabel;
    RptLineGroups: TppReport;
    ppHeaderBand3: TppHeaderBand;
    ppLabel28: TppLabel;
    ppLine11: TppLine;
    ppLabel31: TppLabel;
    ppLine12: TppLine;
    ppImage3: TppImage;
    ppLabel37: TppLabel;
    ppDetailBand3: TppDetailBand;
    ppFooterBand3: TppFooterBand;
    ppLine14: TppLine;
    ppSystemVariable8: TppSystemVariable;
    ppLabel40: TppLabel;
    ppSystemVariable9: TppSystemVariable;
    ppLabel41: TppLabel;
    ppGroup3: TppGroup;
    ppGroupHeaderBand3: TppGroupHeaderBand;
    ppGroupFooterBand3: TppGroupFooterBand;
    ppLabel29: TppLabel;
    ppDBText18: TppDBText;
    ppLabel30: TppLabel;
    ppDBText19: TppDBText;
    ppLabel34: TppLabel;
    ppSystemVariable7: TppSystemVariable;
    ppDBText20: TppDBText;
    ppDBText21: TppDBText;
    ppDBText22: TppDBText;
    ppLabel32: TppLabel;
    ppDBText23: TppDBText;
    ppLabel33: TppLabel;
    ppDBText15: TppDBText;
    ppGroup2: TppGroup;
    ppGroupHeaderBand2: TppGroupHeaderBand;
    ppGroupFooterBand2: TppGroupFooterBand;
    ppLine7: TppLine;
    RptLines: TppReport;
    ppHeaderBand1: TppHeaderBand;
    ppLabel1: TppLabel;
    ppLabel2: TppLabel;
    ppDBText1: TppDBText;
    ppDBText2: TppDBText;
    ppLabel3: TppLabel;
    ppLine1: TppLine;
    ppLine2: TppLine;
    ppLabel4: TppLabel;
    ppLabel5: TppLabel;
    ppSystemVariable1: TppSystemVariable;
    ppLabel6: TppLabel;
    ppImage1: TppImage;
    ppLabel7: TppLabel;
    ppLabel8: TppLabel;
    ppLabel11: TppLabel;
    ppDetailBand1: TppDetailBand;
    ppDBText3: TppDBText;
    ppDBText4: TppDBText;
    ppDBText5: TppDBText;
    ppDBText6: TppDBText;
    ppFooterBand1: TppFooterBand;
    ppLine3: TppLine;
    ppSystemVariable2: TppSystemVariable;
    ppLabel12: TppLabel;
    ppSystemVariable3: TppSystemVariable;
    ppLabel13: TppLabel;
    ppGroup1: TppGroup;
    ppGroupHeaderBand1: TppGroupHeaderBand;
    ppGroupFooterBand1: TppGroupFooterBand;
    ppLine4: TppLine;
    ppDBText7: TppDBText;
    ppLabel9: TppLabel;
    ppDBText8: TppDBText;
    procedure FormShow(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure SpeedButton1Click(Sender: TObject);
    procedure cmbReportsChange(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FrmRptDialog: TFrmRptDialog;

implementation

uses uDmSys1, uDmSys, DB;

{$R *.dfm}

procedure TFrmRptDialog.FormShow(Sender: TObject);
begin
  dmSys.cdsTransportProviders.Open;
  dmSys.cdsLineGroups.Open;
end;

procedure TFrmRptDialog.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  dmSys.cdsTransportProviders.Close;
  dmSys.cdsLineGroups.close;
  FrmRptDialog := nil;
end;

procedure TFrmRptDialog.SpeedButton1Click(Sender: TObject);
var
  text_script:string;
begin
  if (cmbReports.Text = '') then
  Begin
    Application.MessageBox('Informe o Relatório !','Relatório',MB_OK + MB_ICONEXCLAMATION);
    cmbReports.SetFocus;
    exit;
  end;

  if (rxLookup.Text = '') then
  Begin
    Application.MessageBox('Informe a Empresa !','Selecionar Empresa',MB_OK + MB_ICONEXCLAMATION);
    rxLookup.SetFocus;
    exit;
  end;

  case cmbReports.ItemIndex of
  0:
    Begin
      text_script:='select TP.tp_id, TP.tp_desc, LineMT.lm_viadesc,LineMT.lm_id, LineDetails.ld_id, LineDetails.ld_desc, LineDetails.ld_descshort, LineDetails.ld_sectionsqty, LineDetails.ld_regdate';
      text_script:= text_script + ' from TRANSPORTPROVIDERS TP join TRANSPORTPROVIDERSXLINEMT TPXLM ON TP.tp_id = TPXLM.tp_id ';
      text_script:= text_script + ' join LineMT ON TPXLM.lm_id = LineMT.lm_id ';
      text_script:= text_script + ' join LineDetails ON LineMT.lm_id = LineDetails.lm_id ';

      text_script:= text_script + ' where TP.tp_id = ' + QuotedStr(rxLookup.KeyValue);

      if (edtDate.Text <> '  /  /    ') then
           text_script:= text_script + ' and LineMT.lm_regdate >= ' + Quotedstr(FormatDateTime('dd-mmm-yyyy', strtodate(edtDate.Text)));

      text_script:= text_script + ' order by LineDetails.ld_desc';

      dmSys1.cdsReports.close;
      dmSys1.cdsReports.CommandText:=text_script;
      dmSys1.cdsReports.Open;

      RptLines.Print;
    end;

  1:
    Begin
      text_script:='select TP.tp_id, TP.tp_desc,lp_sct1_volta, lp_sct1_ida, LineMT.lm_viadesc, LineDetails.ld_id, LineDetails.ld_desc, LineDetails.ld_descshort, LineDetails.ld_sectionsqty,';
      text_script:= text_script + ' LinePrices.lp_date  from TRANSPORTPROVIDERS TP join TRANSPORTPROVIDERSXLINEMT TPXLM ON TP.tp_id = TPXLM.tp_id ';
      text_script:= text_script + ' join LineMT ON TPXLM.lm_id = LineMT.lm_id ';
      text_script:= text_script + ' join LineDetails ON LineMT.lm_id = LineDetails.lm_id ';
      text_script:= text_script + ' join LinePrices ON LineDetails.ld_id = LinePrices.ld_id ';

      text_script:= text_script + ' where TP.tp_id = ' + QuotedStr(rxLookup.KeyValue);

      if (edtDate.Text <> '  /  /    ') then
           text_script:= text_script + ' and LinePrices.lp_date >= ' + Quotedstr(FormatDateTime('dd-mmm-yyyy', strtodate(edtDate.Text)));

      text_script:= text_script + ' order by LineDetails.ld_desc ';

      dmSys1.cdsReports.close;
      dmSys1.cdsReports.CommandText:=text_script;
      dmSys1.cdsReports.Open;

      RptLinePrices.Print;
    end;

    2:
    Begin

      text_script:='select LineGroups.lg_id, LineGroups.lg_desc, LineMT.lm_desc, LineMT.lm_descshort, LineMT.lm_regdate ';
      text_script:= text_script + ' from LineGroups INNER join LineGroupsXLineMT ON LineGroups.lg_id = LineGroupsXLineMT.lg_id ';
      text_script:= text_script + ' INNER join LineMT ON LineGroupsXLineMT.lm_id = LineMT.lm_id ';

      text_script:= text_script + ' where LineGroups.lg_id = ' + QuotedStr(rxLookup.KeyValue);

      if (edtDate.Text <> '  /  /    ') then
            text_script:= text_script + ' and LineMT.lm_regdate >= ' + Quotedstr(FormatDateTime('dd-mmm-yyyy', strtodate(edtDate.Text)));

      text_script:= text_script + ' order by LineGroupsXLineMT.LG_Id, LineMT.lm_desc ';

      dmSys1.cdsReports.close;
      dmSys1.cdsReports.CommandText:=text_script;
      dmSys1.cdsReports.Open;

      RptLineGroups.Print;
    end;
  end;
end;

procedure TFrmRptDialog.cmbReportsChange(Sender: TObject);
begin

  rxLookup.ClearValue;
  edtDate.Clear;
  if cmbReports.Text = 'Relação de Linhas por Grupo' then
  Begin
    rxLookup.LookupField:='';
    rxLookup.LookupDisplay:='';
    rxLookup.LookupSource:=DmSys.dtsLineGroups;
    rxLookup.LookupField:='LG_ID';
    rxLookup.LookupDisplay:='LG_Desc';
  end
  else
  Begin
    rxLookup.LookupField:='';
    rxLookup.LookupDisplay:='';
    rxLookup.LookupSource:=DmSys.dtsTransportProviders;
    rxLookup.LookupField:='TP_ID';
    rxLookup.LookupDisplay:='TP_Desc';
  end;
end;

end.
