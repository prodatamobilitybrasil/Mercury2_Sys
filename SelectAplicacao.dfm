object FormSelectAplicacao: TFormSelectAplicacao
  Left = 239
  Top = 111
  Width = 550
  Height = 471
  Caption = 'Sele'#231#227'o de Aplica'#231#227'o'
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  OnClose = FormClose
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object DBGrid: TDBGrid
    Left = 0
    Top = 65
    Width = 542
    Height = 334
    Align = alClient
    DataSource = DmSys.dtsAux
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgAlwaysShowSelection, dgConfirmDelete, dgCancelOnExit]
    ParentFont = False
    ParentShowHint = False
    ReadOnly = True
    ShowHint = True
    TabOrder = 0
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWhite
    TitleFont.Height = -11
    TitleFont.Name = 'MS Sans Serif'
    TitleFont.Style = []
    OnDblClick = DBGridDblClick
    Columns = <
      item
        Alignment = taCenter
        Expanded = False
        FieldName = 'APP_ID'
        Title.Alignment = taCenter
        Title.Caption = 'Aplica'#231#227'o'
        Width = 80
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'APP_DESCSHORT'
        Title.Caption = 'Nome'
        Width = 150
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'ISS_DESCLONG'
        Title.Caption = 'Emissor'
        Width = 300
        Visible = True
      end>
  end
  object Panel1: TPanel
    Left = 0
    Top = 399
    Width = 542
    Height = 41
    Align = alBottom
    TabOrder = 1
    object Panel2: TPanel
      Left = 356
      Top = 1
      Width = 185
      Height = 39
      Align = alRight
      TabOrder = 0
      object BitBtn1: TBitBtn
        Left = 8
        Top = 8
        Width = 75
        Height = 25
        TabOrder = 0
        Kind = bkOK
      end
      object BitBtn2: TBitBtn
        Left = 96
        Top = 8
        Width = 75
        Height = 25
        Caption = 'Cancelar'
        TabOrder = 1
        Kind = bkCancel
        Spacing = 2
      end
    end
  end
  object Panel3: TPanel
    Left = 0
    Top = 0
    Width = 542
    Height = 65
    Align = alTop
    TabOrder = 2
    object Label1: TLabel
      Left = 40
      Top = 12
      Width = 95
      Height = 16
      Caption = 'APP................'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clMaroon
      Font.Height = -13
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Label2: TLabel
      Left = 40
      Top = 41
      Width = 89
      Height = 16
      Caption = 'Nome........'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clMaroon
      Font.Height = -13
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object EditAPP: TEdit
      Left = 112
      Top = 8
      Width = 121
      Height = 21
      TabOrder = 0
      OnChange = EditChange
    end
    object EditDesc: TEdit
      Left = 112
      Top = 36
      Width = 121
      Height = 21
      CharCase = ecUpperCase
      TabOrder = 1
      OnChange = EditChange
    end
  end
end
