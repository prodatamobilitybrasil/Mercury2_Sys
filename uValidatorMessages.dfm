inherited FrmValidadorMessages: TFrmValidadorMessages
  Tag = 64
  Left = 243
  Top = 111
  Width = 929
  Height = 440
  Caption = 'Mensagens'
  Constraints.MinHeight = 440
  Constraints.MinWidth = 610
  PixelsPerInch = 96
  TextHeight = 13
  inherited cbBase: TCoolBar
    Width = 921
    Bands = <
      item
        Control = tbBase
        ImageIndex = -1
        MinHeight = 24
        Width = 917
      end>
    inherited tbBase: TToolBar
      Width = 904
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
    Width = 921
    Height = 361
    inherited tsBaseCadastroFiltro: TTabSheet
      inherited Splitter_Base1: TSplitter
        Top = 81
        Width = 913
        Color = clBlack
        ParentColor = False
      end
      inherited gbGrid: TGroupBox
        Top = 85
        Width = 913
        Height = 248
        inherited grdResultado: TDBGrid
          Width = 909
          Height = 231
          DataSource = dtsMaster
          OnTitleClick = grdResultadoTitleClick
          Columns = <
            item
              Alignment = taCenter
              Color = clAqua
              Expanded = False
              FieldName = 'MSG_ID'
              Title.Alignment = taCenter
              Title.Caption = 'C'#243'digo'
              Title.Color = clYellow
              Width = 80
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'MSG_DESC'
              Title.Caption = 'Descri'#231#227'o'
              Width = 180
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'MSG_COMMENT'
              Title.Caption = 'Coment'#225'rio'
              Width = 300
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
              FieldName = 'MSG_REGDATE'
              Title.Caption = 'Registro'
              Width = 100
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'MSG_REGUSER'
              Title.Caption = 'Usu'#225'rio'
              Width = 122
              Visible = True
            end>
        end
      end
      inherited pnFiltro: TPanel
        Width = 913
        Height = 81
        inherited pnPesq: TPanel
          Width = 913
          Height = 81
          inherited gbFiltroAvansado: TGroupBox
            Width = 909
            Height = 77
            inherited pnVoltar: TPanel
              Top = 62
              Width = 905
              inherited lblBack: TLabel
                Left = 878
              end
            end
          end
          inherited gbFiltro: TGroupBox
            Width = 909
            Height = 77
            object Label3: TLabel [0]
              Tag = 2626
              Left = 13
              Top = 20
              Width = 44
              Height = 13
              Caption = 'C'#243'digo:'
              FocusControl = edCodigo
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'MS Sans Serif'
              Font.Style = [fsBold]
              ParentFont = False
            end
            object Label4: TLabel [1]
              Left = 146
              Top = 20
              Width = 62
              Height = 13
              Caption = 'Descri'#231#227'o:'
              FocusControl = edDescricao
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'MS Sans Serif'
              Font.Style = [fsBold]
              ParentFont = False
            end
            object lStatus: TLabel [2]
              Left = 454
              Top = 20
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
            object btnLimpaStatus: TSpeedButton [3]
              Left = 569
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
              Width = 905
              TabOrder = 3
              inherited lblAdvancedSearch: TLabel
                Width = 905
                Visible = False
              end
            end
            object edCodigo: TEdit
              Left = 13
              Top = 36
              Width = 98
              Height = 21
              CharCase = ecUpperCase
              TabOrder = 0
              OnEnter = Entra
              OnExit = Sai
              OnKeyPress = edCodigoKeyPress
            end
            object edDescricao: TEdit
              Tag = 2627
              Left = 146
              Top = 36
              Width = 266
              Height = 21
              CharCase = ecUpperCase
              TabOrder = 1
              OnEnter = Entra
              OnExit = Sai
            end
            object lkFilterStatus: TComboBox
              Left = 454
              Top = 36
              Width = 115
              Height = 21
              Style = csDropDownList
              ItemHeight = 13
              TabOrder = 2
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
      object GroupBox1: TGroupBox
        Left = 0
        Top = 0
        Width = 913
        Height = 333
        Align = alClient
        TabOrder = 0
        object Label1: TLabel
          Left = 20
          Top = 36
          Width = 48
          Height = 13
          Caption = 'Descri'#231#227'o'
          FocusControl = dbDesc
        end
        object lblComment: TLabel
          Left = 20
          Top = 198
          Width = 53
          Height = 13
          Caption = 'Coment'#225'rio'
          FocusControl = dbComment
        end
        object lblStatusCardUsers: TLabel
          Left = 418
          Top = 34
          Width = 30
          Height = 13
          Caption = 'Status'
          FocusControl = dbStatus
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -12
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentFont = False
        end
        object dbDesc: TDBEdit
          Left = 20
          Top = 51
          Width = 381
          Height = 21
          CharCase = ecUpperCase
          DataField = 'MSG_DESC'
          DataSource = dtsMaster
          MaxLength = 50
          TabOrder = 0
        end
        object GroupBox3: TGroupBox
          Left = 52
          Top = 99
          Width = 456
          Height = 70
          TabOrder = 1
          object dbchkPiscaVermelho: TDBCheckBox
            Left = 26
            Top = 19
            Width = 105
            Height = 14
            Caption = 'Pisca vermelho'
            DataField = 'MSG_BLINKRED'
            DataSource = dtsMaster
            TabOrder = 0
            ValueChecked = '1'
            ValueUnchecked = '0'
          end
          object dbchkPiscaVerde: TDBCheckBox
            Left = 26
            Top = 45
            Width = 105
            Height = 14
            Caption = 'Pisca verde'
            DataField = 'MSG_BLINKGREEN'
            DataSource = dtsMaster
            TabOrder = 1
            ValueChecked = '1'
            ValueUnchecked = '0'
          end
          object dbchkVermelho: TDBCheckBox
            Left = 145
            Top = 19
            Width = 104
            Height = 14
            Caption = 'Vermelho'
            DataField = 'MSG_RED'
            DataSource = dtsMaster
            TabOrder = 2
            ValueChecked = '1'
            ValueUnchecked = '0'
          end
          object dbchkVerde: TDBCheckBox
            Left = 145
            Top = 45
            Width = 104
            Height = 14
            Caption = 'Verde'
            DataField = 'MSG_GREEN'
            DataSource = dtsMaster
            TabOrder = 3
            ValueChecked = '1'
            ValueUnchecked = '0'
          end
          object dbchkBipLongo: TDBCheckBox
            Left = 264
            Top = 19
            Width = 105
            Height = 14
            Caption = 'Bip Longo'
            DataField = 'MSG_LONGBEEP'
            DataSource = dtsMaster
            TabOrder = 4
            ValueChecked = '1'
            ValueUnchecked = '0'
          end
          object dbchkBipCurto: TDBCheckBox
            Left = 264
            Top = 45
            Width = 105
            Height = 14
            Caption = 'Bip Curto'
            DataField = 'MSG_SHORTBEEP'
            DataSource = dtsMaster
            TabOrder = 5
            ValueChecked = '1'
            ValueUnchecked = '0'
          end
          object dbchkSetLeds: TDBCheckBox
            Left = 384
            Top = 19
            Width = 61
            Height = 14
            Caption = 'Set leds'
            DataField = 'MSG_SETLEDS'
            DataSource = dtsMaster
            TabOrder = 6
            ValueChecked = '1'
            ValueUnchecked = '0'
            OnClick = dbchkSetLedsClick
          end
          object dbchkOrLeds: TDBCheckBox
            Left = 384
            Top = 45
            Width = 60
            Height = 14
            Caption = 'Or leds'
            DataField = 'MSG_ORLEDS'
            DataSource = dtsMaster
            TabOrder = 7
            ValueChecked = '1'
            ValueUnchecked = '0'
            OnClick = dbchkOrLedsClick
          end
        end
        object dbComment: TDBEdit
          Left = 20
          Top = 214
          Width = 533
          Height = 104
          AutoSize = False
          DataField = 'MSG_COMMENT'
          DataSource = dtsMaster
          MaxLength = 512
          TabOrder = 2
        end
        object dbStatus: TRxDBComboBox
          Left = 417
          Top = 51
          Width = 140
          Height = 21
          Style = csDropDownList
          DataField = 'MSG_STATUS'
          DataSource = dtsMaster
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
    Top = 208
  end
  inherited actlstBase: TActionList
    Left = 88
    Top = 208
    inherited actFilter: TAction
      OnExecute = actFilterExecute
    end
  end
  inherited dtsMaster: TDataSource
    Left = 57
    Top = 208
  end
  inherited mMnuBase: TMainMenu
    Left = 25
    Top = 208
  end
end
