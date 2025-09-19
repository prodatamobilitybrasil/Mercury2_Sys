inherited FrmExportLocations: TFrmExportLocations
  Tag = 25
  Left = 564
  Top = 219
  Width = 709
  Height = 438
  Caption = 'Locais de Exporta'#231#227'o'
  PixelsPerInch = 96
  TextHeight = 13
  inherited cbBase: TCoolBar
    Width = 693
    Bands = <
      item
        Control = tbBase
        ImageIndex = -1
        MinHeight = 24
        Width = 689
      end>
    inherited tbBase: TToolBar
      Width = 676
    end
  end
  inherited pcBaseCadastro: TPageControl
    Width = 693
    Height = 352
    ActivePage = tsBaseCadastroConsulta
    OnChange = pcBaseCadastroChange
    inherited tsBaseCadastroFiltro: TTabSheet
      inherited Splitter_Base1: TSplitter
        Top = 117
        Width = 685
      end
      inherited gbGrid: TGroupBox
        Top = 121
        Width = 685
        Height = 203
        inherited grdResultado: TDBGrid
          Width = 681
          Height = 186
          DataSource = dtsMaster
          Columns = <
            item
              Expanded = False
              FieldName = 'EL_CODE'
              Title.Caption = 'LC'#243'digo'
              Width = 200
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'DP_DESC'
              Title.Caption = 'LGaragem'
              Visible = False
            end
            item
              Expanded = False
              FieldName = 'TP_DESC'
              Title.Caption = 'LEmpresa'
              Visible = False
            end
            item
              Expanded = False
              FieldName = 'EL_PHONENBR'
              Title.Caption = 'LTelefone'
              Width = 120
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'EL_PATH'
              Title.Caption = 'LCaminho'
              Width = 450
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'STATUS_ID'
              Title.Caption = 'LStatus'
              Width = 100
              Visible = True
            end>
        end
      end
      inherited pnFiltro: TPanel
        Width = 685
        Height = 117
        inherited pnPesq: TPanel
          Width = 685
          Height = 117
          inherited gbfiltroavansado: TGroupBox
            Width = 681
            Height = 113
            inherited pnVoltar: TPanel
              Top = 98
              Width = 677
              inherited lblBack: TLabel
                Left = 650
              end
            end
          end
          inherited gbFiltro: TGroupBox
            Width = 681
            Height = 113
            object Label8: TLabel [0]
              Tag = 3161
              Left = 16
              Top = 39
              Width = 39
              Height = 13
              Caption = 'LC'#243'digo'
            end
            object Label9: TLabel [1]
              Left = 776
              Top = 15
              Width = 43
              Height = 13
              Caption = 'Garagem'
              Visible = False
            end
            object Label10: TLabel [2]
              Left = 776
              Top = 63
              Width = 41
              Height = 13
              Caption = 'Empresa'
              Visible = False
            end
            object lStatus: TLabel [3]
              Tag = 3166
              Left = 210
              Top = 41
              Width = 36
              Height = 13
              Caption = 'LStatus'
            end
            inherited pnPesquiza: TPanel
              Top = 98
              Width = 677
              TabOrder = 2
              inherited lblAdvancedSearch: TLabel
                Width = 677
              end
            end
            object rdbGaragemF: TRxDBLookupCombo
              Left = 776
              Top = 32
              Width = 225
              Height = 21
              DropDownCount = 8
              LookupField = 'DP_ID'
              LookupDisplay = 'DP_DESC'
              LookupSource = dmSys1.dtsDepots
              TabOrder = 3
              Visible = False
            end
            object rdbEmpresaF: TRxDBLookupCombo
              Left = 776
              Top = 80
              Width = 233
              Height = 21
              DropDownCount = 8
              LookupField = 'TP_ID'
              LookupDisplay = 'TP_DESC'
              LookupSource = DmSys.dtsTransportProviders
              TabOrder = 4
              Visible = False
            end
            object cbCodigoF: TComboBox
              Left = 16
              Top = 56
              Width = 185
              Height = 21
              ItemHeight = 13
              TabOrder = 0
              OnKeyPress = cbCodigoFKeyPress
              Items.Strings = (
                'EODBUS'
                'CARDFUNC'
                'HOTLIST'
                'CRT'
                'LINBUS')
            end
            object lkFilterStatus: TComboBox
              Left = 210
              Top = 57
              Width = 135
              Height = 21
              ItemHeight = 13
              TabOrder = 1
              Items.Strings = (
                'Ativo'
                'Inativo')
            end
          end
        end
      end
    end
    inherited tsBaseCadastroConsulta: TTabSheet
      object GroupBox1: TGroupBox
        Left = 0
        Top = 0
        Width = 685
        Height = 209
        Align = alTop
        TabOrder = 0
        object Label3: TLabel
          Left = 736
          Top = 55
          Width = 41
          Height = 13
          Caption = 'Empresa'
          Visible = False
        end
        object Label2: TLabel
          Left = 736
          Top = 15
          Width = 43
          Height = 13
          Caption = 'Garagem'
          Visible = False
        end
        object Label1: TLabel
          Tag = 3161
          Left = 16
          Top = 23
          Width = 39
          Height = 13
          Caption = 'LC'#243'digo'
        end
        object Label4: TLabel
          Left = 16
          Top = 64
          Width = 48
          Height = 13
          Caption = 'LTelefone'
          FocusControl = dbPhone
        end
        object Label5: TLabel
          Left = 16
          Top = 111
          Width = 47
          Height = 13
          Caption = 'LCaminho'
          FocusControl = dbPath
        end
        object Label12: TLabel
          Tag = 3167
          Left = 310
          Top = 64
          Width = 36
          Height = 13
          Caption = 'LStatus'
          FocusControl = dbCardUsersStatus
        end
        object Label6: TLabel
          Left = 16
          Top = 160
          Width = 32
          Height = 13
          Caption = 'LLogin'
          FocusControl = dbLogon
        end
        object Label7: TLabel
          Left = 310
          Top = 160
          Width = 37
          Height = 13
          Caption = 'LSenha'
          FocusControl = dbPass
        end
        object dbEmpresa: TRxDBLookupCombo
          Left = 736
          Top = 72
          Width = 233
          Height = 21
          DropDownCount = 8
          LookupField = 'TP_ID'
          LookupDisplay = 'TP_DESC'
          LookupSource = dmSys1.dtsDepotsXTransportProviders
          TabOrder = 6
          Visible = False
          OnCloseUp = dbEmpresaCloseUp
        end
        object dbGaragem: TRxDBLookupCombo
          Left = 736
          Top = 32
          Width = 225
          Height = 21
          DropDownCount = 8
          LookupField = 'DP_ID'
          LookupDisplay = 'DP_DESC'
          LookupSource = dmSys1.dtsDepots
          TabOrder = 7
          Visible = False
          OnCloseUp = dbGaragemCloseUp
        end
        object dbPhone: TDBEdit
          Left = 16
          Top = 80
          Width = 265
          Height = 21
          DataField = 'EL_PHONENBR'
          DataSource = dtsMaster
          TabOrder = 1
        end
        object dbPath: TDBEdit
          Left = 16
          Top = 127
          Width = 513
          Height = 21
          DataField = 'EL_PATH'
          DataSource = dtsMaster
          TabOrder = 3
        end
        object dbCardUsersStatus: TRxDBComboBox
          Left = 309
          Top = 80
          Width = 140
          Height = 21
          Style = csDropDownList
          DataField = 'EL_STATUS'
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
        object dbLogon: TDBEdit
          Left = 16
          Top = 176
          Width = 265
          Height = 21
          DataField = 'EL_LOGONID'
          DataSource = dtsMaster
          TabOrder = 4
        end
        object dbPass: TDBEdit
          Left = 309
          Top = 176
          Width = 230
          Height = 21
          DataField = 'EL_PASSWORD'
          DataSource = dtsMaster
          PasswordChar = '*'
          TabOrder = 5
        end
        object cbCodigo: TRxDBComboBox
          Left = 16
          Top = 38
          Width = 145
          Height = 21
          DataField = 'EL_CODE'
          DataSource = dtsMaster
          EnableValues = False
          ItemHeight = 13
          Items.Strings = (
            'EODBUS'
            'CARDFUNC'
            'HOTLIST'
            'CRT'
            'LINBUS'
            'teste')
          TabOrder = 0
        end
      end
      object pcSubApplications: TPageControl
        Left = 0
        Top = 209
        Width = 685
        Height = 115
        Align = alClient
        TabOrder = 1
        Visible = False
      end
      object gbDetail: TGroupBox
        Left = 0
        Top = 209
        Width = 685
        Height = 115
        Align = alClient
        TabOrder = 2
      end
    end
  end
  inherited actlstBase: TActionList
    inherited actFilter: TAction
      OnExecute = actFilterExecute
    end
  end
end
