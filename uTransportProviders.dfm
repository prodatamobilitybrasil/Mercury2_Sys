inherited FrmTransportProviders: TFrmTransportProviders
  Tag = 60
  Left = 240
  Top = 110
  Width = 1256
  Height = 595
  Caption = 'Empresas'
  Constraints.MinHeight = 576
  Constraints.MinWidth = 798
  PixelsPerInch = 96
  TextHeight = 13
  inherited cbBase: TCoolBar
    Width = 1248
    Bands = <
      item
        Control = tbBase
        ImageIndex = -1
        MinHeight = 24
        Width = 1244
      end>
    inherited tbBase: TToolBar
      Width = 1231
      object lbFiltrado: TLabel
        Left = 354
        Top = 2
        Width = 111
        Height = 22
        Cursor = crHandPoint
        Hint = 'Limpa FILTRO'
        AutoSize = False
        Caption = ' FILTRADO'
        Color = clBtnFace
        Font.Charset = ANSI_CHARSET
        Font.Color = clRed
        Font.Height = -19
        Font.Name = 'Courier New'
        Font.Style = [fsBold]
        ParentColor = False
        ParentFont = False
        Visible = False
        OnClick = lbFiltradoClick
      end
    end
  end
  inherited pcBaseCadastro: TPageControl
    Width = 1248
    Height = 516
    Font.Color = clBlack
    ParentFont = False
    TabWidth = 100
    inherited tsBaseCadastroFiltro: TTabSheet
      Font.Color = clBlack
      ParentFont = False
      inherited Splitter_Base1: TSplitter
        Width = 1240
        Color = clBlack
        ParentColor = False
      end
      inherited gbGrid: TGroupBox
        Width = 1240
        Height = 356
        inherited grdResultado: TDBGrid
          Tag = 2
          Width = 1236
          Height = 339
          DataSource = dtsMaster
          TitleFont.Color = clBlack
          OnCellClick = grdResultadoCellClick
          OnTitleClick = grdResultadoTitleClick
          Columns = <
            item
              Alignment = taCenter
              Color = clAqua
              Expanded = False
              FieldName = 'Tp_Id'
              Title.Alignment = taCenter
              Title.Caption = 'C'#243'digo'
              Width = 70
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'Tp_Permis'
              Title.Caption = 'C'#243'digo da Empresa'
              Width = 100
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'Tp_Desc'
              Title.Caption = 'Descri'#231#227'o'
              Title.Color = clYellow
              Width = 250
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'TP_CNPJ'
              Title.Caption = 'CNPJ'
              Width = 150
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'Tp_Address'
              Title.Caption = 'Endere'#231'o'
              Width = 230
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'Tp_Nameoncard'
              Title.Caption = 'Nome no Cart'#227'o'
              Width = 110
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'STATUS_ID'
              Title.Caption = 'Status'
              Width = 80
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'Tp_Regdate'
              Title.Caption = 'Registro'
              Width = 100
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'Tp_Reguser'
              Title.Caption = 'Usu'#225'rio'
              Width = 100
              Visible = True
            end>
        end
      end
      inherited pnFiltro: TPanel
        Width = 1240
        inherited pnPesq: TPanel
          Width = 1240
          inherited gbFiltroAvansado: TGroupBox
            Width = 1236
            inherited pnVoltar: TPanel
              Width = 1232
              inherited lblBack: TLabel
                Left = 1205
              end
            end
          end
          inherited gbFiltro: TGroupBox
            Width = 1236
            object TP_PERMIS: TLabel [0]
              Tag = 2536
              Left = 16
              Top = 64
              Width = 114
              Height = 13
              Caption = 'C'#243'digo da Empresa:'
              FocusControl = edTP_Permis
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Height = -11
              Font.Name = 'MS Sans Serif'
              Font.Style = [fsBold]
              ParentFont = False
            end
            object Label1: TLabel [1]
              Tag = 2537
              Left = 160
              Top = 16
              Width = 62
              Height = 13
              Caption = 'Descri'#231#227'o:'
              FocusControl = edDesc
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Height = -11
              Font.Name = 'MS Sans Serif'
              Font.Style = [fsBold]
              ParentFont = False
            end
            object lStatus: TLabel [2]
              Tag = 2541
              Left = 162
              Top = 64
              Width = 41
              Height = 13
              Caption = 'Status:'
              FocusControl = lkFilterStatus
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Height = -11
              Font.Name = 'MS Sans Serif'
              Font.Style = [fsBold]
              ParentFont = False
            end
            object Label7: TLabel [3]
              Tag = 2535
              Left = 16
              Top = 16
              Width = 44
              Height = 13
              Caption = 'C'#243'digo:'
              FocusControl = edCodigo
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Height = -11
              Font.Name = 'MS Sans Serif'
              Font.Style = [fsBold]
              ParentFont = False
            end
            object btnLimpaStatus: TSpeedButton [4]
              Left = 274
              Top = 80
              Width = 21
              Height = 21
              Glyph.Data = {
                76010000424D7601000000000000760000002800000020000000100000000100
                04000000000000010000120B0000120B00001000000000000000000000000000
                800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
                FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00555555555555
                55555FFFFFFF5F55FFF5777777757559995777777775755777F7555555555550
                305555555555FF57F7F555555550055BB0555555555775F777F55555550FB000
                005555555575577777F5555550FB0BF0F05555555755755757F555550FBFBF0F
                B05555557F55557557F555550BFBF0FB005555557F55575577F555500FBFBFB0
                B05555577F555557F7F5550E0BFBFB00B055557575F55577F7F550EEE0BFB0B0
                B05557FF575F5757F7F5000EEE0BFBF0B055777FF575FFF7F7F50000EEE00000
                B0557777FF577777F7F500000E055550805577777F7555575755500000555555
                05555777775555557F5555000555555505555577755555557555}
              NumGlyphs = 2
              OnClick = btnLimpaStatusClick
            end
            inherited pnPesquiza: TPanel
              Width = 1232
              TabOrder = 4
              inherited lblAdvancedSearch: TLabel
                Width = 1232
                Visible = False
              end
            end
            object edTP_Permis: TEdit
              Left = 16
              Top = 80
              Width = 121
              Height = 21
              TabOrder = 2
              OnEnter = Entra
              OnExit = Sai
              OnKeyPress = soNumero
            end
            object edDesc: TEdit
              Left = 160
              Top = 32
              Width = 329
              Height = 21
              CharCase = ecUpperCase
              TabOrder = 1
              OnEnter = Entra
              OnExit = Sai
            end
            object lkFilterStatus: TComboBox
              Left = 162
              Top = 80
              Width = 113
              Height = 21
              Style = csDropDownList
              ItemHeight = 13
              ItemIndex = 0
              TabOrder = 3
              Text = 'Ativo'
              OnEnter = Entra
              OnExit = Sai
              Items.Strings = (
                'Ativo'
                'Inativo')
            end
            object edCodigo: TEdit
              Left = 16
              Top = 32
              Width = 121
              Height = 21
              TabOrder = 0
              OnEnter = Entra
              OnExit = Sai
              OnKeyPress = soNumero
            end
          end
        end
      end
    end
    inherited tsBaseCadastroConsulta: TTabSheet
      Font.Color = clBlack
      ParentFont = False
      object GroupBox1: TGroupBox
        Left = 0
        Top = 77
        Width = 1240
        Height = 151
        Align = alTop
        TabOrder = 0
        object Label4: TLabel
          Left = 8
          Top = 54
          Width = 46
          Height = 13
          Caption = 'Endere'#231'o'
          FocusControl = dbAddress
        end
        object Label2: TLabel
          Left = 8
          Top = 9
          Width = 92
          Height = 13
          Caption = 'C'#243'digo da Empresa'
          FocusControl = dbPermis
        end
        object Label3: TLabel
          Left = 164
          Top = 9
          Width = 48
          Height = 13
          Caption = 'Descri'#231#227'o'
          FocusControl = dbDesc
        end
        object Label6: TLabel
          Tag = 2546
          Left = 594
          Top = 53
          Width = 30
          Height = 13
          Caption = 'Status'
          FocusControl = dbCardUsersStatus
        end
        object Label5: TLabel
          Left = 386
          Top = 54
          Width = 77
          Height = 13
          Caption = 'Nome no Cart'#227'o'
          FocusControl = dbNameoncard
        end
        object Label11: TLabel
          Left = 532
          Top = 8
          Width = 27
          Height = 13
          Caption = 'CNPJ'
          FocusControl = dbCNPJ
        end
        object lbl_cargo: TLabel
          Left = 8
          Top = 96
          Width = 172
          Height = 13
          Caption = 'Imprime Grupo de Cargos Operador?'
        end
        object dbAddress: TDBEdit
          Left = 8
          Top = 70
          Width = 369
          Height = 21
          CharCase = ecUpperCase
          DataField = 'TP_ADDRESS'
          DataSource = dtsMaster
          TabOrder = 3
        end
        object dbPermis: TDBEdit
          Left = 8
          Top = 25
          Width = 147
          Height = 21
          DataField = 'TP_PERMIS'
          DataSource = dtsMaster
          MaxLength = 10
          TabOrder = 0
        end
        object dbDesc: TDBEdit
          Left = 164
          Top = 25
          Width = 361
          Height = 21
          CharCase = ecUpperCase
          DataField = 'TP_DESC'
          DataSource = dtsMaster
          TabOrder = 1
        end
        object dbCardUsersStatus: TRxDBComboBox
          Left = 594
          Top = 70
          Width = 117
          Height = 21
          Style = csDropDownList
          DataField = 'TP_STATUS'
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
        object dbNameoncard: TDBEdit
          Left = 386
          Top = 70
          Width = 199
          Height = 21
          CharCase = ecUpperCase
          DataField = 'TP_NAMEONCARD'
          DataSource = dtsMaster
          TabOrder = 4
        end
        object dbCNPJ: TDBEdit
          Left = 532
          Top = 25
          Width = 177
          Height = 21
          DataField = 'TP_CNPJ'
          DataSource = dtsMaster
          TabOrder = 2
          OnChange = dbCNPJChange
        end
        object RxDBComboBox1: TRxDBComboBox
          Left = 16
          Top = 112
          Width = 145
          Height = 21
          Style = csDropDownList
          DataField = 'TP_PRINTPERSONNELFCTGROUP'
          DataSource = dtsMaster
          EnableValues = False
          ItemHeight = 13
          Items.Strings = (
            'SIM'
            'NAO')
          TabOrder = 6
          Values.Strings = (
            'S'
            'N')
        end
      end
      object GroupBox3: TGroupBox
        Left = 0
        Top = 0
        Width = 1240
        Height = 77
        Align = alTop
        TabOrder = 1
        object Label8: TLabel
          Left = 21
          Top = 12
          Width = 33
          Height = 13
          Caption = 'C'#243'digo'
          FocusControl = dbTp_id
        end
        object dbTp_id: TDBEdit
          Left = 22
          Top = 28
          Width = 139
          Height = 21
          Color = clBtnFace
          DataField = 'TP_ID'
          DataSource = dtsMaster
          ReadOnly = True
          TabOrder = 0
          OnChange = dbTp_idChange
        end
      end
      object pcSubApplications: TPageControl
        Left = 27
        Top = 228
        Width = 1213
        Height = 260
        ActivePage = TabSheet3
        Align = alClient
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
        TabOrder = 2
        TabWidth = 120
        OnChange = pcSubApplicationsChange
        OnChanging = pcSubApplicationsChanging
        object TabSheet1: TTabSheet
          Caption = 'Linhas'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentFont = False
          object Label10: TLabel
            Tag = 2556
            Left = 357
            Top = 8
            Width = 98
            Height = 13
            Caption = 'Linhas Selecionadas'
          end
          object Label9: TLabel
            Tag = 2557
            Left = 18
            Top = 8
            Width = 90
            Height = 13
            Caption = 'Linhas Dispon'#237'veis'
          end
          object SpeedButton3: TSpeedButton
            Left = 664
            Top = 111
            Width = 78
            Height = 32
            Action = actOkLine
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
          object SpeedButton4: TSpeedButton
            Left = 664
            Top = 151
            Width = 78
            Height = 32
            Action = actCancelLine
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
          object lbDisponiveis: TListBox
            Left = 18
            Top = 26
            Width = 295
            Height = 192
            DragMode = dmAutomatic
            ItemHeight = 13
            MultiSelect = True
            TabOrder = 1
            OnDragDrop = lbDisponiveisDragDrop
            OnDragOver = lbDisponiveisDragOver
          end
          object lbSelecionadas: TListBox
            Left = 355
            Top = 26
            Width = 300
            Height = 192
            DragMode = dmAutomatic
            ItemHeight = 13
            MultiSelect = True
            TabOrder = 2
            OnDragDrop = lbSelecionadasDragDrop
            OnDragOver = lbSelecionadasDragOver
          end
          object cbLineMt: TCoolBar
            Left = 321
            Top = 72
            Width = 27
            Height = 107
            Align = alNone
            AutoSize = True
            Bands = <
              item
                Control = tbLineMt
                ImageIndex = -1
                MinHeight = 23
                Width = 103
              end>
            Vertical = True
            object tbLineMt: TToolBar
              Left = 0
              Top = 9
              Width = 23
              Height = 90
              Align = alNone
              AutoSize = True
              Caption = 'tbLineMt'
              EdgeBorders = []
              Images = imglstBase
              TabOrder = 0
              object tbtnNewLineMt: TToolButton
                Left = 0
                Top = 2
                Action = actAddAllLine
                Wrap = True
              end
              object btnAddAllLineMt: TToolButton
                Left = 0
                Top = 24
                Action = actAddLine
                Wrap = True
              end
              object btnDelAllLineMt: TToolButton
                Left = 0
                Top = 46
                Action = actDelLine
                Wrap = True
              end
              object tbtnDeleteLineMt: TToolButton
                Left = 0
                Top = 68
                Action = actDelAllLine
              end
            end
          end
          object dbgLinhas: TDBGrid
            Left = 0
            Top = 0
            Width = 1205
            Height = 232
            Align = alClient
            DataSource = DmSys.dtsTransportProvidersXLineMT
            Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgRowSelect, dgConfirmDelete, dgCancelOnExit]
            TabOrder = 0
            TitleFont.Charset = DEFAULT_CHARSET
            TitleFont.Color = clWindowText
            TitleFont.Height = -11
            TitleFont.Name = 'MS Sans Serif'
            TitleFont.Style = []
            Columns = <
              item
                Expanded = False
                FieldName = 'LM_DESCSHORT'
                Title.Caption = 'Descri'#231#227'o'
                Width = 500
                Visible = True
              end>
          end
        end
        object TabSheet2: TTabSheet
          Caption = 'Aplica'#231#245'es'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ImageIndex = 1
          ParentFont = False
          object SpeedButton1: TSpeedButton
            Left = 359
            Top = 95
            Width = 98
            Height = 32
            Action = actOkApp
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
          object SpeedButton2: TSpeedButton
            Left = 359
            Top = 135
            Width = 98
            Height = 32
            Action = actCancelApp
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
          object Label19: TLabel
            Tag = 2565
            Left = 24
            Top = 37
            Width = 47
            Height = 13
            Caption = 'Aplica'#231#227'o'
            FocusControl = dbLkApplications
          end
          object dbLkApplications: TRxDBLookupCombo
            Left = 24
            Top = 53
            Width = 265
            Height = 21
            DropDownCount = 8
            LookupField = 'APP_ID'
            LookupDisplay = 'APP_ID; APP_DESCSHORT; ISS_DESCLONG'
            LookupDisplayIndex = 1
            LookupSource = DmSys.dtsApplicationsLook
            TabOrder = 1
            OnCloseUp = dbLkApplicationsCloseUp
          end
          object edApp: TEdit
            Left = 27
            Top = 55
            Width = 242
            Height = 17
            BorderStyle = bsNone
            ReadOnly = True
            TabOrder = 2
          end
          object dbgAppsXValidatorActions: TDBGrid
            Left = 0
            Top = 0
            Width = 1205
            Height = 232
            Align = alClient
            DataSource = dmSys1.dtsTransportProvidersXApps
            Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgRowSelect, dgConfirmDelete, dgCancelOnExit]
            TabOrder = 0
            TitleFont.Charset = DEFAULT_CHARSET
            TitleFont.Color = clWindowText
            TitleFont.Height = -11
            TitleFont.Name = 'MS Sans Serif'
            TitleFont.Style = []
            Columns = <
              item
                Expanded = False
                FieldName = 'ISS_DESCLONG'
                Title.Caption = 'Emissor'
                Width = 160
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'APP_DESCSHORT'
                Title.Caption = 'Aplica'#231#227'o'
                Width = 260
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
                FieldName = 'TPAPP_REGDATE'
                Title.Caption = 'Registro'
                Width = 100
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'TPAPP_REGUSER'
                Title.Caption = 'Usu'#225'rio'
                Width = 100
                Visible = True
              end>
          end
        end
        object TabSheet3: TTabSheet
          Caption = 'Configura'#231#245'es TPI'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ImageIndex = 2
          ParentFont = False
          object pnlGridTPxIP: TPanel
            Left = 0
            Top = 0
            Width = 1205
            Height = 232
            Align = alClient
            BevelInner = bvRaised
            BevelOuter = bvLowered
            TabOrder = 0
            object lblParamDisp: TLabel
              Left = 16
              Top = 8
              Width = 171
              Height = 16
              Caption = 'Par'#226'metros Dispon'#237'veis:'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -13
              Font.Name = 'MS Sans Serif'
              Font.Style = [fsBold]
              ParentFont = False
            end
            object lstParamDisp: TListBox
              Left = 8
              Top = 24
              Width = 337
              Height = 173
              ItemHeight = 13
              MultiSelect = True
              Sorted = True
              TabOrder = 0
            end
            object btnDetalhe: TBitBtn
              Left = 8
              Top = 200
              Width = 75
              Height = 25
              Caption = 'Detalhe'
              TabOrder = 1
              OnClick = btnDetalheClick
              Glyph.Data = {
                76010000424D7601000000000000760000002800000020000000100000000100
                04000000000000010000120B0000120B00001000000000000000000000000000
                800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
                FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00333330000000
                00003333377777777777333330FFFFFFFFF03FF3F7FFFF33FFF7003000000FF0
                00F077F7777773F77737E00FBFBFB0FFFFF07773333FF7FF33F7E0FBFB00000F
                F0F077F333777773F737E0BFBFBFBFB0FFF077F3333FFFF733F7E0FBFB00000F
                F0F077F333777773F737E0BFBFBFBFB0FFF077F33FFFFFF733F7E0FB0000000F
                F0F077FF777777733737000FB0FFFFFFFFF07773F7F333333337333000FFFFFF
                FFF0333777F3FFF33FF7333330F000FF0000333337F777337777333330FFFFFF
                0FF0333337FFFFFF7F37333330CCCCCC0F033333377777777F73333330FFFFFF
                0033333337FFFFFF773333333000000003333333377777777333}
              NumGlyphs = 2
            end
            object pnDireita: TPanel
              Left = 352
              Top = 2
              Width = 385
              Height = 231
              BevelOuter = bvNone
              TabOrder = 2
              Visible = False
              object lblParamSet: TLabel
                Left = 47
                Top = 8
                Width = 181
                Height = 16
                Caption = 'Par'#226'metros Configurados:'
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clWindowText
                Font.Height = -13
                Font.Name = 'MS Sans Serif'
                Font.Style = [fsBold]
                ParentFont = False
              end
              object clbrButtons: TCoolBar
                Left = 1
                Top = 25
                Width = 32
                Height = 173
                Align = alNone
                Bands = <
                  item
                    Control = tlbButtons
                    ImageIndex = -1
                    MinHeight = 28
                    Width = 169
                  end>
                Vertical = True
                object tlbButtons: TToolBar
                  Left = 0
                  Top = 9
                  Width = 28
                  Height = 160
                  Align = alNone
                  ButtonHeight = 30
                  ButtonWidth = 30
                  Color = clBtnFace
                  EdgeBorders = []
                  Flat = True
                  Font.Charset = DEFAULT_CHARSET
                  Font.Color = clWindowText
                  Font.Height = -11
                  Font.Name = 'MS Sans Serif'
                  Font.Style = []
                  Images = imglstBase
                  Indent = -1
                  ParentColor = False
                  ParentFont = False
                  ParentShowHint = False
                  ShowHint = True
                  TabOrder = 0
                  Transparent = False
                  Wrapable = False
                  object btnAllParameters: TToolButton
                    Left = -1
                    Top = 0
                    ImageIndex = 21
                    Wrap = True
                    OnClick = btnAllParametersClick
                  end
                  object btnAddParameter: TToolButton
                    Left = -1
                    Top = 30
                    ImageIndex = 22
                    Wrap = True
                    OnClick = btnAddParameterClick
                  end
                  object btnDelParameter: TToolButton
                    Left = -1
                    Top = 60
                    ImageIndex = 24
                    Wrap = True
                    OnClick = btnDelParameterClick
                  end
                  object btnNoneParameters: TToolButton
                    Left = -1
                    Top = 90
                    ImageIndex = 23
                    OnClick = btnNoneParametersClick
                  end
                end
              end
              object lstParamSet: TListBox
                Left = 40
                Top = 24
                Width = 337
                Height = 173
                ItemHeight = 13
                MultiSelect = True
                Sorted = True
                TabOrder = 1
                OnDblClick = btnDelParameterClick
              end
              object btnOK: TBitBtn
                Left = 221
                Top = 200
                Width = 75
                Height = 25
                Caption = 'OK'
                Default = True
                TabOrder = 2
                OnClick = btnOKClick
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
              object btnCancelar: TBitBtn
                Left = 301
                Top = 200
                Width = 75
                Height = 25
                Cancel = True
                Caption = 'Cancelar'
                TabOrder = 3
                OnClick = btnCancelarClick
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
                Margin = 4
                NumGlyphs = 2
                Spacing = 2
              end
            end
          end
        end
      end
      object cbCardApps: TCoolBar
        Left = 0
        Top = 228
        Width = 27
        Height = 260
        Align = alLeft
        AutoSize = True
        Bands = <
          item
            Control = tbCardsApps
            ImageIndex = -1
            MinHeight = 23
            Width = 256
          end>
        Vertical = True
        object tbCardsApps: TToolBar
          Left = 0
          Top = 9
          Width = 23
          Height = 247
          Align = alClient
          ButtonHeight = 23
          Caption = 'tbCardsApps'
          Images = imglstBase
          TabOrder = 0
          object tbtnNewCardApp: TToolButton
            Left = 0
            Top = 2
            Action = actNewDetail
            ParentShowHint = False
            Wrap = True
            ShowHint = True
          end
          object tbtnEditCardApp: TToolButton
            Left = 0
            Top = 25
            Action = actEditDetail
            ParentShowHint = False
            Wrap = True
            ShowHint = True
          end
          object tbtnDeletePeriod: TToolButton
            Left = 0
            Top = 48
            Action = actDeleteDetail
            ParentShowHint = False
            ShowHint = True
          end
        end
      end
    end
  end
  object Panel1: TPanel [2]
    Left = 350
    Top = 30
    Width = 138
    Height = 17
    TabOrder = 2
    object lblContador: TRxLabel
      Left = 1
      Top = 1
      Width = 136
      Height = 15
      Align = alClient
      Alignment = taCenter
      Caption = '1.123.123 registro(s)'
      Color = clMoneyGreen
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentColor = False
      ParentFont = False
      ShadowSize = 0
    end
  end
  inherited actlstBase: TActionList
    inherited actFilter: TAction
      OnExecute = actFilterExecute
    end
    object actNewDetail: TAction
      Tag = 2745
      Category = 'Detail'
      Caption = 'actNewLine'
      ImageIndex = 16
      OnExecute = actNewDetailExecute
    end
    object actEditDetail: TAction
      Tag = 2746
      Category = 'Detail'
      Caption = 'actEditLine'
      ImageIndex = 10
      OnExecute = actEditDetailExecute
    end
    object actDeleteDetail: TAction
      Tag = 2747
      Category = 'Detail'
      Caption = 'actDeleteLine'
      ImageIndex = 9
      OnExecute = actDeleteDetailExecute
    end
    object actAddAllLine: TAction
      Tag = 2750
      Category = 'Linhas'
      Caption = 'actAddAllLine'
      ImageIndex = 21
      OnExecute = actAddAllLineExecute
    end
    object actAddLine: TAction
      Tag = 2751
      Category = 'Linhas'
      Caption = 'actAddLine'
      ImageIndex = 22
      OnExecute = actAddLineExecute
    end
    object actDelLine: TAction
      Tag = 2752
      Category = 'Linhas'
      Caption = 'actDelLine'
      ImageIndex = 24
      OnExecute = actDelLineExecute
    end
    object actDelAllLine: TAction
      Tag = 2753
      Category = 'Linhas'
      Caption = 'actDelAllLine'
      ImageIndex = 23
      OnExecute = actDelAllLineExecute
    end
    object actOkLine: TAction
      Tag = 2748
      Category = 'Linhas'
      Caption = 'actOkLine'
      OnExecute = actOkLineExecute
    end
    object actCancelLine: TAction
      Tag = 2749
      Category = 'Linhas'
      Caption = 'actCancelLine'
      OnExecute = actCancelLineExecute
    end
    object actOkApp: TAction
      Tag = 2757
      Category = 'Apps'
      Caption = 'actOkLine'
      OnExecute = actOkAppExecute
    end
    object actCancelApp: TAction
      Tag = 2758
      Category = 'Apps'
      Caption = 'actCancelLine'
      OnExecute = actCancelAppExecute
    end
  end
end
