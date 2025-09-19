inherited frmBanks: TfrmBanks
  Tag = 124
  VertScrollBar.Range = 0
  BorderIcons = [biSystemMenu]
  BorderStyle = bsSingle
  Caption = 'Bancos'
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
              FieldName = 'BK_ID'
              Title.Caption = 'C'#243'digo'
              Width = 50
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'BK_DESC'
              Title.Caption = 'Descri'#231#227'o'
              Width = 200
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'BK_DESCSHORT'
              Title.Caption = 'Descri'#231#227'o Curta'
              Width = 100
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'BK_STATUS'
              Title.Caption = 'Status'
              Width = 50
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'BK_REGDATE'
              Title.Caption = 'Data'
              Width = 100
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'BK_REGUSER'
              Title.Caption = 'Usu'#225'rio'
              Width = 120
              Visible = True
            end>
        end
      end
      inherited pnFiltro: TPanel
        inherited pnPesq: TPanel
          inherited gbFiltro: TGroupBox
            object Label3: TLabel [0]
              Left = 16
              Top = 28
              Width = 48
              Height = 13
              Caption = 'Descri'#231#227'o'
            end
            object Label4: TLabel [1]
              Left = 500
              Top = 28
              Width = 30
              Height = 13
              Caption = 'Status'
            end
            object edtPesqDesc: TEdit
              Left = 16
              Top = 44
              Width = 453
              Height = 21
              CharCase = ecUpperCase
              TabOrder = 1
            end
            object cbxProcura: TComboBox
              Left = 500
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
          end
        end
      end
    end
    inherited tsBaseCadastroConsulta: TTabSheet
      object pnlBottom: TPanel
        Left = 0
        Top = 104
        Width = 668
        Height = 199
        Align = alBottom
        BevelOuter = bvNone
        TabOrder = 0
        object cbCardApps: TCoolBar
          Left = 0
          Top = 0
          Width = 27
          Height = 199
          Align = alLeft
          AutoSize = True
          Bands = <
            item
              Control = tbCardsApps
              ImageIndex = -1
              MinHeight = 23
              Width = 195
            end>
          Vertical = True
          object tbCardsApps: TToolBar
            Left = 0
            Top = 9
            Width = 23
            Height = 186
            Align = alClient
            Caption = 'tbCardsApps'
            Images = imglstBase
            TabOrder = 0
            object tbtnNewChildren: TToolButton
              Left = 0
              Top = 2
              ImageIndex = 16
              ParentShowHint = False
              Wrap = True
              ShowHint = True
              OnClick = tbtnNewChildrenClick
            end
            object tbtnEditChildren: TToolButton
              Left = 0
              Top = 24
              ImageIndex = 10
              ParentShowHint = False
              Wrap = True
              ShowHint = True
              OnClick = tbtnEditChildrenClick
            end
            object tbtnDeleteChildren: TToolButton
              Left = 0
              Top = 46
              ImageIndex = 14
              ParentShowHint = False
              ShowHint = True
              OnClick = tbtnDeleteChildrenClick
            end
          end
        end
        object pcSubBanks: TPageControl
          Left = 27
          Top = 0
          Width = 641
          Height = 199
          ActivePage = TabSheet1
          Align = alClient
          TabOrder = 1
          object TabSheet1: TTabSheet
            Caption = 'Nosso N'#250'mero'
            object SpeedButton3: TSpeedButton
              Left = 664
              Top = 111
              Width = 78
              Height = 32
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
            object Label6: TLabel
              Left = 480
              Top = 16
              Width = 30
              Height = 13
              Caption = 'Status'
              FocusControl = dbcNN_STATUS
            end
            object Label7: TLabel
              Left = 8
              Top = 16
              Width = 96
              Height = 13
              Caption = 'In'#237'cio da Sequ'#234'ncia'
              FocusControl = dbeNN_SEQINI
            end
            object Label8: TLabel
              Left = 164
              Top = 16
              Width = 85
              Height = 13
              Caption = 'Fim da Sequ'#234'ncia'
              FocusControl = dbeNN_SEQFIM
            end
            object Label9: TLabel
              Left = 320
              Top = 16
              Width = 78
              Height = 13
              Caption = 'Sequ'#234'ncia Atual'
              FocusControl = dbeNN_SEQVALUE
            end
            object dbcNN_STATUS: TRxDBComboBox
              Left = 480
              Top = 32
              Width = 145
              Height = 21
              Style = csDropDownList
              DataField = 'NN_STATUS'
              DataSource = dmSys1.dtsNossoNumero
              EnableValues = True
              ItemHeight = 13
              Items.Strings = (
                'Ativo'
                'Inativo')
              TabOrder = 3
              Values.Strings = (
                'A'
                'I')
            end
            object dbeNN_SEQINI: TDBEdit
              Left = 8
              Top = 32
              Width = 121
              Height = 21
              DataField = 'NN_SEQINI'
              DataSource = dmSys1.dtsNossoNumero
              MaxLength = 10
              TabOrder = 1
              OnExit = dbeNN_SEQINIExit
              OnKeyPress = dbeNN_SEQINIKeyPress
            end
            object dbeNN_SEQFIM: TDBEdit
              Left = 164
              Top = 32
              Width = 121
              Height = 21
              DataField = 'NN_SEQEND'
              DataSource = dmSys1.dtsNossoNumero
              MaxLength = 10
              TabOrder = 2
              OnKeyPress = dbeNN_SEQINIKeyPress
            end
            object dbeNN_SEQVALUE: TDBEdit
              Left = 320
              Top = 32
              Width = 121
              Height = 21
              DataField = 'NN_SEQVALUE'
              DataSource = dmSys1.dtsNossoNumero
              MaxLength = 10
              ReadOnly = True
              TabOrder = 4
            end
            object btnSalvar: TBitBtn
              Left = 392
              Top = 128
              Width = 75
              Height = 25
              Caption = 'Salvar'
              TabOrder = 5
              OnClick = btnSalvarClick
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
              Left = 488
              Top = 128
              Width = 75
              Height = 25
              Caption = 'Cancelar'
              TabOrder = 6
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
              NumGlyphs = 2
            end
            object dbgNossoNumero: TDBGrid
              Left = 0
              Top = 0
              Width = 633
              Height = 171
              Align = alClient
              DataSource = dmSys1.dtsNossoNumero
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
                  FieldName = 'NN_SEQINI'
                  Width = 70
                  Visible = True
                end
                item
                  Expanded = False
                  FieldName = 'NN_SEQEND'
                  Width = 70
                  Visible = True
                end
                item
                  Expanded = False
                  FieldName = 'NN_SEQVALUE'
                  Width = 70
                  Visible = True
                end
                item
                  Expanded = False
                  FieldName = 'NN_STATUS'
                  Visible = True
                end
                item
                  Expanded = False
                  FieldName = 'NN_REGDATE'
                  Width = 120
                  Visible = True
                end
                item
                  Expanded = False
                  FieldName = 'NN_REGUSER'
                  Width = 200
                  Visible = True
                end>
            end
          end
          object TabSheet2: TTabSheet
            Caption = 'Cedentes'
            ImageIndex = 1
            object PageControl1: TPageControl
              Left = 0
              Top = 0
              Width = 633
              Height = 171
              ActivePage = tabGeral
              Align = alClient
              TabOrder = 1
              object tabGeral: TTabSheet
                Caption = 'Dados Gerais'
                object Label10: TLabel
                  Left = 336
                  Top = 84
                  Width = 30
                  Height = 13
                  Caption = 'Status'
                  FocusControl = dbcCED_STATUS
                end
                object Label11: TLabel
                  Left = 8
                  Top = 4
                  Width = 38
                  Height = 13
                  Caption = 'Label11'
                  FocusControl = dbeBK_DESC
                end
                object Label12: TLabel
                  Left = 340
                  Top = 4
                  Width = 38
                  Height = 13
                  Caption = 'Label12'
                  FocusControl = dbeBK_DESCSHORT
                end
                object Label13: TLabel
                  Left = 8
                  Top = 44
                  Width = 38
                  Height = 13
                  Caption = 'Label13'
                  FocusControl = dbeCED_AGENCY
                end
                object Label14: TLabel
                  Left = 104
                  Top = 44
                  Width = 38
                  Height = 13
                  Caption = 'Label14'
                  FocusControl = dbeCED_CODCEDENTE
                end
                object Label15: TLabel
                  Left = 240
                  Top = 44
                  Width = 38
                  Height = 13
                  Caption = 'Label15'
                  FocusControl = dbeCED_ESPECIE
                end
                object Label16: TLabel
                  Left = 292
                  Top = 44
                  Width = 38
                  Height = 13
                  Caption = 'Label16'
                  FocusControl = dbeCED_LOCALPGTO
                end
                object Label17: TLabel
                  Left = 8
                  Top = 84
                  Width = 38
                  Height = 13
                  Caption = 'Label17'
                  FocusControl = dbeCED_ACEITE
                end
                object Label18: TLabel
                  Left = 60
                  Top = 84
                  Width = 38
                  Height = 13
                  Caption = 'Label18'
                  FocusControl = dbeCED_USOBANCO
                end
                object Label19: TLabel
                  Left = 144
                  Top = 84
                  Width = 38
                  Height = 13
                  Caption = 'Label19'
                  FocusControl = dbeCED_CARTEIRA
                end
                object Label20: TLabel
                  Left = 200
                  Top = 84
                  Width = 38
                  Height = 13
                  Caption = 'Label20'
                  FocusControl = dbCDE_QTDE
                end
                object dbeCED_DESC: TDBEdit
                  Left = 8
                  Top = 20
                  Width = 321
                  Height = 21
                  CharCase = ecUpperCase
                  DataField = 'CED_DESC'
                  DataSource = dmSys1.dtsCedente
                  TabOrder = 0
                end
                object dbeCED_DESCSHORT: TDBEdit
                  Left = 340
                  Top = 20
                  Width = 277
                  Height = 21
                  CharCase = ecUpperCase
                  DataField = 'CED_DESCSHORT'
                  DataSource = dmSys1.dtsCedente
                  TabOrder = 1
                end
                object dbeCED_AGENCY: TDBEdit
                  Left = 8
                  Top = 60
                  Width = 85
                  Height = 21
                  CharCase = ecUpperCase
                  DataField = 'CED_AGENCY'
                  DataSource = dmSys1.dtsCedente
                  TabOrder = 2
                end
                object dbeCED_CODCEDENTE: TDBEdit
                  Left = 104
                  Top = 60
                  Width = 125
                  Height = 21
                  CharCase = ecUpperCase
                  DataField = 'CED_CODCEDENTE'
                  DataSource = dmSys1.dtsCedente
                  TabOrder = 3
                end
                object dbeCED_ESPECIE: TDBEdit
                  Left = 240
                  Top = 60
                  Width = 29
                  Height = 21
                  CharCase = ecUpperCase
                  DataField = 'CED_ESPECIE'
                  DataSource = dmSys1.dtsCedente
                  TabOrder = 4
                end
                object dbeCED_LOCALPGTO: TDBEdit
                  Left = 292
                  Top = 60
                  Width = 325
                  Height = 21
                  CharCase = ecUpperCase
                  DataField = 'CED_LOCALPGTO'
                  DataSource = dmSys1.dtsCedente
                  TabOrder = 5
                end
                object dbeCED_ACEITE: TDBEdit
                  Left = 8
                  Top = 100
                  Width = 21
                  Height = 21
                  CharCase = ecUpperCase
                  DataField = 'CED_ACEITE'
                  DataSource = dmSys1.dtsCedente
                  TabOrder = 6
                end
                object dbeCED_USOBANCO: TDBEdit
                  Left = 60
                  Top = 100
                  Width = 73
                  Height = 21
                  CharCase = ecUpperCase
                  DataField = 'CED_USOBANCO'
                  DataSource = dmSys1.dtsCedente
                  TabOrder = 7
                end
                object dbeCED_CARTEIRA: TDBEdit
                  Left = 144
                  Top = 100
                  Width = 41
                  Height = 21
                  CharCase = ecUpperCase
                  DataField = 'CED_CARTEIRA'
                  DataSource = dmSys1.dtsCedente
                  TabOrder = 8
                end
                object dbCDE_QTDE: TDBEdit
                  Left = 200
                  Top = 100
                  Width = 121
                  Height = 21
                  CharCase = ecUpperCase
                  DataField = 'CED_QTDE'
                  DataSource = dmSys1.dtsCedente
                  TabOrder = 9
                end
                object dbcCED_STATUS: TRxDBComboBox
                  Left = 336
                  Top = 100
                  Width = 145
                  Height = 21
                  Style = csDropDownList
                  DataField = 'CED_STATUS'
                  DataSource = dmSys1.dtsCedente
                  EnableValues = True
                  ItemHeight = 13
                  Items.Strings = (
                    'Ativo'
                    'Inativo')
                  TabOrder = 10
                  Values.Strings = (
                    'A'
                    'I')
                end
                object btnSalvarCed: TBitBtn
                  Left = 544
                  Top = 86
                  Width = 75
                  Height = 25
                  Caption = 'Salvar'
                  TabOrder = 11
                  OnClick = btnSalvarCedClick
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
                object btnCancelarCed: TBitBtn
                  Left = 544
                  Top = 114
                  Width = 75
                  Height = 25
                  Caption = 'Cancelar'
                  TabOrder = 12
                  OnClick = btnCancelarCedClick
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
              object tabObs: TTabSheet
                Caption = 'Observa'#231#245'es'
                ImageIndex = 1
                object Label21: TLabel
                  Left = 8
                  Top = 4
                  Width = 63
                  Height = 13
                  Caption = 'Observa'#231#245'es'
                  FocusControl = dbeCED_OBS01
                end
                object dbeCED_OBS01: TDBEdit
                  Left = 8
                  Top = 20
                  Width = 605
                  Height = 21
                  DataField = 'CED_OBS01'
                  DataSource = dmSys1.dtsCedente
                  MaxLength = 80
                  TabOrder = 0
                end
                object dbeCED_OBS02: TDBEdit
                  Left = 8
                  Top = 44
                  Width = 605
                  Height = 21
                  DataField = 'CED_OBS02'
                  DataSource = dmSys1.dtsCedente
                  MaxLength = 80
                  TabOrder = 1
                end
                object dbeCED_OBS03: TDBEdit
                  Left = 8
                  Top = 68
                  Width = 605
                  Height = 21
                  DataField = 'CED_OBS03'
                  DataSource = dmSys1.dtsCedente
                  MaxLength = 80
                  TabOrder = 2
                end
                object dbeCED_OBS04: TDBEdit
                  Left = 8
                  Top = 92
                  Width = 605
                  Height = 21
                  DataField = 'CED_OBS04'
                  DataSource = dmSys1.dtsCedente
                  MaxLength = 80
                  TabOrder = 3
                end
                object dbeCED_OBS05: TDBEdit
                  Left = 8
                  Top = 116
                  Width = 605
                  Height = 21
                  DataField = 'CED_OBS05'
                  DataSource = dmSys1.dtsCedente
                  MaxLength = 80
                  TabOrder = 4
                end
              end
              object tabInstrucoes: TTabSheet
                Caption = 'Instru'#231#245'es'
                ImageIndex = 2
                object Label22: TLabel
                  Left = 8
                  Top = 4
                  Width = 38
                  Height = 13
                  Caption = 'Label22'
                  FocusControl = dbeCED_INSTRUCT1
                end
                object dbeCED_INSTRUCT1: TDBEdit
                  Left = 8
                  Top = 20
                  Width = 605
                  Height = 21
                  DataField = 'CED_INSTRUCT1'
                  DataSource = dmSys1.dtsCedente
                  TabOrder = 0
                end
                object dbeCED_INSTRUCT2: TDBEdit
                  Left = 8
                  Top = 44
                  Width = 605
                  Height = 21
                  DataField = 'CED_INSTRUCT2'
                  DataSource = dmSys1.dtsCedente
                  TabOrder = 1
                end
              end
            end
            object dbgCedente: TDBGrid
              Left = 0
              Top = 0
              Width = 633
              Height = 171
              Align = alClient
              DataSource = dmSys1.dtsCedente
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
                  FieldName = 'CED_DESC'
                  Width = 200
                  Visible = True
                end
                item
                  Expanded = False
                  FieldName = 'CED_DESCSHORT'
                  Width = 150
                  Visible = True
                end
                item
                  Expanded = False
                  FieldName = 'CED_AGENCY'
                  Visible = True
                end
                item
                  Expanded = False
                  FieldName = 'CED_CARTEIRA'
                  Visible = True
                end
                item
                  Expanded = False
                  FieldName = 'CED_CODCEDENTE'
                  Visible = True
                end
                item
                  Expanded = False
                  FieldName = 'CED_STATUS'
                  Width = 50
                  Visible = True
                end
                item
                  Expanded = False
                  FieldName = 'CED_REGDATE'
                  Width = 100
                  Visible = True
                end
                item
                  Expanded = False
                  FieldName = 'CED_REGUSER'
                  Width = 100
                  Visible = True
                end>
            end
          end
        end
      end
      object pnlTop: TPanel
        Left = 0
        Top = 0
        Width = 668
        Height = 104
        Align = alClient
        BevelOuter = bvNone
        TabOrder = 1
        object Label1: TLabel
          Left = 20
          Top = 8
          Width = 48
          Height = 13
          Caption = 'Descri'#231#227'o'
          FocusControl = dbeBK_DESC
        end
        object Label2: TLabel
          Left = 20
          Top = 48
          Width = 76
          Height = 13
          Caption = 'Descri'#231#227'o Curta'
          FocusControl = dbeBK_DESCSHORT
        end
        object Label5: TLabel
          Left = 508
          Top = 48
          Width = 30
          Height = 13
          Caption = 'Status'
          FocusControl = dbcBK_STATUS
        end
        object dbeBK_DESC: TDBEdit
          Left = 20
          Top = 24
          Width = 629
          Height = 21
          CharCase = ecUpperCase
          DataField = 'BK_DESC'
          DataSource = dtsMaster
          MaxLength = 50
          TabOrder = 0
        end
        object dbeBK_DESCSHORT: TDBEdit
          Left = 20
          Top = 64
          Width = 469
          Height = 21
          CharCase = ecUpperCase
          DataField = 'BK_DESCSHORT'
          DataSource = dtsMaster
          MaxLength = 30
          TabOrder = 1
        end
        object dbcBK_STATUS: TRxDBComboBox
          Left = 508
          Top = 64
          Width = 145
          Height = 21
          Style = csDropDownList
          DataField = 'BK_STATUS'
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
  end
  inherited actlstBase: TActionList
    inherited actFilter: TAction
      OnExecute = actFilterExecute
    end
  end
end
