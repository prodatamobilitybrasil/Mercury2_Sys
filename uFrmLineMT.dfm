inherited FrmLineMT: TFrmLineMT
  Tag = 32
  Left = 242
  Width = 993
  Height = 463
  Caption = 'Linhas'
  OnActivate = nil
  PixelsPerInch = 96
  TextHeight = 13
  object Label33: TLabel [0]
    Left = 17
    Top = 9
    Width = 51
    Height = 14
    Caption = 'Detalhes:'
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Arial'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object Label34: TLabel [1]
    Left = 73
    Top = 9
    Width = 30
    Height = 13
    Caption = 'xxxxxx'
  end
  inherited cbBase: TCoolBar
    Width = 985
    Bands = <
      item
        Control = tbBase
        ImageIndex = -1
        MinHeight = 24
        Width = 981
      end>
    inherited tbBase: TToolBar
      Width = 968
      object lbFiltrado: TLabel
        Left = 354
        Top = 2
        Width = 99
        Height = 22
        Cursor = crHandPoint
        Hint = 'Limpa FILTRO'
        Align = alLeft
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
    Width = 985
    Height = 384
    TabHeight = 19
    inherited tsBaseCadastroFiltro: TTabSheet
      inherited Splitter_Base1: TSplitter
        Top = 89
        Width = 977
        Color = clBlack
        ParentColor = False
      end
      inherited gbGrid: TGroupBox
        Top = 93
        Width = 977
        Height = 262
        inherited grdResultado: TDBGrid
          Width = 973
          Height = 245
          DataSource = dtsMaster
          OnTitleClick = grdResultadoTitleClick
          Columns = <
            item
              Expanded = False
              FieldName = 'LM_DESCSHORT'
              Title.Caption = 'Linha'
              Width = 89
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'LM_DESC'
              Title.Caption = 'Descri'#231#227'o'
              Title.Color = clYellow
              Width = 285
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'LM_VIADESC'
              Title.Caption = 'Percurso'
              Width = 280
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'Lm_Regdate'
              Title.Caption = 'Registro'
              Width = 121
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'Lm_Reguser'
              Title.Caption = 'Usu'#225'rio'
              Width = 87
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'STATUS_ID'
              Title.Caption = 'Status'
              Width = 62
              Visible = True
            end>
        end
      end
      inherited pnFiltro: TPanel
        Width = 977
        Height = 89
        inherited pnPesq: TPanel
          Width = 977
          Height = 89
          inherited gbFiltroAvansado: TGroupBox
            Width = 973
            Height = 85
            inherited pnVoltar: TPanel
              Top = 70
              Width = 969
              inherited lblBack: TLabel
                Left = 942
              end
            end
          end
          inherited gbFiltro: TGroupBox
            Width = 973
            Height = 85
            object Label1: TLabel [0]
              Tag = 1935
              Left = 13
              Top = 20
              Width = 36
              Height = 13
              Caption = 'Linha:'
              FocusControl = edtLinha
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clMaroon
              Font.Height = -11
              Font.Name = 'MS Sans Serif'
              Font.Style = [fsBold]
              ParentFont = False
            end
            object lblFilterStatus: TLabel [1]
              Tag = 1942
              Left = 488
              Top = 20
              Width = 41
              Height = 13
              Caption = 'Status:'
              FocusControl = lkFilterStatus
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clMaroon
              Font.Height = -11
              Font.Name = 'MS Sans Serif'
              Font.Style = [fsBold]
              ParentFont = False
            end
            object Label36: TLabel [2]
              Tag = 1936
              Left = 152
              Top = 20
              Width = 62
              Height = 13
              Caption = 'Descri'#231#227'o:'
              FocusControl = edDesc
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clMaroon
              Font.Height = -11
              Font.Name = 'MS Sans Serif'
              Font.Style = [fsBold]
              ParentFont = False
            end
            object btnLimpaStatus: TSpeedButton [3]
              Left = 586
              Top = 34
              Width = 21
              Height = 23
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
              Top = 70
              Width = 969
              TabOrder = 3
              inherited lblAdvancedSearch: TLabel
                Width = 969
                Visible = False
              end
            end
            object edtLinha: TEdit
              Left = 13
              Top = 35
              Width = 124
              Height = 21
              CharCase = ecUpperCase
              TabOrder = 0
              OnEnter = Entra
              OnExit = Sai
            end
            object lkFilterStatus: TComboBox
              Left = 488
              Top = 35
              Width = 97
              Height = 21
              Style = csDropDownList
              ItemHeight = 13
              ItemIndex = 0
              TabOrder = 2
              Text = 'Ativo'
              OnEnter = Entra
              OnExit = Sai
              Items.Strings = (
                'Ativo'
                'Inativo')
            end
            object edDesc: TEdit
              Left = 152
              Top = 35
              Width = 321
              Height = 21
              CharCase = ecUpperCase
              TabOrder = 1
              OnEnter = Entra
              OnExit = Sai
            end
          end
        end
      end
    end
    inherited tsBaseCadastroConsulta: TTabSheet
      object gbLines: TGroupBox
        Left = 0
        Top = 0
        Width = 977
        Height = 132
        Align = alTop
        Color = clBtnFace
        ParentColor = False
        TabOrder = 0
        object Label4: TLabel
          Left = 15
          Top = 10
          Width = 26
          Height = 13
          Caption = 'Linha'
          FocusControl = dbDescShort
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -12
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentFont = False
        end
        object Label5: TLabel
          Left = 148
          Top = 10
          Width = 48
          Height = 13
          Caption = 'Descri'#231#227'o'
          FocusControl = dbLinhaDesc
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -12
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentFont = False
        end
        object Label6: TLabel
          Left = 12
          Top = 50
          Width = 42
          Height = 13
          Caption = 'Percurso'
          FocusControl = dbLM_VIADESC
        end
        object lblStatusCardUsers: TLabel
          Tag = 1942
          Left = 496
          Top = 90
          Width = 30
          Height = 13
          Caption = 'Status'
          FocusControl = dbLineMtStatus
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -12
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentFont = False
        end
        object Label2: TLabel
          Left = 425
          Top = 10
          Width = 70
          Height = 13
          Caption = 'Tipo de Linhas'
          FocusControl = dbLT_CODE
        end
        object Label3: TLabel
          Left = 304
          Top = 50
          Width = 57
          Height = 13
          Caption = 'Localiza'#231#227'o'
          FocusControl = dbLOC_CODE
        end
        object Label213: TLabel
          Left = 460
          Top = 50
          Width = 69
          Height = 13
          Caption = 'Possui se'#231#227'o?'
          FocusControl = dbLM_SECTION
        end
        object Label214: TLabel
          Left = 12
          Top = 90
          Width = 36
          Height = 13
          Caption = 'Emissor'
        end
        object Label215: TLabel
          Left = 207
          Top = 90
          Width = 60
          Height = 13
          Caption = 'Abrang'#234'ncia'
        end
        object Label216: TLabel
          Left = 368
          Top = 90
          Width = 61
          Height = 13
          Caption = 'C'#243'd. Externo'
        end
        object dbLinhaDesc: TDBEdit
          Left = 146
          Top = 24
          Width = 269
          Height = 21
          CharCase = ecUpperCase
          DataField = 'LM_DESC'
          DataSource = dtsMaster
          TabOrder = 1
        end
        object dbDescShort: TDBEdit
          Left = 14
          Top = 24
          Width = 119
          Height = 21
          CharCase = ecUpperCase
          DataField = 'LM_DESCSHORT'
          DataSource = dtsMaster
          TabOrder = 0
        end
        object dbLM_VIADESC: TDBEdit
          Left = 12
          Top = 64
          Width = 279
          Height = 21
          CharCase = ecUpperCase
          DataField = 'LM_VIADESC'
          DataSource = dtsMaster
          TabOrder = 3
        end
        object dbLineMtStatus: TRxDBComboBox
          Left = 495
          Top = 104
          Width = 86
          Height = 21
          Style = csDropDownList
          DataField = 'LM_STATUS'
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
        object dbLT_CODE: TRxDBLookupCombo
          Left = 424
          Top = 24
          Width = 157
          Height = 20
          DropDownCount = 8
          DataField = 'LT_CODE'
          DataSource = dtsMaster
          LookupField = 'LT_CODE'
          LookupDisplay = 'LT_DESC'
          LookupSource = DmSys.dtsLineTypes
          TabOrder = 2
        end
        object dbLOC_CODE: TRxDBLookupCombo
          Left = 303
          Top = 64
          Width = 146
          Height = 21
          DropDownCount = 8
          DataField = 'LOC_CODE'
          DataSource = dtsMaster
          LookupField = 'LOC_CODE'
          LookupDisplay = 'LOC_DESC'
          LookupSource = DmSys.dtsLocations
          TabOrder = 4
        end
        object GroupBox1: TGroupBox
          Tag = 1950
          Left = 585
          Top = 11
          Width = 202
          Height = 112
          Caption = 'Empresas'
          TabOrder = 6
          object DBLookupListBox1: TDBLookupListBox
            Left = 2
            Top = 15
            Width = 198
            Height = 95
            Align = alClient
            Color = 13619151
            KeyField = 'TP_DESC'
            ListField = 'TP_ID;TP_DESC'
            ListSource = dmSys1.dtsTPxLM
            TabOrder = 0
          end
        end
        object dbLM_SECTION: TRxDBComboBox
          Left = 460
          Top = 64
          Width = 121
          Height = 21
          Style = csDropDownList
          DataField = 'LM_SECTION'
          DataSource = dtsMaster
          EnableValues = True
          ItemHeight = 13
          Items.Strings = (
            '0 - Normal'
            '1 - Seccionada')
          TabOrder = 7
          Values.Strings = (
            '0'
            '1')
        end
        object dbISS_ID: TRxDBLookupCombo
          Left = 11
          Top = 104
          Width = 186
          Height = 21
          DropDownCount = 8
          DataField = 'ISS_ID'
          DataSource = dtsMaster
          LookupField = 'ISS_ID'
          LookupDisplay = 'ISS_DESCLONG'
          LookupSource = DmSys.dtsIssuers
          TabOrder = 8
        end
        object dbLR_ID: TRxDBLookupCombo
          Left = 206
          Top = 104
          Width = 155
          Height = 21
          DropDownCount = 8
          DataField = 'LR_ID'
          DataSource = dtsMaster
          LookupField = 'LR_ID'
          LookupDisplay = 'LR_DESC'
          LookupSource = dmSys1.dtsLineRange
          TabOrder = 9
        end
        object DBEdit3: TDBEdit
          Left = 367
          Top = 104
          Width = 122
          Height = 21
          DataField = 'LM_EXTCODE'
          DataSource = dtsMaster
          MaxLength = 5
          TabOrder = 10
        end
      end
      object GroupBox3: TGroupBox
        Left = 0
        Top = 132
        Width = 977
        Height = 141
        Align = alTop
        Caption = ' Detalhes '
        TabOrder = 1
        object nbDetalhes: TNotebook
          Left = 2
          Top = 15
          Width = 973
          Height = 124
          Align = alClient
          PageIndex = 1
          TabOrder = 0
          OnPageChanged = nbDetalhesPageChanged
          object TPage
            Left = 0
            Top = 0
            Caption = 'PageGrid'
            object DBGrid2: TDBGrid
              Left = 28
              Top = 0
              Width = 947
              Height = 124
              Align = alClient
              BorderStyle = bsNone
              Ctl3D = True
              DataSource = DmSys.dtsLineDetails
              Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgConfirmDelete, dgCancelOnExit]
              ParentCtl3D = False
              TabOrder = 0
              TitleFont.Charset = DEFAULT_CHARSET
              TitleFont.Color = clWindowText
              TitleFont.Height = -11
              TitleFont.Name = 'MS Sans Serif'
              TitleFont.Style = []
              Columns = <
                item
                  Expanded = False
                  FieldName = 'Ld_Descshort'
                  Title.Caption = 'Linha'
                  Width = 130
                  Visible = True
                end
                item
                  Expanded = False
                  FieldName = 'Ld_Desc'
                  Title.Caption = 'Descri'#231#227'o'
                  Width = 200
                  Visible = True
                end
                item
                  Expanded = False
                  FieldName = 'LDT_DESC'
                  Title.Caption = 'Tipo de Linha'
                  Width = 130
                  Visible = True
                end
                item
                  Expanded = False
                  FieldName = 'Ld_Tpintcode'
                  Width = 96
                  Visible = True
                end
                item
                  Expanded = False
                  FieldName = 'LD_SECTIONSQTY'
                  Title.Caption = 'Quantidade de Se'#231#245'es'
                  Width = 115
                  Visible = True
                end
                item
                  Expanded = False
                  FieldName = 'LD_PBMULTFACT'
                  Title.Caption = 'Passback'
                  Visible = True
                end
                item
                  Expanded = False
                  FieldName = 'Ld_RegDate'
                  Title.Caption = 'Registro'
                  Width = 120
                  Visible = True
                end
                item
                  Expanded = False
                  FieldName = 'LD_REGUSER'
                  Width = 120
                  Visible = True
                end
                item
                  Expanded = False
                  FieldName = 'STATUS_ID'
                  Title.Caption = 'Status'
                  Visible = True
                end>
            end
            object cbDetails: TCoolBar
              Left = 0
              Top = 0
              Width = 28
              Height = 124
              Align = alLeft
              Bands = <
                item
                  Control = ToolBar1
                  ImageIndex = -1
                  MinHeight = 31
                  Width = 120
                end>
              Vertical = True
              object ToolBar1: TToolBar
                Left = 0
                Top = 9
                Width = 31
                Height = 111
                Align = alClient
                Caption = 'ToolBar1'
                EdgeInner = esLowered
                EdgeOuter = esRaised
                Images = imglstBase
                TabOrder = 0
                object tbNewDetalhes: TToolButton
                  Left = 0
                  Top = 2
                  Action = actNewDetail
                  Wrap = True
                end
                object tbEditDetalhes: TToolButton
                  Left = 0
                  Top = 24
                  Action = actEditDetail
                  Wrap = True
                end
                object tbDelDetalhes: TToolButton
                  Left = 0
                  Top = 46
                  Action = actDeleteDetail
                end
              end
            end
          end
          object TPage
            Left = 0
            Top = 0
            Caption = 'PageEdit'
            object SpeedButton5: TSpeedButton
              Left = 599
              Top = 80
              Width = 72
              Height = 28
              Action = actOkDetail
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
            object SpeedButton6: TSpeedButton
              Left = 683
              Top = 80
              Width = 79
              Height = 28
              Action = actCancelDetail
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
            object Label21: TLabel
              Left = 12
              Top = 4
              Width = 26
              Height = 13
              Caption = 'Linha'
            end
            object Label22: TLabel
              Left = 292
              Top = 4
              Width = 65
              Height = 13
              Caption = 'Tipo de Linha'
              FocusControl = dbTipo
            end
            object Label23: TLabel
              Left = 456
              Top = 4
              Width = 49
              Height = 13
              Caption = 'TPintcode'
              FocusControl = DBEdit7
            end
            object Label24: TLabel
              Left = 597
              Top = 4
              Width = 109
              Height = 13
              Caption = 'Quantidade de Se'#231#245'es'
              FocusControl = DBEdit8
            end
            object Label25: TLabel
              Left = 12
              Top = 39
              Width = 48
              Height = 13
              Caption = 'Descri'#231#227'o'
              FocusControl = DBEdit1
            end
            object Label39: TLabel
              Left = 456
              Top = 39
              Width = 30
              Height = 13
              Caption = 'Status'
              FocusControl = dbStatusDetalhes
            end
            object Label217: TLabel
              Left = 292
              Top = 40
              Width = 47
              Height = 13
              Caption = 'Passback'
            end
            object Label226: TLabel
              Left = 12
              Top = 75
              Width = 103
              Height = 13
              Caption = 'Grupo de Integra'#231#245'es'
            end
            object btnGrupoIntegracoes: TSpeedButton
              Left = 523
              Top = 90
              Width = 23
              Height = 22
              Glyph.Data = {
                76010000424D7601000000000000760000002800000020000000100000000100
                04000000000000010000130B0000130B00001000000000000000000000000000
                800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
                FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00333333333333
                333333333333333333FF33333333333330003FF3FFFFF3333777003000003333
                300077F777773F333777E00BFBFB033333337773333F7F33333FE0BFBF000333
                330077F3337773F33377E0FBFBFBF033330077F3333FF7FFF377E0BFBF000000
                333377F3337777773F3FE0FBFBFBFBFB039977F33FFFFFFF7377E0BF00000000
                339977FF777777773377000BFB03333333337773FF733333333F333000333333
                3300333777333333337733333333333333003333333333333377333333333333
                333333333333333333FF33333333333330003333333333333777333333333333
                3000333333333333377733333333333333333333333333333333}
              NumGlyphs = 2
              OnClick = btnGrupoIntegracoesClick
            end
            object dbLinha: TDBEdit
              Left = 12
              Top = 18
              Width = 269
              Height = 21
              CharCase = ecUpperCase
              DataField = 'Ld_Descshort'
              DataSource = DmSys.dtsLineDetails
              TabOrder = 0
            end
            object DBEdit7: TDBEdit
              Left = 456
              Top = 18
              Width = 131
              Height = 21
              CharCase = ecUpperCase
              DataField = 'Ld_Tpintcode'
              DataSource = DmSys.dtsLineDetails
              TabOrder = 2
            end
            object DBEdit8: TDBEdit
              Left = 597
              Top = 18
              Width = 121
              Height = 21
              CharCase = ecUpperCase
              DataField = 'Ld_SectionsQty'
              DataSource = DmSys.dtsLineDetails
              TabOrder = 3
            end
            object DBEdit1: TDBEdit
              Left = 12
              Top = 53
              Width = 269
              Height = 21
              CharCase = ecUpperCase
              DataField = 'LD_DESC'
              DataSource = DmSys.dtsLineDetails
              TabOrder = 4
            end
            object dbTipo: TRxDBLookupCombo
              Left = 292
              Top = 18
              Width = 154
              Height = 21
              DropDownCount = 8
              DataField = 'Ldt_Code'
              DataSource = DmSys.dtsLineDetails
              LookupField = 'Ldt_Code'
              LookupDisplay = 'Ldt_Desc'
              LookupSource = DmSys.dtsLineDetailTpes
              TabOrder = 1
            end
            object dbStatusDetalhes: TRxDBComboBox
              Left = 456
              Top = 53
              Width = 131
              Height = 21
              Style = csDropDownList
              DataField = 'Ld_Status'
              DataSource = DmSys.dtsLineDetails
              EnableValues = True
              ItemHeight = 13
              Items.Strings = (
                'Ativo'
                'Inativo')
              TabOrder = 6
              Values.Strings = (
                'A'
                'I')
            end
            object dbPassback: TDBEdit
              Left = 292
              Top = 53
              Width = 154
              Height = 21
              DataField = 'LD_PBMULTFACT'
              DataSource = DmSys.dtsLineDetails
              TabOrder = 5
            end
            object RxDBLookupCombo2: TRxDBLookupCombo
              Left = 12
              Top = 91
              Width = 435
              Height = 21
              DropDownCount = 15
              DisplayAllFields = True
              DataField = 'LG_ID_INTEG'
              DataSource = dtsMaster
              LookupField = 'LG_ID'
              LookupDisplay = 'LG_ID;LG_DESC'
              LookupSource = DmSys.dtsLineGroups
              TabOrder = 7
            end
            object EditGroupInte: TEdit
              Left = 456
              Top = 91
              Width = 65
              Height = 21
              TabOrder = 8
              OnKeyDown = EditGroupInteKeyDown
            end
          end
        end
      end
      object pcSecoes: TPageControl
        Left = 0
        Top = 273
        Width = 977
        Height = 82
        ActivePage = tabTrechos
        Align = alClient
        Style = tsButtons
        TabHeight = 18
        TabOrder = 2
        OnChanging = pcSecoesChanging
        object TabSheet2: TTabSheet
          Tag = 1970
          Caption = '&Pre'#231'os'
          DesignSize = (
            969
            54)
          object Label10: TLabel
            Left = 200
            Top = 80
            Width = 38
            Height = 13
            Caption = 'Label10'
          end
          object Panel1: TPanel
            Left = 27
            Top = 0
            Width = 41
            Height = 33
            BevelOuter = bvNone
            TabOrder = 0
          end
          object Panel2: TPanel
            Left = 26
            Top = 0
            Width = 942
            Height = 55
            Align = alCustom
            Anchors = [akLeft, akTop, akRight]
            Color = 13816530
            TabOrder = 1
            object Label7: TLabel
              Left = 16
              Top = 8
              Width = 23
              Height = 13
              Caption = 'Data'
              FocusControl = dbDate
            end
            object Label19: TLabel
              Tag = 1777
              Left = 160
              Top = 8
              Width = 47
              Height = 13
              Caption = 'Aplica'#231#227'o'
              FocusControl = dbLkApplications
            end
            object Label9: TLabel
              Tag = 1987
              Left = 542
              Top = 11
              Width = 30
              Height = 13
              Caption = 'Status'
              FocusControl = dbStatusPrice
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Height = -12
              Font.Name = 'MS Sans Serif'
              Font.Style = []
              ParentFont = False
            end
            object Label227: TLabel
              Left = 722
              Top = 9
              Width = 83
              Height = 13
              Caption = 'Validade In'#237'cio....'
            end
            object Label228: TLabel
              Left = 722
              Top = 33
              Width = 87
              Height = 13
              Caption = 'Validade Fim.........'
            end
            object Label229: TLabel
              Left = 949
              Top = 10
              Width = 82
              Height = 13
              Caption = 'Poder de Compra'
            end
            object btnSelectAplicacao: TSpeedButton
              Left = 493
              Top = 23
              Width = 23
              Height = 22
              Hint = 'Selecionar Aplica'#231#227'o...'
              Glyph.Data = {
                76010000424D7601000000000000760000002800000020000000100000000100
                04000000000000010000130B0000130B00001000000000000000000000000000
                800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
                FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00333333333333
                333333333333333333FF33333333333330003FF3FFFFF3333777003000003333
                300077F777773F333777E00BFBFB033333337773333F7F33333FE0BFBF000333
                330077F3337773F33377E0FBFBFBF033330077F3333FF7FFF377E0BFBF000000
                333377F3337777773F3FE0FBFBFBFBFB039977F33FFFFFFF7377E0BF00000000
                339977FF777777773377000BFB03333333337773FF733333333F333000333333
                3300333777333333337733333333333333003333333333333377333333333333
                333333333333333333FF33333333333330003333333333333777333333333333
                3000333333333333377733333333333333333333333333333333}
              NumGlyphs = 2
              OnClick = btnSelectAplicacaoClick
            end
            object dbDate: TDBDateEdit
              Left = 16
              Top = 24
              Width = 137
              Height = 21
              DataField = 'LP_DATE'
              DataSource = dmSys1.dtsLinePrices
              NumGlyphs = 2
              TabOrder = 0
            end
            object dbLkApplications: TRxDBLookupCombo
              Left = 160
              Top = 24
              Width = 329
              Height = 21
              DropDownCount = 8
              DisplayAllFields = True
              LookupField = 'APP_ISS_ID'
              LookupDisplay = 'APP_ID; APP_DESCSHORT; ISS_DESCLONG'
              LookupDisplayIndex = 1
              LookupSource = DmSys.dtsApplicationsLook
              TabOrder = 1
            end
            object dbStatusPrice: TRxDBComboBox
              Left = 576
              Top = 7
              Width = 133
              Height = 21
              Style = csDropDownList
              DataField = 'LP_STATUS'
              DataSource = dmSys1.dtsLinePrices
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
            object dbcbLpBUUseAlternatePrice: TDBCheckBox
              Left = 542
              Top = 33
              Width = 155
              Height = 17
              Caption = 'Valor m'#225'ximo para subs'#237'dio'
              DataField = 'LP_BU_USEALTERNATEPRICE'
              DataSource = dmSys1.dtsLinePrices
              TabOrder = 3
              ValueChecked = '1'
              ValueUnchecked = '0'
              OnClick = dbcbLpBUUseAlternatePriceClick
            end
            object DBDateEdit3: TDBDateEdit
              Left = 800
              Top = 4
              Width = 137
              Height = 21
              DataField = 'DT_INICIO_VALID'
              DataSource = dmSys1.dtsLinePrices
              NumGlyphs = 2
              TabOrder = 4
            end
            object DBDateEdit4: TDBDateEdit
              Left = 800
              Top = 29
              Width = 137
              Height = 21
              DataField = 'DT_FIM_VALID'
              DataSource = dmSys1.dtsLinePrices
              NumGlyphs = 2
              TabOrder = 5
            end
            object DBEdit4: TDBEdit
              Left = 947
              Top = 25
              Width = 65
              Height = 21
              DataField = 'PODER_COMPRA'
              DataSource = dmSys1.dtsLinePrices
              TabOrder = 6
            end
          end
          object PageControl1: TPageControl
            Left = 27
            Top = 55
            Width = 943
            Height = 158
            ActivePage = TabSheet1
            Anchors = [akLeft, akTop, akRight]
            TabOrder = 2
            object TabSheet1: TTabSheet
              Caption = '1 a 10'
              object gbSec01: TGroupBox
                Left = 3
                Top = -2
                Width = 146
                Height = 55
                Caption = 'Se'#231#227'o 1'
                TabOrder = 0
                object Label12: TLabel
                  Left = 4
                  Top = 16
                  Width = 15
                  Height = 13
                  Caption = 'Ida'
                end
                object Label13: TLabel
                  Left = 75
                  Top = 16
                  Width = 24
                  Height = 13
                  Caption = 'Volta'
                end
                object dbeSecID01: TDBEdit
                  Left = 3
                  Top = 29
                  Width = 65
                  Height = 21
                  DataField = 'LP_SCT1_IDA'
                  DataSource = dmSys1.dtsLinePrices
                  TabOrder = 0
                end
                object dbeSecVT01: TDBEdit
                  Left = 74
                  Top = 29
                  Width = 67
                  Height = 21
                  DataField = 'LP_SCT1_VOLTA'
                  DataSource = dmSys1.dtsLinePrices
                  TabOrder = 1
                end
              end
              object gbSec02: TGroupBox
                Left = 152
                Top = -2
                Width = 146
                Height = 55
                Caption = 'Se'#231#227'o 2'
                TabOrder = 1
                object Label8: TLabel
                  Left = 4
                  Top = 16
                  Width = 15
                  Height = 13
                  Caption = 'Ida'
                end
                object Label11: TLabel
                  Left = 75
                  Top = 16
                  Width = 24
                  Height = 13
                  Caption = 'Volta'
                end
                object dbeSecID02: TDBEdit
                  Left = 3
                  Top = 29
                  Width = 65
                  Height = 21
                  DataField = 'LP_SCT2_IDA'
                  DataSource = dmSys1.dtsLinePrices
                  TabOrder = 0
                end
                object dbeSecVT02: TDBEdit
                  Left = 74
                  Top = 29
                  Width = 67
                  Height = 21
                  DataField = 'LP_SCT2_VOLTA'
                  DataSource = dmSys1.dtsLinePrices
                  TabOrder = 1
                end
              end
              object gbSec03: TGroupBox
                Left = 302
                Top = -1
                Width = 146
                Height = 55
                Caption = 'Se'#231#227'o 3'
                Color = clBtnFace
                ParentColor = False
                TabOrder = 2
                object Label14: TLabel
                  Left = 4
                  Top = 16
                  Width = 15
                  Height = 13
                  Caption = 'Ida'
                end
                object Label15: TLabel
                  Left = 75
                  Top = 16
                  Width = 24
                  Height = 13
                  Caption = 'Volta'
                end
                object dbeSecID03: TDBEdit
                  Left = 3
                  Top = 29
                  Width = 65
                  Height = 21
                  DataField = 'LP_SCT3_IDA'
                  DataSource = dmSys1.dtsLinePrices
                  TabOrder = 0
                end
                object dbeSecVT03: TDBEdit
                  Left = 74
                  Top = 29
                  Width = 67
                  Height = 21
                  DataField = 'LP_SCT3_VOLTA'
                  DataSource = dmSys1.dtsLinePrices
                  TabOrder = 1
                end
              end
              object gbSec04: TGroupBox
                Left = 452
                Top = -1
                Width = 146
                Height = 55
                Caption = 'Se'#231#227'o 4'
                TabOrder = 3
                object Label16: TLabel
                  Left = 4
                  Top = 16
                  Width = 15
                  Height = 13
                  Caption = 'Ida'
                end
                object Label17: TLabel
                  Left = 75
                  Top = 16
                  Width = 24
                  Height = 13
                  Caption = 'Volta'
                end
                object dbeSecID04: TDBEdit
                  Left = 3
                  Top = 29
                  Width = 65
                  Height = 21
                  DataField = 'LP_SCT4_IDA'
                  DataSource = dmSys1.dtsLinePrices
                  TabOrder = 0
                end
                object dbeSecVT04: TDBEdit
                  Left = 74
                  Top = 29
                  Width = 67
                  Height = 21
                  DataField = 'LP_SCT4_VOLTA'
                  DataSource = dmSys1.dtsLinePrices
                  TabOrder = 1
                end
              end
              object gbSec05: TGroupBox
                Left = 603
                Top = -1
                Width = 146
                Height = 55
                Caption = 'Se'#231#227'o 5'
                TabOrder = 4
                object Label18: TLabel
                  Left = 4
                  Top = 16
                  Width = 15
                  Height = 13
                  Caption = 'Ida'
                end
                object Label20: TLabel
                  Left = 75
                  Top = 16
                  Width = 24
                  Height = 13
                  Caption = 'Volta'
                end
                object dbeSecID05: TDBEdit
                  Left = 3
                  Top = 29
                  Width = 65
                  Height = 21
                  DataField = 'LP_SCT5_IDA'
                  DataSource = dmSys1.dtsLinePrices
                  TabOrder = 0
                end
                object dbeSecVT05: TDBEdit
                  Left = 74
                  Top = 29
                  Width = 67
                  Height = 21
                  DataField = 'LP_SCT5_VOLTA'
                  DataSource = dmSys1.dtsLinePrices
                  TabOrder = 1
                end
              end
              object gbSec06: TGroupBox
                Left = 3
                Top = 54
                Width = 146
                Height = 55
                Caption = 'Se'#231#227'o 6'
                TabOrder = 5
                object Label26: TLabel
                  Left = 4
                  Top = 16
                  Width = 15
                  Height = 13
                  Caption = 'Ida'
                end
                object Label27: TLabel
                  Left = 75
                  Top = 16
                  Width = 24
                  Height = 13
                  Caption = 'Volta'
                end
                object dbeSecID06: TDBEdit
                  Left = 3
                  Top = 29
                  Width = 65
                  Height = 21
                  DataField = 'LP_SCT6_IDA'
                  DataSource = dmSys1.dtsLinePrices
                  TabOrder = 0
                end
                object dbeSecVT06: TDBEdit
                  Left = 74
                  Top = 29
                  Width = 67
                  Height = 21
                  DataField = 'LP_SCT6_VOLTA'
                  DataSource = dmSys1.dtsLinePrices
                  TabOrder = 1
                end
              end
              object gbSec07: TGroupBox
                Left = 152
                Top = 54
                Width = 146
                Height = 55
                Caption = 'Se'#231#227'o 7'
                TabOrder = 6
                object Label29: TLabel
                  Left = 4
                  Top = 16
                  Width = 15
                  Height = 13
                  Caption = 'Ida'
                end
                object Label30: TLabel
                  Left = 75
                  Top = 16
                  Width = 24
                  Height = 13
                  Caption = 'Volta'
                end
                object dbeSecID07: TDBEdit
                  Left = 3
                  Top = 29
                  Width = 65
                  Height = 21
                  DataField = 'LP_SCT7_IDA'
                  DataSource = dmSys1.dtsLinePrices
                  TabOrder = 0
                end
                object dbeSecVT07: TDBEdit
                  Left = 74
                  Top = 29
                  Width = 67
                  Height = 21
                  DataField = 'LP_SCT7_VOLTA'
                  DataSource = dmSys1.dtsLinePrices
                  TabOrder = 1
                end
              end
              object gbSec08: TGroupBox
                Left = 302
                Top = 54
                Width = 146
                Height = 55
                Caption = 'Se'#231#227'o 8'
                TabOrder = 7
                object Label31: TLabel
                  Left = 4
                  Top = 16
                  Width = 15
                  Height = 13
                  Caption = 'Ida'
                end
                object Label32: TLabel
                  Left = 75
                  Top = 16
                  Width = 24
                  Height = 13
                  Caption = 'Volta'
                end
                object dbeSecID08: TDBEdit
                  Left = 3
                  Top = 29
                  Width = 65
                  Height = 21
                  DataField = 'LP_SCT8_IDA'
                  DataSource = dmSys1.dtsLinePrices
                  TabOrder = 0
                end
                object dbeSecVT08: TDBEdit
                  Left = 74
                  Top = 29
                  Width = 67
                  Height = 21
                  DataField = 'LP_SCT8_VOLTA'
                  DataSource = dmSys1.dtsLinePrices
                  TabOrder = 1
                end
              end
              object gbSec09: TGroupBox
                Left = 452
                Top = 54
                Width = 146
                Height = 55
                Caption = 'Se'#231#227'o 9'
                TabOrder = 8
                object Label35: TLabel
                  Left = 4
                  Top = 16
                  Width = 15
                  Height = 13
                  Caption = 'Ida'
                end
                object Label37: TLabel
                  Left = 75
                  Top = 16
                  Width = 24
                  Height = 13
                  Caption = 'Volta'
                end
                object dbeSecID09: TDBEdit
                  Left = 3
                  Top = 29
                  Width = 65
                  Height = 21
                  DataField = 'LP_SCT9_IDA'
                  DataSource = dmSys1.dtsLinePrices
                  TabOrder = 0
                end
                object dbeSecVT09: TDBEdit
                  Left = 74
                  Top = 29
                  Width = 67
                  Height = 21
                  DataField = 'LP_SCT9_VOLTA'
                  DataSource = dmSys1.dtsLinePrices
                  TabOrder = 1
                end
              end
              object gbSec10: TGroupBox
                Left = 603
                Top = 54
                Width = 146
                Height = 55
                Caption = 'Se'#231#227'o 10'
                TabOrder = 9
                object Label38: TLabel
                  Left = 4
                  Top = 16
                  Width = 15
                  Height = 13
                  Caption = 'Ida'
                end
                object Label42: TLabel
                  Left = 75
                  Top = 16
                  Width = 24
                  Height = 13
                  Caption = 'Volta'
                end
                object dbeSecID10: TDBEdit
                  Left = 3
                  Top = 29
                  Width = 65
                  Height = 21
                  DataField = 'LP_SCT10_IDA'
                  DataSource = dmSys1.dtsLinePrices
                  TabOrder = 0
                end
                object dbeSecVT10: TDBEdit
                  Left = 74
                  Top = 29
                  Width = 67
                  Height = 21
                  DataField = 'LP_SCT10_VOLTA'
                  DataSource = dmSys1.dtsLinePrices
                  TabOrder = 1
                end
              end
            end
            object TabSheet4: TTabSheet
              Caption = '11 - 20'
              ImageIndex = 1
              object gbSec11: TGroupBox
                Left = 3
                Top = -2
                Width = 146
                Height = 55
                Caption = 'Se'#231#227'o 11'
                TabOrder = 0
                object Label43: TLabel
                  Left = 4
                  Top = 16
                  Width = 15
                  Height = 13
                  Caption = 'Ida'
                end
                object Label44: TLabel
                  Left = 75
                  Top = 16
                  Width = 24
                  Height = 13
                  Caption = 'Volta'
                end
                object dbeSecID11: TDBEdit
                  Left = 3
                  Top = 29
                  Width = 65
                  Height = 21
                  DataField = 'LP_SCT11_IDA'
                  DataSource = dmSys1.dtsLinePrices
                  TabOrder = 0
                end
                object dbeSecVT11: TDBEdit
                  Left = 74
                  Top = 29
                  Width = 67
                  Height = 21
                  DataField = 'LP_SCT11_VOLTA'
                  DataSource = dmSys1.dtsLinePrices
                  TabOrder = 1
                end
              end
              object gbSec12: TGroupBox
                Left = 152
                Top = -2
                Width = 146
                Height = 55
                Caption = 'Se'#231#227'o 12'
                TabOrder = 1
                object Label45: TLabel
                  Left = 4
                  Top = 16
                  Width = 15
                  Height = 13
                  Caption = 'Ida'
                end
                object Label46: TLabel
                  Left = 75
                  Top = 16
                  Width = 24
                  Height = 13
                  Caption = 'Volta'
                end
                object dbeSecID12: TDBEdit
                  Left = 3
                  Top = 29
                  Width = 65
                  Height = 21
                  DataField = 'LP_SCT12_IDA'
                  DataSource = dmSys1.dtsLinePrices
                  TabOrder = 0
                end
                object dbeSecVT12: TDBEdit
                  Left = 74
                  Top = 29
                  Width = 67
                  Height = 21
                  DataField = 'LP_SCT12_VOLTA'
                  DataSource = dmSys1.dtsLinePrices
                  TabOrder = 1
                end
              end
              object gbSec13: TGroupBox
                Left = 302
                Top = -2
                Width = 146
                Height = 55
                Caption = 'Se'#231#227'o 13'
                TabOrder = 2
                object Label47: TLabel
                  Left = 4
                  Top = 16
                  Width = 15
                  Height = 13
                  Caption = 'Ida'
                end
                object Label48: TLabel
                  Left = 75
                  Top = 16
                  Width = 24
                  Height = 13
                  Caption = 'Volta'
                end
                object dbeSecID13: TDBEdit
                  Left = 3
                  Top = 29
                  Width = 65
                  Height = 21
                  DataField = 'LP_SCT13_IDA'
                  DataSource = dmSys1.dtsLinePrices
                  TabOrder = 0
                end
                object dbeSecVT13: TDBEdit
                  Left = 74
                  Top = 29
                  Width = 67
                  Height = 21
                  DataField = 'LP_SCT13_VOLTA'
                  DataSource = dmSys1.dtsLinePrices
                  TabOrder = 1
                end
              end
              object gbSec14: TGroupBox
                Left = 452
                Top = -2
                Width = 146
                Height = 55
                Caption = 'Se'#231#227'o 14'
                TabOrder = 3
                object Label49: TLabel
                  Left = 4
                  Top = 16
                  Width = 15
                  Height = 13
                  Caption = 'Ida'
                end
                object Label50: TLabel
                  Left = 75
                  Top = 16
                  Width = 24
                  Height = 13
                  Caption = 'Volta'
                end
                object dbeSecID14: TDBEdit
                  Left = 3
                  Top = 29
                  Width = 65
                  Height = 21
                  DataField = 'LP_SCT14_IDA'
                  DataSource = dmSys1.dtsLinePrices
                  TabOrder = 0
                end
                object dbeSecVT14: TDBEdit
                  Left = 74
                  Top = 29
                  Width = 67
                  Height = 21
                  DataField = 'LP_SCT14_VOLTA'
                  DataSource = dmSys1.dtsLinePrices
                  TabOrder = 1
                end
              end
              object gbSec15: TGroupBox
                Left = 603
                Top = -2
                Width = 146
                Height = 55
                Caption = 'Se'#231#227'o 15'
                TabOrder = 4
                object Label51: TLabel
                  Left = 4
                  Top = 16
                  Width = 15
                  Height = 13
                  Caption = 'Ida'
                end
                object Label52: TLabel
                  Left = 75
                  Top = 16
                  Width = 24
                  Height = 13
                  Caption = 'Volta'
                end
                object dbeSecID15: TDBEdit
                  Left = 3
                  Top = 29
                  Width = 65
                  Height = 21
                  DataField = 'LP_SCT15_IDA'
                  DataSource = dmSys1.dtsLinePrices
                  TabOrder = 0
                end
                object dbeSecVT15: TDBEdit
                  Left = 74
                  Top = 29
                  Width = 67
                  Height = 21
                  DataField = 'LP_SCT15_VOLTA'
                  DataSource = dmSys1.dtsLinePrices
                  TabOrder = 1
                end
              end
              object gbSec20: TGroupBox
                Left = 603
                Top = 54
                Width = 146
                Height = 55
                Caption = 'Se'#231#227'o 20'
                TabOrder = 5
                object Label53: TLabel
                  Left = 4
                  Top = 16
                  Width = 15
                  Height = 13
                  Caption = 'Ida'
                end
                object Label54: TLabel
                  Left = 75
                  Top = 16
                  Width = 24
                  Height = 13
                  Caption = 'Volta'
                end
                object dbeSecID20: TDBEdit
                  Left = 3
                  Top = 29
                  Width = 65
                  Height = 21
                  DataField = 'LP_SCT20_IDA'
                  DataSource = dmSys1.dtsLinePrices
                  TabOrder = 0
                end
                object dbeSecVT20: TDBEdit
                  Left = 74
                  Top = 29
                  Width = 67
                  Height = 21
                  DataField = 'LP_SCT20_VOLTA'
                  DataSource = dmSys1.dtsLinePrices
                  TabOrder = 1
                end
              end
              object gbSec19: TGroupBox
                Left = 452
                Top = 54
                Width = 146
                Height = 55
                Caption = 'Se'#231#227'o 19'
                TabOrder = 6
                object Label55: TLabel
                  Left = 4
                  Top = 16
                  Width = 15
                  Height = 13
                  Caption = 'Ida'
                end
                object Label56: TLabel
                  Left = 75
                  Top = 16
                  Width = 24
                  Height = 13
                  Caption = 'Volta'
                end
                object dbeSecID19: TDBEdit
                  Left = 3
                  Top = 29
                  Width = 65
                  Height = 21
                  DataField = 'LP_SCT19_IDA'
                  DataSource = dmSys1.dtsLinePrices
                  TabOrder = 0
                end
                object dbeSecVT19: TDBEdit
                  Left = 74
                  Top = 29
                  Width = 67
                  Height = 21
                  DataField = 'LP_SCT19_VOLTA'
                  DataSource = dmSys1.dtsLinePrices
                  TabOrder = 1
                end
              end
              object gbSec18: TGroupBox
                Left = 302
                Top = 54
                Width = 146
                Height = 55
                Caption = 'Se'#231#227'o 18'
                TabOrder = 7
                object Label57: TLabel
                  Left = 4
                  Top = 16
                  Width = 15
                  Height = 13
                  Caption = 'Ida'
                end
                object Label58: TLabel
                  Left = 75
                  Top = 16
                  Width = 24
                  Height = 13
                  Caption = 'Volta'
                end
                object dbeSecID18: TDBEdit
                  Left = 3
                  Top = 29
                  Width = 65
                  Height = 21
                  DataField = 'LP_SCT18_IDA'
                  DataSource = dmSys1.dtsLinePrices
                  TabOrder = 0
                end
                object dbeSecVT18: TDBEdit
                  Left = 74
                  Top = 29
                  Width = 67
                  Height = 21
                  DataField = 'LP_SCT18_VOLTA'
                  DataSource = dmSys1.dtsLinePrices
                  TabOrder = 1
                end
              end
              object gbSec17: TGroupBox
                Left = 152
                Top = 54
                Width = 146
                Height = 55
                Caption = 'Se'#231#227'o 17'
                TabOrder = 8
                object Label59: TLabel
                  Left = 4
                  Top = 16
                  Width = 15
                  Height = 13
                  Caption = 'Ida'
                end
                object Label60: TLabel
                  Left = 75
                  Top = 16
                  Width = 24
                  Height = 13
                  Caption = 'Volta'
                end
                object dbeSecID17: TDBEdit
                  Left = 3
                  Top = 29
                  Width = 65
                  Height = 21
                  DataField = 'LP_SCT17_IDA'
                  DataSource = dmSys1.dtsLinePrices
                  TabOrder = 0
                end
                object dbeSecVT17: TDBEdit
                  Left = 74
                  Top = 29
                  Width = 67
                  Height = 21
                  DataField = 'LP_SCT17_VOLTA'
                  DataSource = dmSys1.dtsLinePrices
                  TabOrder = 1
                end
              end
              object gbSec16: TGroupBox
                Left = 3
                Top = 54
                Width = 146
                Height = 55
                Caption = 'Se'#231#227'o 16'
                TabOrder = 9
                object Label61: TLabel
                  Left = 4
                  Top = 16
                  Width = 15
                  Height = 13
                  Caption = 'Ida'
                end
                object Label62: TLabel
                  Left = 75
                  Top = 16
                  Width = 24
                  Height = 13
                  Caption = 'Volta'
                end
                object dbeSecID16: TDBEdit
                  Left = 3
                  Top = 29
                  Width = 65
                  Height = 21
                  DataField = 'LP_SCT16_IDA'
                  DataSource = dmSys1.dtsLinePrices
                  TabOrder = 0
                end
                object dbeSecVT16: TDBEdit
                  Left = 74
                  Top = 29
                  Width = 67
                  Height = 21
                  DataField = 'LP_SCT16_VOLTA'
                  DataSource = dmSys1.dtsLinePrices
                  TabOrder = 1
                end
              end
            end
            object TabSheet5: TTabSheet
              Caption = '21 - 30'
              ImageIndex = 2
              object gbSec21: TGroupBox
                Left = 3
                Top = -2
                Width = 146
                Height = 55
                Caption = 'Se'#231#227'o 21'
                TabOrder = 0
                object Label63: TLabel
                  Left = 4
                  Top = 16
                  Width = 15
                  Height = 13
                  Caption = 'Ida'
                end
                object Label64: TLabel
                  Left = 75
                  Top = 16
                  Width = 24
                  Height = 13
                  Caption = 'Volta'
                end
                object dbeSecID21: TDBEdit
                  Left = 3
                  Top = 29
                  Width = 65
                  Height = 21
                  DataField = 'LP_SCT21_IDA'
                  DataSource = dmSys1.dtsLinePrices
                  TabOrder = 0
                end
                object dbeSecVT21: TDBEdit
                  Left = 74
                  Top = 29
                  Width = 67
                  Height = 21
                  DataField = 'LP_SCT21_VOLTA'
                  DataSource = dmSys1.dtsLinePrices
                  TabOrder = 1
                end
              end
              object gbSec22: TGroupBox
                Left = 152
                Top = -2
                Width = 146
                Height = 55
                Caption = 'Se'#231#227'o 22'
                TabOrder = 1
                object Label65: TLabel
                  Left = 4
                  Top = 16
                  Width = 15
                  Height = 13
                  Caption = 'Ida'
                end
                object Label66: TLabel
                  Left = 75
                  Top = 16
                  Width = 24
                  Height = 13
                  Caption = 'Volta'
                end
                object dbeSecID22: TDBEdit
                  Left = 3
                  Top = 29
                  Width = 65
                  Height = 21
                  DataField = 'LP_SCT22_IDA'
                  DataSource = dmSys1.dtsLinePrices
                  TabOrder = 0
                end
                object dbeSecVT22: TDBEdit
                  Left = 74
                  Top = 29
                  Width = 67
                  Height = 21
                  DataField = 'LP_SCT22_VOLTA'
                  DataSource = dmSys1.dtsLinePrices
                  TabOrder = 1
                end
              end
              object gbSec23: TGroupBox
                Left = 302
                Top = -2
                Width = 146
                Height = 55
                Caption = 'Se'#231#227'o 23'
                TabOrder = 2
                object Label67: TLabel
                  Left = 4
                  Top = 16
                  Width = 15
                  Height = 13
                  Caption = 'Ida'
                end
                object Label68: TLabel
                  Left = 75
                  Top = 16
                  Width = 24
                  Height = 13
                  Caption = 'Volta'
                end
                object dbeSecID23: TDBEdit
                  Left = 3
                  Top = 29
                  Width = 65
                  Height = 21
                  DataField = 'LP_SCT23_IDA'
                  DataSource = dmSys1.dtsLinePrices
                  TabOrder = 0
                end
                object dbeSecVT23: TDBEdit
                  Left = 74
                  Top = 29
                  Width = 67
                  Height = 21
                  DataField = 'LP_SCT23_VOLTA'
                  DataSource = dmSys1.dtsLinePrices
                  TabOrder = 1
                end
              end
              object gbSec24: TGroupBox
                Left = 452
                Top = -2
                Width = 146
                Height = 55
                Caption = 'Se'#231#227'o 24'
                TabOrder = 3
                object Label69: TLabel
                  Left = 4
                  Top = 16
                  Width = 15
                  Height = 13
                  Caption = 'Ida'
                end
                object Label70: TLabel
                  Left = 75
                  Top = 16
                  Width = 24
                  Height = 13
                  Caption = 'Volta'
                end
                object dbeSecID24: TDBEdit
                  Left = 3
                  Top = 29
                  Width = 65
                  Height = 21
                  DataField = 'LP_SCT24_IDA'
                  DataSource = dmSys1.dtsLinePrices
                  TabOrder = 0
                end
                object dbeSecVT24: TDBEdit
                  Left = 74
                  Top = 29
                  Width = 67
                  Height = 21
                  DataField = 'LP_SCT24_VOLTA'
                  DataSource = dmSys1.dtsLinePrices
                  TabOrder = 1
                end
              end
              object gbSec25: TGroupBox
                Left = 603
                Top = -2
                Width = 146
                Height = 55
                Caption = 'Se'#231#227'o 25'
                TabOrder = 4
                object Label71: TLabel
                  Left = 4
                  Top = 16
                  Width = 15
                  Height = 13
                  Caption = 'Ida'
                end
                object Label72: TLabel
                  Left = 75
                  Top = 16
                  Width = 24
                  Height = 13
                  Caption = 'Volta'
                end
                object dbeSecID25: TDBEdit
                  Left = 3
                  Top = 29
                  Width = 65
                  Height = 21
                  DataField = 'LP_SCT25_IDA'
                  DataSource = dmSys1.dtsLinePrices
                  TabOrder = 0
                end
                object dbeSecVT25: TDBEdit
                  Left = 74
                  Top = 29
                  Width = 67
                  Height = 21
                  DataField = 'LP_SCT25_VOLTA'
                  DataSource = dmSys1.dtsLinePrices
                  TabOrder = 1
                end
              end
              object gbSec29: TGroupBox
                Left = 452
                Top = 54
                Width = 146
                Height = 55
                Caption = 'Se'#231#227'o 29'
                TabOrder = 5
                object Label75: TLabel
                  Left = 4
                  Top = 16
                  Width = 15
                  Height = 13
                  Caption = 'Ida'
                end
                object Label76: TLabel
                  Left = 75
                  Top = 16
                  Width = 24
                  Height = 13
                  Caption = 'Volta'
                end
                object dbeSecID29: TDBEdit
                  Left = 3
                  Top = 29
                  Width = 65
                  Height = 21
                  DataField = 'LP_SCT29_IDA'
                  DataSource = dmSys1.dtsLinePrices
                  TabOrder = 0
                end
                object dbeSecVT29: TDBEdit
                  Left = 74
                  Top = 29
                  Width = 67
                  Height = 21
                  DataField = 'LP_SCT29_VOLTA'
                  DataSource = dmSys1.dtsLinePrices
                  TabOrder = 1
                end
              end
              object gbSec28: TGroupBox
                Left = 302
                Top = 54
                Width = 146
                Height = 55
                Caption = 'Se'#231#227'o 28'
                TabOrder = 6
                object Label77: TLabel
                  Left = 4
                  Top = 16
                  Width = 15
                  Height = 13
                  Caption = 'Ida'
                end
                object Label78: TLabel
                  Left = 75
                  Top = 16
                  Width = 24
                  Height = 13
                  Caption = 'Volta'
                end
                object dbeSecID28: TDBEdit
                  Left = 3
                  Top = 29
                  Width = 65
                  Height = 21
                  DataField = 'LP_SCT28_IDA'
                  DataSource = dmSys1.dtsLinePrices
                  TabOrder = 0
                end
                object dbeSecVT28: TDBEdit
                  Left = 74
                  Top = 29
                  Width = 67
                  Height = 21
                  DataField = 'LP_SCT28_VOLTA'
                  DataSource = dmSys1.dtsLinePrices
                  TabOrder = 1
                end
              end
              object gbSec27: TGroupBox
                Left = 152
                Top = 54
                Width = 146
                Height = 55
                Caption = 'Se'#231#227'o 27'
                TabOrder = 7
                object Label79: TLabel
                  Left = 4
                  Top = 16
                  Width = 15
                  Height = 13
                  Caption = 'Ida'
                end
                object Label80: TLabel
                  Left = 75
                  Top = 16
                  Width = 24
                  Height = 13
                  Caption = 'Volta'
                end
                object dbeSecID27: TDBEdit
                  Left = 3
                  Top = 29
                  Width = 65
                  Height = 21
                  DataField = 'LP_SCT27_IDA'
                  DataSource = dmSys1.dtsLinePrices
                  TabOrder = 0
                end
                object dbeSecVT27: TDBEdit
                  Left = 74
                  Top = 29
                  Width = 67
                  Height = 21
                  DataField = 'LP_SCT27_VOLTA'
                  DataSource = dmSys1.dtsLinePrices
                  TabOrder = 1
                end
              end
              object gbSec26: TGroupBox
                Left = 3
                Top = 54
                Width = 146
                Height = 55
                Caption = 'Se'#231#227'o 26'
                TabOrder = 8
                object Label81: TLabel
                  Left = 4
                  Top = 16
                  Width = 15
                  Height = 13
                  Caption = 'Ida'
                end
                object Label82: TLabel
                  Left = 75
                  Top = 16
                  Width = 24
                  Height = 13
                  Caption = 'Volta'
                end
                object dbeSecID26: TDBEdit
                  Left = 3
                  Top = 29
                  Width = 65
                  Height = 21
                  DataField = 'LP_SCT26_IDA'
                  DataSource = dmSys1.dtsLinePrices
                  TabOrder = 0
                end
                object dbeSecVT26: TDBEdit
                  Left = 74
                  Top = 29
                  Width = 67
                  Height = 21
                  DataField = 'LP_SCT26_VOLTA'
                  DataSource = dmSys1.dtsLinePrices
                  TabOrder = 1
                end
              end
              object gbSec30: TGroupBox
                Left = 603
                Top = 54
                Width = 146
                Height = 55
                Caption = 'Se'#231#227'o 30'
                TabOrder = 9
                object Label73: TLabel
                  Left = 4
                  Top = 16
                  Width = 15
                  Height = 13
                  Caption = 'Ida'
                end
                object Label74: TLabel
                  Left = 75
                  Top = 16
                  Width = 24
                  Height = 13
                  Caption = 'Volta'
                end
                object dbeSecID30: TDBEdit
                  Left = 3
                  Top = 29
                  Width = 65
                  Height = 21
                  DataField = 'LP_SCT30_IDA'
                  DataSource = dmSys1.dtsLinePrices
                  TabOrder = 0
                end
                object dbeSecVT30: TDBEdit
                  Left = 74
                  Top = 29
                  Width = 67
                  Height = 21
                  DataField = 'LP_SCT29_VOLTA'
                  DataSource = dmSys1.dtsLinePrices
                  TabOrder = 1
                end
              end
            end
          end
          object plPriceOK: TPanel
            Left = 0
            Top = 22
            Width = 969
            Height = 32
            Align = alBottom
            TabOrder = 4
            Visible = False
            object BitBtn2: TBitBtn
              Left = 601
              Top = 4
              Width = 81
              Height = 27
              Action = actOkPrice
              Caption = 'actOkPrice'
              TabOrder = 0
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
            object BitBtn3: TBitBtn
              Left = 689
              Top = 4
              Width = 81
              Height = 27
              Action = actCancelPrice
              Caption = 'actCancelPrice'
              TabOrder = 1
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
          object cbPrices: TCoolBar
            Left = 0
            Top = 0
            Width = -75
            Height = 22
            Align = alLeft
            Anchors = [akLeft, akTop, akRight, akBottom]
            AutoSize = True
            Bands = <
              item
                Control = ToolBar3
                ImageIndex = -1
                MinHeight = 23
                Width = 161
              end>
            Vertical = True
            object ToolBar3: TToolBar
              Left = 0
              Top = 9
              Width = 23
              Height = 152
              Align = alLeft
              Caption = 'tbCardsApps'
              Images = imglstBase
              TabOrder = 0
              object tbnewprices: TToolButton
                Left = 0
                Top = 2
                Action = actNewPrice
                Wrap = True
              end
              object tbEditPrices: TToolButton
                Left = 0
                Top = 24
                Action = actEditPrice
                Wrap = True
              end
              object tbDeletePrices: TToolButton
                Left = 0
                Top = 46
                Action = actDeletePrice
              end
            end
          end
          object pnlPrice: TPanel
            Left = -75
            Top = 0
            Width = 1044
            Height = 22
            Align = alClient
            BevelOuter = bvNone
            TabOrder = 5
            object pnlPriceLeft: TPanel
              Left = 0
              Top = 0
              Width = 785
              Height = 165
              Align = alClient
              BevelOuter = bvNone
              TabOrder = 0
              object dbgLinePrices: TDBGrid
                Left = 0
                Top = 0
                Width = 785
                Height = 165
                Align = alClient
                Ctl3D = True
                DataSource = dmSys1.dtsLinePrices
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clWindowText
                Font.Height = -9
                Font.Name = 'MS Sans Serif'
                Font.Style = []
                Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgRowSelect]
                ParentCtl3D = False
                ParentFont = False
                TabOrder = 0
                TitleFont.Charset = DEFAULT_CHARSET
                TitleFont.Color = clWindowText
                TitleFont.Height = -11
                TitleFont.Name = 'MS Sans Serif'
                TitleFont.Style = []
                OnDrawColumnCell = dbgDrawColumnCell
                Columns = <
                  item
                    Expanded = False
                    FieldName = 'LP_DATE'
                    Title.Caption = 'Data'
                    Width = 85
                    Visible = True
                  end
                  item
                    Expanded = False
                    FieldName = 'ISS_ID'
                    Title.Caption = 'Emissor'
                    Width = 150
                    Visible = True
                  end
                  item
                    Expanded = False
                    FieldName = 'APP_ID'
                    Title.Caption = 'Aplica'#231#227'o'
                    Width = 150
                    Visible = True
                  end
                  item
                    Expanded = False
                    FieldName = 'LP_SCT1_IDA'
                    Visible = False
                  end
                  item
                    Expanded = False
                    FieldName = 'LP_SCT1_VOLTA'
                    Visible = False
                  end
                  item
                    Expanded = False
                    FieldName = 'LP_REGDATE'
                    Title.Caption = 'Registro'
                    Width = 100
                    Visible = True
                  end
                  item
                    Expanded = False
                    FieldName = 'LP_REGUSER'
                    Title.Caption = 'Usu'#225'rio'
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
                    FieldName = 'LP_BU_USEALTERNATEPRICE'
                    Title.Caption = 'Val. m'#225'x. p/ subs'#237'dio'
                    Visible = True
                  end
                  item
                    Expanded = False
                    FieldName = 'DT_INICIO_VALID'
                    Title.Caption = 'Validade In'#237'cio'
                    Width = 80
                    Visible = True
                  end
                  item
                    Expanded = False
                    FieldName = 'DT_FIM_VALID'
                    Title.Caption = 'Validade Fim'
                    Width = 70
                    Visible = True
                  end
                  item
                    Expanded = False
                    FieldName = 'PODER_COMPRA'
                    Title.Caption = 'Poder de Compra'
                    Width = 88
                    Visible = True
                  end>
              end
            end
            object pnlPriceRight: TPanel
              Left = 785
              Top = 0
              Width = 259
              Height = 165
              Align = alRight
              BevelOuter = bvNone
              TabOrder = 1
              object DBGrid3: TDBGrid
                Left = 0
                Top = 0
                Width = 259
                Height = 165
                Align = alClient
                DataSource = dmSys1.dtsLinePricesIndividual
                Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgConfirmDelete, dgCancelOnExit]
                TabOrder = 0
                TitleFont.Charset = DEFAULT_CHARSET
                TitleFont.Color = clWindowText
                TitleFont.Height = -11
                TitleFont.Name = 'MS Sans Serif'
                TitleFont.Style = []
                Columns = <
                  item
                    Expanded = False
                    FieldName = 'LPI_SECTION'
                    Width = 45
                    Visible = True
                  end
                  item
                    Expanded = False
                    FieldName = 'LPI_PRICE_GO'
                    Width = 78
                    Visible = True
                  end
                  item
                    Expanded = False
                    FieldName = 'LPI_PRICE_BACK'
                    Width = 78
                    Visible = True
                  end>
              end
            end
          end
        end
        object TabSheet3: TTabSheet
          Tag = 1985
          Caption = '&Descontos'
          ImageIndex = 1
          DesignSize = (
            969
            54)
          object Panel3: TPanel
            Left = 25
            Top = 0
            Width = 943
            Height = 76
            Align = alCustom
            Anchors = [akLeft, akTop, akRight]
            TabOrder = 0
            object Label83: TLabel
              Left = 12
              Top = 38
              Width = 53
              Height = 13
              Caption = 'Data Inicial'
            end
            object Label84: TLabel
              Tag = 1777
              Left = 12
              Top = 2
              Width = 47
              Height = 13
              Caption = 'Aplica'#231#227'o'
              FocusControl = dbLkApplicationsDiscounts
            end
            object Label85: TLabel
              Tag = 1987
              Left = 619
              Top = 2
              Width = 30
              Height = 13
              Caption = 'Status'
              FocusControl = RxDBComboBox1
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Height = -12
              Font.Name = 'MS Sans Serif'
              Font.Style = []
              ParentFont = False
            end
            object Label41: TLabel
              Left = 362
              Top = 2
              Width = 85
              Height = 13
              Caption = 'Tipo de Desconto'
            end
            object Label28: TLabel
              Left = 187
              Top = 53
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
            object Label40: TLabel
              Left = 166
              Top = 38
              Width = 53
              Height = 13
              Caption = 'Hora Inicial'
            end
            object Label86: TLabel
              Left = 275
              Top = 38
              Width = 48
              Height = 13
              Caption = 'Data Final'
            end
            object Label87: TLabel
              Left = 413
              Top = 38
              Width = 48
              Height = 13
              Caption = 'Hora Final'
            end
            object Label148: TLabel
              Left = 434
              Top = 53
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
            object DBDateEdit1: TDBDateEdit
              Left = 12
              Top = 51
              Width = 137
              Height = 21
              DataField = 'LDI_DATESTART'
              DataSource = DmSys.dtsLineDiscounts
              NumGlyphs = 2
              TabOrder = 1
            end
            object dbLkApplicationsDiscounts: TRxDBLookupCombo
              Left = 12
              Top = 15
              Width = 336
              Height = 21
              DropDownCount = 8
              DisplayAllFields = True
              LookupField = 'APP_ISS_ID'
              LookupDisplay = 'APP_ID; APP_DESCSHORT; ISS_DESCLONG'
              LookupDisplayIndex = 1
              LookupSource = DmSys.dtsApplicationsLook
              TabOrder = 0
            end
            object RxDBComboBox1: TRxDBComboBox
              Left = 617
              Top = 15
              Width = 128
              Height = 21
              Style = csDropDownList
              DataField = 'LDI_STATUS'
              DataSource = DmSys.dtsLineDiscounts
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
            object RxDBLookupCombo1: TRxDBLookupCombo
              Left = 362
              Top = 15
              Width = 239
              Height = 21
              DropDownCount = 8
              DataField = 'DT_ID'
              DataSource = DmSys.dtsLineDiscounts
              LookupField = 'DT_ID'
              LookupDisplay = 'DT_DESC'
              LookupSource = DmSys.dtsDiscountTypes
              TabOrder = 3
            end
            object edHHini: TCurrencyEdit
              Left = 165
              Top = 51
              Width = 21
              Height = 19
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
              Left = 193
              Top = 51
              Width = 21
              Height = 19
              AutoSize = False
              Ctl3D = True
              DecimalPlaces = 0
              DisplayFormat = '00'
              MaxValue = 59.000000000000000000
              ParentCtl3D = False
              TabOrder = 5
              OnChange = edHMIniChange
            end
            object dbDataF: TDBDateEdit
              Left = 276
              Top = 51
              Width = 119
              Height = 21
              DataField = 'LDI_DATEEND'
              DataSource = DmSys.dtsLineDiscounts
              NumGlyphs = 2
              TabOrder = 6
            end
            object edHHFim: TCurrencyEdit
              Left = 412
              Top = 51
              Width = 21
              Height = 19
              AutoSize = False
              Ctl3D = True
              DecimalPlaces = 0
              DisplayFormat = '00'
              MaxValue = 23.000000000000000000
              ParentCtl3D = False
              TabOrder = 7
              OnChange = edHHFimChange
            end
            object edHMFim: TCurrencyEdit
              Left = 439
              Top = 51
              Width = 22
              Height = 19
              AutoSize = False
              Ctl3D = True
              DecimalPlaces = 0
              DisplayFormat = '00'
              MaxValue = 59.000000000000000000
              ParentCtl3D = False
              TabOrder = 8
              OnChange = edHMFimChange
            end
          end
          object PageControl2: TPageControl
            Left = 26
            Top = 74
            Width = 943
            Height = 138
            ActivePage = TabSheet6
            Anchors = [akLeft, akTop, akRight]
            TabOrder = 1
            object TabSheet6: TTabSheet
              Caption = '1 a 10'
              object gbDec01: TGroupBox
                Left = 3
                Top = -2
                Width = 146
                Height = 55
                Caption = 'Se'#231#227'o 1'
                TabOrder = 0
                object Label88: TLabel
                  Left = 4
                  Top = 16
                  Width = 15
                  Height = 13
                  Caption = 'Ida'
                end
                object Label89: TLabel
                  Left = 75
                  Top = 16
                  Width = 24
                  Height = 13
                  Caption = 'Volta'
                end
                object DBEdit2: TDBEdit
                  Left = 3
                  Top = 29
                  Width = 65
                  Height = 21
                  DataField = 'LDI_SCT1_IDA'
                  DataSource = DmSys.dtsLineDiscounts
                  TabOrder = 0
                end
                object DBEdit6: TDBEdit
                  Left = 74
                  Top = 29
                  Width = 67
                  Height = 21
                  DataField = 'LDI_SCT1_VOLTA'
                  DataSource = DmSys.dtsLineDiscounts
                  TabOrder = 1
                end
              end
              object gbDec02: TGroupBox
                Left = 152
                Top = -2
                Width = 146
                Height = 55
                Caption = 'Se'#231#227'o 2'
                TabOrder = 1
                object Label90: TLabel
                  Left = 4
                  Top = 16
                  Width = 15
                  Height = 13
                  Caption = 'Ida'
                end
                object Label91: TLabel
                  Left = 75
                  Top = 16
                  Width = 24
                  Height = 13
                  Caption = 'Volta'
                end
                object DBEdit10: TDBEdit
                  Left = 3
                  Top = 29
                  Width = 65
                  Height = 21
                  DataField = 'LDI_SCT2_IDA'
                  DataSource = DmSys.dtsLineDiscounts
                  TabOrder = 0
                end
                object DBEdit12: TDBEdit
                  Left = 74
                  Top = 29
                  Width = 67
                  Height = 21
                  DataField = 'LDI_SCT2_VOLTA'
                  DataSource = DmSys.dtsLineDiscounts
                  TabOrder = 1
                end
              end
              object gbDec03: TGroupBox
                Left = 302
                Top = -1
                Width = 146
                Height = 55
                Caption = 'Se'#231#227'o 3'
                Color = clBtnFace
                ParentColor = False
                TabOrder = 2
                object Label92: TLabel
                  Left = 4
                  Top = 16
                  Width = 15
                  Height = 13
                  Caption = 'Ida'
                end
                object Label93: TLabel
                  Left = 75
                  Top = 16
                  Width = 24
                  Height = 13
                  Caption = 'Volta'
                end
                object DBEdit14: TDBEdit
                  Left = 3
                  Top = 29
                  Width = 65
                  Height = 21
                  DataField = 'LDI_SCT3_IDA'
                  DataSource = DmSys.dtsLineDiscounts
                  TabOrder = 0
                end
                object DBEdit16: TDBEdit
                  Left = 74
                  Top = 29
                  Width = 67
                  Height = 21
                  DataField = 'LDI_SCT3_VOLTA'
                  DataSource = DmSys.dtsLineDiscounts
                  TabOrder = 1
                end
              end
              object gbDec04: TGroupBox
                Left = 452
                Top = -1
                Width = 146
                Height = 55
                Caption = 'Se'#231#227'o 4'
                TabOrder = 3
                object Label94: TLabel
                  Left = 4
                  Top = 16
                  Width = 15
                  Height = 13
                  Caption = 'Ida'
                end
                object Label95: TLabel
                  Left = 75
                  Top = 16
                  Width = 24
                  Height = 13
                  Caption = 'Volta'
                end
                object DBEdit18: TDBEdit
                  Left = 3
                  Top = 29
                  Width = 65
                  Height = 21
                  DataField = 'LDI_SCT4_IDA'
                  DataSource = DmSys.dtsLineDiscounts
                  TabOrder = 0
                end
                object DBEdit20: TDBEdit
                  Left = 74
                  Top = 29
                  Width = 67
                  Height = 21
                  DataField = 'LDI_SCT4_VOLTA'
                  DataSource = DmSys.dtsLineDiscounts
                  TabOrder = 1
                end
              end
              object gbDec05: TGroupBox
                Left = 603
                Top = -1
                Width = 146
                Height = 55
                Caption = 'Se'#231#227'o 5'
                TabOrder = 4
                object Label96: TLabel
                  Left = 4
                  Top = 16
                  Width = 15
                  Height = 13
                  Caption = 'Ida'
                end
                object Label97: TLabel
                  Left = 75
                  Top = 16
                  Width = 24
                  Height = 13
                  Caption = 'Volta'
                end
                object DBEdit22: TDBEdit
                  Left = 3
                  Top = 29
                  Width = 65
                  Height = 21
                  DataField = 'LDI_SCT5_IDA'
                  DataSource = DmSys.dtsLineDiscounts
                  TabOrder = 0
                end
                object DBEdit24: TDBEdit
                  Left = 74
                  Top = 29
                  Width = 67
                  Height = 21
                  DataField = 'LDI_SCT5_VOLTA'
                  DataSource = DmSys.dtsLineDiscounts
                  TabOrder = 1
                end
              end
              object gbDec06: TGroupBox
                Left = 3
                Top = 54
                Width = 146
                Height = 55
                Caption = 'Se'#231#227'o 6'
                TabOrder = 5
                object Label98: TLabel
                  Left = 4
                  Top = 16
                  Width = 15
                  Height = 13
                  Caption = 'Ida'
                end
                object Label99: TLabel
                  Left = 75
                  Top = 16
                  Width = 24
                  Height = 13
                  Caption = 'Volta'
                end
                object DBEdit26: TDBEdit
                  Left = 3
                  Top = 29
                  Width = 65
                  Height = 21
                  DataField = 'LDI_SCT6_IDA'
                  DataSource = DmSys.dtsLineDiscounts
                  TabOrder = 0
                end
                object DBEdit28: TDBEdit
                  Left = 74
                  Top = 29
                  Width = 67
                  Height = 21
                  DataField = 'LDI_SCT6_VOLTA'
                  DataSource = DmSys.dtsLineDiscounts
                  TabOrder = 1
                end
              end
              object gbDec07: TGroupBox
                Left = 152
                Top = 54
                Width = 146
                Height = 55
                Caption = 'Se'#231#227'o 7'
                TabOrder = 6
                object Label100: TLabel
                  Left = 4
                  Top = 16
                  Width = 15
                  Height = 13
                  Caption = 'Ida'
                end
                object Label101: TLabel
                  Left = 75
                  Top = 16
                  Width = 24
                  Height = 13
                  Caption = 'Volta'
                end
                object DBEdit30: TDBEdit
                  Left = 3
                  Top = 29
                  Width = 65
                  Height = 21
                  DataField = 'LDI_SCT7_IDA'
                  DataSource = DmSys.dtsLineDiscounts
                  TabOrder = 0
                end
                object DBEdit32: TDBEdit
                  Left = 74
                  Top = 29
                  Width = 67
                  Height = 21
                  DataField = 'LDI_SCT7_VOLTA'
                  DataSource = DmSys.dtsLineDiscounts
                  TabOrder = 1
                end
              end
              object gbDec08: TGroupBox
                Left = 302
                Top = 54
                Width = 146
                Height = 55
                Caption = 'Se'#231#227'o 8'
                TabOrder = 7
                object Label102: TLabel
                  Left = 4
                  Top = 16
                  Width = 15
                  Height = 13
                  Caption = 'Ida'
                end
                object Label103: TLabel
                  Left = 75
                  Top = 16
                  Width = 24
                  Height = 13
                  Caption = 'Volta'
                end
                object DBEdit34: TDBEdit
                  Left = 3
                  Top = 29
                  Width = 65
                  Height = 21
                  DataField = 'LDI_SCT8_IDA'
                  DataSource = DmSys.dtsLineDiscounts
                  TabOrder = 0
                end
                object DBEdit36: TDBEdit
                  Left = 74
                  Top = 29
                  Width = 67
                  Height = 21
                  DataField = 'LDI_SCT8_VOLTA'
                  DataSource = DmSys.dtsLineDiscounts
                  TabOrder = 1
                end
              end
              object gbDec09: TGroupBox
                Left = 452
                Top = 54
                Width = 146
                Height = 55
                Caption = 'Se'#231#227'o 9'
                TabOrder = 8
                object Label104: TLabel
                  Left = 4
                  Top = 16
                  Width = 15
                  Height = 13
                  Caption = 'Ida'
                end
                object Label105: TLabel
                  Left = 75
                  Top = 16
                  Width = 24
                  Height = 13
                  Caption = 'Volta'
                end
                object DBEdit38: TDBEdit
                  Left = 3
                  Top = 29
                  Width = 65
                  Height = 21
                  DataField = 'LDI_SCT9_IDA'
                  DataSource = DmSys.dtsLineDiscounts
                  TabOrder = 0
                end
                object DBEdit40: TDBEdit
                  Left = 74
                  Top = 29
                  Width = 67
                  Height = 21
                  DataField = 'LDI_SCT9_VOLTA'
                  DataSource = DmSys.dtsLineDiscounts
                  TabOrder = 1
                end
              end
              object gbDec10: TGroupBox
                Left = 603
                Top = 54
                Width = 146
                Height = 55
                Caption = 'Se'#231#227'o 10'
                TabOrder = 9
                object Label106: TLabel
                  Left = 4
                  Top = 16
                  Width = 15
                  Height = 13
                  Caption = 'Ida'
                end
                object Label107: TLabel
                  Left = 75
                  Top = 16
                  Width = 24
                  Height = 13
                  Caption = 'Volta'
                end
                object DBEdit42: TDBEdit
                  Left = 3
                  Top = 29
                  Width = 65
                  Height = 21
                  DataField = 'LDI_SCT10_IDA'
                  DataSource = DmSys.dtsLineDiscounts
                  TabOrder = 0
                end
                object DBEdit44: TDBEdit
                  Left = 74
                  Top = 29
                  Width = 67
                  Height = 21
                  DataField = 'LDI_SCT10_VOLTA'
                  DataSource = DmSys.dtsLineDiscounts
                  TabOrder = 1
                end
              end
            end
            object TabSheet7: TTabSheet
              Caption = '11 - 20'
              ImageIndex = 1
              object gbDec11: TGroupBox
                Left = 3
                Top = -2
                Width = 146
                Height = 55
                Caption = 'Se'#231#227'o 11'
                TabOrder = 0
                object Label108: TLabel
                  Left = 4
                  Top = 16
                  Width = 15
                  Height = 13
                  Caption = 'Ida'
                end
                object Label109: TLabel
                  Left = 75
                  Top = 16
                  Width = 24
                  Height = 13
                  Caption = 'Volta'
                end
                object DBEdit46: TDBEdit
                  Left = 3
                  Top = 29
                  Width = 65
                  Height = 21
                  DataField = 'LDI_SCT11_IDA'
                  DataSource = DmSys.dtsLineDiscounts
                  TabOrder = 0
                end
                object DBEdit48: TDBEdit
                  Left = 74
                  Top = 29
                  Width = 67
                  Height = 21
                  DataField = 'LDI_SCT11_VOLTA'
                  DataSource = DmSys.dtsLineDiscounts
                  TabOrder = 1
                end
              end
              object gbDec12: TGroupBox
                Left = 152
                Top = -2
                Width = 146
                Height = 55
                Caption = 'Se'#231#227'o 12'
                TabOrder = 1
                object Label110: TLabel
                  Left = 4
                  Top = 16
                  Width = 15
                  Height = 13
                  Caption = 'Ida'
                end
                object Label111: TLabel
                  Left = 75
                  Top = 16
                  Width = 24
                  Height = 13
                  Caption = 'Volta'
                end
                object DBEdit50: TDBEdit
                  Left = 3
                  Top = 29
                  Width = 65
                  Height = 21
                  DataField = 'LDI_SCT12_IDA'
                  DataSource = DmSys.dtsLineDiscounts
                  TabOrder = 0
                end
                object DBEdit52: TDBEdit
                  Left = 74
                  Top = 29
                  Width = 67
                  Height = 21
                  DataField = 'LDI_SCT12_VOLTA'
                  DataSource = DmSys.dtsLineDiscounts
                  TabOrder = 1
                end
              end
              object gbDec13: TGroupBox
                Left = 302
                Top = -2
                Width = 146
                Height = 55
                Caption = 'Se'#231#227'o 13'
                TabOrder = 2
                object Label112: TLabel
                  Left = 4
                  Top = 16
                  Width = 15
                  Height = 13
                  Caption = 'Ida'
                end
                object Label113: TLabel
                  Left = 75
                  Top = 16
                  Width = 24
                  Height = 13
                  Caption = 'Volta'
                end
                object DBEdit54: TDBEdit
                  Left = 3
                  Top = 29
                  Width = 65
                  Height = 21
                  DataField = 'LDI_SCT13_IDA'
                  DataSource = DmSys.dtsLineDiscounts
                  TabOrder = 0
                end
                object DBEdit55: TDBEdit
                  Left = 74
                  Top = 29
                  Width = 67
                  Height = 21
                  DataField = 'LDI_SCT13_VOLTA'
                  DataSource = DmSys.dtsLineDiscounts
                  TabOrder = 1
                end
              end
              object gbDec14: TGroupBox
                Left = 452
                Top = -2
                Width = 146
                Height = 55
                Caption = 'Se'#231#227'o 14'
                TabOrder = 3
                object Label114: TLabel
                  Left = 4
                  Top = 16
                  Width = 15
                  Height = 13
                  Caption = 'Ida'
                end
                object Label115: TLabel
                  Left = 75
                  Top = 16
                  Width = 24
                  Height = 13
                  Caption = 'Volta'
                end
                object DBEdit56: TDBEdit
                  Left = 3
                  Top = 29
                  Width = 65
                  Height = 21
                  DataField = 'LDI_SCT14_IDA'
                  DataSource = DmSys.dtsLineDiscounts
                  TabOrder = 0
                end
                object DBEdit58: TDBEdit
                  Left = 74
                  Top = 29
                  Width = 67
                  Height = 21
                  DataField = 'LDI_SCT14_VOLTA'
                  DataSource = DmSys.dtsLineDiscounts
                  TabOrder = 1
                end
              end
              object gbDec15: TGroupBox
                Left = 603
                Top = -2
                Width = 146
                Height = 55
                Caption = 'Se'#231#227'o 15'
                TabOrder = 4
                object Label116: TLabel
                  Left = 4
                  Top = 16
                  Width = 15
                  Height = 13
                  Caption = 'Ida'
                end
                object Label117: TLabel
                  Left = 75
                  Top = 16
                  Width = 24
                  Height = 13
                  Caption = 'Volta'
                end
                object DBEdit60: TDBEdit
                  Left = 3
                  Top = 29
                  Width = 65
                  Height = 21
                  DataField = 'LDI_SCT15_IDA'
                  DataSource = DmSys.dtsLineDiscounts
                  TabOrder = 0
                end
                object DBEdit62: TDBEdit
                  Left = 74
                  Top = 29
                  Width = 67
                  Height = 21
                  DataField = 'LDI_SCT15_VOLTA'
                  DataSource = DmSys.dtsLineDiscounts
                  TabOrder = 1
                end
              end
              object gbDec20: TGroupBox
                Left = 603
                Top = 54
                Width = 146
                Height = 55
                Caption = 'Se'#231#227'o 20'
                TabOrder = 5
                object Label118: TLabel
                  Left = 4
                  Top = 16
                  Width = 15
                  Height = 13
                  Caption = 'Ida'
                end
                object Label119: TLabel
                  Left = 75
                  Top = 16
                  Width = 24
                  Height = 13
                  Caption = 'Volta'
                end
                object DBEdit64: TDBEdit
                  Left = 3
                  Top = 29
                  Width = 65
                  Height = 21
                  DataField = 'LDI_SCT20_IDA'
                  DataSource = DmSys.dtsLineDiscounts
                  TabOrder = 0
                end
                object DBEdit65: TDBEdit
                  Left = 74
                  Top = 29
                  Width = 67
                  Height = 21
                  DataField = 'LDI_SCT20_VOLTA'
                  DataSource = DmSys.dtsLineDiscounts
                  TabOrder = 1
                end
              end
              object gbDec19: TGroupBox
                Left = 452
                Top = 54
                Width = 146
                Height = 55
                Caption = 'Se'#231#227'o 19'
                TabOrder = 6
                object Label120: TLabel
                  Left = 4
                  Top = 16
                  Width = 15
                  Height = 13
                  Caption = 'Ida'
                end
                object Label121: TLabel
                  Left = 75
                  Top = 16
                  Width = 24
                  Height = 13
                  Caption = 'Volta'
                end
                object DBEdit66: TDBEdit
                  Left = 3
                  Top = 29
                  Width = 65
                  Height = 21
                  DataField = 'LDI_SCT19_IDA'
                  DataSource = DmSys.dtsLineDiscounts
                  TabOrder = 0
                end
                object DBEdit67: TDBEdit
                  Left = 74
                  Top = 29
                  Width = 67
                  Height = 21
                  DataField = 'LDI_SCT19_VOLTA'
                  DataSource = DmSys.dtsLineDiscounts
                  TabOrder = 1
                end
              end
              object gbDec18: TGroupBox
                Left = 302
                Top = 54
                Width = 146
                Height = 55
                Caption = 'Se'#231#227'o 18'
                TabOrder = 7
                object Label122: TLabel
                  Left = 4
                  Top = 16
                  Width = 15
                  Height = 13
                  Caption = 'Ida'
                end
                object Label123: TLabel
                  Left = 75
                  Top = 16
                  Width = 24
                  Height = 13
                  Caption = 'Volta'
                end
                object DBEdit68: TDBEdit
                  Left = 3
                  Top = 29
                  Width = 65
                  Height = 21
                  DataField = 'LDI_SCT18_IDA'
                  DataSource = DmSys.dtsLineDiscounts
                  TabOrder = 0
                end
                object DBEdit69: TDBEdit
                  Left = 74
                  Top = 29
                  Width = 67
                  Height = 21
                  DataField = 'LDI_SCT18_VOLTA'
                  DataSource = DmSys.dtsLineDiscounts
                  TabOrder = 1
                end
              end
              object gbDec17: TGroupBox
                Left = 152
                Top = 54
                Width = 146
                Height = 55
                Caption = 'Se'#231#227'o 17'
                TabOrder = 8
                object Label124: TLabel
                  Left = 4
                  Top = 16
                  Width = 15
                  Height = 13
                  Caption = 'Ida'
                end
                object Label125: TLabel
                  Left = 75
                  Top = 16
                  Width = 24
                  Height = 13
                  Caption = 'Volta'
                end
                object DBEdit70: TDBEdit
                  Left = 3
                  Top = 29
                  Width = 65
                  Height = 21
                  DataField = 'LDI_SCT17_IDA'
                  DataSource = DmSys.dtsLineDiscounts
                  TabOrder = 0
                end
                object DBEdit71: TDBEdit
                  Left = 74
                  Top = 29
                  Width = 67
                  Height = 21
                  DataField = 'LDI_SCT17_VOLTA'
                  DataSource = DmSys.dtsLineDiscounts
                  TabOrder = 1
                end
              end
              object gbDec16: TGroupBox
                Left = 3
                Top = 54
                Width = 146
                Height = 55
                Caption = 'Se'#231#227'o 16'
                TabOrder = 9
                object Label126: TLabel
                  Left = 4
                  Top = 16
                  Width = 15
                  Height = 13
                  Caption = 'Ida'
                end
                object Label127: TLabel
                  Left = 75
                  Top = 16
                  Width = 24
                  Height = 13
                  Caption = 'Volta'
                end
                object DBEdit72: TDBEdit
                  Left = 3
                  Top = 29
                  Width = 65
                  Height = 21
                  DataField = 'LDI_SCT16_IDA'
                  DataSource = DmSys.dtsLineDiscounts
                  TabOrder = 0
                end
                object DBEdit73: TDBEdit
                  Left = 74
                  Top = 29
                  Width = 67
                  Height = 21
                  DataField = 'LDI_SCT16_VOLTA'
                  DataSource = DmSys.dtsLineDiscounts
                  TabOrder = 1
                end
              end
            end
            object TabSheet8: TTabSheet
              Caption = '21 - 30'
              ImageIndex = 2
              object gbDec21: TGroupBox
                Left = 3
                Top = -2
                Width = 146
                Height = 55
                Caption = 'Se'#231#227'o 21'
                TabOrder = 0
                object Label128: TLabel
                  Left = 4
                  Top = 16
                  Width = 15
                  Height = 13
                  Caption = 'Ida'
                end
                object Label129: TLabel
                  Left = 75
                  Top = 16
                  Width = 24
                  Height = 13
                  Caption = 'Volta'
                end
                object DBEdit74: TDBEdit
                  Left = 3
                  Top = 29
                  Width = 65
                  Height = 21
                  DataField = 'LDI_SCT21_IDA'
                  DataSource = DmSys.dtsLineDiscounts
                  TabOrder = 0
                end
                object DBEdit75: TDBEdit
                  Left = 74
                  Top = 29
                  Width = 67
                  Height = 21
                  DataField = 'LDI_SCT21_VOLTA'
                  DataSource = DmSys.dtsLineDiscounts
                  TabOrder = 1
                end
              end
              object gbDec22: TGroupBox
                Left = 152
                Top = -2
                Width = 146
                Height = 55
                Caption = 'Se'#231#227'o 22'
                TabOrder = 1
                object Label130: TLabel
                  Left = 4
                  Top = 16
                  Width = 15
                  Height = 13
                  Caption = 'Ida'
                end
                object Label131: TLabel
                  Left = 75
                  Top = 16
                  Width = 24
                  Height = 13
                  Caption = 'Volta'
                end
                object DBEdit76: TDBEdit
                  Left = 3
                  Top = 29
                  Width = 65
                  Height = 21
                  DataField = 'LDI_SCT22_IDA'
                  DataSource = DmSys.dtsLineDiscounts
                  TabOrder = 0
                end
                object DBEdit77: TDBEdit
                  Left = 74
                  Top = 29
                  Width = 67
                  Height = 21
                  DataField = 'LDI_SCT22_VOLTA'
                  DataSource = DmSys.dtsLineDiscounts
                  TabOrder = 1
                end
              end
              object gbDec23: TGroupBox
                Left = 302
                Top = -2
                Width = 146
                Height = 55
                Caption = 'Se'#231#227'o 23'
                TabOrder = 2
                object Label132: TLabel
                  Left = 4
                  Top = 16
                  Width = 15
                  Height = 13
                  Caption = 'Ida'
                end
                object Label133: TLabel
                  Left = 75
                  Top = 16
                  Width = 24
                  Height = 13
                  Caption = 'Volta'
                end
                object DBEdit78: TDBEdit
                  Left = 3
                  Top = 29
                  Width = 65
                  Height = 21
                  DataField = 'LDI_SCT23_IDA'
                  DataSource = DmSys.dtsLineDiscounts
                  TabOrder = 0
                end
                object DBEdit79: TDBEdit
                  Left = 74
                  Top = 29
                  Width = 67
                  Height = 21
                  DataField = 'LDI_SCT23_VOLTA'
                  DataSource = DmSys.dtsLineDiscounts
                  TabOrder = 1
                end
              end
              object gbDec24: TGroupBox
                Left = 452
                Top = -2
                Width = 146
                Height = 55
                Caption = 'Se'#231#227'o 24'
                TabOrder = 3
                object Label134: TLabel
                  Left = 4
                  Top = 16
                  Width = 15
                  Height = 13
                  Caption = 'Ida'
                end
                object Label135: TLabel
                  Left = 75
                  Top = 16
                  Width = 24
                  Height = 13
                  Caption = 'Volta'
                end
                object DBEdit80: TDBEdit
                  Left = 3
                  Top = 29
                  Width = 65
                  Height = 21
                  DataField = 'LDI_SCT24_IDA'
                  DataSource = DmSys.dtsLineDiscounts
                  TabOrder = 0
                end
                object DBEdit81: TDBEdit
                  Left = 74
                  Top = 29
                  Width = 67
                  Height = 21
                  DataField = 'LDI_SCT24_VOLTA'
                  DataSource = DmSys.dtsLineDiscounts
                  TabOrder = 1
                end
              end
              object gbDec25: TGroupBox
                Left = 603
                Top = -2
                Width = 146
                Height = 55
                Caption = 'Se'#231#227'o 25'
                TabOrder = 4
                object Label136: TLabel
                  Left = 4
                  Top = 16
                  Width = 15
                  Height = 13
                  Caption = 'Ida'
                end
                object Label137: TLabel
                  Left = 75
                  Top = 16
                  Width = 24
                  Height = 13
                  Caption = 'Volta'
                end
                object DBEdit82: TDBEdit
                  Left = 3
                  Top = 29
                  Width = 65
                  Height = 21
                  DataField = 'LDI_SCT25_IDA'
                  DataSource = DmSys.dtsLineDiscounts
                  TabOrder = 0
                end
                object DBEdit83: TDBEdit
                  Left = 74
                  Top = 29
                  Width = 67
                  Height = 21
                  DataField = 'LDI_SCT25_VOLTA'
                  DataSource = DmSys.dtsLineDiscounts
                  TabOrder = 1
                end
              end
              object gbDec29: TGroupBox
                Left = 452
                Top = 54
                Width = 146
                Height = 55
                Caption = 'Se'#231#227'o 29'
                TabOrder = 5
                object Label138: TLabel
                  Left = 4
                  Top = 16
                  Width = 15
                  Height = 13
                  Caption = 'Ida'
                end
                object Label139: TLabel
                  Left = 75
                  Top = 16
                  Width = 24
                  Height = 13
                  Caption = 'Volta'
                end
                object DBEdit84: TDBEdit
                  Left = 3
                  Top = 29
                  Width = 65
                  Height = 21
                  DataField = 'LDI_SCT29_IDA'
                  DataSource = DmSys.dtsLineDiscounts
                  TabOrder = 0
                end
                object DBEdit85: TDBEdit
                  Left = 74
                  Top = 29
                  Width = 67
                  Height = 21
                  DataField = 'LDI_SCT29_VOLTA'
                  DataSource = DmSys.dtsLineDiscounts
                  TabOrder = 1
                end
              end
              object gbDec28: TGroupBox
                Left = 302
                Top = 54
                Width = 146
                Height = 55
                Caption = 'Se'#231#227'o 28'
                TabOrder = 6
                object Label140: TLabel
                  Left = 4
                  Top = 16
                  Width = 15
                  Height = 13
                  Caption = 'Ida'
                end
                object Label141: TLabel
                  Left = 75
                  Top = 16
                  Width = 24
                  Height = 13
                  Caption = 'Volta'
                end
                object DBEdit86: TDBEdit
                  Left = 3
                  Top = 29
                  Width = 65
                  Height = 21
                  DataField = 'LDI_SCT28_IDA'
                  DataSource = DmSys.dtsLineDiscounts
                  TabOrder = 0
                end
                object DBEdit87: TDBEdit
                  Left = 74
                  Top = 29
                  Width = 67
                  Height = 21
                  DataField = 'LDI_SCT28_VOLTA'
                  DataSource = DmSys.dtsLineDiscounts
                  TabOrder = 1
                end
              end
              object gbDec27: TGroupBox
                Left = 152
                Top = 54
                Width = 146
                Height = 55
                Caption = 'Se'#231#227'o 27'
                TabOrder = 7
                object Label142: TLabel
                  Left = 4
                  Top = 16
                  Width = 15
                  Height = 13
                  Caption = 'Ida'
                end
                object Label143: TLabel
                  Left = 75
                  Top = 16
                  Width = 24
                  Height = 13
                  Caption = 'Volta'
                end
                object DBEdit88: TDBEdit
                  Left = 3
                  Top = 29
                  Width = 65
                  Height = 21
                  DataField = 'LDI_SCT27_IDA'
                  DataSource = DmSys.dtsLineDiscounts
                  TabOrder = 0
                end
                object DBEdit89: TDBEdit
                  Left = 74
                  Top = 29
                  Width = 67
                  Height = 21
                  DataField = 'LDI_SCT27_VOLTA'
                  DataSource = DmSys.dtsLineDiscounts
                  TabOrder = 1
                end
              end
              object gbDec26: TGroupBox
                Left = 3
                Top = 54
                Width = 146
                Height = 55
                Caption = 'Se'#231#227'o 26'
                TabOrder = 8
                object Label144: TLabel
                  Left = 4
                  Top = 16
                  Width = 15
                  Height = 13
                  Caption = 'Ida'
                end
                object Label145: TLabel
                  Left = 75
                  Top = 16
                  Width = 24
                  Height = 13
                  Caption = 'Volta'
                end
                object DBEdit90: TDBEdit
                  Left = 3
                  Top = 29
                  Width = 65
                  Height = 21
                  DataField = 'LDI_SCT26_IDA'
                  DataSource = DmSys.dtsLineDiscounts
                  TabOrder = 0
                end
                object DBEdit91: TDBEdit
                  Left = 74
                  Top = 29
                  Width = 67
                  Height = 21
                  DataField = 'LDI_SCT26_VOLTA'
                  DataSource = DmSys.dtsLineDiscounts
                  TabOrder = 1
                end
              end
              object gbDec30: TGroupBox
                Left = 603
                Top = 54
                Width = 146
                Height = 55
                Caption = 'Se'#231#227'o 30'
                TabOrder = 9
                object Label146: TLabel
                  Left = 4
                  Top = 16
                  Width = 15
                  Height = 13
                  Caption = 'Ida'
                end
                object Label147: TLabel
                  Left = 75
                  Top = 16
                  Width = 24
                  Height = 13
                  Caption = 'Volta'
                end
                object DBEdit92: TDBEdit
                  Left = 3
                  Top = 29
                  Width = 65
                  Height = 21
                  DataField = 'LDI_SCT30_IDA'
                  DataSource = DmSys.dtsLineDiscounts
                  TabOrder = 0
                end
                object DBEdit93: TDBEdit
                  Left = 74
                  Top = 29
                  Width = 67
                  Height = 21
                  DataField = 'LDI_SCT29_VOLTA'
                  DataSource = DmSys.dtsLineDiscounts
                  TabOrder = 1
                end
              end
            end
          end
          object plDiscountsOK: TPanel
            Left = 0
            Top = 26
            Width = 969
            Height = 28
            Align = alBottom
            TabOrder = 3
            Visible = False
            object BitBtn5: TBitBtn
              Left = 676
              Top = 1
              Width = 89
              Height = 26
              Action = actCancelDiscount
              Caption = 'actCancelDiscount'
              TabOrder = 0
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
            object BitBtn4: TBitBtn
              Left = 573
              Top = 1
              Width = 89
              Height = 25
              Action = actOkDiscount
              Caption = 'actOkDiscount'
              TabOrder = 1
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
          end
          object dbDiscounts: TCoolBar
            Left = 0
            Top = 0
            Width = 27
            Height = 26
            Align = alLeft
            AutoSize = True
            Bands = <
              item
                Control = ToolBar4
                ImageIndex = -1
                MinHeight = 23
                Width = 165
              end>
            Vertical = True
            object ToolBar4: TToolBar
              Left = 0
              Top = 9
              Width = 23
              Height = 156
              Align = alLeft
              Caption = 'tbCardsApps'
              Images = imglstBase
              TabOrder = 0
              object tbNewDescontos: TToolButton
                Left = 0
                Top = 2
                Action = actNewPrice
                Wrap = True
              end
              object tbEditDescontos: TToolButton
                Left = 0
                Top = 24
                Action = actEditPrice
                Wrap = True
              end
              object tbDeleteDescontos: TToolButton
                Left = 0
                Top = 46
                Action = actDeletePrice
              end
            end
          end
          object pnlDiscount: TPanel
            Left = 27
            Top = 0
            Width = 942
            Height = 26
            Align = alClient
            BevelOuter = bvNone
            TabOrder = 4
            object pnlDiscountLeft: TPanel
              Left = 0
              Top = 0
              Width = 785
              Height = 169
              Align = alClient
              BevelOuter = bvNone
              TabOrder = 0
              object dbgLineDiscounts: TDBGrid
                Left = 0
                Top = 0
                Width = 932
                Height = 237
                DataSource = DmSys.dtsLineDiscounts
                Options = [dgTitles, dgIndicator, dgColLines, dgRowLines, dgRowSelect]
                TabOrder = 0
                TitleFont.Charset = DEFAULT_CHARSET
                TitleFont.Color = clWindowText
                TitleFont.Height = -11
                TitleFont.Name = 'MS Sans Serif'
                TitleFont.Style = []
                OnDblClick = grdResultadoDblClick
                Columns = <
                  item
                    Expanded = False
                    FieldName = 'ISS_DESCSHORT'
                    Title.Caption = 'Emiss'#227'o'
                    Width = 150
                    Visible = True
                  end
                  item
                    Expanded = False
                    FieldName = 'APP_DESCSHORT'
                    Title.Caption = 'Aplica'#231#227'o'
                    Width = 150
                    Visible = True
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
                    Title.Caption = 'Data In'#237'cio'
                    Width = 90
                    Visible = True
                  end
                  item
                    Expanded = False
                    FieldName = 'LDI_TIMESTART'
                    Title.Caption = 'Hora In'#237'cio'
                    Width = 90
                    Visible = True
                  end
                  item
                    Expanded = False
                    FieldName = 'LDI_DATEEND'
                    Title.Caption = 'Data Final'
                    Width = 100
                    Visible = True
                  end
                  item
                    Expanded = False
                    FieldName = 'LDI_TIMEEND'
                    Title.Caption = 'Hora final'
                    Width = 90
                    Visible = True
                  end
                  item
                    Expanded = False
                    FieldName = 'LDI_SCT1_IDA'
                    Visible = False
                  end
                  item
                    Expanded = False
                    FieldName = 'LDI_SCT1_VOLTA'
                    Visible = False
                  end
                  item
                    Expanded = False
                    FieldName = 'STATUS_ID'
                    Title.Caption = 'Status'
                    Width = 100
                    Visible = True
                  end>
              end
            end
            object pnlDiscountRight: TPanel
              Left = 785
              Top = 0
              Width = 259
              Height = 169
              Align = alRight
              BevelOuter = bvNone
              TabOrder = 1
              object DBGrid4: TDBGrid
                Left = 0
                Top = 0
                Width = 259
                Height = 169
                Align = alClient
                DataSource = dmSys1.dtsLineDiscountsIndividual
                Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgConfirmDelete, dgCancelOnExit]
                TabOrder = 0
                TitleFont.Charset = DEFAULT_CHARSET
                TitleFont.Color = clWindowText
                TitleFont.Height = -11
                TitleFont.Name = 'MS Sans Serif'
                TitleFont.Style = []
                Columns = <
                  item
                    Expanded = False
                    FieldName = 'LDI_SECTION'
                    Width = 45
                    Visible = True
                  end
                  item
                    Expanded = False
                    FieldName = 'LDI_PRICE_GO'
                    Width = 78
                    Visible = True
                  end
                  item
                    Expanded = False
                    FieldName = 'LDI_PRICE_BACK'
                    Width = 78
                    Visible = True
                  end>
              end
            end
          end
        end
        object tabZones: TTabSheet
          Caption = 'Relacionamentos da Se'#231#227'o'
          ImageIndex = 2
          DesignSize = (
            969
            54)
          object Panel4: TPanel
            Left = 26
            Top = 0
            Width = 943
            Height = 53
            Align = alCustom
            Anchors = [akLeft, akTop, akRight]
            Color = 13816530
            TabOrder = 0
            object Label149: TLabel
              Left = 16
              Top = 8
              Width = 23
              Height = 13
              Caption = 'Data'
            end
            object Label150: TLabel
              Tag = 1777
              Left = 269
              Top = 8
              Width = 47
              Height = 13
              Caption = 'Aplica'#231#227'o'
              FocusControl = dblZoneApplication
            end
            object Label151: TLabel
              Tag = 1987
              Left = 605
              Top = 8
              Width = 30
              Height = 13
              Caption = 'Status'
              FocusControl = dbcZoneStatus
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Height = -12
              Font.Name = 'MS Sans Serif'
              Font.Style = []
              ParentFont = False
            end
            object Label212: TLabel
              Left = 176
              Top = 8
              Width = 31
              Height = 13
              Caption = 'Se'#231#227'o'
            end
            object Label233: TLabel
              Left = 744
              Top = 8
              Width = 71
              Height = 13
              Caption = 'Validade In'#237'cio'
            end
            object Label234: TLabel
              Left = 888
              Top = 8
              Width = 60
              Height = 13
              Caption = 'Validade Fim'
            end
            object Label235: TLabel
              Left = 1032
              Top = 8
              Width = 82
              Height = 13
              Caption = 'Poder de Compra'
            end
            object dbdZoneDate: TDBDateEdit
              Left = 16
              Top = 24
              Width = 137
              Height = 21
              DataField = 'LZP_DATE'
              DataSource = dmSys1.dtsLineZonePrices
              NumGlyphs = 2
              TabOrder = 0
            end
            object dblZoneApplication: TRxDBLookupCombo
              Left = 269
              Top = 24
              Width = 329
              Height = 21
              DropDownCount = 8
              DisplayAllFields = True
              LookupField = 'APP_ISS_ID'
              LookupDisplay = 'APP_ID; APP_DESCSHORT; ISS_DESCLONG'
              LookupDisplayIndex = 1
              LookupSource = DmSys.dtsApplicationsLook
              TabOrder = 1
            end
            object dbcZoneStatus: TRxDBComboBox
              Left = 605
              Top = 24
              Width = 133
              Height = 21
              Style = csDropDownList
              DataField = 'LZP_STATUS'
              DataSource = dmSys1.dtsLineZonePrices
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
            object dbeSections: TDBEdit
              Left = 175
              Top = 24
              Width = 65
              Height = 21
              DataField = 'LZP_SECTION'
              DataSource = dmSys1.dtsLineZonePrices
              TabOrder = 3
            end
            object DBDateEdit7: TDBDateEdit
              Left = 744
              Top = 24
              Width = 137
              Height = 21
              DataField = 'DT_INICIO_VALID'
              DataSource = dmSys1.dtsLineZonePrices
              NumGlyphs = 2
              TabOrder = 4
            end
            object DBDateEdit8: TDBDateEdit
              Left = 888
              Top = 24
              Width = 137
              Height = 21
              DataField = 'DT_FIM_VALID'
              DataSource = dmSys1.dtsLineZonePrices
              NumGlyphs = 2
              TabOrder = 5
            end
            object DBEdit9: TDBEdit
              Left = 1031
              Top = 24
              Width = 65
              Height = 21
              DataField = 'PODER_COMPRA'
              DataSource = dmSys1.dtsLineZonePrices
              TabOrder = 6
            end
          end
          object PageControl3: TPageControl
            Left = 26
            Top = 53
            Width = 943
            Height = 158
            ActivePage = TabSheet9
            Anchors = [akLeft, akTop, akRight]
            TabOrder = 1
            object TabSheet9: TTabSheet
              Caption = '1 a 10'
              object gbZon1: TGroupBox
                Left = 3
                Top = -2
                Width = 146
                Height = 55
                Caption = 'Se'#231#227'o 1'
                TabOrder = 0
                object Label152: TLabel
                  Left = 4
                  Top = 16
                  Width = 15
                  Height = 13
                  Caption = 'Ida'
                end
                object Label153: TLabel
                  Left = 75
                  Top = 16
                  Width = 24
                  Height = 13
                  Caption = 'Volta'
                end
                object dbeZoneSec1Go: TDBEdit
                  Left = 3
                  Top = 29
                  Width = 65
                  Height = 21
                  DataField = 'LZP_SCT1_IDA'
                  DataSource = dmSys1.dtsLineZonePrices
                  TabOrder = 0
                end
                object dbeZoneSec1Back: TDBEdit
                  Left = 74
                  Top = 29
                  Width = 67
                  Height = 21
                  DataField = 'LZP_SCT1_VOLTA'
                  DataSource = dmSys1.dtsLineZonePrices
                  TabOrder = 1
                end
              end
              object gbZon2: TGroupBox
                Left = 156
                Top = -2
                Width = 146
                Height = 55
                Caption = 'Se'#231#227'o 2'
                TabOrder = 1
                object Label154: TLabel
                  Left = 4
                  Top = 16
                  Width = 15
                  Height = 13
                  Caption = 'Ida'
                end
                object Label155: TLabel
                  Left = 75
                  Top = 16
                  Width = 24
                  Height = 13
                  Caption = 'Volta'
                end
                object dbeZoneSec2Go: TDBEdit
                  Left = 3
                  Top = 29
                  Width = 65
                  Height = 21
                  DataField = 'LZP_SCT2_IDA'
                  DataSource = dmSys1.dtsLineZonePrices
                  TabOrder = 0
                end
                object dbeZoneSec2Back: TDBEdit
                  Left = 74
                  Top = 29
                  Width = 67
                  Height = 21
                  DataField = 'LZP_SCT2_VOLTA'
                  DataSource = dmSys1.dtsLineZonePrices
                  TabOrder = 1
                end
              end
              object gbZon3: TGroupBox
                Left = 302
                Top = -1
                Width = 146
                Height = 55
                Caption = 'Se'#231#227'o 3'
                Color = clBtnFace
                ParentColor = False
                TabOrder = 2
                object Label156: TLabel
                  Left = 4
                  Top = 16
                  Width = 15
                  Height = 13
                  Caption = 'Ida'
                end
                object Label157: TLabel
                  Left = 75
                  Top = 16
                  Width = 24
                  Height = 13
                  Caption = 'Volta'
                end
                object dbeZoneSec3Go: TDBEdit
                  Left = 3
                  Top = 29
                  Width = 65
                  Height = 21
                  DataField = 'LZP_SCT3_IDA'
                  DataSource = dmSys1.dtsLineZonePrices
                  TabOrder = 0
                end
                object dbeZoneSec3Back: TDBEdit
                  Left = 74
                  Top = 29
                  Width = 67
                  Height = 21
                  DataField = 'LZP_SCT3_VOLTA'
                  DataSource = dmSys1.dtsLineZonePrices
                  TabOrder = 1
                end
              end
              object gbZon4: TGroupBox
                Left = 452
                Top = -1
                Width = 146
                Height = 55
                Caption = 'Se'#231#227'o 4'
                TabOrder = 3
                object Label158: TLabel
                  Left = 4
                  Top = 16
                  Width = 15
                  Height = 13
                  Caption = 'Ida'
                end
                object Label159: TLabel
                  Left = 75
                  Top = 16
                  Width = 24
                  Height = 13
                  Caption = 'Volta'
                end
                object dbeZoneSec4Go: TDBEdit
                  Left = 3
                  Top = 29
                  Width = 65
                  Height = 21
                  DataField = 'LZP_SCT4_IDA'
                  DataSource = dmSys1.dtsLineZonePrices
                  TabOrder = 0
                end
                object dbeZoneSec4Back: TDBEdit
                  Left = 74
                  Top = 29
                  Width = 67
                  Height = 21
                  DataField = 'LZP_SCT4_VOLTA'
                  DataSource = dmSys1.dtsLineZonePrices
                  TabOrder = 1
                end
              end
              object gbZon5: TGroupBox
                Left = 603
                Top = -1
                Width = 146
                Height = 55
                Caption = 'Se'#231#227'o 5'
                TabOrder = 4
                object Label160: TLabel
                  Left = 4
                  Top = 16
                  Width = 15
                  Height = 13
                  Caption = 'Ida'
                end
                object Label161: TLabel
                  Left = 75
                  Top = 16
                  Width = 24
                  Height = 13
                  Caption = 'Volta'
                end
                object dbeZoneSec5Go: TDBEdit
                  Left = 3
                  Top = 29
                  Width = 65
                  Height = 21
                  DataField = 'LZP_SCT5_IDA'
                  DataSource = dmSys1.dtsLineZonePrices
                  TabOrder = 0
                end
                object dbeZoneSec5Back: TDBEdit
                  Left = 74
                  Top = 29
                  Width = 67
                  Height = 21
                  DataField = 'LZP_SCT5_VOLTA'
                  DataSource = dmSys1.dtsLineZonePrices
                  TabOrder = 1
                end
              end
              object gbZon6: TGroupBox
                Left = 3
                Top = 54
                Width = 146
                Height = 55
                Caption = 'Se'#231#227'o 6'
                TabOrder = 5
                object Label162: TLabel
                  Left = 4
                  Top = 16
                  Width = 15
                  Height = 13
                  Caption = 'Ida'
                end
                object Label163: TLabel
                  Left = 75
                  Top = 16
                  Width = 24
                  Height = 13
                  Caption = 'Volta'
                end
                object dbeZoneSec6Go: TDBEdit
                  Left = 3
                  Top = 29
                  Width = 65
                  Height = 21
                  DataField = 'LZP_SCT6_IDA'
                  DataSource = dmSys1.dtsLineZonePrices
                  TabOrder = 0
                end
                object dbeZoneSec6Back: TDBEdit
                  Left = 74
                  Top = 29
                  Width = 67
                  Height = 21
                  DataField = 'LZP_SCT6_VOLTA'
                  DataSource = dmSys1.dtsLineZonePrices
                  TabOrder = 1
                end
              end
              object gbZon7: TGroupBox
                Left = 152
                Top = 54
                Width = 146
                Height = 55
                Caption = 'Se'#231#227'o 7'
                TabOrder = 6
                object Label164: TLabel
                  Left = 4
                  Top = 16
                  Width = 15
                  Height = 13
                  Caption = 'Ida'
                end
                object Label165: TLabel
                  Left = 75
                  Top = 16
                  Width = 24
                  Height = 13
                  Caption = 'Volta'
                end
                object dbeZoneSec7Go: TDBEdit
                  Left = 3
                  Top = 29
                  Width = 65
                  Height = 21
                  DataField = 'LZP_SCT7_IDA'
                  DataSource = dmSys1.dtsLineZonePrices
                  TabOrder = 0
                end
                object dbeZoneSec7Back: TDBEdit
                  Left = 74
                  Top = 29
                  Width = 67
                  Height = 21
                  DataField = 'LZP_SCT7_VOLTA'
                  DataSource = dmSys1.dtsLineZonePrices
                  TabOrder = 1
                end
              end
              object gbZon8: TGroupBox
                Left = 302
                Top = 54
                Width = 146
                Height = 55
                Caption = 'Se'#231#227'o 8'
                TabOrder = 7
                object Label166: TLabel
                  Left = 4
                  Top = 16
                  Width = 15
                  Height = 13
                  Caption = 'Ida'
                end
                object Label167: TLabel
                  Left = 75
                  Top = 16
                  Width = 24
                  Height = 13
                  Caption = 'Volta'
                end
                object dbeZoneSec8Go: TDBEdit
                  Left = 3
                  Top = 29
                  Width = 65
                  Height = 21
                  DataField = 'LZP_SCT8_IDA'
                  DataSource = dmSys1.dtsLineZonePrices
                  TabOrder = 0
                end
                object dbeZoneSec8Back: TDBEdit
                  Left = 74
                  Top = 29
                  Width = 67
                  Height = 21
                  DataField = 'LZP_SCT8_VOLTA'
                  DataSource = dmSys1.dtsLineZonePrices
                  TabOrder = 1
                end
              end
              object gbZon9: TGroupBox
                Left = 452
                Top = 54
                Width = 146
                Height = 55
                Caption = 'Se'#231#227'o 9'
                TabOrder = 8
                object Label168: TLabel
                  Left = 4
                  Top = 16
                  Width = 15
                  Height = 13
                  Caption = 'Ida'
                end
                object Label169: TLabel
                  Left = 75
                  Top = 16
                  Width = 24
                  Height = 13
                  Caption = 'Volta'
                end
                object dbeZoneSec9Go: TDBEdit
                  Left = 3
                  Top = 29
                  Width = 65
                  Height = 21
                  DataField = 'LZP_SCT9_IDA'
                  DataSource = dmSys1.dtsLineZonePrices
                  TabOrder = 0
                end
                object dbeZoneSec9Back: TDBEdit
                  Left = 74
                  Top = 29
                  Width = 67
                  Height = 21
                  DataField = 'LZP_SCT9_VOLTA'
                  DataSource = dmSys1.dtsLineZonePrices
                  TabOrder = 1
                end
              end
              object gbZon10: TGroupBox
                Left = 603
                Top = 54
                Width = 146
                Height = 55
                Caption = 'Se'#231#227'o 10'
                TabOrder = 9
                object Label170: TLabel
                  Left = 4
                  Top = 16
                  Width = 15
                  Height = 13
                  Caption = 'Ida'
                end
                object Label171: TLabel
                  Left = 75
                  Top = 16
                  Width = 24
                  Height = 13
                  Caption = 'Volta'
                end
                object dbeZoneSec10Go: TDBEdit
                  Left = 3
                  Top = 29
                  Width = 65
                  Height = 21
                  DataField = 'LZP_SCT10_IDA'
                  DataSource = dmSys1.dtsLineZonePrices
                  TabOrder = 0
                end
                object dbeZoneSec10Back: TDBEdit
                  Left = 74
                  Top = 29
                  Width = 67
                  Height = 21
                  DataField = 'LZP_SCT10_VOLTA'
                  DataSource = dmSys1.dtsLineZonePrices
                  TabOrder = 1
                end
              end
            end
            object TabSheet10: TTabSheet
              Caption = '11 - 20'
              ImageIndex = 1
              object gbZon11: TGroupBox
                Left = 3
                Top = -2
                Width = 146
                Height = 55
                Caption = 'Se'#231#227'o 11'
                TabOrder = 0
                object Label172: TLabel
                  Left = 4
                  Top = 16
                  Width = 15
                  Height = 13
                  Caption = 'Ida'
                end
                object Label173: TLabel
                  Left = 75
                  Top = 16
                  Width = 24
                  Height = 13
                  Caption = 'Volta'
                end
                object dbeZoneSec11Go: TDBEdit
                  Left = 3
                  Top = 29
                  Width = 65
                  Height = 21
                  DataField = 'LZP_SCT11_IDA'
                  DataSource = dmSys1.dtsLineZonePrices
                  TabOrder = 0
                end
                object dbeZoneSec11Back: TDBEdit
                  Left = 74
                  Top = 29
                  Width = 67
                  Height = 21
                  DataField = 'LZP_SCT11_VOLTA'
                  DataSource = dmSys1.dtsLineZonePrices
                  TabOrder = 1
                end
              end
              object gbZon12: TGroupBox
                Left = 152
                Top = -2
                Width = 146
                Height = 55
                Caption = 'Se'#231#227'o 12'
                TabOrder = 1
                object Label174: TLabel
                  Left = 4
                  Top = 16
                  Width = 15
                  Height = 13
                  Caption = 'Ida'
                end
                object Label175: TLabel
                  Left = 75
                  Top = 16
                  Width = 24
                  Height = 13
                  Caption = 'Volta'
                end
                object dbeZoneSec12Go: TDBEdit
                  Left = 3
                  Top = 29
                  Width = 65
                  Height = 21
                  DataField = 'LZP_SCT12_IDA'
                  DataSource = dmSys1.dtsLineZonePrices
                  TabOrder = 0
                end
                object dbeZoneSec12Back: TDBEdit
                  Left = 74
                  Top = 29
                  Width = 67
                  Height = 21
                  DataField = 'LZP_SCT12_VOLTA'
                  DataSource = dmSys1.dtsLineZonePrices
                  TabOrder = 1
                end
              end
              object gbZon13: TGroupBox
                Left = 302
                Top = -2
                Width = 146
                Height = 55
                Caption = 'Se'#231#227'o 13'
                TabOrder = 2
                object Label176: TLabel
                  Left = 4
                  Top = 16
                  Width = 15
                  Height = 13
                  Caption = 'Ida'
                end
                object Label177: TLabel
                  Left = 75
                  Top = 16
                  Width = 24
                  Height = 13
                  Caption = 'Volta'
                end
                object dbeZoneSec13Go: TDBEdit
                  Left = 3
                  Top = 29
                  Width = 65
                  Height = 21
                  DataField = 'LZP_SCT13_IDA'
                  DataSource = dmSys1.dtsLineZonePrices
                  TabOrder = 0
                end
                object dbeZoneSec13Back: TDBEdit
                  Left = 74
                  Top = 29
                  Width = 67
                  Height = 21
                  DataField = 'LZP_SCT13_VOLTA'
                  DataSource = dmSys1.dtsLineZonePrices
                  TabOrder = 1
                end
              end
              object gbZon14: TGroupBox
                Left = 452
                Top = -2
                Width = 146
                Height = 55
                Caption = 'Se'#231#227'o 14'
                TabOrder = 3
                object Label178: TLabel
                  Left = 4
                  Top = 16
                  Width = 15
                  Height = 13
                  Caption = 'Ida'
                end
                object Label179: TLabel
                  Left = 75
                  Top = 16
                  Width = 24
                  Height = 13
                  Caption = 'Volta'
                end
                object dbeZoneSec14Go: TDBEdit
                  Left = 3
                  Top = 29
                  Width = 65
                  Height = 21
                  DataField = 'LZP_SCT14_IDA'
                  DataSource = dmSys1.dtsLineZonePrices
                  TabOrder = 0
                end
                object dbeZoneSec14Back: TDBEdit
                  Left = 74
                  Top = 29
                  Width = 67
                  Height = 21
                  DataField = 'LZP_SCT14_VOLTA'
                  DataSource = dmSys1.dtsLineZonePrices
                  TabOrder = 1
                end
              end
              object gbZon15: TGroupBox
                Left = 603
                Top = -2
                Width = 146
                Height = 55
                Caption = 'Se'#231#227'o 15'
                TabOrder = 4
                object Label180: TLabel
                  Left = 4
                  Top = 16
                  Width = 15
                  Height = 13
                  Caption = 'Ida'
                end
                object Label181: TLabel
                  Left = 75
                  Top = 16
                  Width = 24
                  Height = 13
                  Caption = 'Volta'
                end
                object dbeZoneSec15Go: TDBEdit
                  Left = 3
                  Top = 29
                  Width = 65
                  Height = 21
                  DataField = 'LZP_SCT15_IDA'
                  DataSource = dmSys1.dtsLineZonePrices
                  TabOrder = 0
                end
                object dbeZoneSec15Back: TDBEdit
                  Left = 74
                  Top = 29
                  Width = 67
                  Height = 21
                  DataField = 'LZP_SCT15_VOLTA'
                  DataSource = dmSys1.dtsLineZonePrices
                  TabOrder = 1
                end
              end
              object gbZon20: TGroupBox
                Left = 603
                Top = 54
                Width = 146
                Height = 55
                Caption = 'Se'#231#227'o 20'
                TabOrder = 5
                object Label182: TLabel
                  Left = 4
                  Top = 16
                  Width = 15
                  Height = 13
                  Caption = 'Ida'
                end
                object Label183: TLabel
                  Left = 75
                  Top = 16
                  Width = 24
                  Height = 13
                  Caption = 'Volta'
                end
                object dbeZoneSec20Go: TDBEdit
                  Left = 3
                  Top = 29
                  Width = 65
                  Height = 21
                  DataField = 'LZP_SCT20_IDA'
                  DataSource = dmSys1.dtsLineZonePrices
                  TabOrder = 0
                end
                object dbeZoneSec20Back: TDBEdit
                  Left = 74
                  Top = 29
                  Width = 67
                  Height = 21
                  DataField = 'LZP_SCT20_VOLTA'
                  DataSource = dmSys1.dtsLineZonePrices
                  TabOrder = 1
                end
              end
              object gbZon19: TGroupBox
                Left = 452
                Top = 54
                Width = 146
                Height = 55
                Caption = 'Se'#231#227'o 19'
                TabOrder = 6
                object Label184: TLabel
                  Left = 4
                  Top = 16
                  Width = 15
                  Height = 13
                  Caption = 'Ida'
                end
                object Label185: TLabel
                  Left = 75
                  Top = 16
                  Width = 24
                  Height = 13
                  Caption = 'Volta'
                end
                object dbeZoneSec19Go: TDBEdit
                  Left = 3
                  Top = 29
                  Width = 65
                  Height = 21
                  DataField = 'LZP_SCT19_IDA'
                  DataSource = dmSys1.dtsLineZonePrices
                  TabOrder = 0
                end
                object dbeZoneSec19Back: TDBEdit
                  Left = 74
                  Top = 29
                  Width = 67
                  Height = 21
                  DataField = 'LZP_SCT19_VOLTA'
                  DataSource = dmSys1.dtsLineZonePrices
                  TabOrder = 1
                end
              end
              object gbZon18: TGroupBox
                Left = 302
                Top = 54
                Width = 146
                Height = 55
                Caption = 'Se'#231#227'o 18'
                TabOrder = 7
                object Label186: TLabel
                  Left = 4
                  Top = 16
                  Width = 15
                  Height = 13
                  Caption = 'Ida'
                end
                object Label187: TLabel
                  Left = 75
                  Top = 16
                  Width = 24
                  Height = 13
                  Caption = 'Volta'
                end
                object dbeZoneSec18Go: TDBEdit
                  Left = 3
                  Top = 29
                  Width = 65
                  Height = 21
                  DataField = 'LZP_SCT18_IDA'
                  DataSource = dmSys1.dtsLineZonePrices
                  TabOrder = 0
                end
                object dbeZoneSec18Back: TDBEdit
                  Left = 74
                  Top = 29
                  Width = 67
                  Height = 21
                  DataField = 'LZP_SCT18_VOLTA'
                  DataSource = dmSys1.dtsLineZonePrices
                  TabOrder = 1
                end
              end
              object gbZon17: TGroupBox
                Left = 152
                Top = 54
                Width = 146
                Height = 55
                Caption = 'Se'#231#227'o 17'
                TabOrder = 8
                object Label188: TLabel
                  Left = 4
                  Top = 16
                  Width = 15
                  Height = 13
                  Caption = 'Ida'
                end
                object Label189: TLabel
                  Left = 75
                  Top = 16
                  Width = 24
                  Height = 13
                  Caption = 'Volta'
                end
                object dbeZoneSec17Go: TDBEdit
                  Left = 3
                  Top = 29
                  Width = 65
                  Height = 21
                  DataField = 'LZP_SCT17_IDA'
                  DataSource = dmSys1.dtsLineZonePrices
                  TabOrder = 0
                end
                object dbeZoneSec17Back: TDBEdit
                  Left = 74
                  Top = 29
                  Width = 67
                  Height = 21
                  DataField = 'LZP_SCT17_VOLTA'
                  DataSource = dmSys1.dtsLineZonePrices
                  TabOrder = 1
                end
              end
              object gbZon16: TGroupBox
                Left = 3
                Top = 54
                Width = 146
                Height = 55
                Caption = 'Se'#231#227'o 16'
                TabOrder = 9
                object Label190: TLabel
                  Left = 4
                  Top = 16
                  Width = 15
                  Height = 13
                  Caption = 'Ida'
                end
                object Label191: TLabel
                  Left = 75
                  Top = 16
                  Width = 24
                  Height = 13
                  Caption = 'Volta'
                end
                object dbeZoneSec16Go: TDBEdit
                  Left = 3
                  Top = 29
                  Width = 65
                  Height = 21
                  DataField = 'LZP_SCT16_IDA'
                  DataSource = dmSys1.dtsLineZonePrices
                  TabOrder = 0
                end
                object dbeZoneSec16Back: TDBEdit
                  Left = 74
                  Top = 29
                  Width = 67
                  Height = 21
                  DataField = 'LZP_SCT16_VOLTA'
                  DataSource = dmSys1.dtsLineZonePrices
                  TabOrder = 1
                end
              end
            end
            object TabSheet11: TTabSheet
              Caption = '21 - 30'
              ImageIndex = 2
              object gbZon21: TGroupBox
                Left = 3
                Top = -2
                Width = 146
                Height = 55
                Caption = 'Se'#231#227'o 21'
                TabOrder = 0
                object Label192: TLabel
                  Left = 4
                  Top = 16
                  Width = 15
                  Height = 13
                  Caption = 'Ida'
                end
                object Label193: TLabel
                  Left = 75
                  Top = 16
                  Width = 24
                  Height = 13
                  Caption = 'Volta'
                end
                object dbeZoneSec21Go: TDBEdit
                  Left = 3
                  Top = 29
                  Width = 65
                  Height = 21
                  DataField = 'LZP_SCT21_IDA'
                  DataSource = dmSys1.dtsLineZonePrices
                  TabOrder = 0
                end
                object dbeZoneSec21Back: TDBEdit
                  Left = 74
                  Top = 29
                  Width = 67
                  Height = 21
                  DataField = 'LZP_SCT21_VOLTA'
                  DataSource = dmSys1.dtsLineZonePrices
                  TabOrder = 1
                end
              end
              object gbZon22: TGroupBox
                Left = 152
                Top = -2
                Width = 146
                Height = 55
                Caption = 'Se'#231#227'o 22'
                TabOrder = 1
                object Label194: TLabel
                  Left = 4
                  Top = 16
                  Width = 15
                  Height = 13
                  Caption = 'Ida'
                end
                object Label195: TLabel
                  Left = 75
                  Top = 16
                  Width = 24
                  Height = 13
                  Caption = 'Volta'
                end
                object dbeZoneSec22Go: TDBEdit
                  Left = 3
                  Top = 29
                  Width = 65
                  Height = 21
                  DataField = 'LZP_SCT22_IDA'
                  DataSource = dmSys1.dtsLineZonePrices
                  TabOrder = 0
                end
                object dbeZoneSec22Back: TDBEdit
                  Left = 74
                  Top = 29
                  Width = 67
                  Height = 21
                  DataField = 'LZP_SCT22_VOLTA'
                  DataSource = dmSys1.dtsLineZonePrices
                  TabOrder = 1
                end
              end
              object gbZon23: TGroupBox
                Left = 302
                Top = -2
                Width = 146
                Height = 55
                Caption = 'Se'#231#227'o 23'
                TabOrder = 2
                object Label196: TLabel
                  Left = 4
                  Top = 16
                  Width = 15
                  Height = 13
                  Caption = 'Ida'
                end
                object Label197: TLabel
                  Left = 75
                  Top = 16
                  Width = 24
                  Height = 13
                  Caption = 'Volta'
                end
                object dbeZoneSec23Go: TDBEdit
                  Left = 3
                  Top = 29
                  Width = 65
                  Height = 21
                  DataField = 'LZP_SCT23_IDA'
                  DataSource = dmSys1.dtsLineZonePrices
                  TabOrder = 0
                end
                object dbeZoneSec23Back: TDBEdit
                  Left = 74
                  Top = 29
                  Width = 67
                  Height = 21
                  DataField = 'LZP_SCT23_VOLTA'
                  DataSource = dmSys1.dtsLineZonePrices
                  TabOrder = 1
                end
              end
              object gbZon24: TGroupBox
                Left = 452
                Top = -2
                Width = 146
                Height = 55
                Caption = 'Se'#231#227'o 24'
                TabOrder = 3
                object Label198: TLabel
                  Left = 4
                  Top = 16
                  Width = 15
                  Height = 13
                  Caption = 'Ida'
                end
                object Label199: TLabel
                  Left = 75
                  Top = 16
                  Width = 24
                  Height = 13
                  Caption = 'Volta'
                end
                object dbeZoneSec24Go: TDBEdit
                  Left = 3
                  Top = 29
                  Width = 65
                  Height = 21
                  DataField = 'LZP_SCT24_IDA'
                  DataSource = dmSys1.dtsLineZonePrices
                  TabOrder = 0
                end
                object dbeZoneSec24Back: TDBEdit
                  Left = 74
                  Top = 29
                  Width = 67
                  Height = 21
                  DataField = 'LZP_SCT24_VOLTA'
                  DataSource = dmSys1.dtsLineZonePrices
                  TabOrder = 1
                end
              end
              object gbZon25: TGroupBox
                Left = 603
                Top = -2
                Width = 146
                Height = 55
                Caption = 'Se'#231#227'o 25'
                TabOrder = 4
                object Label200: TLabel
                  Left = 4
                  Top = 16
                  Width = 15
                  Height = 13
                  Caption = 'Ida'
                end
                object Label201: TLabel
                  Left = 75
                  Top = 16
                  Width = 24
                  Height = 13
                  Caption = 'Volta'
                end
                object dbeZoneSec25Go: TDBEdit
                  Left = 3
                  Top = 29
                  Width = 65
                  Height = 21
                  DataField = 'LZP_SCT25_IDA'
                  DataSource = dmSys1.dtsLineZonePrices
                  TabOrder = 0
                end
                object dbeZoneSec25Back: TDBEdit
                  Left = 74
                  Top = 29
                  Width = 67
                  Height = 21
                  DataField = 'LZP_SCT25_VOLTA'
                  DataSource = dmSys1.dtsLineZonePrices
                  TabOrder = 1
                end
              end
              object gbZon29: TGroupBox
                Left = 452
                Top = 54
                Width = 146
                Height = 55
                Caption = 'Se'#231#227'o 29'
                TabOrder = 5
                object Label202: TLabel
                  Left = 4
                  Top = 16
                  Width = 15
                  Height = 13
                  Caption = 'Ida'
                end
                object Label203: TLabel
                  Left = 75
                  Top = 16
                  Width = 24
                  Height = 13
                  Caption = 'Volta'
                end
                object dbeZoneSec29Go: TDBEdit
                  Left = 3
                  Top = 29
                  Width = 65
                  Height = 21
                  DataField = 'LZP_SCT29_IDA'
                  DataSource = dmSys1.dtsLineZonePrices
                  TabOrder = 0
                end
                object dbeZoneSec29Back: TDBEdit
                  Left = 74
                  Top = 29
                  Width = 67
                  Height = 21
                  DataField = 'LZP_SCT29_VOLTA'
                  DataSource = dmSys1.dtsLineZonePrices
                  TabOrder = 1
                end
              end
              object gbZon28: TGroupBox
                Left = 302
                Top = 54
                Width = 146
                Height = 55
                Caption = 'Se'#231#227'o 28'
                TabOrder = 6
                object Label204: TLabel
                  Left = 4
                  Top = 16
                  Width = 15
                  Height = 13
                  Caption = 'Ida'
                end
                object Label205: TLabel
                  Left = 75
                  Top = 16
                  Width = 24
                  Height = 13
                  Caption = 'Volta'
                end
                object dbeZoneSec28Go: TDBEdit
                  Left = 3
                  Top = 29
                  Width = 65
                  Height = 21
                  DataField = 'LZP_SCT28_IDA'
                  DataSource = dmSys1.dtsLineZonePrices
                  TabOrder = 0
                end
                object dbeZoneSec28Back: TDBEdit
                  Left = 74
                  Top = 29
                  Width = 67
                  Height = 21
                  DataField = 'LZP_SCT28_VOLTA'
                  DataSource = dmSys1.dtsLineZonePrices
                  TabOrder = 1
                end
              end
              object gbZon27: TGroupBox
                Left = 152
                Top = 54
                Width = 146
                Height = 55
                Caption = 'Se'#231#227'o 27'
                TabOrder = 7
                object Label206: TLabel
                  Left = 4
                  Top = 16
                  Width = 15
                  Height = 13
                  Caption = 'Ida'
                end
                object Label207: TLabel
                  Left = 75
                  Top = 16
                  Width = 24
                  Height = 13
                  Caption = 'Volta'
                end
                object dbeZoneSec27Go: TDBEdit
                  Left = 3
                  Top = 29
                  Width = 65
                  Height = 21
                  DataField = 'LZP_SCT27_IDA'
                  DataSource = dmSys1.dtsLineZonePrices
                  TabOrder = 0
                end
                object dbeZoneSec27Back: TDBEdit
                  Left = 74
                  Top = 29
                  Width = 67
                  Height = 21
                  DataField = 'LZP_SCT27_VOLTA'
                  DataSource = dmSys1.dtsLineZonePrices
                  TabOrder = 1
                end
              end
              object gbZon26: TGroupBox
                Left = 3
                Top = 54
                Width = 146
                Height = 55
                Caption = 'Se'#231#227'o 26'
                TabOrder = 8
                object Label208: TLabel
                  Left = 4
                  Top = 16
                  Width = 15
                  Height = 13
                  Caption = 'Ida'
                end
                object Label209: TLabel
                  Left = 75
                  Top = 16
                  Width = 24
                  Height = 13
                  Caption = 'Volta'
                end
                object dbeZoneSec26Go: TDBEdit
                  Left = 3
                  Top = 29
                  Width = 65
                  Height = 21
                  DataField = 'LZP_SCT26_IDA'
                  DataSource = dmSys1.dtsLineZonePrices
                  TabOrder = 0
                end
                object dbeZoneSec26Back: TDBEdit
                  Left = 74
                  Top = 29
                  Width = 67
                  Height = 21
                  DataField = 'LZP_SCT26_VOLTA'
                  DataSource = dmSys1.dtsLineZonePrices
                  TabOrder = 1
                end
              end
              object gbZon30: TGroupBox
                Left = 603
                Top = 54
                Width = 146
                Height = 55
                Caption = 'Se'#231#227'o 30'
                TabOrder = 9
                object Label210: TLabel
                  Left = 4
                  Top = 16
                  Width = 15
                  Height = 13
                  Caption = 'Ida'
                end
                object Label211: TLabel
                  Left = 75
                  Top = 16
                  Width = 24
                  Height = 13
                  Caption = 'Volta'
                end
                object dbeZoneSec30Go: TDBEdit
                  Left = 3
                  Top = 29
                  Width = 65
                  Height = 21
                  DataField = 'LZP_SCT30_IDA'
                  DataSource = dmSys1.dtsLineZonePrices
                  TabOrder = 0
                end
                object dbeZoneSec30Back: TDBEdit
                  Left = 74
                  Top = 29
                  Width = 67
                  Height = 21
                  DataField = 'LZP_SCT30_VOLTA'
                  DataSource = dmSys1.dtsLineZonePrices
                  TabOrder = 1
                end
              end
            end
          end
          object CoolBar1: TCoolBar
            Left = 0
            Top = 0
            Width = 27
            Height = 26
            Align = alLeft
            AutoSize = True
            Bands = <
              item
                Control = ToolBar2
                ImageIndex = -1
                MinHeight = 23
                Width = 165
              end>
            Vertical = True
            object ToolBar2: TToolBar
              Left = 0
              Top = 9
              Width = 23
              Height = 156
              Align = alLeft
              Caption = 'tbCardsApps'
              Images = imglstBase
              TabOrder = 0
              object tbtnAddZone: TToolButton
                Left = 0
                Top = 2
                Action = actNewPrice
                Wrap = True
              end
              object tbtnModZone: TToolButton
                Left = 0
                Top = 24
                Action = actEditPrice
                Wrap = True
              end
              object tbtnDelZone: TToolButton
                Left = 0
                Top = 46
                Action = actDeletePrice
              end
            end
          end
          object pnlBottomZone: TPanel
            Left = 0
            Top = 26
            Width = 969
            Height = 28
            Align = alBottom
            TabOrder = 3
            Visible = False
            object btnCancelZone: TBitBtn
              Left = 641
              Top = 1
              Width = 81
              Height = 27
              Action = actCancelZone
              Caption = 'Cancelar'
              TabOrder = 0
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
            object btnOkZone: TBitBtn
              Left = 553
              Top = 1
              Width = 81
              Height = 27
              Action = actOkZone
              Caption = 'Ok'
              TabOrder = 1
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
          end
          object pnlZone: TPanel
            Left = 27
            Top = 0
            Width = 942
            Height = 26
            Align = alClient
            TabOrder = 4
            object pnlZoneLeft: TPanel
              Left = 1
              Top = 1
              Width = 783
              Height = 167
              Align = alClient
              BevelOuter = bvNone
              TabOrder = 0
              object dbgZone: TDBGrid
                Left = 0
                Top = 0
                Width = 783
                Height = 167
                Align = alClient
                Ctl3D = True
                DataSource = dmSys1.dtsLineZonePrices
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clWindowText
                Font.Height = -9
                Font.Name = 'MS Sans Serif'
                Font.Style = []
                Options = [dgTitles, dgIndicator, dgColLines, dgRowLines, dgRowSelect]
                ParentCtl3D = False
                ParentFont = False
                TabOrder = 0
                TitleFont.Charset = DEFAULT_CHARSET
                TitleFont.Color = clWindowText
                TitleFont.Height = -11
                TitleFont.Name = 'MS Sans Serif'
                TitleFont.Style = []
                OnDrawColumnCell = dbgDrawColumnCell
                Columns = <
                  item
                    Expanded = False
                    FieldName = 'LZP_DATE'
                    Visible = True
                  end
                  item
                    Expanded = False
                    FieldName = 'ISS_ID'
                    Width = 200
                    Visible = True
                  end
                  item
                    Expanded = False
                    FieldName = 'APP_ID'
                    Width = 200
                    Visible = True
                  end
                  item
                    Expanded = False
                    FieldName = 'LZP_SECTION'
                    Width = 45
                    Visible = True
                  end
                  item
                    Expanded = False
                    FieldName = 'DT_INICIO_VALID'
                    Width = 80
                    Visible = True
                  end
                  item
                    Expanded = False
                    FieldName = 'DT_FIM_VALID'
                    Width = 70
                    Visible = True
                  end
                  item
                    Expanded = False
                    FieldName = 'PODER_COMPRA'
                    Width = 88
                    Visible = True
                  end>
              end
            end
            object pnlZoneRight: TPanel
              Left = 784
              Top = 1
              Width = 259
              Height = 167
              Align = alRight
              BevelOuter = bvNone
              TabOrder = 1
              object DBGrid1: TDBGrid
                Left = 0
                Top = 0
                Width = 259
                Height = 167
                Align = alClient
                DataSource = dmSys1.dtsLineZonePricesIndividual
                Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgConfirmDelete, dgCancelOnExit]
                TabOrder = 0
                TitleFont.Charset = DEFAULT_CHARSET
                TitleFont.Color = clWindowText
                TitleFont.Height = -11
                TitleFont.Name = 'MS Sans Serif'
                TitleFont.Style = []
                Columns = <
                  item
                    Expanded = False
                    FieldName = 'LZPI_SECTION'
                    Width = 45
                    Visible = True
                  end
                  item
                    Expanded = False
                    FieldName = 'LZPI_PRICE_GO'
                    Width = 78
                    Visible = True
                  end
                  item
                    Expanded = False
                    FieldName = 'LZPI_PRICE_BACK'
                    Width = 78
                    Visible = True
                  end>
              end
            end
          end
        end
        object tabTrechos: TTabSheet
          Caption = 'Trechos'
          ImageIndex = 3
          object lb_trecho: TLabel
            Left = 48
            Top = 16
            Width = 34
            Height = 13
            Caption = 'Trecho'
          end
          object Label218: TLabel
            Left = 339
            Top = 17
            Width = 54
            Height = 13
            Caption = 'Valor pre'#231'o'
          end
          object Label219: TLabel
            Left = 476
            Top = 17
            Width = 59
            Height = 13
            Caption = 'Valor partida'
          end
          object Label220: TLabel
            Left = 341
            Top = 97
            Width = 65
            Height = 13
            Caption = 'Valor ped'#225'gio'
          end
          object Label221: TLabel
            Left = 478
            Top = 58
            Width = 59
            Height = 13
            Caption = 'Valor seguro'
          end
          object Label222: TLabel
            Left = 339
            Top = 57
            Width = 71
            Height = 13
            Caption = 'Valor desconto'
          end
          object Label223: TLabel
            Left = 480
            Top = 96
            Width = 51
            Height = 13
            Caption = 'Valor outro'
          end
          object Label224: TLabel
            Left = 48
            Top = 56
            Width = 23
            Height = 13
            Caption = 'Data'
          end
          object Label225: TLabel
            Tag = 1777
            Left = 48
            Top = 96
            Width = 47
            Height = 13
            Caption = 'Aplica'#231#227'o'
          end
          object Label230: TLabel
            Left = 624
            Top = 17
            Width = 71
            Height = 13
            Caption = 'Validade In'#237'cio'
          end
          object Label231: TLabel
            Left = 624
            Top = 58
            Width = 60
            Height = 13
            Caption = 'Validade Fim'
          end
          object Label232: TLabel
            Left = 624
            Top = 96
            Width = 82
            Height = 13
            Caption = 'Poder de Compra'
          end
          object Label236: TLabel
            Left = 192
            Top = 56
            Width = 85
            Height = 13
            Caption = 'C'#243'digo do Trecho'
          end
          object DBEdit11: TDBEdit
            Left = 192
            Top = 70
            Width = 121
            Height = 21
            DataField = 'COD_TRECHO'
            DataSource = DmSys.dtsLineDetailsXZones
            TabOrder = 15
            OnEnter = Entra
            OnExit = Sai
          end
          object pn_bottom_trechos: TPanel
            Left = 584
            Top = 144
            Width = 193
            Height = 33
            BevelOuter = bvNone
            TabOrder = 12
            Visible = False
            object btnCancelTrechos: TBitBtn
              Left = 97
              Top = 3
              Width = 81
              Height = 27
              Action = actCancelTrechos
              Caption = 'Cancelar'
              TabOrder = 1
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
            object btnOkTrechos: TBitBtn
              Left = 9
              Top = 3
              Width = 81
              Height = 27
              Action = ActOkTrechos
              Caption = 'Ok'
              TabOrder = 0
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
          end
          object DBDateEdit5: TDBDateEdit
            Left = 624
            Top = 32
            Width = 137
            Height = 21
            DataField = 'DT_INICIO_VALID'
            DataSource = DmSys.dtsLineDetailsXZones
            NumGlyphs = 2
            TabOrder = 3
            OnEnter = Entra
            OnExit = Sai
          end
          object DBDateEdit6: TDBDateEdit
            Left = 624
            Top = 72
            Width = 137
            Height = 21
            DataField = 'DT_FIM_VALID'
            DataSource = DmSys.dtsLineDetailsXZones
            NumGlyphs = 2
            TabOrder = 7
            OnEnter = Entra
            OnExit = Sai
          end
          object DBEdit5: TDBEdit
            Left = 624
            Top = 110
            Width = 129
            Height = 21
            DataField = 'PODER_COMPRA'
            DataSource = DmSys.dtsLineDetailsXZones
            TabOrder = 11
            OnEnter = Entra
            OnExit = Sai
          end
          object CoolBar2: TCoolBar
            Left = 0
            Top = 0
            Width = 27
            Height = 54
            Align = alLeft
            AutoSize = True
            Bands = <
              item
                Control = ToolBar5
                ImageIndex = -1
                MinHeight = 23
                Width = 193
              end>
            Vertical = True
            object ToolBar5: TToolBar
              Left = 0
              Top = 9
              Width = 23
              Height = 184
              Align = alLeft
              Caption = 'tbCardsApps'
              Images = imglstBase
              TabOrder = 0
              object tb_inserir_trecho: TToolButton
                Left = 0
                Top = 2
                Action = actNewPrice
                Wrap = True
              end
              object tb_editar_trecho: TToolButton
                Left = 0
                Top = 24
                Action = actEditPrice
                Wrap = True
              end
              object tb_excluir_trecho: TToolButton
                Left = 0
                Top = 46
                Action = actDeletePrice
              end
            end
          end
          object cb_trecho: TRxDBLookupCombo
            Left = 48
            Top = 32
            Width = 265
            Height = 21
            DropDownCount = 8
            DisplayAllFields = True
            DataField = 'ZN_ID'
            DataSource = DmSys.dtsLineDetailsXZones
            LookupField = 'ZN_ID'
            LookupDisplay = 'ZN_ID; ZNL_DESCSHORT_ORIG; ZNL_DESCSHORT_DEST'
            LookupSource = DmSys.dtsZones
            TabOrder = 0
            OnEnter = Entra
            OnExit = Sai
          end
          object dbed_preco: TDBEdit
            Left = 337
            Top = 32
            Width = 129
            Height = 21
            DataField = 'LDZN_PRICE'
            DataSource = DmSys.dtsLineDetailsXZones
            TabOrder = 1
            OnEnter = Entra
            OnExit = Sai
          end
          object dbed_partida: TDBEdit
            Left = 473
            Top = 32
            Width = 129
            Height = 21
            DataField = 'LDZN_DEPARTUREVALUE'
            DataSource = DmSys.dtsLineDetailsXZones
            TabOrder = 2
            OnEnter = Entra
            OnExit = Sai
          end
          object dbed_desconto: TDBEdit
            Left = 337
            Top = 72
            Width = 129
            Height = 21
            DataField = 'LDZN_DISCOUNTVALUE'
            DataSource = DmSys.dtsLineDetailsXZones
            TabOrder = 5
            OnEnter = Entra
            OnExit = Sai
          end
          object dbed_pedagio: TDBEdit
            Left = 337
            Top = 110
            Width = 129
            Height = 21
            DataField = 'LDZN_TOLLVALUE'
            DataSource = DmSys.dtsLineDetailsXZones
            TabOrder = 9
            OnEnter = Entra
            OnExit = Sai
          end
          object dbed_seguro: TDBEdit
            Left = 475
            Top = 110
            Width = 129
            Height = 21
            DataField = 'LDZN_OTHERVALUE'
            DataSource = DmSys.dtsLineDetailsXZones
            TabOrder = 10
            OnEnter = Entra
            OnExit = Sai
          end
          object dbed_outro: TDBEdit
            Left = 475
            Top = 72
            Width = 129
            Height = 21
            DataField = 'LDZN_INSURANCEVALUE'
            DataSource = DmSys.dtsLineDetailsXZones
            TabOrder = 6
            OnEnter = Entra
            OnExit = Sai
          end
          object DBDateEdit2: TDBDateEdit
            Left = 48
            Top = 71
            Width = 137
            Height = 21
            DataField = 'LDZN_DATE'
            DataSource = DmSys.dtsLineDetailsXZones
            NumGlyphs = 2
            TabOrder = 4
            OnEnter = Entra
            OnExit = Sai
          end
          object cb_aplicacao_trecho: TRxDBLookupCombo
            Left = 48
            Top = 110
            Width = 265
            Height = 21
            DropDownCount = 8
            DisplayAllFields = True
            LookupField = 'APP_ISS_ID'
            LookupDisplay = 'APP_ID; APP_DESCSHORT; ISS_DESCLONG'
            LookupDisplayIndex = 1
            LookupSource = DmSys.dtsApplicationsLook
            TabOrder = 8
            OnEnter = Entra
            OnExit = Sai
          end
          object pn_trechos: TPanel
            Left = 27
            Top = 0
            Width = 942
            Height = 54
            Align = alClient
            TabOrder = 13
            object dbg_trechos: TDBGrid
              Left = 1
              Top = 1
              Width = 1042
              Height = 195
              Align = alClient
              DataSource = DmSys.dtsLineDetailsXZones
              Options = [dgTitles, dgColLines, dgRowLines, dgRowSelect, dgAlwaysShowSelection]
              ReadOnly = True
              TabOrder = 0
              TitleFont.Charset = DEFAULT_CHARSET
              TitleFont.Color = clWindowText
              TitleFont.Height = -11
              TitleFont.Name = 'MS Sans Serif'
              TitleFont.Style = []
              OnDrawColumnCell = dbgDrawColumnCell
              OnDblClick = dbg_trechosDblClick
              Columns = <
                item
                  Expanded = False
                  FieldName = 'ZNL_DESCSHORT_ORIG'
                  Title.Caption = 'Origem'
                  Width = 100
                  Visible = True
                end
                item
                  Expanded = False
                  FieldName = 'ZNL_DESCSHORT_DEST'
                  Title.Caption = 'Destino'
                  Width = 100
                  Visible = True
                end
                item
                  Expanded = False
                  FieldName = 'LDZN_DATE'
                  Title.Caption = 'Data'
                  Width = 80
                  Visible = True
                end
                item
                  Expanded = False
                  FieldName = 'ISS_ID'
                  Title.Caption = 'Emissor'
                  Visible = True
                end
                item
                  Expanded = False
                  FieldName = 'APP_ID'
                  Title.Caption = 'Aplica'#231#227'o'
                  Visible = True
                end
                item
                  Expanded = False
                  FieldName = 'LDZN_PRICE'
                  Title.Caption = 'Valor pre'#231'o'
                  Visible = True
                end
                item
                  Expanded = False
                  FieldName = 'LDZN_DEPARTUREVALUE'
                  Title.Caption = 'Valor partida'
                  Visible = True
                end
                item
                  Expanded = False
                  FieldName = 'LDZN_TOLLVALUE'
                  Title.Caption = 'Valor ped'#225'gio'
                  Visible = True
                end
                item
                  Expanded = False
                  FieldName = 'LDZN_INSURANCEVALUE'
                  Title.Caption = 'Valor seguro'
                  Visible = True
                end
                item
                  Expanded = False
                  FieldName = 'LDZN_DISCOUNTVALUE'
                  Title.Caption = 'Valor desconto'
                  Visible = True
                end
                item
                  Expanded = False
                  FieldName = 'LDZN_OTHERVALUE'
                  Title.Caption = 'Valor outro'
                  Visible = True
                end
                item
                  Expanded = False
                  FieldName = 'LDZN_STATUS'
                  Title.Caption = 'Status'
                  Visible = True
                end
                item
                  Expanded = False
                  FieldName = 'DT_INICIO_VALID'
                  Title.Caption = 'Validade In'#237'cio'
                  Width = 80
                  Visible = True
                end
                item
                  Expanded = False
                  FieldName = 'DT_FIM_VALID'
                  Width = 70
                  Visible = True
                end
                item
                  Expanded = False
                  FieldName = 'PODER_COMPRA'
                  Width = 88
                  Visible = True
                end
                item
                  Expanded = False
                  FieldName = 'COD_TRECHO'
                  Width = 95
                  Visible = True
                end>
            end
          end
        end
      end
      object Button1: TButton
        Left = 664
        Top = 272
        Width = 75
        Height = 25
        Caption = 'Button1'
        TabOrder = 3
        Visible = False
      end
    end
  end
  object Panel5: TPanel [4]
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
  inherited imglstBase: TImageList
    Left = 120
    Top = 216
  end
  inherited actlstBase: TActionList
    Left = 88
    Top = 216
    inherited actFilter: TAction
      OnExecute = actFilterExecute
    end
    object actNewDetail: TAction
      Tag = 2776
      Category = 'Details-sections'
      Caption = 'actNewDetail'
      ImageIndex = 16
      OnExecute = actNewDetailExecute
    end
    object actEditDetail: TAction
      Tag = 2777
      Category = 'Details-sections'
      Caption = 'actEditDetail'
      ImageIndex = 10
      OnExecute = actEditDetailExecute
    end
    object actDeleteDetail: TAction
      Tag = 2778
      Category = 'Details-sections'
      Caption = 'actDeleteDetail'
      ImageIndex = 9
      OnExecute = actDeleteDetailExecute
    end
    object actOkDetail: TAction
      Tag = 2774
      Category = 'Details'
      Caption = 'actOkDetail'
      OnExecute = actOkDetailExecute
    end
    object actCancelDetail: TAction
      Tag = 2775
      Category = 'Details'
      Caption = 'actCancelDetail'
      OnExecute = actCancelDetailExecute
    end
    object actOkSections: TAction
      Tag = 2790
      Category = 'Sections'
      Caption = 'actOkSections'
      OnExecute = actOkSectionsExecute
    end
    object actCancelSections: TAction
      Tag = 2791
      Category = 'Sections'
      Caption = 'actCancelSections'
      OnExecute = actCancelSectionsExecute
    end
    object actNewPrice: TAction
      Tag = 2783
      Category = 'Prices-Discounts'
      Caption = 'actNewPrice'
      ImageIndex = 16
      OnExecute = actNewPriceExecute
    end
    object actEditPrice: TAction
      Tag = 2784
      Category = 'Prices-Discounts'
      Caption = 'actEditPrice'
      ImageIndex = 10
      OnExecute = actEditPriceExecute
    end
    object actDeletePrice: TAction
      Tag = 2785
      Category = 'Prices-Discounts'
      Caption = 'actDeletePrice'
      ImageIndex = 9
      OnExecute = actDeletePriceExecute
    end
    object actOkPrice: TAction
      Tag = 2781
      Category = 'Price'
      Caption = 'actOkPrice'
      OnExecute = actOkPriceExecute
    end
    object actCancelPrice: TAction
      Tag = 2782
      Category = 'Price'
      Caption = 'actCancelPrice'
      OnExecute = actCancelPriceExecute
    end
    object actOkDiscount: TAction
      Tag = 2779
      Category = 'Discount'
      Caption = 'actOkDiscount'
      OnExecute = actOkDiscountExecute
    end
    object actCancelDiscount: TAction
      Tag = 2780
      Category = 'Discount'
      Caption = 'actCancelDiscount'
      OnExecute = actCancelDiscountExecute
    end
    object actNewDiscounts: TAction
      Category = 'Discount'
      Caption = 'actNewDiscounts'
    end
    object Action2: TAction
      Category = 'Discount'
      Caption = 'Action2'
    end
    object Action3: TAction
      Category = 'Discount'
      Caption = 'Action3'
    end
    object actNewSection: TAction
      Category = 'Sections'
      Caption = 'actNewSection'
      ImageIndex = 16
      OnExecute = actNewSectionExecute
    end
    object actEditSection: TAction
      Category = 'Sections'
      Caption = 'actEditSection'
      ImageIndex = 10
      OnExecute = actEditSectionExecute
    end
    object actDeleteSection: TAction
      Category = 'Sections'
      Caption = 'actDelSection'
      ImageIndex = 9
      OnExecute = actDeleteSectionExecute
    end
    object actOkZone: TAction
      Caption = 'actOkZone'
      OnExecute = actOkZoneExecute
    end
    object actCancelZone: TAction
      Caption = 'actCancelZone'
      OnExecute = actCancelZoneExecute
    end
    object ActOkTrechos: TAction
      Category = 'Trechos'
      Caption = 'Ok'
      OnExecute = ActOkTrechosExecute
    end
    object actCancelTrechos: TAction
      Category = 'Trechos'
      Caption = 'Cancel'
      OnExecute = actCancelTrechosExecute
    end
  end
  inherited dtsMaster: TDataSource
    Left = 57
    Top = 216
  end
  inherited mMnuBase: TMainMenu
    Left = 25
    Top = 216
  end
end
