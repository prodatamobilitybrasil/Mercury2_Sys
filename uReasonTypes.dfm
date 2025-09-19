inherited frmReasonTypes: TfrmReasonTypes
  Tag = 120
  Caption = 'Tipos de Raz'#245'es'
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
              FieldName = 'RT_ID'
              Title.Caption = 'C'#243'digo'
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'RT_DESC'
              Title.Caption = 'Descri'#231#227'o'
              Width = 250
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'RT_STATUS'
              Title.Caption = 'Status'
              Width = 70
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'RT_REGDATE'
              Title.Caption = 'Data Registro'
              Width = 100
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'RT_REGUSER'
              Title.Caption = 'Usu'#225'rio'
              Width = 160
              Visible = True
            end>
        end
      end
      inherited pnFiltro: TPanel
        inherited pnPesq: TPanel
          inherited gbFiltro: TGroupBox
            object Label3: TLabel [0]
              Left = 16
              Top = 28
              Width = 48
              Height = 13
              Caption = 'Descri'#231#227'o'
            end
            object Label4: TLabel [1]
              Left = 500
              Top = 28
              Width = 30
              Height = 13
              Caption = 'Status'
            end
            object edtPesqDesc: TEdit
              Left = 16
              Top = 44
              Width = 453
              Height = 21
              CharCase = ecUpperCase
              TabOrder = 1
            end
            object cbxProcura: TComboBox
              Left = 500
              Top = 44
              Width = 145
              Height = 21
              Style = csDropDownList
              ItemHeight = 13
              ItemIndex = 2
              TabOrder = 2
              Text = 'Todos'
              Items.Strings = (
                'Ativo'
                'Inativo'
                'Todos')
            end
          end
        end
      end
    end
    inherited tsBaseCadastroConsulta: TTabSheet
      Tag = 0
      object Label1: TLabel
        Left = 32
        Top = 52
        Width = 51
        Height = 13
        Caption = 'Descri'#231#227'o:'
      end
      object Label2: TLabel
        Left = 472
        Top = 52
        Width = 33
        Height = 13
        Caption = 'Status:'
      end
      object dbeRT_DESC: TDBEdit
        Left = 88
        Top = 48
        Width = 361
        Height = 21
        CharCase = ecUpperCase
        DataField = 'RT_DESC'
        DataSource = dtsMaster
        TabOrder = 0
      end
      object dbcRT_STATUS: TRxDBComboBox
        Left = 512
        Top = 48
        Width = 145
        Height = 21
        Style = csDropDownList
        DataField = 'RT_STATUS'
        DataSource = dtsMaster
        EnableValues = True
        ItemHeight = 13
        Items.Strings = (
          'Ativo'
          'Inativo')
        TabOrder = 1
        Values.Strings = (
          'A'
          'I')
      end
    end
  end
  inherited actlstBase: TActionList
    inherited actFilter: TAction
      OnExecute = actFilterExecute
    end
  end
  inherited dtsMaster: TDataSource
    DataSet = dmSys1.cdsReasonTypes
  end
end
