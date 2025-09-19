inherited FrmRemotePrinters: TFrmRemotePrinters
  Tag = 90
  Left = 56
  Top = 247
  Caption = 'Impressora Remota'
  PixelsPerInch = 96
  TextHeight = 13
  inherited pcBaseCadastro: TPageControl
    ActivePage = tsBaseCadastroConsulta
    inherited tsBaseCadastroFiltro: TTabSheet
      inherited gbGrid: TGroupBox
        inherited grdResultado: TDBGrid
          DataSource = dtsMaster
          Columns = <
            item
              Expanded = False
              FieldName = 'RP_DescShort'
              Title.Caption = 'Abrevia'#231#227'o'
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'RP_DescLong'
              Title.Caption = 'Tipo de Impressora'
              Width = 150
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'STATUS_ID'
              Title.Caption = 'LStatus'
              Width = 80
              Visible = True
            end>
        end
      end
      inherited pnFiltro: TPanel
        inherited pnPesq: TPanel
          inherited gbFiltro: TGroupBox
            object Label1: TLabel [0]
              Tag = 3144
              Left = 15
              Top = 21
              Width = 60
              Height = 13
              Caption = 'LAbrevia'#231#227'o'
            end
            object Label2: TLabel [1]
              Tag = 3143
              Left = 105
              Top = 21
              Width = 90
              Height = 13
              Caption = 'LTipodeImpressora'
            end
            object Label3: TLabel [2]
              Left = 368
              Top = 24
              Width = 3
              Height = 13
            end
            object edtRPDescShort: TEdit
              Left = 13
              Top = 37
              Width = 68
              Height = 21
              CharCase = ecUpperCase
              TabOrder = 1
            end
            object edtRPDescLong: TEdit
              Left = 104
              Top = 37
              Width = 249
              Height = 21
              CharCase = ecUpperCase
              TabOrder = 2
            end
          end
        end
      end
    end
    inherited tsBaseCadastroConsulta: TTabSheet
      object Label4: TLabel
        Left = 15
        Top = 21
        Width = 60
        Height = 13
        Caption = 'LAbrevia'#231#227'o'
        FocusControl = dbRPDescShort
      end
      object Label5: TLabel
        Left = 105
        Top = 21
        Width = 90
        Height = 13
        Caption = 'LTipodeImpressora'
        FocusControl = dbRPDescLong
      end
      object LStatus: TLabel
        Tag = 3145
        Left = 368
        Top = 21
        Width = 36
        Height = 13
        Caption = 'LStatus'
        FocusControl = cmbStatus
      end
      object dbRPDescShort: TDBEdit
        Left = 13
        Top = 37
        Width = 68
        Height = 21
        CharCase = ecUpperCase
        DataField = 'RP_DescShort'
        DataSource = dtsMaster
        TabOrder = 0
      end
      object dbRPDescLong: TDBEdit
        Left = 104
        Top = 37
        Width = 249
        Height = 21
        CharCase = ecUpperCase
        DataField = 'RP_DescLong'
        DataSource = dtsMaster
        TabOrder = 1
      end
      object cmbStatus: TRxDBComboBox
        Left = 367
        Top = 36
        Width = 145
        Height = 21
        Style = csDropDownList
        DataField = 'RP_Status'
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
    end
  end
  inherited actlstBase: TActionList
    inherited actFilter: TAction
      OnExecute = actFilterExecute
    end
  end
end
