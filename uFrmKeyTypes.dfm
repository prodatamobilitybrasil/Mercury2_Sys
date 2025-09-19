inherited FrmKeyTypes: TFrmKeyTypes
  Tag = 67
  Left = 237
  Top = 191
  Width = 661
  Height = 457
  Caption = 'Tipos de Chaves'
  PixelsPerInch = 96
  TextHeight = 13
  inherited cbBase: TCoolBar
    Width = 653
    Bands = <
      item
        Control = tbBase
        ImageIndex = -1
        MinHeight = 24
        Width = 649
      end>
    inherited tbBase: TToolBar
      Width = 636
    end
  end
  inherited pcBaseCadastro: TPageControl
    Width = 653
    Height = 383
    OnChange = pcBaseCadastroChange
    inherited tsBaseCadastroFiltro: TTabSheet
      inherited Splitter_Base1: TSplitter
        Width = 645
      end
      inherited gbGrid: TGroupBox
        Width = 645
        Height = 223
        inherited grdResultado: TDBGrid
          Width = 641
          Height = 206
          DataSource = dtsMaster
          Columns = <
            item
              Expanded = False
              FieldName = 'KT_CODE'
              Title.Caption = 'Sigla'
              Width = 120
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'KT_DESC'
              Title.Caption = 'Descri'#231#227'o'
              Width = 200
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'KT_REGDATE'
              Title.Caption = 'Registro'
              Width = 100
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'KT_REGUSER'
              Title.Caption = 'Usu'#225'rio'
              Width = 200
              Visible = True
            end>
        end
      end
      inherited pnFiltro: TPanel
        Width = 645
        inherited pnPesq: TPanel
          Width = 645
          inherited gbfiltroavansado: TGroupBox
            Width = 641
            inherited pnVoltar: TPanel
              Width = 637
              inherited lblBack: TLabel
                Left = 610
              end
            end
          end
          inherited gbFiltro: TGroupBox
            Width = 641
            object Label1: TLabel [0]
              Tag = 2694
              Left = 16
              Top = 12
              Width = 23
              Height = 13
              Caption = 'Sigla'
              FocusControl = edCode
            end
            object Label2: TLabel [1]
              Tag = 2695
              Left = 16
              Top = 56
              Width = 48
              Height = 13
              Caption = 'Descri'#231#227'o'
              FocusControl = edDesc
            end
            inherited pnPesquiza: TPanel
              Width = 637
              inherited lblAdvancedSearch: TLabel
                Width = 637
              end
            end
            object edCode: TEdit
              Left = 16
              Top = 28
              Width = 160
              Height = 21
              CharCase = ecUpperCase
              MaxLength = 20
              TabOrder = 1
            end
            object edDesc: TEdit
              Left = 16
              Top = 72
              Width = 274
              Height = 21
              CharCase = ecUpperCase
              MaxLength = 30
              TabOrder = 2
            end
          end
        end
      end
    end
    inherited tsBaseCadastroConsulta: TTabSheet
      object GroupBox1: TGroupBox
        Left = 0
        Top = 0
        Width = 645
        Height = 109
        Align = alTop
        TabOrder = 0
        object Label3: TLabel
          Left = 16
          Top = 12
          Width = 23
          Height = 13
          Caption = 'Sigla'
          FocusControl = dbCode
        end
        object Label4: TLabel
          Left = 16
          Top = 56
          Width = 48
          Height = 13
          Caption = 'Descri'#231#227'o'
          FocusControl = dbDesc
        end
        object Label5: TLabel
          Tag = 3095
          Left = 318
          Top = 56
          Width = 24
          Height = 13
          Caption = 'Valor'
          FocusControl = dbDesc
        end
        object dbCode: TDBEdit
          Left = 16
          Top = 28
          Width = 160
          Height = 21
          CharCase = ecUpperCase
          DataField = 'KT_CODE'
          DataSource = dtsMaster
          MaxLength = 20
          TabOrder = 0
        end
        object dbDesc: TDBEdit
          Left = 16
          Top = 72
          Width = 274
          Height = 21
          CharCase = ecUpperCase
          DataField = 'KT_DESC'
          DataSource = dtsMaster
          MaxLength = 50
          TabOrder = 1
        end
        object dbeEodCode: TDBEdit
          Left = 318
          Top = 72
          Width = 274
          Height = 21
          CharCase = ecUpperCase
          DataField = 'KT_EODCODE'
          DataSource = dtsMaster
          MaxLength = 50
          TabOrder = 2
        end
      end
    end
  end
  inherited imglstBase: TImageList
    Left = 480
    Top = 4
  end
  inherited actlstBase: TActionList
    Left = 448
    Top = 4
    inherited actFilter: TAction
      OnExecute = actFilterExecute
    end
  end
  inherited dtsMaster: TDataSource
    DataSet = DmSys.cdsKeyTypes
    Left = 417
    Top = 4
  end
  inherited mMnuBase: TMainMenu
    Left = 385
    Top = 4
  end
end
