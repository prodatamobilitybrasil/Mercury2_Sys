inherited FrmObjectTypes: TFrmObjectTypes
  Tag = 80
  Left = 246
  Top = 190
  Width = 530
  Caption = 'Tipos de Objetos'
  PixelsPerInch = 96
  TextHeight = 13
  inherited cbBase: TCoolBar
    Width = 522
    Bands = <
      item
        Control = tbBase
        ImageIndex = -1
        MinHeight = 24
        Width = 518
      end>
    inherited tbBase: TToolBar
      Width = 505
    end
  end
  inherited pcBaseCadastro: TPageControl
    Width = 522
    OnChange = pcBaseCadastroChange
    inherited tsBaseCadastroFiltro: TTabSheet
      inherited Splitter_Base1: TSplitter
        Top = 75
        Width = 514
      end
      inherited gbGrid: TGroupBox
        Top = 79
        Width = 514
        Height = 216
        inherited grdResultado: TDBGrid
          Width = 510
          Height = 199
          DataSource = dtsMaster
          Columns = <
            item
              Expanded = False
              FieldName = 'OT_DESC'
              Width = 224
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'OT_REGDATE'
              Width = 115
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'OT_REGUSER'
              Width = 132
              Visible = True
            end>
        end
      end
      inherited pnFiltro: TPanel
        Width = 514
        Height = 75
        inherited pnPesq: TPanel
          Width = 514
          Height = 75
          inherited gbfiltroavansado: TGroupBox
            Width = 510
            Height = 71
            inherited pnVoltar: TPanel
              Top = 56
              Width = 506
              inherited lblBack: TLabel
                Left = 479
              end
            end
          end
          inherited gbFiltro: TGroupBox
            Width = 510
            Height = 71
            object Label1: TLabel [0]
              Tag = 3077
              Left = 8
              Top = 16
              Width = 50
              Height = 13
              Caption = 'OT_DESC'
              FocusControl = edDesc
            end
            inherited pnPesquiza: TPanel
              Top = 56
              Width = 506
              inherited lblAdvancedSearch: TLabel
                Width = 506
              end
            end
            object edDesc: TEdit
              Left = 8
              Top = 32
              Width = 232
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
      object GroupBox1: TGroupBox
        Left = 0
        Top = 0
        Width = 514
        Height = 73
        Align = alTop
        TabOrder = 0
        object Label2: TLabel
          Left = 12
          Top = 16
          Width = 50
          Height = 13
          Caption = 'OT_DESC'
          FocusControl = dbDesc
        end
        object dbDesc: TDBEdit
          Left = 12
          Top = 32
          Width = 232
          Height = 21
          CharCase = ecUpperCase
          DataField = 'OT_DESC'
          DataSource = dtsMaster
          MaxLength = 30
          TabOrder = 0
        end
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
    DataSet = dmSys1.cdsObjectTypes
    Left = 369
    Top = 20
  end
  inherited mMnuBase: TMainMenu
    Left = 421
    Top = 0
  end
end
