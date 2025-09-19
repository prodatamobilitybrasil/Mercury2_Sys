inherited FrmEmailTypes: TFrmEmailTypes
  Tag = 87
  Left = 263
  Top = 204
  Caption = 'Tipos de Email'
  PixelsPerInch = 96
  TextHeight = 13
  inherited pcBaseCadastro: TPageControl
    inherited tsBaseCadastroFiltro: TTabSheet
      inherited gbGrid: TGroupBox
        inherited grdResultado: TDBGrid
          DataSource = dmSys1.dtsEmailTypes
          Columns = <
            item
              Expanded = False
              FieldName = 'EMT_ID'
              Title.Caption = 'ID'
              Width = 106
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'EMT_DESC'
              Title.Caption = 'Tipo de Email'
              Width = 384
              Visible = True
            end>
        end
      end
      inherited pnFiltro: TPanel
        inherited pnPesq: TPanel
          inherited gbFiltro: TGroupBox
            object Label1: TLabel [0]
              Tag = 3128
              Left = 14
              Top = 22
              Width = 64
              Height = 13
              Caption = 'Tipo de Email'
              FocusControl = edEmtDesc
            end
            object edEmtDesc: TEdit
              Left = 13
              Top = 37
              Width = 249
              Height = 21
              CharCase = ecUpperCase
              TabOrder = 1
            end
          end
        end
      end
    end
    inherited tsBaseCadastroConsulta: TTabSheet
      object Label2: TLabel
        Left = 15
        Top = 22
        Width = 64
        Height = 13
        Caption = 'Tipo de Email'
        FocusControl = dbEmtDesc
      end
      object dbEmtDesc: TDBEdit
        Left = 13
        Top = 37
        Width = 249
        Height = 21
        CharCase = ecUpperCase
        DataField = 'EMT_DESC'
        DataSource = dtsMaster
        TabOrder = 0
      end
    end
  end
  inherited actlstBase: TActionList
    inherited actFilter: TAction
      OnExecute = actFilterExecute
    end
  end
  inherited dtsMaster: TDataSource
    DataSet = dmSys1.cdsEmailTypes
  end
end
