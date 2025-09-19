inherited FrmTelephoneTypes: TFrmTelephoneTypes
  Tag = 88
  Left = 282
  Top = 222
  Caption = 'Tipos de Telefones'
  PixelsPerInch = 96
  TextHeight = 13
  inherited pcBaseCadastro: TPageControl
    ActivePage = tsBaseCadastroConsulta
    inherited tsBaseCadastroFiltro: TTabSheet
      inherited gbGrid: TGroupBox
        inherited grdResultado: TDBGrid
          DataSource = dmSys1.dtsTelephoneTypes
          Columns = <
            item
              Expanded = False
              FieldName = 'TT_ID'
              Title.Caption = 'ID'
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'TT_DESC'
              Title.Caption = 'Tipo de Telefone'
              Width = 160
              Visible = True
            end>
        end
      end
      inherited pnFiltro: TPanel
        inherited pnPesq: TPanel
          inherited gbFiltro: TGroupBox
            object Label1: TLabel [0]
              Tag = 3131
              Left = 14
              Top = 21
              Width = 81
              Height = 13
              Caption = 'Tipo de Telefone'
              FocusControl = edTTDesc
            end
            object edTTDesc: TEdit
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
        Left = 14
        Top = 22
        Width = 81
        Height = 13
        Caption = 'Tipo de Telefone'
        FocusControl = dbTTDesc
      end
      object dbTTDesc: TDBEdit
        Left = 13
        Top = 37
        Width = 249
        Height = 21
        CharCase = ecUpperCase
        DataField = 'TT_DESC'
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
    DataSet = dmSys1.cdsTelephoneTypes
  end
end
