inherited frmStudentTypes: TfrmStudentTypes
  Tag = 125
  Left = 278
  Top = 200
  VertScrollBar.Range = 0
  BorderIcons = [biSystemMenu]
  BorderStyle = bsSingle
  Caption = 'Tipos de Estudantes'
  PixelsPerInch = 96
  TextHeight = 13
  inherited pcBaseCadastro: TPageControl
    ActivePage = tsBaseCadastroConsulta
    OnChange = pcBaseCadastroChange
    inherited tsBaseCadastroFiltro: TTabSheet
      Tag = 0
      inherited gbGrid: TGroupBox
        inherited grdResultado: TDBGrid
          DataSource = dtsMaster
          Columns = <
            item
              Expanded = False
              FieldName = 'STUTP_ID'
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'STUTP_DESC'
              Width = 300
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'STUTP_STATUS'
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'STUTP_REGDATE'
              Width = 120
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'STUTP_REGUSER'
              Width = 300
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
      object dbeSTUTP_DESC: TDBEdit
        Left = 88
        Top = 48
        Width = 361
        Height = 21
        CharCase = ecUpperCase
        DataField = 'STUTP_DESC'
        DataSource = dtsMaster
        TabOrder = 0
      end
      object dbcSTUTP_STATUS: TRxDBComboBox
        Left = 512
        Top = 48
        Width = 145
        Height = 21
        Style = csDropDownList
        DataField = 'STUTP_STATUS'
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
    DataSet = DmSys.cdsStudentTypes
  end
end
