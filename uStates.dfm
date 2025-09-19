inherited frmStates: TfrmStates
  Tag = 117
  Caption = 'Estados'
  PixelsPerInch = 96
  TextHeight = 13
  inherited pcBaseCadastro: TPageControl
    OnChange = pcBaseCadastroChange
    inherited tsBaseCadastroFiltro: TTabSheet
      Tag = 0
      inherited gbGrid: TGroupBox
        inherited grdResultado: TDBGrid
          DataSource = dtsMaster
          Columns = <
            item
              Expanded = False
              FieldName = 'ST_CODE'
              Title.Caption = 'C'#243'digo'
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'ST_DESC'
              Title.Caption = 'Descri'#231#227'o'
              Width = 350
              Visible = True
            end>
        end
      end
      inherited pnFiltro: TPanel
        inherited pnPesq: TPanel
          inherited gbFiltro: TGroupBox
            object Label3: TLabel [0]
              Left = 44
              Top = 36
              Width = 51
              Height = 13
              Caption = 'Descri'#231#227'o:'
            end
            object edtPesqDesc: TEdit
              Left = 100
              Top = 32
              Width = 297
              Height = 21
              CharCase = ecUpperCase
              TabOrder = 1
            end
          end
        end
      end
    end
    inherited tsBaseCadastroConsulta: TTabSheet
      Tag = 0
      object Label1: TLabel
        Left = 24
        Top = 36
        Width = 36
        Height = 13
        Caption = 'C'#243'digo:'
      end
      object Label2: TLabel
        Left = 24
        Top = 64
        Width = 51
        Height = 13
        Caption = 'Descri'#231#227'o:'
      end
      object dbeST_CODE: TDBEdit
        Left = 80
        Top = 32
        Width = 45
        Height = 21
        CharCase = ecUpperCase
        DataField = 'ST_CODE'
        DataSource = dtsMaster
        TabOrder = 0
      end
      object dbeST_DESC: TDBEdit
        Left = 80
        Top = 60
        Width = 313
        Height = 21
        CharCase = ecUpperCase
        DataField = 'ST_DESC'
        DataSource = dtsMaster
        TabOrder = 1
      end
    end
  end
  inherited actlstBase: TActionList
    inherited actFilter: TAction
      OnExecute = actFilterExecute
    end
  end
  inherited dtsMaster: TDataSource
    DataSet = dmSys1.cdsStates
  end
end
