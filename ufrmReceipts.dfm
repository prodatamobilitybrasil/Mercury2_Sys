inherited frmReceipts: TfrmReceipts
  Tag = 131
  Left = 192
  Top = 226
  Width = 1248
  Caption = 'Recibos'
  PixelsPerInch = 96
  TextHeight = 13
  inherited cbBase: TCoolBar
    Width = 1240
    Bands = <
      item
        Control = tbBase
        ImageIndex = -1
        MinHeight = 24
        Width = 1236
      end>
    inherited tbBase: TToolBar
      Width = 1223
    end
  end
  inherited pcBaseCadastro: TPageControl
    Width = 1240
    ActivePage = tsBaseCadastroConsulta
    OnChange = pcBaseCadastroChange
    inherited tsBaseCadastroFiltro: TTabSheet
      inherited Splitter_Base1: TSplitter
        Width = 1232
      end
      inherited gbGrid: TGroupBox
        Width = 1232
        inherited grdResultado: TDBGrid
          Width = 1228
          DataSource = dtsMaster
          Columns = <
            item
              Expanded = False
              FieldName = 'TP_DESC'
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'ZNL_DESCSHORT_ORIG'
              Width = 92
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'ZNL_DESCSHORT_DEST'
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'RCPTMT_REGDATE'
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'RCPTMT_REGUSER'
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'STATUS_ID'
              Visible = True
            end>
        end
      end
      inherited pnFiltro: TPanel
        Width = 1232
        inherited pnPesq: TPanel
          Width = 1232
          inherited gbfiltroavansado: TGroupBox
            Width = 1228
            inherited pnVoltar: TPanel
              Width = 1224
              inherited lblBack: TLabel
                Left = 1197
              end
            end
          end
          inherited gbFiltro: TGroupBox
            Width = 1228
            object lb_codigo_empresa: TLabel [0]
              Left = 16
              Top = 16
              Width = 92
              Height = 13
              Caption = 'C'#243'digo da Empresa'
            end
            object lblFilterStatus: TLabel [1]
              Left = 129
              Top = 17
              Width = 30
              Height = 13
              Caption = 'Status'
              FocusControl = lkFilterStatus
            end
            inherited pnPesquiza: TPanel
              Width = 1224
              inherited lblAdvancedSearch: TLabel
                Width = 1224
              end
            end
            object ed_codigo_empresa: TEdit
              Left = 15
              Top = 30
              Width = 98
              Height = 21
              TabOrder = 1
            end
            object lkFilterStatus: TComboBox
              Left = 129
              Top = 31
              Width = 105
              Height = 21
              Style = csDropDownList
              ItemHeight = 13
              TabOrder = 2
              Items.Strings = (
                'Ativo'
                'Inativo')
            end
          end
        end
      end
    end
    inherited tsBaseCadastroConsulta: TTabSheet
      object lb_linhas: TLabel
        Left = 152
        Top = 50
        Width = 31
        Height = 13
        Caption = 'Linhas'
      end
      object lb_colunas: TLabel
        Left = 16
        Top = 50
        Width = 38
        Height = 13
        Caption = 'Colunas'
      end
      object lb_empresa: TLabel
        Left = 16
        Top = 10
        Width = 41
        Height = 13
        Caption = 'Empresa'
      end
      object Label10: TLabel
        Left = 285
        Top = 7
        Width = 30
        Height = 13
        Caption = 'Status'
        FocusControl = RxDBComboBox1
      end
      object gb_detalhe: TGroupBox
        Left = 0
        Top = 101
        Width = 1232
        Height = 194
        Align = alBottom
        Caption = 'Detalhe'
        TabOrder = 3
        object Label6: TLabel
          Left = 43
          Top = 107
          Width = 24
          Height = 13
          Caption = 'Valor'
        end
        object Label7: TLabel
          Left = 146
          Top = 107
          Width = 38
          Height = 13
          Caption = 'Formato'
        end
        object Label8: TLabel
          Left = 248
          Top = 107
          Width = 45
          Height = 13
          Caption = 'Tamanho'
        end
        object Label5: TLabel
          Left = 352
          Top = 66
          Width = 53
          Height = 13
          Caption = 'No. Coluna'
        end
        object Label4: TLabel
          Left = 248
          Top = 67
          Width = 46
          Height = 13
          Caption = 'No. Linha'
        end
        object Label3: TLabel
          Left = 44
          Top = 66
          Width = 70
          Height = 13
          Caption = 'Campo Recibo'
        end
        object Label1: TLabel
          Left = 45
          Top = 26
          Width = 26
          Height = 13
          Caption = 'Linha'
        end
        object Label2: TLabel
          Left = 248
          Top = 26
          Width = 34
          Height = 13
          Caption = 'Trecho'
        end
        object Label9: TLabel
          Left = 453
          Top = 23
          Width = 30
          Height = 13
          Caption = 'Status'
        end
        object cb_status: TRxDBComboBox
          Left = 453
          Top = 39
          Width = 117
          Height = 21
          Style = csDropDownList
          DataField = 'RCPTDT_STATUS'
          DataSource = DmSys.dtsReceiptDt
          EnableValues = True
          ItemHeight = 13
          Items.Strings = (
            'Ativo'
            'Inativo')
          TabOrder = 11
          Values.Strings = (
            'A'
            'I')
        end
        object ed_valor: TDBEdit
          Left = 43
          Top = 120
          Width = 94
          Height = 21
          DataField = 'RCPTDT_VALUE'
          DataSource = DmSys.dtsReceiptDt
          TabOrder = 5
        end
        object ed_formato: TDBEdit
          Left = 146
          Top = 120
          Width = 94
          Height = 21
          DataField = 'RCPTDT_FORMAT'
          DataSource = DmSys.dtsReceiptDt
          ReadOnly = True
          TabOrder = 6
        end
        object ed_tamanho: TDBEdit
          Left = 248
          Top = 120
          Width = 94
          Height = 21
          DataField = 'RCPTDT_LENGTH'
          DataSource = DmSys.dtsReceiptDt
          TabOrder = 7
        end
        object ed_no_coluna: TDBEdit
          Left = 352
          Top = 80
          Width = 94
          Height = 21
          DataField = 'RCPTDT_COLUMNNUMBER'
          DataSource = DmSys.dtsReceiptDt
          TabOrder = 4
        end
        object ed_no_linha: TDBEdit
          Left = 248
          Top = 80
          Width = 94
          Height = 21
          DataField = 'RCPTDT_ROWNUMBER'
          DataSource = DmSys.dtsReceiptDt
          TabOrder = 3
        end
        object cb_campo_recibo: TRxDBLookupCombo
          Left = 43
          Top = 80
          Width = 198
          Height = 21
          DropDownCount = 8
          DataField = 'RF_ID'
          DataSource = DmSys.dtsReceiptDt
          LookupField = 'RF_ID'
          LookupDisplay = 'RF_DESC; RF_TAG'
          LookupSource = DmSys.dtsReceiptFields
          TabOrder = 2
          OnCloseUp = cb_campo_reciboCloseUp
        end
        object cb_linha: TRxDBLookupCombo
          Left = 43
          Top = 40
          Width = 198
          Height = 21
          DropDownCount = 8
          DataField = 'LD_ID'
          DataSource = DmSys.dtsReceiptDt
          LookupField = 'LD_ID'
          LookupDisplay = 'LD_DESC'
          LookupSource = DmSys.dtsLineDetailsAux
          TabOrder = 0
        end
        object cb_trecho: TRxDBLookupCombo
          Left = 248
          Top = 40
          Width = 198
          Height = 21
          DropDownCount = 8
          DataField = 'ZN_ID'
          DataSource = DmSys.dtsReceiptDt
          LookupField = 'ZN_ID'
          LookupDisplay = 'ZNL_DESCSHORT_ORIG; ZNL_DESCSHORT_DEST'
          LookupSource = DmSys.dtsZones
          TabOrder = 1
        end
        object pn_bottom_detalhe: TPanel
          Left = 2
          Top = 160
          Width = 1228
          Height = 32
          Align = alBottom
          TabOrder = 8
          Visible = False
          object Panel1: TPanel
            Left = 1029
            Top = 1
            Width = 198
            Height = 30
            Align = alRight
            BevelOuter = bvNone
            TabOrder = 0
            object bt_ok_detalhe: TBitBtn
              Left = 16
              Top = 2
              Width = 81
              Height = 27
              Caption = 'Ok'
              TabOrder = 0
              OnClick = bt_ok_detalheClick
              Glyph.Data = {
                DE010000424DDE01000000000000760000002800000024000000120000000100
                0400000000006801000000000000000000001000000000000000000000000000
                80000080000000808000800000008000800080800000C0C0C000808080000000
                FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00333333333333
                3333333333333333333333330000333333333333333333333333F33333333333
                00003333344333333333333333388F3333333333000033334224333333333333
                338338F3333333330000333422224333333333333833338F3333333300003342
                222224333333333383333338F3333333000034222A22224333333338F338F333
                8F33333300003222A3A2224333333338F3838F338F33333300003A2A333A2224
                33333338F83338F338F33333000033A33333A222433333338333338F338F3333
                0000333333333A222433333333333338F338F33300003333333333A222433333
                333333338F338F33000033333333333A222433333333333338F338F300003333
                33333333A222433333333333338F338F00003333333333333A22433333333333
                3338F38F000033333333333333A223333333333333338F830000333333333333
                333A333333333333333338330000333333333333333333333333333333333333
                0000}
              NumGlyphs = 2
            end
            object btnCancelTrechos: TBitBtn
              Left = 104
              Top = 2
              Width = 81
              Height = 27
              Caption = 'Cancel'
              TabOrder = 1
              OnClick = btnCancelTrechosClick
              Glyph.Data = {
                DE010000424DDE01000000000000760000002800000024000000120000000100
                0400000000006801000000000000000000001000000000000000000000000000
                80000080000000808000800000008000800080800000C0C0C000808080000000
                FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00333333333333
                333333333333333333333333000033338833333333333333333F333333333333
                0000333911833333983333333388F333333F3333000033391118333911833333
                38F38F333F88F33300003339111183911118333338F338F3F8338F3300003333
                911118111118333338F3338F833338F3000033333911111111833333338F3338
                3333F8330000333333911111183333333338F333333F83330000333333311111
                8333333333338F3333383333000033333339111183333333333338F333833333
                00003333339111118333333333333833338F3333000033333911181118333333
                33338333338F333300003333911183911183333333383338F338F33300003333
                9118333911183333338F33838F338F33000033333913333391113333338FF833
                38F338F300003333333333333919333333388333338FFF830000333333333333
                3333333333333333333888330000333333333333333333333333333333333333
                0000}
              NumGlyphs = 2
            end
          end
        end
        object CoolBar2: TCoolBar
          Left = 2
          Top = 15
          Width = 27
          Height = 145
          Align = alLeft
          AutoSize = True
          Bands = <
            item
              Control = ToolBar5
              ImageIndex = -1
              MinHeight = 23
              Width = 141
            end>
          Vertical = True
          object ToolBar5: TToolBar
            Left = 0
            Top = 9
            Width = 23
            Height = 132
            Align = alLeft
            Caption = 'tbCardsApps'
            Images = imglstBase
            TabOrder = 0
            object tb_inserir_detalhe: TToolButton
              Left = 0
              Top = 2
              Grouped = True
              ImageIndex = 16
              Wrap = True
              OnClick = tb_inserir_detalheClick
            end
            object tb_editar_detalhe: TToolButton
              Left = 0
              Top = 24
              Grouped = True
              ImageIndex = 10
              Wrap = True
              OnClick = tb_editar_detalheClick
            end
            object tb_excluir_detalhe: TToolButton
              Left = 0
              Top = 46
              Grouped = True
              ImageIndex = 9
              OnClick = tb_excluir_detalheClick
            end
          end
        end
        object pn_detalhe: TPanel
          Left = 29
          Top = 15
          Width = 1201
          Height = 145
          Align = alClient
          TabOrder = 9
          object dbg_detalhe: TDBGrid
            Left = 1
            Top = 1
            Width = 1199
            Height = 143
            Align = alClient
            DataSource = DmSys.dtsReceiptDt
            ReadOnly = True
            TabOrder = 0
            TitleFont.Charset = DEFAULT_CHARSET
            TitleFont.Color = clWindowText
            TitleFont.Height = -11
            TitleFont.Name = 'MS Sans Serif'
            TitleFont.Style = []
            Columns = <
              item
                Expanded = False
                FieldName = 'LD_DESCSHORT'
                Width = 128
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'ZN_ID'
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'ZNL_DESCSHORT_ORIG'
                Width = 123
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'ZNL_DESCSHORT_DEST'
                Width = 142
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'RF_DESC'
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'RF_TAG'
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'RCPTDT_ROWNUMBER'
                Width = 134
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'RCPTDT_COLUMNNUMBER'
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'RCPTDT_VALUE'
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'RCPTDT_FORMAT'
                Width = 85
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'RCPTDT_LENGTH'
                Width = 78
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'RCPTDT_REGDATE'
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'RCPTDT_REGUSER'
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'STATUS_ID'
                Visible = True
              end>
          end
        end
      end
      object ed_linhas: TDBEdit
        Left = 152
        Top = 64
        Width = 121
        Height = 21
        DataField = 'RCPTMT_TOTALROWS'
        DataSource = dtsMaster
        TabOrder = 2
      end
      object ed_colunas: TDBEdit
        Left = 16
        Top = 64
        Width = 121
        Height = 21
        DataField = 'RCPTMT_TOTALCOLUMNS'
        DataSource = dtsMaster
        TabOrder = 1
      end
      object cb_empresa: TRxDBLookupCombo
        Left = 16
        Top = 24
        Width = 262
        Height = 21
        DropDownCount = 8
        DataField = 'TP_ID'
        DataSource = dtsMaster
        LookupField = 'TP_ID'
        LookupDisplay = 'TP_DESC'
        LookupSource = DmSys.dtsTransportProviders
        TabOrder = 0
      end
      object RxDBComboBox1: TRxDBComboBox
        Left = 285
        Top = 23
        Width = 117
        Height = 21
        Style = csDropDownList
        DataField = 'RCPTMT_STATUS'
        DataSource = dtsMaster
        EnableValues = True
        ItemHeight = 13
        Items.Strings = (
          'Ativo'
          'Inativo')
        TabOrder = 4
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
    OnStateChange = dtsMasterStateChange
  end
end
