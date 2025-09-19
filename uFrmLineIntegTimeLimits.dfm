inherited frmLineIntegTimeLimits: TfrmLineIntegTimeLimits
  Tag = 128
  Left = 321
  Top = 168
  Caption = 'Limites de Tempo de Integra'#231#227'o'
  PixelsPerInch = 96
  TextHeight = 13
  inherited pcBaseCadastro: TPageControl
    inherited tsBaseCadastroFiltro: TTabSheet
      inherited gbGrid: TGroupBox
        inherited grdResultado: TDBGrid
          DataSource = dtsMaster
          Columns = <
            item
              Expanded = False
              FieldName = 'LIT_ID'
              Visible = False
            end
            item
              Expanded = False
              FieldName = 'LIT_DESC'
              Title.Caption = 'DESCRI'#199#195'O'
              Width = 250
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'LIT_BINID'
              Title.Caption = 'BIN ID'
              Width = 123
              Visible = True
            end
            item
              Alignment = taCenter
              Expanded = False
              FieldName = 'LIT_STATUS'
              Title.Caption = 'STATUS'
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'LIT_REGDATE'
              Visible = False
            end
            item
              Expanded = False
              FieldName = 'LIT_REGUSER'
              Visible = False
            end>
        end
      end
      inherited pnFiltro: TPanel
        inherited pnPesq: TPanel
          inherited gbFiltro: TGroupBox
            object lblFilterDescricao: TLabel [0]
              Left = 16
              Top = 28
              Width = 48
              Height = 13
              Caption = 'Descri'#231#227'o'
            end
            object lblFilterBinId: TLabel [1]
              Left = 304
              Top = 28
              Width = 29
              Height = 13
              Caption = 'Bin ID'
            end
            object lblFilterStatus: TLabel [2]
              Left = 432
              Top = 28
              Width = 30
              Height = 13
              Caption = 'Status'
            end
            object edtFilterDescricao: TEdit
              Left = 16
              Top = 44
              Width = 273
              Height = 21
              TabOrder = 1
            end
            object cboFilterStatus: TComboBox
              Left = 432
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
            object edtFilterBinId: TEdit
              Left = 304
              Top = 44
              Width = 92
              Height = 21
              ReadOnly = True
              TabOrder = 3
              Text = '0'
            end
            object udFilterBinId: TUpDown
              Left = 397
              Top = 41
              Width = 17
              Height = 25
              TabOrder = 4
              OnClick = UpDownClick
            end
          end
        end
      end
    end
    inherited tsBaseCadastroConsulta: TTabSheet
      object lblDescricao: TLabel
        Left = 17
        Top = 30
        Width = 48
        Height = 13
        Caption = 'Descri'#231#227'o'
        FocusControl = edtDescricao
      end
      object lblBinId: TLabel
        Left = 305
        Top = 30
        Width = 29
        Height = 13
        Caption = 'Bin ID'
        FocusControl = edtBinId
      end
      object lblStatus: TLabel
        Left = 434
        Top = 30
        Width = 30
        Height = 13
        Caption = 'Status'
        FocusControl = cboStatus
      end
      object edtDescricao: TDBEdit
        Left = 17
        Top = 46
        Width = 274
        Height = 21
        DataField = 'LIT_DESC'
        DataSource = dtsMaster
        TabOrder = 0
      end
      object edtBinId: TDBEdit
        Left = 305
        Top = 46
        Width = 93
        Height = 21
        DataField = 'LIT_BINID'
        DataSource = dtsMaster
        ReadOnly = True
        TabOrder = 1
      end
      object cboStatus: TRxDBComboBox
        Left = 434
        Top = 46
        Width = 145
        Height = 21
        Style = csDropDownList
        DataField = 'LIT_STATUS'
        DataSource = dtsMaster
        EnableValues = True
        ItemHeight = 13
        Items.Strings = (
          'Ativo'
          'Inativo')
        TabOrder = 2
        Values.Strings = (
          'A'
          'I')
      end
      object udBinId: TUpDown
        Left = 398
        Top = 43
        Width = 17
        Height = 25
        TabOrder = 3
        OnClick = UpDownClick
      end
    end
  end
  inherited actlstBase: TActionList
    inherited actFilter: TAction
      OnExecute = actFilterExecute
    end
  end
end
