inherited FrmCardDesign: TFrmCardDesign
  Tag = 17
  Left = 241
  Width = 708
  Height = 499
  Caption = 'Desenhos do Cart'#227'o'
  Constraints.MinHeight = 499
  Constraints.MinWidth = 708
  PixelsPerInch = 96
  TextHeight = 13
  inherited cbBase: TCoolBar
    Width = 700
    Bands = <
      item
        Control = tbBase
        ImageIndex = -1
        MinHeight = 24
        Width = 696
      end>
    inherited tbBase: TToolBar
      Width = 683
      object lbFiltrado: TLabel
        Left = 354
        Top = 2
        Width = 111
        Height = 22
        Cursor = crHandPoint
        Hint = 'Limpa Filtro'
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
    Width = 700
    Height = 420
    inherited tsBaseCadastroFiltro: TTabSheet
      inherited Splitter_Base1: TSplitter
        Top = 89
        Width = 692
        Color = clBlack
        ParentColor = False
      end
      inherited gbGrid: TGroupBox
        Top = 93
        Width = 692
        Height = 299
        inherited grdResultado: TDBGrid
          Width = 688
          Height = 282
          DataSource = dtsMaster
          OnTitleClick = grdResultadoTitleClick
          Columns = <
            item
              Expanded = False
              FieldName = 'CD_DESC'
              Title.Caption = 'Descri'#231#227'o'
              Title.Color = clYellow
              Width = 180
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'CD_CERTIFICATE'
              Title.Caption = 'Certificado'
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
              FieldName = 'CD_REGDATE'
              Title.Caption = 'Registro'
              Width = 130
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'CD_REGUSER'
              Title.Caption = 'Usu'#225'rio'
              Width = 130
              Visible = True
            end>
        end
      end
      inherited pnFiltro: TPanel
        Width = 692
        Height = 89
        inherited pnPesq: TPanel
          Width = 692
          Height = 89
          inherited gbFiltroAvansado: TGroupBox
            Width = 688
            Height = 85
            inherited pnVoltar: TPanel
              Top = 70
              Width = 684
              inherited lblBack: TLabel
                Left = 657
              end
            end
          end
          inherited gbFiltro: TGroupBox
            Width = 688
            Height = 85
            object lStatus: TLabel [0]
              Tag = 1767
              Left = 362
              Top = 25
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
            object Label7: TLabel [1]
              Tag = 1764
              Left = 13
              Top = 25
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
            object btnLimpaStatus: TSpeedButton [2]
              Left = 475
              Top = 39
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
              Top = 70
              Width = 684
              TabOrder = 2
              inherited lblAdvancedSearch: TLabel
                Width = 684
                Visible = False
              end
            end
            object lkFilterStatus: TComboBox
              Left = 362
              Top = 40
              Width = 113
              Height = 21
              Style = csDropDownList
              ItemHeight = 13
              ItemIndex = 0
              TabOrder = 1
              Text = 'Ativo'
              OnEnter = Entra
              OnExit = Sai
              Items.Strings = (
                'Ativo'
                'Inativo')
            end
            object edDesc: TEdit
              Left = 13
              Top = 40
              Width = 300
              Height = 21
              CharCase = ecUpperCase
              MaxLength = 50
              TabOrder = 0
              OnEnter = Entra
              OnExit = Sai
            end
          end
        end
      end
    end
    inherited tsBaseCadastroConsulta: TTabSheet
      object gbCarddesign: TGroupBox
        Left = 0
        Top = 0
        Width = 692
        Height = 124
        Align = alTop
        TabOrder = 0
        object lbDescricao: TLabel
          Left = 26
          Top = 18
          Width = 48
          Height = 13
          Caption = 'Descri'#231#227'o'
          FocusControl = dbDesc
        end
        object lbCertificate: TLabel
          Left = 319
          Top = 18
          Width = 50
          Height = 13
          Caption = 'Certificado'
          FocusControl = dbCertificate
        end
        object lblStatusCardUsers: TLabel
          Tag = 1770
          Left = 28
          Top = 65
          Width = 30
          Height = 13
          Caption = 'Status'
          FocusControl = dbCardUsersStatus
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -12
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentFont = False
        end
        object dbDesc: TDBEdit
          Left = 26
          Top = 34
          Width = 274
          Height = 21
          CharCase = ecUpperCase
          DataField = 'CD_DESC'
          DataSource = dtsMaster
          TabOrder = 0
        end
        object dbCertificate: TDBEdit
          Left = 319
          Top = 34
          Width = 124
          Height = 21
          DataField = 'CD_CERTIFICATE'
          DataSource = dtsMaster
          TabOrder = 1
        end
        object dbCardUsersStatus: TRxDBComboBox
          Left = 26
          Top = 80
          Width = 137
          Height = 21
          Style = csDropDownList
          DataField = 'CD_STATUS'
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
      object cbCardApps: TCoolBar
        Left = 0
        Top = 124
        Width = 27
        Height = 268
        Align = alLeft
        AutoSize = True
        Bands = <
          item
            Control = tbCardsApps
            ImageIndex = -1
            MinHeight = 23
            Width = 264
          end>
        Vertical = True
        object tbCardsApps: TToolBar
          Left = 0
          Top = 9
          Width = 23
          Height = 255
          Align = alClient
          Caption = 'tbCardsApps'
          Images = imglstBase
          TabOrder = 0
          object tbtnNewCardApp: TToolButton
            Left = 0
            Top = 2
            Action = actNewApp
            ParentShowHint = False
            Wrap = True
            ShowHint = True
          end
          object tbtnEditCardApp: TToolButton
            Left = 0
            Top = 24
            Action = actEditApp
            ParentShowHint = False
            Wrap = True
            ShowHint = True
          end
          object tbtnDeletePeriod: TToolButton
            Left = 0
            Top = 46
            Action = actDeleteApp
            ParentShowHint = False
            ShowHint = True
          end
        end
      end
      object pcSubApplications: TPageControl
        Left = 27
        Top = 124
        Width = 665
        Height = 268
        ActivePage = TabSheet1
        Align = alClient
        TabOrder = 2
        object TabSheet1: TTabSheet
          Tag = 1776
          Caption = 'Aplica'#231#245'es'
          object Label19: TLabel
            Tag = 1777
            Left = 24
            Top = 32
            Width = 47
            Height = 13
            Caption = 'Aplica'#231#227'o'
            FocusControl = dbLkApplications
          end
          object btDisplayCancel: TSpeedButton
            Left = 443
            Top = 175
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
          object btDisplayOK: TSpeedButton
            Left = 336
            Top = 175
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
          object dbLkApplications: TRxDBLookupCombo
            Left = 24
            Top = 48
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
          object dbgAplicacoes: TDBGrid
            Left = 0
            Top = 0
            Width = 657
            Height = 240
            Align = alClient
            DataSource = DmSys.dtsCarddesignXApp
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
                FieldName = 'APP_DESCSHORT'
                Title.Caption = 'Aplica'#231#227'o'
                Width = 200
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'ISS_DESCLONG'
                Title.Caption = 'Emissor'
                Width = 180
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'STATUS_ID'
                Title.Caption = 'Status'
                Width = 90
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'CDAPP_REGDATE'
                Title.Caption = 'Registro'
                Width = 100
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'CDAPP_REGUSER'
                Title.Caption = 'Usu'#225'rio'
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
    object actNewApp: TAction
      Tag = 2725
      Category = 'Applications'
      Caption = 'actNewApp'
      ImageIndex = 16
      OnExecute = actNewAppExecute
    end
    object actEditApp: TAction
      Tag = 2726
      Category = 'Applications'
      Caption = 'actEditApp'
      ImageIndex = 10
      OnExecute = actEditAppExecute
    end
    object actDeleteApp: TAction
      Tag = 2727
      Category = 'Applications'
      Caption = 'actDeleteApp'
      ImageIndex = 9
      OnExecute = actDeleteAppExecute
    end
    object actOkApp: TAction
      Tag = 2728
      Category = 'Ok-Cancel'
      Caption = 'actOkApp'
      OnExecute = actOkAppExecute
    end
    object actCancelApp: TAction
      Tag = 2729
      Category = 'Ok-Cancel'
      Caption = 'actCancelApp'
      OnExecute = actCancelAppExecute
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
