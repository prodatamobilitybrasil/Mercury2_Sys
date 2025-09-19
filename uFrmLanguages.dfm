inherited FrmLanguages: TFrmLanguages
  Tag = 30
  Left = 230
  Top = 189
  Width = 658
  Height = 456
  Caption = 'Idiomas'
  PixelsPerInch = 96
  TextHeight = 13
  inherited cbBase: TCoolBar
    Width = 650
    Bands = <
      item
        Control = tbBase
        ImageIndex = -1
        MinHeight = 24
        Width = 646
      end>
    inherited tbBase: TToolBar
      Width = 633
    end
  end
  inherited pcBaseCadastro: TPageControl
    Width = 650
    Height = 374
    OnChange = pcBaseCadastroChange
    inherited tsBaseCadastroFiltro: TTabSheet
      inherited Splitter_Base1: TSplitter
        Top = 79
        Width = 642
      end
      inherited gbGrid: TGroupBox
        Top = 83
        Width = 642
        Height = 263
        inherited grdResultado: TDBGrid
          Width = 638
          Height = 246
          DataSource = dtsMaster
          Columns = <
            item
              Expanded = False
              FieldName = 'LNG_DESC'
              Title.Caption = 'Descri'#231#227'o'
              Width = 240
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'LNG_REGDATE'
              Title.Caption = 'Registro'
              Width = 96
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'LNG_REGUSER'
              Title.Caption = 'Usu'#225'rio'
              Width = 175
              Visible = True
            end>
        end
      end
      inherited pnFiltro: TPanel
        Width = 642
        Height = 79
        inherited pnPesq: TPanel
          Width = 642
          Height = 79
          inherited gbfiltroavansado: TGroupBox
            Width = 638
            Height = 75
            inherited pnVoltar: TPanel
              Top = 60
              Width = 634
              inherited lblBack: TLabel
                Left = 607
              end
            end
          end
          inherited gbFiltro: TGroupBox
            Width = 638
            Height = 75
            object Label1: TLabel [0]
              Tag = 1917
              Left = 12
              Top = 16
              Width = 48
              Height = 13
              Caption = 'Descri'#231#227'o'
              FocusControl = edDesc
            end
            inherited pnPesquiza: TPanel
              Top = 60
              Width = 634
              inherited lblAdvancedSearch: TLabel
                Width = 634
              end
            end
            object edDesc: TEdit
              Left = 12
              Top = 32
              Width = 241
              Height = 21
              CharCase = ecUpperCase
              MaxLength = 50
              TabOrder = 1
            end
          end
        end
      end
    end
    inherited tsBaseCadastroConsulta: TTabSheet
      object Label2: TLabel
        Left = 16
        Top = 16
        Width = 48
        Height = 13
        Caption = 'Descri'#231#227'o'
        FocusControl = dbDesc
      end
      object dbDesc: TDBEdit
        Left = 16
        Top = 32
        Width = 245
        Height = 21
        CharCase = ecUpperCase
        DataField = 'LNG_DESC'
        DataSource = dtsMaster
        MaxLength = 50
        TabOrder = 0
      end
    end
  end
  inherited imglstBase: TImageList
    Left = 432
    Top = 20
  end
  inherited actlstBase: TActionList
    Left = 400
    Top = 20
    inherited actFilter: TAction
      OnExecute = actFilterExecute
    end
  end
  inherited dtsMaster: TDataSource
    DataSet = dmSys1.cdsLanguages
    Left = 369
    Top = 20
  end
  inherited mMnuBase: TMainMenu
    Left = 337
    Top = 20
  end
end
