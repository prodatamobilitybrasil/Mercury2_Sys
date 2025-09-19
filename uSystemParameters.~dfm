inherited FrmSystemParameters: TFrmSystemParameters
  Tag = 57
  Left = 240
  Top = 111
  Width = 998
  Height = 478
  Caption = 'Par'#226'metros do Sistema'
  Constraints.MinHeight = 478
  Constraints.MinWidth = 676
  PixelsPerInch = 96
  TextHeight = 13
  inherited cbBase: TCoolBar
    Width = 990
    Bands = <
      item
        Control = tbBase
        ImageIndex = -1
        MinHeight = 24
        Width = 986
      end>
    inherited tbBase: TToolBar
      Width = 973
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
    Width = 990
    Height = 399
    inherited tsBaseCadastroFiltro: TTabSheet
      inherited Splitter_Base1: TSplitter
        Width = 982
        Color = clBlack
        ParentColor = False
      end
      inherited gbGrid: TGroupBox
        Width = 982
        Height = 239
        inherited grdResultado: TDBGrid
          Width = 978
          Height = 222
          DataSource = dtsMaster
          OnTitleClick = grdResultadoTitleClick
          Columns = <
            item
              Expanded = False
              FieldName = 'SP_CODE'
              Title.Caption = 'C'#243'digo'
              Title.Color = clYellow
              Width = 130
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'SP_DATATYPE'
              Title.Caption = 'DataType'
              Width = 110
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'SP_TYPE'
              Title.Caption = 'Tipo'
              Width = 130
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
              FieldName = 'SP_REGDATE'
              Title.Caption = 'Registro'
              Width = 120
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'SP_REGUSER'
              Title.Caption = 'Usu'#225'rio'
              Width = 130
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'SP_VALUE'
              Title.Caption = 'Valor'
              Width = 215
              Visible = True
            end>
        end
      end
      inherited pnFiltro: TPanel
        Width = 982
        inherited pnPesq: TPanel
          Width = 982
          inherited gbFiltroAvansado: TGroupBox
            Width = 978
            inherited pnVoltar: TPanel
              Width = 974
              inherited lblBack: TLabel
                Left = 947
              end
            end
          end
          inherited gbFiltro: TGroupBox
            Width = 978
            object lStatus: TLabel [0]
              Tag = 2481
              Left = 395
              Top = 17
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
              Tag = 2478
              Left = 26
              Top = 17
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
            object Label8: TLabel [2]
              Tag = 2479
              Left = 247
              Top = 17
              Width = 60
              Height = 13
              Caption = 'DataType:'
              FocusControl = edDataType
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'MS Sans Serif'
              Font.Style = [fsBold]
              ParentFont = False
            end
            object Label9: TLabel [3]
              Tag = 2480
              Left = 26
              Top = 62
              Width = 30
              Height = 13
              Caption = 'Tipo:'
              FocusControl = edTipo
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'MS Sans Serif'
              Font.Style = [fsBold]
              ParentFont = False
            end
            object btnLimpaStatus: TSpeedButton [4]
              Left = 496
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
            inherited pnPesquiza: TPanel
              Width = 974
              TabOrder = 4
              inherited lblAdvancedSearch: TLabel
                Width = 974
                Visible = False
              end
            end
            object edCodigo: TEdit
              Left = 26
              Top = 33
              Width = 209
              Height = 21
              CharCase = ecUpperCase
              TabOrder = 0
              OnEnter = Entra
              OnExit = Sai
            end
            object edDataType: TEdit
              Left = 247
              Top = 33
              Width = 137
              Height = 21
              CharCase = ecUpperCase
              TabOrder = 1
              OnEnter = Entra
              OnExit = Sai
            end
            object edTipo: TEdit
              Left = 26
              Top = 78
              Width = 358
              Height = 21
              CharCase = ecUpperCase
              TabOrder = 3
              OnEnter = Entra
              OnExit = Sai
            end
            object lkFilterStatus: TComboBox
              Tag = 2481
              Left = 395
              Top = 33
              Width = 100
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
          end
        end
      end
    end
    inherited tsBaseCadastroConsulta: TTabSheet
      object GroupBox1: TGroupBox
        Left = 0
        Top = 0
        Width = 982
        Height = 72
        Align = alTop
        TabOrder = 0
        object Label1: TLabel
          Left = 27
          Top = 13
          Width = 33
          Height = 13
          Caption = 'C'#243'digo'
          FocusControl = dbCodigo
        end
        object Label10: TLabel
          Tag = 2480
          Left = 232
          Top = 13
          Width = 21
          Height = 13
          Caption = 'Tipo'
          FocusControl = dbType
        end
        object dbCodigo: TDBEdit
          Left = 27
          Top = 29
          Width = 179
          Height = 21
          CharCase = ecUpperCase
          DataField = 'SP_CODE'
          DataSource = dtsMaster
          MaxLength = 20
          TabOrder = 0
          OnChange = dbCodigoChange
        end
        object dbType: TRxDBComboBox
          Left = 232
          Top = 29
          Width = 217
          Height = 21
          DataField = 'SP_TYPE'
          DataSource = dtsMaster
          EnableValues = False
          ItemHeight = 13
          Items.Strings = (
            'GENERAL'
            'PARAMBUSVAL'
            'POSSYSTEM'
            'RECORDER'
            'REFORMATTEDCARDS'
            'VTSYSTEM')
          TabOrder = 1
        end
      end
      object GroupBox2: TGroupBox
        Left = 0
        Top = 72
        Width = 982
        Height = 299
        Align = alClient
        TabOrder = 1
        object Label5: TLabel
          Left = 232
          Top = 18
          Width = 50
          Height = 13
          Caption = 'Certificado'
          FocusControl = dbCertificado
        end
        object Label4: TLabel
          Tag = 2481
          Left = 422
          Top = 17
          Width = 30
          Height = 13
          Caption = 'Status'
          FocusControl = dbCardUsersStatus
        end
        object Label3: TLabel
          Left = 26
          Top = 77
          Width = 24
          Height = 13
          Caption = 'Valor'
          FocusControl = dbValue
        end
        object Label2: TLabel
          Left = 26
          Top = 18
          Width = 57
          Height = 13
          Caption = 'DATATYPE'
          FocusControl = dbDataType
        end
        object dbCertificado: TDBEdit
          Left = 232
          Top = 33
          Width = 161
          Height = 21
          DataField = 'SP_CERTIFICATE'
          DataSource = dtsMaster
          MaxLength = 3
          TabOrder = 1
          OnChange = dbCertificadoChange
        end
        object dbValue: TDBEdit
          Left = 26
          Top = 92
          Width = 527
          Height = 83
          AutoSize = False
          DataField = 'SP_VALUE'
          DataSource = dtsMaster
          MaxLength = 255
          TabOrder = 3
        end
        object dbDataType: TDBEdit
          Left = 26
          Top = 33
          Width = 175
          Height = 21
          CharCase = ecUpperCase
          DataField = 'SP_DATATYPE'
          DataSource = dtsMaster
          MaxLength = 10
          TabOrder = 0
        end
        object dbCardUsersStatus: TRxDBComboBox
          Left = 422
          Top = 33
          Width = 134
          Height = 21
          Style = csDropDownList
          DataField = 'SP_STATUS'
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
        object btnBits: TButton
          Left = 24
          Top = 184
          Width = 57
          Height = 25
          Caption = 'BITs'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
          TabOrder = 4
          OnClick = btnBitsClick
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
    Left = 57
    Top = 256
  end
  inherited mMnuBase: TMainMenu
    Left = 25
    Top = 256
  end
end
