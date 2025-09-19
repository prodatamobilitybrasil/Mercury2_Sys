inherited FrmPeriodUseTypes: TFrmPeriodUseTypes
  Tag = 103
  Left = 196
  Top = 221
  Caption = 'Tipos de Per'#237'odo'
  Constraints.MinHeight = 405
  Constraints.MinWidth = 684
  PixelsPerInch = 96
  TextHeight = 13
  inherited pcBaseCadastro: TPageControl
    ActivePage = tsBaseCadastroConsulta
    OnChange = pcBaseCadastroChange
    inherited tsBaseCadastroFiltro: TTabSheet
      inherited gbGrid: TGroupBox
        inherited grdResultado: TDBGrid
          DataSource = dtsMaster
          Columns = <
            item
              Expanded = False
              FieldName = 'PUT_ID'
              Title.Caption = 'ID'
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'PUT_DESC'
              Title.Caption = 'Descri'#231#227'o'
              Width = 259
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'STATUS_ID'
              Title.Caption = 'Status'
              Width = 99
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'PUT_REGDATE'
              Title.Caption = 'Data Registro'
              Width = 154
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'PUT_REGUSER'
              Title.Caption = 'Usu'#225'rio'
              Visible = True
            end>
        end
      end
      inherited pnFiltro: TPanel
        inherited pnPesq: TPanel
          inherited gbFiltro: TGroupBox
            object Label7: TLabel [0]
              Tag = 3217
              Left = 13
              Top = 28
              Width = 48
              Height = 13
              Caption = 'Descri'#231#227'o'
              FocusControl = edDesc
            end
            object lStatus: TLabel [1]
              Tag = 1046
              Left = 362
              Top = 28
              Width = 30
              Height = 13
              Caption = 'Status'
              FocusControl = lkFilterStatus
            end
            object edDesc: TEdit
              Left = 13
              Top = 43
              Width = 300
              Height = 21
              CharCase = ecUpperCase
              MaxLength = 50
              TabOrder = 1
            end
            object lkFilterStatus: TComboBox
              Left = 362
              Top = 43
              Width = 113
              Height = 21
              Style = csDropDownList
              ItemHeight = 13
              ItemIndex = 0
              TabOrder = 2
              Text = 'Ativo'
              Items.Strings = (
                'Ativo'
                'Inativo')
            end
          end
        end
      end
    end
    inherited tsBaseCadastroConsulta: TTabSheet
      object gbPeriodUseTypes: TGroupBox
        Left = 0
        Top = 0
        Width = 668
        Height = 129
        Align = alTop
        TabOrder = 0
        object lbDesc: TLabel
          Tag = 3217
          Left = 13
          Top = 28
          Width = 48
          Height = 13
          Caption = 'Descri'#231#227'o'
          FocusControl = dbDesc
        end
        object lblStatusCardUsers: TLabel
          Tag = 1046
          Left = 362
          Top = 28
          Width = 30
          Height = 13
          Caption = 'Status'
          FocusControl = dbStatus
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -12
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentFont = False
        end
        object dbDesc: TDBEdit
          Left = 13
          Top = 43
          Width = 312
          Height = 21
          CharCase = ecUpperCase
          DataField = 'PUT_DESC'
          DataSource = dtsMaster
          TabOrder = 0
        end
        object dbStatus: TRxDBComboBox
          Left = 362
          Top = 43
          Width = 143
          Height = 21
          Style = csDropDownList
          DataField = 'PUT_STATUS'
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
  end
  inherited actlstBase: TActionList
    Left = 556
    inherited actFilter: TAction
      OnExecute = actFilterExecute
    end
    inherited actLog: TAction
      Enabled = False
    end
  end
end
