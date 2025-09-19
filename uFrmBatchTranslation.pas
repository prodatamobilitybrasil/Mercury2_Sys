unit uFrmBatchTranslation;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, uFrmBase, ActnList, ImgList, ComCtrls, ToolWin, StdCtrls,
  RxLookup, ExtCtrls, RxDBComb;

type
  TFrmBatchTranslation = class(TFrmBase)
    actExit: TAction;
    actTranslate: TAction;
    ToolButton1: TToolButton;
    ToolButton2: TToolButton;
    ToolButton3: TToolButton;
    GroupBox1: TGroupBox;
    Splitter1: TSplitter;
    StatusBar1: TStatusBar;
    GroupBox2: TGroupBox;
    dblkSourceLanguage: TRxDBLookupCombo;
    Label1: TLabel;
    Label2: TLabel;
    dblkDestLanguage: TRxDBLookupCombo;
    Label3: TLabel;
    Label4: TLabel;
    edTranslation: TEdit;
    cmbText: TComboBox;
    rdgField: TRadioGroup;
    procedure actExitExecute(Sender: TObject);
    procedure actTranslateExecute(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure dblkSourceLanguageChange(Sender: TObject);
    procedure dblkDestLanguageChange(Sender: TObject);
    procedure rdgFieldClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FrmBatchTranslation: TFrmBatchTranslation;

implementation

uses AppSparkSysMain, uConst, uDataBaseFunctions, uDmSys1, uGeralFunctions,
  uDmConexao, DBClient, DB;

{$R *.dfm}

procedure TFrmBatchTranslation.actExitExecute(Sender: TObject);
begin
  inherited;
  close;
end;

procedure TFrmBatchTranslation.actTranslateExecute(Sender: TObject);
var
 // QtdNew, QtdUpd : Integer;
  sDate, sUser : String;
begin
  inherited;
 // QtdNew := 0;
//  QtdUpd := 0;
  sDate := QuotedStr(FormatDateTime('dd-mmm-yyyy', DmConexao.ConnBrkMaster.AppServer.GetCurrentDateTime));
  sUser := QuotedStr(GetNetuser);

//  dmConexao.ConnBrkMaster.AppServer.StartTransaction;

  Try
    With dmConexao.cdsGeral do
     begin
       If rdgField.ItemIndex = 0 then
        begin
          CommandText := ' INSERT INTO OBJECTSXLANGUAGES ( OBJ_ID, LNG_ID, OBJLNG_DESC, OBJLNG_CAPTION,  '
                       + '                                 OBJLNG_HINT, OBJLNG_REGDATE, OBJLNG_REGUSER,  '
                       + '                                 OBJLNG_STATUS )                               '
                       + ' SELECT OBJ_ID, ' + IntToStr(dblkDestLanguage.KeyValue) + ', ' + QuotedStr(edTranslation.Text) + ', '
                       + '        NULL, NULL, ' + sDate + ', ' + sUser + ', OBJLNG_STATUS                '
                       + ' FROM   OBJECTSXLANGUAGES                                                      '
                       + ' WHERE  LNG_ID = ' + IntToStr(dblkSourceLanguage.KeyValue)
                       + ' AND    OBJLNG_DESC = ' + QuotedStr(cmbText.Text)
                       + ' AND    OBJ_ID NOT IN  ( SELECT OBJ_ID             '
                       + '                         FROM OBJECTSXLANGUAGES    '
                       + '                         WHERE LNG_ID = ' + IntToStr(dblkDestLanguage.KeyValue) + ')';
        end
       Else If rdgField.ItemIndex = 1 then
        begin
          CommandText := ' INSERT INTO OBJECTSXLANGUAGES ( OBJ_ID, LNG_ID, OBJLNG_DESC, OBJLNG_CAPTION,  '
                       + '                                 OBJLNG_HINT, OBJLNG_REGDATE, OBJLNG_REGUSER,  '
                       + '                                 OBJLNG_STATUS )                               '
                       + ' SELECT OBJ_ID, ' + IntToStr(dblkDestLanguage.KeyValue) + ', ''$$EMPTY$$'',    '
                       + QuotedStr(edTranslation.Text) + ', NULL, ' + sDate + ', ' + sUser + ', OBJLNG_STATUS                '
                       + ' FROM   OBJECTSXLANGUAGES                                                      '
                       + ' WHERE  LNG_ID = ' + IntToStr(dblkSourceLanguage.KeyValue)
                       + ' AND    OBJLNG_CAPTION = ' + QuotedStr(cmbText.Text)
                       + ' AND    OBJ_ID NOT IN  ( SELECT OBJ_ID             '
                       + '                         FROM OBJECTSXLANGUAGES    '
                       + '                         WHERE LNG_ID = ' + IntToStr(dblkDestLanguage.KeyValue) + ')';
        end
       Else If rdgField.ItemIndex = 2 then
        begin
          CommandText := ' INSERT INTO OBJECTSXLANGUAGES ( OBJ_ID, LNG_ID, OBJLNG_DESC, OBJLNG_CAPTION,  '
                       + '                                 OBJLNG_HINT, OBJLNG_REGDATE, OBJLNG_REGUSER,  '
                       + '                                 OBJLNG_STATUS )                               '
                       + ' SELECT OBJ_ID, ' + IntToStr(dblkDestLanguage.KeyValue) + ', ''$$EMPTY$$'',    '
                       + ' NULL, ' + QuotedStr(edTranslation.Text) + ', ' +  sDate + ', ' + sUser + ', OBJLNG_STATUS                '
                       + ' FROM   OBJECTSXLANGUAGES                                                      '
                       + ' WHERE  LNG_ID = ' + IntToStr(dblkSourceLanguage.KeyValue)
                       + ' AND    OBJLNG_HINT = ' + QuotedStr(cmbText.Text)
                       + ' AND    OBJ_ID NOT IN  ( SELECT OBJ_ID             '
                       + '                         FROM OBJECTSXLANGUAGES    '
                       + '                         WHERE LNG_ID = ' + IntToStr(dblkDestLanguage.KeyValue) + ')';
        end;
       Execute;

       If rdgField.ItemIndex = 0 then
        begin
          CommandText := ' UPDATE OBJECTSXLANGUAGES        '
                       + ' SET    OBJLNG_DESC  = ' + QuotedStr(edTranslation.Text)
                       + ' WHERE  LNG_ID       = ' + IntToStr(dblkDestLanguage.KeyValue)
                       + ' AND    OBJ_ID IN ( SELECT OBJ_ID                   '
                       + '                    FROM   OBJECTSXLANGUAGES        '
                       + '                    WHERE  LNG_ID  = ' + IntToStr(dblkSourceLanguage.KeyValue)
                       + '                    AND    OBJLNG_DESC  =  ' + QuotedStr(cmbText.Text) + ' )' ;
        end
       Else If rdgField.ItemIndex = 1 then
        begin
          CommandText := ' UPDATE OBJECTSXLANGUAGES        '
                       + ' SET    OBJLNG_CAPTION  = ' + QuotedStr(edTranslation.Text)
                       + ' WHERE  LNG_ID          = ' + IntToStr(dblkDestLanguage.KeyValue)
                       + ' AND    OBJ_ID IN ( SELECT OBJ_ID                   '
                       + '                    FROM   OBJECTSXLANGUAGES        '
                       + '                    WHERE  LNG_ID  = ' + IntToStr(dblkSourceLanguage.KeyValue)
                       + '                    AND    OBJLNG_CAPTION  =  ' + QuotedStr(cmbText.Text) + ' )' ;
        end
       Else If rdgField.ItemIndex = 2 then
        begin
          CommandText := ' UPDATE OBJECTSXLANGUAGES        '
                       + ' SET    OBJLNG_HINT  = ' + QuotedStr(edTranslation.Text)
                       + ' WHERE  LNG_ID       = ' + IntToStr(dblkDestLanguage.KeyValue)
                       + ' AND    OBJ_ID IN ( SELECT OBJ_ID                    '
                       + '                    FROM   OBJECTSXLANGUAGES         '
                       + '                    WHERE  LNG_ID  = ' + IntToStr(dblkSourceLanguage.KeyValue)
                       + '                    AND    OBJLNG_HINT  =  ' + QuotedStr(cmbText.Text) + ' )' ;
        end;
       Execute;  {}

     end;
  Except
//    dmConexao.ConnBrkMaster.AppServer.Rollback;
    DisplayMsg(t_form_objects, '%T', [3088], [], mtError);
  End;
//  dmConexao.ConnBrkMaster.AppServer.Commit;
  DisplayMsg(t_form_objects, '%T', [3087], [], mtInformation);


end;

procedure TFrmBatchTranslation.FormShow(Sender: TObject);
begin
  inherited;
  dmSys1.cdsLanguages.Open;
//  SetActions([actTranslate], False, FrmBatchTranslation, t_form_objects);
end;

procedure TFrmBatchTranslation.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  inherited;
  dmSys1.cdsLanguages.Close;
  FrmBatchTranslation := nil;
end;

procedure TFrmBatchTranslation.dblkSourceLanguageChange(Sender: TObject);
begin
  inherited;
  SetActions([actTranslate], ((dblkSourceLanguage.KeyValue > 0) and (dblkDestLanguage.KeyValue > 0) and (dblkDestLanguage.KeyValue <> dblkSourceLanguage.KeyValue) ), FrmBatchTranslation, t_form_objects);

  cmbText.Items.Clear;

  If dblkSourceLanguage.KeyValue > 0 then
   begin
     With dmConexao.cdsGeral do
      begin
        Close;
        If rdgField.ItemIndex = 0 then
         begin
           CommandText := ' SELECT DISTINCT OBJLNG_DESC AS TEXTO '
                        + ' FROM   OBJECTSXLANGUAGES                                  '
                        + ' WHERE  LNG_ID = ' + IntToStr(dblkSourceLanguage.KeyValue)
                        + ' ORDER BY TEXTO ';
         end
        Else If rdgField.ItemIndex = 1 then
         begin
           CommandText := ' SELECT DISTINCT OBJLNG_CAPTION AS TEXTO                   '
                        + ' FROM   OBJECTSXLANGUAGES                                  '
                        + ' WHERE  LNG_ID = ' + IntToStr(dblkSourceLanguage.KeyValue)
                        + ' ORDER BY TEXTO ';
         end
        Else If rdgField.ItemIndex = 2 then
         begin
           CommandText := ' SELECT DISTINCT OBJLNG_HINT AS TEXTO                      '
                        + ' FROM   OBJECTSXLANGUAGES                                  '
                        + ' WHERE  LNG_ID = ' + IntToStr(dblkSourceLanguage.KeyValue)
                        + ' ORDER BY TEXTO ';
         end;
         
        Open;
        First;
        While not Eof do
         begin
           cmbText.Items.Add(FieldByName('TEXTO').AsString);
           Next;
         end
      end;
   end;
end;

procedure TFrmBatchTranslation.dblkDestLanguageChange(Sender: TObject);
begin
  inherited;
  SetActions([actTranslate], ((dblkSourceLanguage.KeyValue > 0) and (dblkDestLanguage.KeyValue > 0) and (dblkDestLanguage.KeyValue <> dblkSourceLanguage.KeyValue) ), FrmBatchTranslation, t_form_objects);

end;

procedure TFrmBatchTranslation.rdgFieldClick(Sender: TObject);
begin
  inherited;
  dblkSourceLanguageChange(Self);
end;

end.
