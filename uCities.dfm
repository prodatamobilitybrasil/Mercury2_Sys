inherited frmCities: TfrmCities
  Tag = 119
  Caption = 'Cidades'
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
              FieldName = 'CIT_ID'
              Title.Caption = 'C'#243'digo'
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'CIT_DESC'
              Title.Caption = 'Descri'#231#227'o'
              Width = 400
              Visible = True
            end>
        end
      end
      inherited pnFiltro: TPanel
        inherited pnPesq: TPanel
          inherited gbFiltro: TGroupBox
            object Label6: TLabel [0]
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
        Left = 32
        Top = 24
        Width = 36
        Height = 13
        Caption = 'Estado:'
      end
      object Label2: TLabel
        Left = 32
        Top = 56
        Width = 36
        Height = 13
        Caption = 'C'#243'digo:'
      end
      object Label3: TLabel
        Left = 32
        Top = 88
        Width = 51
        Height = 13
        Caption = 'Descri'#231#227'o:'
      end
      object Label4: TLabel
        Left = 32
        Top = 120
        Width = 37
        Height = 13
        Caption = 'Regi'#227'o:'
      end
      object Label5: TLabel
        Left = 32
        Top = 152
        Width = 59
        Height = 13
        Caption = 'Sub-Regi'#227'o:'
      end
      object dbcST_CODE: TDBLookupComboBox
        Left = 108
        Top = 20
        Width = 141
        Height = 21
        DataField = 'ST_CODE'
        DataSource = dtsMaster
        KeyField = 'ST_CODE'
        ListField = 'ST_DESC'
        ListSource = dmSys1.dtsStatesLKP
        TabOrder = 0
      end
      object dbeCIT_ID: TDBEdit
        Left = 108
        Top = 52
        Width = 77
        Height = 21
        CharCase = ecUpperCase
        DataField = 'CIT_ID'
        DataSource = dtsMaster
        TabOrder = 1
      end
      object dbeCIT_DESC: TDBEdit
        Left = 108
        Top = 84
        Width = 317
        Height = 21
        CharCase = ecUpperCase
        DataField = 'CIT_DESC'
        DataSource = dtsMaster
        TabOrder = 2
      end
      object dbcREG_ID: TDBLookupComboBox
        Left = 108
        Top = 116
        Width = 229
        Height = 21
        DataField = 'REG_ID'
        DataSource = dtsMaster
        KeyField = 'REG_ID'
        ListField = 'REG_DESC'
        ListSource = dmSys1.dtsRegionLKP
        TabOrder = 3
      end
      object dbcSUBREG_ID: TDBLookupComboBox
        Left = 108
        Top = 148
        Width = 229
        Height = 21
        DataField = 'SUBREG_ID'
        DataSource = dtsMaster
        KeyField = 'SUBREG_ID'
        ListField = 'SUBREG_DESC'
        ListSource = dmSys1.dtsSubRegionLKP
        TabOrder = 4
      end
    end
  end
  inherited actlstBase: TActionList
    inherited actFilter: TAction
      OnExecute = actFilterExecute
    end
  end
  inherited dtsMaster: TDataSource
    DataSet = dmSys1.cdsCities
  end
end
