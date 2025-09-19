inherited FrmZoneLocations: TFrmZoneLocations
  Tag = 129
  Left = 241
  Top = 110
  Height = 466
  Caption = 'Pontos de Trechos'
  PixelsPerInch = 96
  TextHeight = 13
  inherited cbBase: TCoolBar
    inherited tbBase: TToolBar
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
    Height = 387
    inherited tsBaseCadastroFiltro: TTabSheet
      inherited Splitter_Base1: TSplitter
        Top = 73
      end
      inherited gbGrid: TGroupBox
        Top = 77
        Height = 282
        inherited grdResultado: TDBGrid
          Tag = 1
          Height = 265
          DataSource = dtsMaster
          OnTitleClick = grdResultadoTitleClick
          Columns = <
            item
              Alignment = taCenter
              Color = clAqua
              Expanded = False
              FieldName = 'ZNL_ID'
              Title.Alignment = taCenter
              Title.Caption = 'C'#243'digo'
              Width = 55
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'ZNL_DESCSHORT'
              Title.Caption = 'Descri'#231#227'o'
              Title.Color = clYellow
              Width = 120
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'ZNL_STATUS'
              Title.Caption = 'Status'
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'ZNL_REGDATE'
              Title.Caption = 'Data registro'
              Width = 137
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'ZNL_REGUSER'
              Title.Caption = 'Usu'#225'rio'
              Width = 101
              Visible = True
            end>
        end
      end
      inherited pnFiltro: TPanel
        Height = 73
        inherited pnPesq: TPanel
          Height = 73
          inherited gbFiltroAvansado: TGroupBox
            Height = 69
            inherited pnVoltar: TPanel
              Top = 54
            end
          end
          inherited gbFiltro: TGroupBox
            Height = 69
            object lb_descricao: TLabel [0]
              Left = 16
              Top = 16
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
            object lblFilterStatus: TLabel [1]
              Left = 338
              Top = 15
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
            object btnLimpaStatus: TSpeedButton [2]
              Left = 444
              Top = 30
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
              Top = 54
              inherited lblAdvancedSearch: TLabel
                Visible = False
              end
            end
            object ed_descricao: TEdit
              Left = 16
              Top = 32
              Width = 305
              Height = 21
              CharCase = ecUpperCase
              TabOrder = 1
              OnEnter = Entra
              OnExit = Sai
            end
            object lkFilterStatus: TComboBox
              Left = 338
              Top = 31
              Width = 105
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
      object Label1: TLabel
        Left = 13
        Top = 28
        Width = 75
        Height = 13
        Caption = 'Descri'#231#227'o curta'
        FocusControl = ed_descricao_curta
      end
      object Label5: TLabel
        Left = 14
        Top = 71
        Width = 30
        Height = 13
        Caption = 'Status'
        FocusControl = cb_status
      end
      object Label2: TLabel
        Left = 221
        Top = 28
        Width = 77
        Height = 13
        Caption = 'Descri'#231#227'o longa'
        FocusControl = ed_descricao_longa
      end
      object ed_descricao_curta: TDBEdit
        Left = 13
        Top = 44
        Width = 196
        Height = 21
        CharCase = ecUpperCase
        DataField = 'ZNL_DESCSHORT'
        DataSource = dtsMaster
        MaxLength = 50
        TabOrder = 0
      end
      object cb_status: TRxDBComboBox
        Left = 14
        Top = 87
        Width = 117
        Height = 21
        Style = csDropDownList
        DataField = 'ZNL_STATUS'
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
      object ed_descricao_longa: TDBEdit
        Left = 221
        Top = 44
        Width = 420
        Height = 21
        CharCase = ecUpperCase
        DataField = 'ZNL_DESC'
        DataSource = dtsMaster
        MaxLength = 50
        TabOrder = 1
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
    Top = 192
  end
  inherited actlstBase: TActionList
    Left = 88
    Top = 192
    inherited actFilter: TAction
      OnExecute = actFilterExecute
    end
  end
  inherited dtsMaster: TDataSource
    Tag = 1
    Left = 57
    Top = 192
  end
  inherited mMnuBase: TMainMenu
    Left = 25
    Top = 192
  end
end
