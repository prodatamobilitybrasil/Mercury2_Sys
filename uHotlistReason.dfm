inherited FrmHotlistReason: TFrmHotlistReason
  Tag = 37
  Left = 240
  Top = 211
  Caption = 'Motivos de Lista Negra'
  Constraints.MinHeight = 405
  Constraints.MinWidth = 684
  WindowState = wsNormal
  PixelsPerInch = 96
  TextHeight = 13
  inherited pcBaseCadastro: TPageControl
    OnChange = pcBaseCadastroChange
    inherited tsBaseCadastroFiltro: TTabSheet
      inherited gbGrid: TGroupBox
        inherited grdResultado: TDBGrid
          DataSource = dtsMaster
          Columns = <
            item
              Expanded = False
              FieldName = 'HLR_DESC'
              Title.Caption = 'Descri'#231#227'o'
              Width = 306
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'TYPE_DESC'
              Title.Caption = 'Tipo'
              Width = 74
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'ACTION_DESC'
              Title.Caption = 'A'#231#227'o'
              Width = 78
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'HLR_REGDATE'
              Title.Caption = 'Registro'
              Width = 71
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'HLR_REGUSER'
              Title.Caption = 'Usu'#225'rio'
              Width = 199
              Visible = True
            end>
        end
      end
      inherited pnFiltro: TPanel
        inherited pnPesq: TPanel
          inherited gbFiltro: TGroupBox
            object Label4: TLabel [0]
              Tag = 2065
              Left = 16
              Top = 20
              Width = 48
              Height = 13
              Caption = 'Descri'#231#227'o'
              FocusControl = edDesc
            end
            object edDesc: TEdit
              Left = 16
              Top = 36
              Width = 237
              Height = 21
              CharCase = ecUpperCase
              MaxLength = 30
              TabOrder = 1
            end
          end
        end
      end
    end
    inherited tsBaseCadastroConsulta: TTabSheet
      object Label1: TLabel
        Left = 16
        Top = 16
        Width = 48
        Height = 13
        Caption = 'Descri'#231#227'o'
        FocusControl = dbDesc
      end
      object Label2: TLabel
        Tag = 2066
        Left = 16
        Top = 64
        Width = 21
        Height = 13
        Caption = 'Tipo'
        FocusControl = dbType
      end
      object Label3: TLabel
        Tag = 2067
        Left = 184
        Top = 64
        Width = 25
        Height = 13
        Caption = 'A'#231#227'o'
        FocusControl = dbAction
      end
      object dbDesc: TDBEdit
        Left = 16
        Top = 32
        Width = 213
        Height = 21
        CharCase = ecUpperCase
        DataField = 'HLR_DESC'
        DataSource = dtsMaster
        MaxLength = 30
        TabOrder = 0
      end
      object dbType: TRxDBComboBox
        Left = 16
        Top = 80
        Width = 145
        Height = 21
        Style = csDropDownList
        DataField = 'HLR_TYPE'
        DataSource = dtsMaster
        EnableValues = True
        ItemHeight = 13
        Items.Strings = (
          'Aplica'#231#227'o'
          #218'nico'
          'Intervalo'
          'Todos')
        TabOrder = 1
        Values.Strings = (
          'A'
          'S'
          'R'
          'E')
      end
      object dbAction: TRxDBComboBox
        Left = 184
        Top = 80
        Width = 145
        Height = 21
        Style = csDropDownList
        DataField = 'HLR_ACTION'
        DataSource = dtsMaster
        EnableValues = True
        ItemHeight = 13
        Items.Strings = (
          'Cancelar'
          'Bloquear')
        TabOrder = 2
        Values.Strings = (
          '1'
          '2')
      end
    end
  end
  inherited actlstBase: TActionList
    inherited actFilter: TAction
      OnExecute = actFilterExecute
    end
  end
  inherited dtsMaster: TDataSource
    DataSet = DmSys.cdsHotListReason
  end
end
