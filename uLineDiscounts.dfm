inherited FrmLineDiscounts: TFrmLineDiscounts
  Tag = 39
  Left = 241
  Top = 191
  Width = 672
  Height = 431
  Caption = 'Descontos'
  PixelsPerInch = 96
  TextHeight = 13
  inherited cbBase: TCoolBar
    Width = 664
    Bands = <
      item
        Control = tbBase
        ImageIndex = -1
        MinHeight = 24
        Width = 660
      end>
    inherited tbBase: TToolBar
      Width = 647
    end
  end
  inherited pcBaseCadastro: TPageControl
    Width = 664
    Height = 352
    ActivePage = tsBaseCadastroConsulta
    OnChange = pcBaseCadastroChange
    inherited tsBaseCadastroFiltro: TTabSheet
      inherited Splitter_Base1: TSplitter
        Width = 656
      end
      inherited gbGrid: TGroupBox
        Width = 656
        Height = 192
        inherited grdResultado: TDBGrid
          Width = 652
          Height = 175
          DataSource = dtsMaster
          Columns = <
            item
              Expanded = False
              Title.Caption = 'Linha'
              Visible = False
            end
            item
              Expanded = False
              FieldName = 'DT_DESC'
              Title.Caption = 'Tipo de Desconto'
              Width = 140
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'LDI_DATESTART'
              Title.Caption = 'Data Inicial'
              Width = 95
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'LDI_DATEEND'
              Title.Caption = 'Data Final'
              Width = 95
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'LDI_TIMESTART'
              Title.Caption = 'Hora In'#237'cio'
              Width = 60
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'LDI_TIMEEND'
              Title.Caption = 'Hora Final'
              Width = 60
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'LDI_VALUE'
              Title.Caption = 'Valor'
              Width = 90
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'STATUS_ID'
              Title.Caption = 'Status'
              Width = 100
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'LDI_REGDATE'
              Title.Caption = 'Registro'
              Width = 120
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'LDI_REGUSER'
              Title.Caption = 'Usu'#225'rio'
              Width = 130
              Visible = True
            end>
        end
      end
      inherited pnFiltro: TPanel
        Width = 656
        inherited pnPesq: TPanel
          Width = 656
          inherited gbfiltroavansado: TGroupBox
            Width = 652
            inherited pnVoltar: TPanel
              Width = 648
              inherited lblBack: TLabel
                Left = 621
              end
            end
          end
          inherited gbFiltro: TGroupBox
            Width = 652
            object Label5: TLabel [0]
              Left = 19
              Top = 20
              Width = 85
              Height = 13
              Caption = 'Tipo de Desconto'
              FocusControl = edDiscountTypes
            end
            object lStatus: TLabel [1]
              Tag = 2099
              Left = 24
              Top = 68
              Width = 30
              Height = 13
              Caption = 'Status'
              FocusControl = lkFilterStatus
            end
            object Label13: TLabel [2]
              Tag = 2094
              Left = 292
              Top = 19
              Width = 53
              Height = 13
              Caption = 'Data Inicial'
              FocusControl = edDtInicial
            end
            object Label14: TLabel [3]
              Tag = 2095
              Left = 436
              Top = 19
              Width = 48
              Height = 13
              Caption = 'Data Final'
              FocusControl = edDtFinal
            end
            inherited pnPesquiza: TPanel
              Width = 648
              TabOrder = 4
              inherited lblAdvancedSearch: TLabel
                Width = 648
              end
            end
            object edDiscountTypes: TRxDBLookupCombo
              Left = 19
              Top = 37
              Width = 238
              Height = 20
              DropDownCount = 8
              LookupField = 'DT_ID'
              LookupDisplay = 'DT_DESC'
              LookupSource = DmSys.dtsDiscountTypes
              TabOrder = 0
            end
            object lkFilterStatus: TComboBox
              Left = 23
              Top = 85
              Width = 138
              Height = 21
              ItemHeight = 13
              TabOrder = 1
              Items.Strings = (
                'Ativo'
                'Inativo')
            end
            object edDtInicial: TDateEdit
              Left = 292
              Top = 36
              Width = 104
              Height = 19
              ButtonWidth = 17
              NumGlyphs = 2
              TabOrder = 2
            end
            object edDtFinal: TDateEdit
              Left = 436
              Top = 36
              Width = 105
              Height = 19
              ButtonWidth = 17
              NumGlyphs = 2
              TabOrder = 3
            end
          end
        end
      end
    end
    inherited tsBaseCadastroConsulta: TTabSheet
      object gbDescontos: TGroupBox
        Left = 0
        Top = 0
        Width = 656
        Height = 324
        Align = alClient
        TabOrder = 0
        object Label2: TLabel
          Left = 25
          Top = 28
          Width = 85
          Height = 13
          Caption = 'Tipo de Desconto'
          FocusControl = dblkDiscountTypes
        end
        object Label7: TLabel
          Left = 332
          Top = 28
          Width = 24
          Height = 13
          Caption = 'Valor'
          FocusControl = dbValue
        end
        object Label8: TLabel
          Tag = 2099
          Left = 508
          Top = 28
          Width = 30
          Height = 13
          Caption = 'Status'
          FocusControl = dbCardUsersStatus
        end
        object Label3: TLabel
          Left = 25
          Top = 88
          Width = 53
          Height = 13
          Caption = 'Data Inicial'
          FocusControl = dbDataI
        end
        object Label9: TLabel
          Tag = 2096
          Left = 164
          Top = 88
          Width = 53
          Height = 13
          Caption = 'Hora Inicial'
          FocusControl = edHHini
        end
        object Label10: TLabel
          Left = 185
          Top = 106
          Width = 5
          Height = 16
          Caption = ':'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -15
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object Label4: TLabel
          Tag = 2095
          Left = 331
          Top = 88
          Width = 48
          Height = 13
          Caption = 'Data Final'
          FocusControl = dbDataF
        end
        object Label11: TLabel
          Tag = 2097
          Left = 469
          Top = 88
          Width = 48
          Height = 13
          Caption = 'Hora Final'
          FocusControl = edHHFim
        end
        object Label12: TLabel
          Left = 490
          Top = 106
          Width = 5
          Height = 16
          Caption = ':'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -15
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object dblkDiscountTypes: TRxDBLookupCombo
          Left = 25
          Top = 45
          Width = 288
          Height = 20
          DropDownCount = 8
          DataField = 'DT_ID'
          DataSource = dtsMaster
          LookupField = 'DT_ID'
          LookupDisplay = 'DT_DESC'
          LookupSource = DmSys.dtsDiscountTypes
          TabOrder = 0
        end
        object dbCardUsersStatus: TRxDBComboBox
          Left = 508
          Top = 45
          Width = 125
          Height = 21
          Style = csDropDownList
          DataField = 'LDI_STATUS'
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
        object edHHini: TCurrencyEdit
          Left = 164
          Top = 106
          Width = 20
          Height = 18
          AutoSize = False
          Ctl3D = True
          DecimalPlaces = 0
          DisplayFormat = '00'
          FormatOnEditing = True
          MaxValue = 23.000000000000000000
          ParentCtl3D = False
          TabOrder = 4
          OnChange = edHHiniChange
        end
        object edHMIni: TCurrencyEdit
          Left = 191
          Top = 106
          Width = 20
          Height = 18
          AutoSize = False
          Ctl3D = True
          DecimalPlaces = 0
          DisplayFormat = '00'
          MaxValue = 59.000000000000000000
          ParentCtl3D = False
          TabOrder = 5
          OnChange = edHMIniChange
        end
        object edHMFim: TCurrencyEdit
          Left = 495
          Top = 106
          Width = 21
          Height = 18
          AutoSize = False
          Ctl3D = True
          DecimalPlaces = 0
          DisplayFormat = '00'
          MaxValue = 59.000000000000000000
          ParentCtl3D = False
          TabOrder = 8
          OnChange = edHMFimChange
        end
        object edHHFim: TCurrencyEdit
          Left = 469
          Top = 106
          Width = 20
          Height = 18
          AutoSize = False
          Ctl3D = True
          DecimalPlaces = 0
          DisplayFormat = '00'
          MaxValue = 23.000000000000000000
          ParentCtl3D = False
          TabOrder = 7
          OnChange = edHHFimChange
        end
        object dbDataI: TDBDateEdit
          Left = 24
          Top = 104
          Width = 121
          Height = 21
          DataField = 'LDI_DATESTART'
          DataSource = dtsMaster
          NumGlyphs = 2
          TabOrder = 3
        end
        object dbDataF: TDBDateEdit
          Left = 332
          Top = 104
          Width = 119
          Height = 21
          DataField = 'LDI_DATEEND'
          DataSource = dtsMaster
          NumGlyphs = 2
          TabOrder = 6
        end
        object dbValue: TRxDBCalcEdit
          Left = 332
          Top = 45
          Width = 125
          Height = 21
          DataField = 'LDI_VALUE'
          DataSource = dtsMaster
          DefaultParams = True
          DisplayFormat = ',##0.00'
          ButtonWidth = -1
          NumGlyphs = 2
          TabOrder = 1
        end
      end
    end
  end
  inherited actlstBase: TActionList
    inherited actFilter: TAction
      OnExecute = actFilterExecute
    end
  end
end
