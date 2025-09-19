inherited frmRegion: TfrmRegion
  Tag = 118
  Caption = 'Regi'#245'es'
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
              Visible = True
            end
            item
              Expanded = False
              Width = 200
              Visible = True
            end
            item
              Expanded = False
              Visible = True
            end
            item
              Expanded = False
              Width = 120
              Visible = True
            end
            item
              Expanded = False
              Width = 100
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
        Left = 68
        Top = 40
        Width = 36
        Height = 13
        Caption = 'C'#243'digo:'
      end
      object Label2: TLabel
        Left = 68
        Top = 68
        Width = 51
        Height = 13
        Caption = 'Descri'#231#227'o:'
      end
      object dbeREG_ID: TDBEdit
        Left = 124
        Top = 36
        Width = 69
        Height = 21
        CharCase = ecUpperCase
        DataSource = dtsMaster
        MaxLength = 5
        TabOrder = 0
      end
      object dbeREG_DESC: TDBEdit
        Left = 124
        Top = 64
        Width = 405
        Height = 21
        CharCase = ecUpperCase
        DataSource = dtsMaster
        MaxLength = 50
        TabOrder = 1
      end
    end
  end
  inherited actlstBase: TActionList
    inherited actFilter: TAction
      OnExecute = actFilterExecute
    end
  end
end
