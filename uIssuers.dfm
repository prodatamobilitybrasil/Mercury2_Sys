inherited FrmIssuers: TFrmIssuers
  Tag = 38
  Left = 240
  Top = 112
  Width = 903
  Height = 495
  Caption = 'Emissor'
  Constraints.MinHeight = 495
  Constraints.MinWidth = 724
  OnActivate = nil
  PixelsPerInch = 96
  TextHeight = 13
  inherited cbBase: TCoolBar
    Width = 895
    Bands = <
      item
        Control = tbBase
        ImageIndex = -1
        MinHeight = 24
        Width = 891
      end>
    inherited tbBase: TToolBar
      Width = 878
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
    Width = 895
    Height = 416
    inherited tsBaseCadastroFiltro: TTabSheet
      inherited Splitter_Base1: TSplitter
        Width = 887
        Color = clBlack
        ParentColor = False
      end
      inherited gbGrid: TGroupBox
        Width = 887
        Height = 256
        inherited grdResultado: TDBGrid
          Width = 883
          Height = 239
          DataSource = dtsMaster
          OnTitleClick = grdResultadoTitleClick
          Columns = <
            item
              Alignment = taCenter
              Color = clAqua
              Expanded = False
              FieldName = 'ISS_ID'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'MS Sans Serif'
              Font.Style = [fsBold]
              Title.Alignment = taCenter
              Title.Caption = 'C'#243'digo'
              Title.Color = clYellow
              Width = 60
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'ISS_DESCSHORT'
              Title.Caption = 'Nome'
              Width = 140
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'ISS_DESCLONG'
              Title.Caption = 'Descri'#231#227'o'
              Width = 200
              Visible = True
            end
            item
              Alignment = taCenter
              Expanded = False
              FieldName = 'ISS_CERTIFICATE'
              Title.Alignment = taCenter
              Title.Caption = 'Certificado'
              Width = 70
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
              FieldName = 'ISS_REGDATE'
              Title.Caption = 'Registro'
              Width = 129
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'ISS_REGUSER'
              Title.Caption = 'Usu'#225'rio'
              Width = 130
              Visible = True
            end>
        end
      end
      inherited pnFiltro: TPanel
        Width = 887
        inherited pnPesq: TPanel
          Width = 887
          inherited gbFiltroAvansado: TGroupBox
            Width = 883
            inherited pnVoltar: TPanel
              Width = 879
              inherited lblBack: TLabel
                Left = 852
              end
            end
          end
          inherited gbFiltro: TGroupBox
            Width = 883
            object lStatus: TLabel [0]
              Left = 362
              Top = 17
              Width = 41
              Height = 13
              Caption = 'Status:'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'MS Sans Serif'
              Font.Style = [fsBold]
              ParentFont = False
            end
            object Label5: TLabel [1]
              Left = 15
              Top = 17
              Width = 44
              Height = 13
              Caption = 'C'#243'digo:'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'MS Sans Serif'
              Font.Style = [fsBold]
              ParentFont = False
            end
            object Label7: TLabel [2]
              Left = 13
              Top = 65
              Width = 62
              Height = 13
              Caption = 'Descri'#231#227'o:'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'MS Sans Serif'
              Font.Style = [fsBold]
              ParentFont = False
            end
            object btnLimpaStatus: TSpeedButton [3]
              Left = 476
              Top = 32
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
            object Label6: TLabel [4]
              Left = 130
              Top = 17
              Width = 37
              Height = 13
              Caption = 'Nome:'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'MS Sans Serif'
              Font.Style = [fsBold]
              ParentFont = False
            end
            inherited pnPesquiza: TPanel
              Width = 879
              TabOrder = 4
              inherited lblAdvancedSearch: TLabel
                Width = 879
                Visible = False
              end
            end
            object edNome: TEdit
              Left = 130
              Top = 33
              Width = 215
              Height = 21
              CharCase = ecUpperCase
              MaxLength = 15
              TabOrder = 1
              OnEnter = Entra
              OnExit = Sai
            end
            object edDesc: TEdit
              Left = 13
              Top = 80
              Width = 300
              Height = 21
              CharCase = ecUpperCase
              MaxLength = 50
              TabOrder = 3
              OnEnter = Entra
              OnExit = Sai
            end
            object lkFilterStatus: TComboBox
              Left = 362
              Top = 33
              Width = 113
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
            object edCodigo: TEdit
              Left = 15
              Top = 33
              Width = 98
              Height = 21
              TabOrder = 0
              OnEnter = Entra
              OnExit = Sai
            end
          end
        end
      end
    end
    inherited tsBaseCadastroConsulta: TTabSheet
      object GroupBox1: TGroupBox
        Left = 0
        Top = 71
        Width = 887
        Height = 317
        Align = alClient
        TabOrder = 1
        object Label1: TLabel
          Left = 20
          Top = 16
          Width = 28
          Height = 13
          Caption = '&Nome'
          FocusControl = dbDescShort
        end
        object Label2: TLabel
          Left = 187
          Top = 16
          Width = 48
          Height = 13
          Caption = 'Descri'#231#227'o'
          FocusControl = dbDesc
        end
        object Label3: TLabel
          Left = 20
          Top = 69
          Width = 50
          Height = 13
          Caption = 'Certificado'
          FocusControl = dbCertificate
        end
        object lblStatusCardUsers: TLabel
          Tag = 2089
          Left = 484
          Top = 69
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
        object Label8: TLabel
          Left = 173
          Top = 69
          Width = 61
          Height = 13
          Caption = 'ISS_KEY_ID'
          FocusControl = dbKey
        end
        object Label9: TLabel
          Left = 312
          Top = 69
          Width = 72
          Height = 13
          Caption = 'ISS_KEY_STR'
          FocusControl = db_KeySTR
        end
        object dbDescShort: TDBEdit
          Left = 20
          Top = 33
          Width = 141
          Height = 21
          CharCase = ecUpperCase
          DataField = 'ISS_DESCSHORT'
          DataSource = dtsMaster
          MaxLength = 15
          TabOrder = 0
        end
        object dbDesc: TDBEdit
          Left = 187
          Top = 33
          Width = 390
          Height = 21
          CharCase = ecUpperCase
          DataField = 'ISS_DESCLONG'
          DataSource = dtsMaster
          MaxLength = 50
          TabOrder = 1
        end
        object dbCertificate: TDBEdit
          Left = 20
          Top = 85
          Width = 141
          Height = 21
          DataField = 'ISS_CERTIFICATE'
          DataSource = dtsMaster
          MaxLength = 5
          TabOrder = 2
          OnChange = dbCertificateChange
        end
        object dbCardUsersStatus: TRxDBComboBox
          Left = 483
          Top = 85
          Width = 134
          Height = 21
          Style = csDropDownList
          DataField = 'ISS_STATUS'
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
        object dbKey: TDBEdit
          Left = 173
          Top = 85
          Width = 127
          Height = 21
          DataField = 'ISS_KEY_ID'
          DataSource = dtsMaster
          TabOrder = 3
          OnChange = dbKeyChange
        end
        object db_KeySTR: TDBEdit
          Left = 312
          Top = 85
          Width = 161
          Height = 21
          DataField = 'ISS_KEY_STR'
          DataSource = dtsMaster
          TabOrder = 4
          OnChange = db_KeySTRChange
        end
      end
      object GroupBox2: TGroupBox
        Left = 0
        Top = 0
        Width = 887
        Height = 71
        Align = alTop
        TabOrder = 0
        object Label4: TLabel
          Left = 20
          Top = 20
          Width = 33
          Height = 13
          Caption = 'C'#243'digo'
          FocusControl = dbCodigo
        end
        object dbCodigo: TDBEdit
          Left = 20
          Top = 35
          Width = 98
          Height = 21
          DataField = 'ISS_ID'
          DataSource = dtsMaster
          TabOrder = 0
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
    Top = 256
  end
  inherited actlstBase: TActionList
    Left = 88
    Top = 256
    inherited actFilter: TAction
      OnExecute = actFilterExecute
    end
  end
  inherited dtsMaster: TDataSource
    DataSet = DmSys.cdsIssuers
    Left = 57
    Top = 256
  end
  inherited mMnuBase: TMainMenu
    Left = 25
    Top = 256
  end
end
