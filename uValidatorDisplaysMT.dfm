inherited FrmValidatorDisplaysMT: TFrmValidatorDisplaysMT
  Tag = 62
  Top = 112
  Width = 867
  Height = 530
  Caption = 'Displays'
  Constraints.MinHeight = 474
  Constraints.MinWidth = 679
  PixelsPerInch = 96
  TextHeight = 13
  inherited cbBase: TCoolBar
    Width = 859
    Bands = <
      item
        Control = tbBase
        ImageIndex = -1
        MinHeight = 24
        Width = 855
      end>
    inherited tbBase: TToolBar
      Width = 842
      object lbFiltrado: TLabel
        Left = 354
        Top = 2
        Width = 111
        Height = 22
        Cursor = crHandPoint
        Hint = 'Limpar FILTRO'
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
    Width = 859
    Height = 451
    inherited tsBaseCadastroFiltro: TTabSheet
      inherited Splitter_Base1: TSplitter
        Top = 81
        Width = 851
        Color = clBlack
        ParentColor = False
      end
      inherited gbGrid: TGroupBox
        Top = 85
        Width = 851
        Height = 338
        inherited grdResultado: TDBGrid
          Width = 847
          Height = 321
          DataSource = dtsMaster
          OnTitleClick = grdResultadoTitleClick
          Columns = <
            item
              Alignment = taCenter
              Color = clAqua
              Expanded = False
              FieldName = 'VDM_CODE'
              Title.Alignment = taCenter
              Title.Caption = 'C'#243'digo'
              Title.Color = clYellow
              Width = 70
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'VDM_DESC'
              Title.Caption = 'Descri'#231#227'o'
              Width = 200
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'VDM_LEDSETTINGS'
              Title.Caption = 'Controle de led'
              Width = 100
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'VDM_OPTIONS'
              Title.Caption = 'Op'#231#245'es'
              Width = 100
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
              FieldName = 'VDM_REGDATE'
              Title.Caption = 'Registro'
              Width = 120
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'VDM_REGUSER'
              Title.Caption = 'Usu'#225'rio'
              Width = 122
              Visible = True
            end>
        end
      end
      inherited pnFiltro: TPanel
        Width = 851
        Height = 81
        inherited pnPesq: TPanel
          Width = 851
          Height = 81
          inherited gbFiltroAvansado: TGroupBox
            Width = 847
            Height = 77
            inherited pnVoltar: TPanel
              Top = 62
              Width = 843
              inherited lblBack: TLabel
                Left = 816
              end
            end
          end
          inherited gbFiltro: TGroupBox
            Width = 847
            Height = 77
            object Label8: TLabel [0]
              Tag = 2594
              Left = 13
              Top = 21
              Width = 62
              Height = 13
              Caption = 'Descri'#231#227'o:'
              FocusControl = edDesc
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'MS Sans Serif'
              Font.Style = [fsBold]
              ParentFont = False
            end
            object Label10: TLabel [1]
              Tag = 2597
              Left = 361
              Top = 21
              Width = 41
              Height = 13
              Caption = 'Status:'
              FocusControl = lkFilterStatus
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'MS Sans Serif'
              Font.Style = [fsBold]
              ParentFont = False
            end
            object btnLimpaStatus: TSpeedButton [2]
              Left = 455
              Top = 34
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
              Top = 62
              Width = 843
              TabOrder = 2
              inherited lblAdvancedSearch: TLabel
                Width = 843
                Visible = False
              end
            end
            object edDesc: TEdit
              Left = 13
              Top = 36
              Width = 306
              Height = 21
              CharCase = ecUpperCase
              MaxLength = 50
              TabOrder = 0
              OnEnter = Entra
              OnExit = Sai
            end
            object lkFilterStatus: TComboBox
              Left = 360
              Top = 36
              Width = 94
              Height = 21
              Style = csDropDownList
              ItemHeight = 13
              TabOrder = 1
              OnEnter = Entra
              OnExit = Sai
              Items.Strings = (
                'Ativo'
                'Inativo')
            end
          end
        end
      end
    end
    inherited tsBaseCadastroConsulta: TTabSheet
      object gbDisplay: TGroupBox
        Left = 0
        Top = 0
        Width = 851
        Height = 179
        Align = alClient
        TabOrder = 0
        object Label2: TLabel
          Left = 144
          Top = 9
          Width = 48
          Height = 13
          Caption = 'Descri'#231#227'o'
          FocusControl = dbDesc
        end
        object Label3: TLabel
          Left = 498
          Top = 9
          Width = 75
          Height = 13
          Caption = 'Controle de Led'
          FocusControl = dbControle
          Visible = False
        end
        object Label4: TLabel
          Left = 11
          Top = 50
          Width = 37
          Height = 13
          Caption = 'Op'#231#245'es'
          FocusControl = dbOpcao
        end
        object Label5: TLabel
          Left = 11
          Top = 9
          Width = 33
          Height = 13
          Caption = 'C'#243'digo'
          FocusControl = dbCodigo
        end
        object lblStatusCardUsers: TLabel
          Left = 234
          Top = 50
          Width = 30
          Height = 13
          Caption = 'Status'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -12
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentFont = False
        end
        object dbDesc: TDBEdit
          Left = 144
          Top = 25
          Width = 313
          Height = 21
          CharCase = ecUpperCase
          DataField = 'VDM_DESC'
          DataSource = dtsMaster
          TabOrder = 1
        end
        object dbControle: TDBEdit
          Left = 498
          Top = 25
          Width = 135
          Height = 21
          DataField = 'VDM_LEDSETTINGS'
          DataSource = dtsMaster
          TabOrder = 2
          Visible = False
          OnChange = dbControleChange
        end
        object dbOpcao: TDBEdit
          Left = 10
          Top = 68
          Width = 159
          Height = 21
          DataField = 'VDM_OPTIONS'
          DataSource = dtsMaster
          TabOrder = 3
          OnChange = dbOpcaoChange
        end
        object dbCodigo: TDBEdit
          Left = 10
          Top = 25
          Width = 111
          Height = 21
          DataField = 'VDM_CODE'
          DataSource = dtsMaster
          TabOrder = 0
          OnExit = dbCodigoExit
        end
        object dbStatus: TRxDBComboBox
          Left = 233
          Top = 68
          Width = 140
          Height = 21
          Style = csDropDownList
          DataField = 'VDM_STATUS'
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
        object GroupBox3: TGroupBox
          Left = 12
          Top = 98
          Width = 697
          Height = 70
          TabOrder = 5
          object chkPiscaVermelho: TCheckBox
            Left = 24
            Top = 16
            Width = 97
            Height = 17
            Caption = 'Pisca Vermelho'
            TabOrder = 0
          end
          object chkVermelho: TCheckBox
            Left = 24
            Top = 40
            Width = 97
            Height = 17
            Caption = 'Vermelho'
            TabOrder = 1
          end
          object chkPiscaAmarelo: TCheckBox
            Left = 148
            Top = 16
            Width = 97
            Height = 17
            Caption = 'Pisca Amarelo'
            TabOrder = 2
          end
          object chkAmarelo: TCheckBox
            Left = 148
            Top = 40
            Width = 97
            Height = 17
            Caption = 'Amarelo'
            TabOrder = 3
          end
          object chkPiscaVerde: TCheckBox
            Left = 304
            Top = 16
            Width = 97
            Height = 17
            Caption = 'Pisca Verde'
            TabOrder = 4
          end
          object chkVerde: TCheckBox
            Left = 304
            Top = 40
            Width = 97
            Height = 17
            Caption = 'Verde'
            TabOrder = 5
          end
          object chkBeepLongo: TCheckBox
            Left = 444
            Top = 16
            Width = 97
            Height = 17
            Caption = 'Beep Longo'
            TabOrder = 6
          end
          object chkBeepCurto: TCheckBox
            Left = 444
            Top = 40
            Width = 97
            Height = 17
            Caption = 'Beep Curto'
            TabOrder = 7
          end
          object chkSetLeds: TCheckBox
            Left = 576
            Top = 16
            Width = 97
            Height = 17
            Caption = 'Set Leds'
            TabOrder = 8
          end
          object chkOrLeds: TCheckBox
            Left = 576
            Top = 40
            Width = 97
            Height = 17
            Caption = 'Or Leds'
            TabOrder = 9
          end
        end
      end
      object pgcDetail: TPageControl
        Left = 0
        Top = 179
        Width = 851
        Height = 244
        ActivePage = TabSheet1
        Align = alBottom
        TabOrder = 1
        object TabSheet1: TTabSheet
          Caption = 'Detalhes'
          object Label1: TLabel
            Left = 52
            Top = 26
            Width = 26
            Height = 13
            Caption = 'Linha'
            FocusControl = DBEdit1
          end
          object Label6: TLabel
            Left = 182
            Top = 26
            Width = 33
            Height = 13
            Caption = 'Coluna'
            FocusControl = DBEdit2
          end
          object Label7: TLabel
            Left = 325
            Top = 26
            Width = 27
            Height = 13
            Caption = 'Fonte'
            FocusControl = DBEdit5
          end
          object btDisplayOK: TSpeedButton
            Left = 410
            Top = 127
            Width = 78
            Height = 26
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
          object btDisplayCancel: TSpeedButton
            Left = 494
            Top = 127
            Width = 79
            Height = 26
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
          object Label9: TLabel
            Left = 52
            Top = 66
            Width = 27
            Height = 13
            Caption = 'Texto'
            FocusControl = DBEdit3
          end
          object DBEdit3: TDBEdit
            Left = 52
            Top = 79
            Width = 379
            Height = 21
            DataField = 'VDD_TEXT'
            DataSource = DmSys.dtsValidatorDisplaysDT
            TabOrder = 5
          end
          object cbCardApps: TCoolBar
            Left = 0
            Top = 0
            Width = 27
            Height = 216
            Align = alLeft
            AutoSize = True
            Bands = <
              item
                Control = tbCardsApps
                ImageIndex = -1
                MinHeight = 23
                Width = 212
              end>
            Vertical = True
            object tbCardsApps: TToolBar
              Left = 0
              Top = 9
              Width = 23
              Height = 203
              Align = alClient
              Caption = 'tbCardsApps'
              Images = imglstBase
              TabOrder = 0
              object tbtnNewCardApp: TToolButton
                Left = 0
                Top = 2
                Action = actNewDetail
                Wrap = True
              end
              object tbtnEditCardApp: TToolButton
                Left = 0
                Top = 24
                Action = actEditDetail
                Wrap = True
              end
              object tbtnDeleteCardApp: TToolButton
                Left = 0
                Top = 46
                Action = actDeleteDetail
              end
            end
          end
          object DBEdit1: TDBEdit
            Left = 52
            Top = 39
            Width = 98
            Height = 21
            DataField = 'VDD_LINE'
            DataSource = DmSys.dtsValidatorDisplaysDT
            TabOrder = 1
          end
          object DBEdit2: TDBEdit
            Left = 182
            Top = 39
            Width = 118
            Height = 21
            DataField = 'VDD_COLUMN'
            DataSource = DmSys.dtsValidatorDisplaysDT
            TabOrder = 2
          end
          object DBEdit5: TDBEdit
            Left = 325
            Top = 39
            Width = 105
            Height = 21
            DataField = 'VDD_FONT'
            DataSource = DmSys.dtsValidatorDisplaysDT
            TabOrder = 3
          end
          object dbgDetalhes: TDBGrid
            Left = 27
            Top = 0
            Width = 816
            Height = 216
            Align = alClient
            DataSource = DmSys.dtsValidatorDisplaysDT
            Options = [dgAlwaysShowEditor, dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgConfirmDelete]
            TabOrder = 0
            TitleFont.Charset = DEFAULT_CHARSET
            TitleFont.Color = clWindowText
            TitleFont.Height = -11
            TitleFont.Name = 'MS Sans Serif'
            TitleFont.Style = []
            OnKeyPress = dbgDetalhesKeyPress
            Columns = <
              item
                Expanded = False
                FieldName = 'VDD_LINE'
                Title.Caption = 'Linha'
                Width = 100
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'VDD_COLUMN'
                Title.Caption = 'Coluna'
                Width = 100
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'VDD_FONT'
                Title.Caption = 'Fonte'
                Width = 100
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'VDD_TEXT'
                Title.Caption = 'Texto'
                Width = 200
                Visible = True
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
      Tag = 2699
      Category = 'Detail'
      Caption = 'Novo Detalhe'
      ImageIndex = 16
      OnExecute = actNewDetailExecute
    end
    object actEditDetail: TAction
      Tag = 2700
      Category = 'Detail'
      Caption = 'actEditDetail'
      ImageIndex = 10
      OnExecute = actEditDetailExecute
    end
    object actDeleteDetail: TAction
      Tag = 2701
      Category = 'Detail'
      Caption = 'actDeleteDetail'
      ImageIndex = 9
      OnExecute = actDeleteDetailExecute
    end
    object actOkDetail: TAction
      Tag = 2702
      Category = 'Ok-Cancel'
      Caption = 'Ok'
      OnExecute = actOkDetailExecute
    end
    object actCancelDetail: TAction
      Tag = 2703
      Category = 'Ok-Cancel'
      Caption = 'Cancel'
      OnExecute = actCancelDetailExecute
    end
  end
end
