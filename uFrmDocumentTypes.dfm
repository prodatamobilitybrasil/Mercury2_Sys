inherited FrmDocumentTypes: TFrmDocumentTypes
  Tag = 89
  Left = 133
  Top = 341
  Width = 1022
  Height = 738
  Caption = 'Tipos de Documentos'
  PixelsPerInch = 96
  TextHeight = 13
  inherited cbBase: TCoolBar
    Width = 1014
    Bands = <
      item
        Control = tbBase
        ImageIndex = -1
        MinHeight = 24
        Width = 1010
      end>
    inherited tbBase: TToolBar
      Width = 997
    end
  end
  inherited pcBaseCadastro: TPageControl
    Width = 1014
    Height = 656
    inherited tsBaseCadastroFiltro: TTabSheet
      inherited Splitter_Base1: TSplitter
        Width = 1006
      end
      inherited gbGrid: TGroupBox
        Width = 1006
        Height = 496
        inherited grdResultado: TDBGrid
          Width = 1002
          Height = 479
          DataSource = dtsMaster
          Columns = <
            item
              Expanded = False
              FieldName = 'DT_DESC'
              Title.Caption = 'Descri'#231#227'o'
              Width = 150
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'DT_MASK'
              Title.Caption = 'M'#225'scara'
              Width = 150
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'DT_PRINTPRIORITY'
              Title.Caption = 'Prioridade'
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'DUPALLOWED_ID'
              Title.Caption = 'Duplica'#231#227'o'
              Width = 110
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'DUPACTION_ID'
              Title.Caption = 'A'#231#227'o'
              Width = 150
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'STATUS_ID'
              Title.Caption = 'Status'
              Width = 80
              Visible = True
            end>
        end
      end
      inherited pnFiltro: TPanel
        Width = 1006
        inherited pnPesq: TPanel
          Width = 1006
          inherited gbfiltroavansado: TGroupBox
            Width = 1002
            inherited pnVoltar: TPanel
              Width = 998
              inherited lblBack: TLabel
                Left = 971
              end
            end
          end
          inherited gbFiltro: TGroupBox
            Width = 1002
            object Label1: TLabel [0]
              Tag = 3132
              Left = 13
              Top = 21
              Width = 48
              Height = 13
              Caption = 'Descri'#231#227'o'
              FocusControl = edDesc
            end
            object Label2: TLabel [1]
              Tag = 3133
              Left = 269
              Top = 21
              Width = 41
              Height = 13
              Caption = 'M'#225'scara'
              FocusControl = edMask
            end
            object Label3: TLabel [2]
              Tag = 3134
              Left = 469
              Top = 21
              Width = 47
              Height = 13
              Caption = 'Prioridade'
              FocusControl = edPrintPriority
            end
            object Label4: TLabel [3]
              Tag = 3136
              Left = 15
              Top = 71
              Width = 25
              Height = 13
              Caption = 'A'#231#227'o'
              FocusControl = cmbAction
            end
            object LStatus: TLabel [4]
              Tag = 3138
              Left = 190
              Top = 70
              Width = 36
              Height = 13
              Caption = 'LStatus'
            end
            inherited pnPesquiza: TPanel
              Width = 998
              inherited lblAdvancedSearch: TLabel
                Width = 998
              end
            end
            object edDesc: TEdit
              Left = 13
              Top = 37
              Width = 249
              Height = 21
              CharCase = ecUpperCase
              TabOrder = 1
            end
            object edMask: TEdit
              Left = 269
              Top = 37
              Width = 188
              Height = 21
              CharCase = ecUpperCase
              TabOrder = 2
            end
            object edPrintPriority: TEdit
              Left = 469
              Top = 37
              Width = 68
              Height = 21
              CharCase = ecUpperCase
              TabOrder = 3
            end
            object cmbAction: TComboBox
              Left = 15
              Top = 85
              Width = 165
              Height = 21
              Style = csDropDownList
              CharCase = ecUpperCase
              ItemHeight = 13
              Sorted = True
              TabOrder = 4
              Items.Strings = (
                ''
                'AVISO'
                'ERRO'
                'NENHUMA A'#199#195'O')
            end
            object cmbStatus: TComboBox
              Left = 188
              Top = 85
              Width = 145
              Height = 21
              Style = csDropDownList
              CharCase = ecUpperCase
              ItemHeight = 13
              Sorted = True
              TabOrder = 5
              Items.Strings = (
                ''
                'ATIVO'
                'INATIVO')
            end
          end
        end
      end
    end
    inherited tsBaseCadastroConsulta: TTabSheet
      object Label5: TLabel
        Left = 13
        Top = 21
        Width = 48
        Height = 13
        Caption = 'Descri'#231#227'o'
        FocusControl = dbDTDesc
      end
      object Label6: TLabel
        Left = 272
        Top = 21
        Width = 41
        Height = 13
        Caption = 'M'#225'scara'
        FocusControl = dbDTMask
      end
      object Label7: TLabel
        Left = 472
        Top = 21
        Width = 47
        Height = 13
        Caption = 'Prioridade'
        FocusControl = dbDTPrintPriority
      end
      object Label8: TLabel
        Tag = 3136
        Left = 159
        Top = 71
        Width = 25
        Height = 13
        Caption = 'A'#231#227'o'
      end
      object Label9: TLabel
        Tag = 3138
        Left = 334
        Top = 70
        Width = 36
        Height = 13
        Caption = 'LStatus'
        FocusControl = cbStatus
      end
      object dbDTDesc: TDBEdit
        Left = 13
        Top = 37
        Width = 249
        Height = 21
        CharCase = ecUpperCase
        DataField = 'DT_DESC'
        DataSource = dtsMaster
        TabOrder = 0
      end
      object dbDTMask: TDBEdit
        Left = 272
        Top = 37
        Width = 188
        Height = 21
        CharCase = ecUpperCase
        DataField = 'DT_MASK'
        DataSource = dtsMaster
        TabOrder = 1
      end
      object dbDTPrintPriority: TDBEdit
        Left = 472
        Top = 37
        Width = 68
        Height = 21
        CharCase = ecUpperCase
        DataField = 'DT_PRINTPRIORITY'
        DataSource = dtsMaster
        TabOrder = 2
      end
      object chDBDupAllowed: TDBCheckBox
        Left = 16
        Top = 87
        Width = 121
        Height = 17
        Caption = 'Permitir Duplica'#231#227'o?'
        DataField = 'DT_DUPALLOWED'
        DataSource = dtsMaster
        TabOrder = 3
        ValueChecked = 'Y'
        ValueUnchecked = 'N'
      end
      object cbDupAction: TRxDBComboBox
        Tag = 2055
        Left = 156
        Top = 85
        Width = 165
        Height = 21
        Style = csDropDownList
        DataField = 'DT_DUPACTION'
        DataSource = dtsMaster
        EnableValues = True
        ItemHeight = 13
        Items.Strings = (
          'Aviso'
          'Erro'
          'Nenhuma A'#231#227'o')
        TabOrder = 4
        Values.Strings = (
          'W'
          'E'
          'N')
      end
      object cbStatus: TRxDBComboBox
        Tag = 2055
        Left = 332
        Top = 85
        Width = 133
        Height = 21
        Style = csDropDownList
        DataField = 'DT_STATUS'
        DataSource = dtsMaster
        EnableValues = True
        ItemHeight = 13
        Items.Strings = (
          'Ativo'
          'Inativo')
        TabOrder = 5
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
