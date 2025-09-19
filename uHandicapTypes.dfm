inherited FrmHandicapTypes: TFrmHandicapTypes
  Tag = 35
  Left = 242
  Top = 115
  Width = 673
  Height = 430
  Caption = 'Tipos de Defici'#234'ncia'
  PixelsPerInch = 96
  TextHeight = 13
  inherited cbBase: TCoolBar
    Width = 665
    Bands = <
      item
        Control = tbBase
        ImageIndex = -1
        MinHeight = 24
        Width = 661
      end>
    inherited tbBase: TToolBar
      Width = 648
      object lbFiltrado: TLabel
        Left = 354
        Top = 2
        Width = 99
        Height = 22
        Cursor = crHandPoint
        Hint = 'Limpa FILTRO'
        Align = alLeft
        Caption = ' FILTRADO'
        Color = clBtnFace
        Font.Charset = ANSI_CHARSET
        Font.Color = clRed
        Font.Height = -19
        Font.Name = 'Courier New'
        Font.Style = [fsBold]
        ParentColor = False
        ParentFont = False
        Visible = False
      end
    end
  end
  inherited pcBaseCadastro: TPageControl
    Width = 665
    Height = 351
    inherited tsBaseCadastroFiltro: TTabSheet
      inherited Splitter_Base1: TSplitter
        Top = 109
        Width = 657
        Color = clBlack
        ParentColor = False
      end
      inherited gbGrid: TGroupBox
        Top = 113
        Width = 657
        Height = 210
        inherited grdResultado: TDBGrid
          Width = 653
          Height = 193
          DataSource = dtsMaster
          Columns = <
            item
              Expanded = False
              FieldName = 'HT_NAME'
              Title.Caption = 'Nome'
              Width = 216
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'HT_DESC'
              Title.Caption = 'Descri'#231#227'o'
              Width = 376
              Visible = True
            end>
        end
      end
      inherited pnFiltro: TPanel
        Width = 657
        Height = 109
        inherited pnPesq: TPanel
          Width = 657
          Height = 109
          inherited gbFiltroAvansado: TGroupBox
            Width = 653
            Height = 105
            inherited pnVoltar: TPanel
              Top = 90
              Width = 649
              inherited lblBack: TLabel
                Left = 622
              end
            end
          end
          inherited gbFiltro: TGroupBox
            Width = 653
            Height = 105
            object Label3: TLabel [0]
              Left = 12
              Top = 12
              Width = 37
              Height = 13
              Caption = 'Nome:'
              FocusControl = edName
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'MS Sans Serif'
              Font.Style = [fsBold]
              ParentFont = False
            end
            object Label4: TLabel [1]
              Left = 12
              Top = 56
              Width = 62
              Height = 13
              Caption = 'Descri'#231#227'o:'
              FocusControl = edDesc
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'MS Sans Serif'
              Font.Style = [fsBold]
              ParentFont = False
            end
            inherited pnPesquiza: TPanel
              Top = 90
              Width = 649
              inherited lblAdvancedSearch: TLabel
                Width = 649
                Visible = False
              end
            end
            object edName: TEdit
              Left = 12
              Top = 28
              Width = 194
              Height = 21
              CharCase = ecUpperCase
              MaxLength = 20
              TabOrder = 1
              OnEnter = Entra
              OnExit = Sai
            end
            object edDesc: TEdit
              Left = 12
              Top = 72
              Width = 472
              Height = 21
              CharCase = ecUpperCase
              MaxLength = 50
              TabOrder = 2
              OnEnter = Entra
              OnExit = Sai
            end
          end
        end
      end
    end
    inherited tsBaseCadastroConsulta: TTabSheet
      object Label1: TLabel
        Left = 12
        Top = 12
        Width = 28
        Height = 13
        Caption = 'Nome'
        FocusControl = dbName
      end
      object Label2: TLabel
        Left = 12
        Top = 59
        Width = 48
        Height = 13
        Caption = 'Descri'#231#227'o'
        FocusControl = dbDesc
      end
      object Label5: TLabel
        Left = 12
        Top = 111
        Width = 97
        Height = 13
        Caption = 'C'#243'digo Internacional'
      end
      object Label6: TLabel
        Left = 260
        Top = 111
        Width = 41
        Height = 13
        Caption = 'Validade'
      end
      object Label7: TLabel
        Left = 12
        Top = 159
        Width = 63
        Height = 13
        Caption = 'Observa'#231#245'es'
      end
      object dbName: TDBEdit
        Left = 12
        Top = 28
        Width = 193
        Height = 21
        CharCase = ecUpperCase
        DataField = 'HT_NAME'
        DataSource = dtsMaster
        MaxLength = 20
        TabOrder = 0
      end
      object dbDesc: TDBEdit
        Left = 12
        Top = 75
        Width = 625
        Height = 21
        CharCase = ecUpperCase
        DataField = 'HT_DESC'
        DataSource = dtsMaster
        MaxLength = 50
        TabOrder = 1
      end
      object DBINTCODE: TDBEdit
        Left = 12
        Top = 127
        Width = 233
        Height = 21
        CharCase = ecUpperCase
        DataField = 'HT_INTCODE'
        DataSource = dtsMaster
        MaxLength = 20
        TabOrder = 2
      end
      object DBVALIDITY: TDBEdit
        Left = 260
        Top = 127
        Width = 77
        Height = 21
        CharCase = ecUpperCase
        DataField = 'HT_VALIDITY'
        DataSource = dtsMaster
        MaxLength = 3
        TabOrder = 3
      end
      object DBOBS: TDBMemo
        Left = 12
        Top = 175
        Width = 625
        Height = 73
        DataField = 'HT_OBS'
        DataSource = dtsMaster
        MaxLength = 100
        TabOrder = 4
      end
      object CHKPERMITATTENDANT: TCheckBox
        Left = 352
        Top = 128
        Width = 141
        Height = 17
        Caption = 'Permite Acompanhante?'
        TabOrder = 5
      end
      object CHKAUTHORIZED: TCheckBox
        Left = 500
        Top = 128
        Width = 141
        Height = 17
        Caption = 'Autoriza Gratuidade?'
        TabOrder = 6
      end
    end
  end
  object Panel1: TPanel [2]
    Left = 350
    Top = 30
    Width = 138
    Height = 17
    TabOrder = 2
    object lblContador: TRxLabel
      Left = 1
      Top = 1
      Width = 136
      Height = 15
      Align = alClient
      Alignment = taCenter
      Caption = '1.123.123 registro(s)'
      Color = clMoneyGreen
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentColor = False
      ParentFont = False
      ShadowSize = 0
    end
  end
  inherited imglstBase: TImageList
    Left = 120
    Top = 232
  end
  inherited actlstBase: TActionList
    Left = 88
    Top = 232
    inherited actFilter: TAction
      OnExecute = actFilterExecute
    end
  end
  inherited dtsMaster: TDataSource
    DataSet = DmSys.cdsHandicapTypes
    Left = 57
    Top = 232
  end
  inherited mMnuBase: TMainMenu
    Left = 25
    Top = 232
  end
end
