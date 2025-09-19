inherited FrmDataTypes: TFrmDataTypes
  Tag = 29
  Left = 215
  Top = 176
  Width = 612
  Height = 419
  Caption = 'Tipos de Dados'
  PixelsPerInch = 96
  TextHeight = 13
  inherited cbBase: TCoolBar
    Width = 604
    Bands = <
      item
        Control = tbBase
        ImageIndex = -1
        MinHeight = 24
        Width = 600
      end>
    inherited tbBase: TToolBar
      Width = 587
    end
  end
  inherited pcBaseCadastro: TPageControl
    Width = 604
    Height = 337
    OnChange = pcBaseCadastroChange
    inherited tsBaseCadastroFiltro: TTabSheet
      inherited Splitter_Base1: TSplitter
        Top = 79
        Width = 596
      end
      inherited gbGrid: TGroupBox
        Top = 83
        Width = 596
        Height = 226
        inherited grdResultado: TDBGrid
          Width = 592
          Height = 209
          DataSource = dtsMaster
          Columns = <
            item
              Expanded = False
              FieldName = 'DT_DESC'
              Title.Caption = 'Descri'#231#227'o'
              Width = 258
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'DT_REGDATE'
              Title.Caption = 'Registro'
              Width = 78
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'DT_REGUSER'
              Title.Caption = 'Usu'#225'rio'
              Width = 124
              Visible = True
            end>
        end
      end
      inherited pnFiltro: TPanel
        Width = 596
        Height = 79
        inherited pnPesq: TPanel
          Width = 596
          Height = 79
          inherited gbfiltroavansado: TGroupBox
            Width = 592
            Height = 75
            inherited pnVoltar: TPanel
              Top = 60
              Width = 588
              inherited lblBack: TLabel
                Left = 561
              end
            end
          end
          inherited gbFiltro: TGroupBox
            Width = 592
            Height = 75
            object Label1: TLabel [0]
              Tag = 1911
              Left = 12
              Top = 12
              Width = 48
              Height = 13
              Caption = 'Descri'#231#227'o'
              FocusControl = edDtDesc
            end
            inherited pnPesquiza: TPanel
              Top = 60
              Width = 588
              inherited lblAdvancedSearch: TLabel
                Width = 588
              end
            end
            object edDtDesc: TEdit
              Left = 12
              Top = 28
              Width = 249
              Height = 21
              CharCase = ecUpperCase
              MaxLength = 30
              TabOrder = 1
            end
          end
        end
      end
    end
    inherited tsBaseCadastroConsulta: TTabSheet
      object Label2: TLabel
        Left = 12
        Top = 12
        Width = 48
        Height = 13
        Caption = 'Descri'#231#227'o'
        FocusControl = dbDesc
      end
      object dbDesc: TDBEdit
        Left = 12
        Top = 28
        Width = 293
        Height = 21
        CharCase = ecUpperCase
        DataField = 'DT_DESC'
        DataSource = dtsMaster
        MaxLength = 30
        TabOrder = 0
      end
    end
  end
  inherited imglstBase: TImageList
    Left = 388
    Top = 28
  end
  inherited actlstBase: TActionList
    Left = 356
    Top = 28
    inherited actFilter: TAction
      OnExecute = actFilterExecute
    end
  end
  inherited dtsMaster: TDataSource
    DataSet = dmSys1.cdsDataTypes
    Left = 325
    Top = 28
  end
  inherited mMnuBase: TMainMenu
    Left = 293
    Top = 28
  end
end
