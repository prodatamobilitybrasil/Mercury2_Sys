inherited FrmValidatorFunctions: TFrmValidatorFunctions
  Tag = 63
  Left = 247
  Top = 115
  Width = 654
  Height = 386
  Caption = 'Fun'#231#245'es do Validador'
  PixelsPerInch = 96
  TextHeight = 13
  inherited cbBase: TCoolBar
    Width = 646
    Bands = <
      item
        Control = tbBase
        ImageIndex = -1
        MinHeight = 24
        Width = 642
      end>
    inherited tbBase: TToolBar
      Width = 629
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
    Width = 646
    Height = 307
    inherited tsBaseCadastroFiltro: TTabSheet
      Tag = 0
      inherited Splitter_Base1: TSplitter
        Top = 89
        Width = 638
        Color = clBlack
        ParentColor = False
      end
      inherited gbGrid: TGroupBox
        Top = 93
        Width = 638
        Height = 186
        inherited grdResultado: TDBGrid
          Width = 634
          Height = 169
          DataSource = dtsMaster
          OnTitleClick = grdResultadoTitleClick
          Columns = <
            item
              Alignment = taCenter
              Color = clAqua
              Expanded = False
              FieldName = 'VF_ID'
              Title.Alignment = taCenter
              Title.Caption = 'C'#243'digo'
              Title.Color = clYellow
              Width = 59
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'VF_DESC'
              Title.Caption = 'Descri'#231#227'o'
              Width = 400
              Visible = True
            end
            item
              Alignment = taCenter
              Expanded = False
              FieldName = 'VF_STATUS'
              Title.Alignment = taCenter
              Title.Caption = 'Status'
              Width = 63
              Visible = True
            end>
        end
      end
      inherited pnFiltro: TPanel
        Width = 638
        Height = 89
        inherited pnPesq: TPanel
          Width = 638
          Height = 89
          inherited gbFiltroAvansado: TGroupBox
            Width = 634
            Height = 85
            inherited pnVoltar: TPanel
              Top = 70
              Width = 630
              inherited lblBack: TLabel
                Left = 603
              end
            end
          end
          inherited gbFiltro: TGroupBox
            Width = 634
            Height = 85
            object lbCodigo: TLabel [0]
              Left = 13
              Top = 20
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
            object btnLimpaStatus: TSpeedButton [1]
              Left = 574
              Top = 36
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
            object Label3: TLabel [2]
              Left = 434
              Top = 20
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
            inherited pnPesquiza: TPanel
              Top = 70
              Width = 630
              inherited lblAdvancedSearch: TLabel
                Width = 630
              end
            end
            object edtDescricao: TEdit
              Left = 13
              Top = 39
              Width = 372
              Height = 21
              TabOrder = 1
              OnEnter = Entra
              OnExit = Sai
            end
            object lkFilterStatus: TComboBox
              Left = 435
              Top = 37
              Width = 138
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
      Tag = 0
      object GroupBox1: TGroupBox
        Left = 0
        Top = 0
        Width = 638
        Height = 279
        Align = alClient
        TabOrder = 0
        object Label1: TLabel
          Tag = 3074
          Left = 20
          Top = 26
          Width = 33
          Height = 13
          Caption = 'C'#243'digo'
          FocusControl = dbCodigo
        end
        object Label2: TLabel
          Tag = 3094
          Left = 111
          Top = 26
          Width = 48
          Height = 13
          Caption = 'Descri'#231#227'o'
          FocusControl = dbDesc
        end
        object Label6: TLabel
          Tag = 1045
          Left = 510
          Top = 26
          Width = 30
          Height = 13
          Caption = 'Status'
          FocusControl = dbStatus
        end
        object dbCodigo: TDBEdit
          Tag = 3074
          Left = 20
          Top = 41
          Width = 81
          Height = 21
          DataField = 'VF_ID'
          DataSource = dtsMaster
          TabOrder = 0
        end
        object dbDesc: TDBEdit
          Tag = 3094
          Left = 111
          Top = 41
          Width = 386
          Height = 21
          DataField = 'VF_DESC'
          DataSource = dtsMaster
          TabOrder = 1
        end
        object dbStatus: TRxDBComboBox
          Tag = 1045
          Left = 509
          Top = 41
          Width = 117
          Height = 21
          Style = csDropDownList
          DataField = 'VF_STATUS'
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
  end
  inherited dtsMaster: TDataSource
    DataSet = DmSys.cdsValFunc
  end
end
