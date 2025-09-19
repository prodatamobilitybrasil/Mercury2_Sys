object FrmLinha_Integracao: TFrmLinha_Integracao
  Tag = 42
  Left = 161
  Top = 160
  BorderStyle = bsSingle
  Caption = 'Linha / Integra'#231#227'o'
  ClientHeight = 398
  ClientWidth = 785
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  Position = poDesktopCenter
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 785
    Height = 74
    Align = alTop
    BevelInner = bvLowered
    TabOrder = 0
    object Label1: TLabel
      Tag = 2139
      Left = 16
      Top = 16
      Width = 88
      Height = 13
      Caption = 'Linha / Integra'#231#227'o'
    end
    object edLine: TEdit
      Left = 16
      Top = 32
      Width = 361
      Height = 21
      CharCase = ecUpperCase
      TabOrder = 0
      OnChange = edLineChange
    end
    object btnOK: TBitBtn
      Left = 584
      Top = 24
      Width = 89
      Height = 31
      Action = actConfirmar
      Caption = 'actConfirmar'
      TabOrder = 1
      Kind = bkOK
    end
    object BitBtn3: TBitBtn
      Left = 688
      Top = 24
      Width = 89
      Height = 31
      Action = actCancelar
      Caption = 'actCancelar'
      TabOrder = 2
      Kind = bkCancel
    end
  end
  object dbgLinesIntegration: TDBGrid
    Left = 0
    Top = 74
    Width = 785
    Height = 324
    Align = alClient
    DataSource = DmSys.dtsLineMT
    TabOrder = 1
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'MS Sans Serif'
    TitleFont.Style = []
    Visible = False
    Columns = <
      item
        Expanded = False
        FieldName = 'LM_DESC'
        Title.Caption = 'Linha'
        Width = 246
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'LM_VIADESC'
        Title.Caption = 'Percurso'
        Width = 400
        Visible = True
      end>
  end
  object dbgIntegration: TDBGrid
    Left = 0
    Top = 74
    Width = 785
    Height = 324
    Align = alClient
    DataSource = dmSys1.dtsLineIntegrationCons
    TabOrder = 2
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'MS Sans Serif'
    TitleFont.Style = []
    Visible = False
    Columns = <
      item
        Expanded = False
        FieldName = 'LI_ID'
        Title.Caption = 'Integra'#231#227'o'
        Width = 75
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'LI_ORIG_TYPE'
        Title.Caption = 'Tipo'
        Width = 83
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'LINHAORIGEM'
        Title.Caption = 'Linha / Integra'#231#227'o'
        Width = 170
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'LDR_DESC'
        Title.Caption = 'Sentido'
        Width = 70
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'LINHADESTINO'
        Title.Caption = 'Linha'
        Width = 150
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'LDR_DESC_DEST'
        Title.Caption = 'Sentido'
        Width = 70
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'LI_INTEG_VALUE'
        Title.Caption = 'Valor'
        Width = 65
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'LI_INTEG_TIME'
        Title.Caption = 'Tempo'
        Width = 60
        Visible = True
      end>
  end
  object ActionList1: TActionList
    Left = 504
    Top = 24
    object actConfirmar: TAction
      Tag = 2800
      Caption = 'actConfirmar'
      OnExecute = actConfirmarExecute
    end
    object actCancelar: TAction
      Tag = 2142
      Caption = 'actCancelar'
      OnExecute = actCancelarExecute
    end
  end
end
