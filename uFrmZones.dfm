inherited frmZones: TfrmZones
  Tag = 130
  Top = 108
  Width = 832
  Height = 469
  Caption = 'Trechos'
  PixelsPerInch = 96
  TextHeight = 13
  inherited cbBase: TCoolBar
    Width = 824
    Bands = <
      item
        Control = tbBase
        ImageIndex = -1
        MinHeight = 24
        Width = 820
      end>
    inherited tbBase: TToolBar
      Width = 807
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
    Width = 824
    Height = 390
    inherited tsBaseCadastroFiltro: TTabSheet
      inherited Splitter_Base1: TSplitter
        Top = 89
        Width = 816
        Color = clBlack
        ParentColor = False
      end
      inherited gbGrid: TGroupBox
        Top = 93
        Width = 816
        Height = 269
        inherited grdResultado: TDBGrid
          Tag = -1
          Width = 812
          Height = 252
          DataSource = dtsMaster
          OnTitleClick = grdResultadoTitleClick
          Columns = <
            item
              Alignment = taCenter
              Color = clAqua
              Expanded = False
              FieldName = 'ZN_ID'
              Title.Alignment = taCenter
              Title.Caption = 'C'#243'digo'
              Visible = True
            end
            item
              Alignment = taCenter
              Expanded = False
              FieldName = 'ZN_ZNLID_ORIG'
              Title.Alignment = taCenter
              Title.Caption = 'C'#243'digo origem'
              Width = 74
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'ZNL_DESCSHORT_ORIG'
              Title.Caption = 'Origem'
              Width = 124
              Visible = True
            end
            item
              Alignment = taCenter
              Expanded = False
              FieldName = 'ZN_ZNLID_DEST'
              Title.Alignment = taCenter
              Title.Caption = 'C'#243'digo destino'
              Width = 82
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'ZNL_DESCSHORT_DEST'
              Title.Caption = 'Destino'
              Width = 128
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'ZN_STATUS'
              Title.Caption = 'Status'
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'ZN_REGDATE'
              Title.Caption = 'Data registro'
              Width = 127
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'ZN_REGUSER'
              Title.Caption = 'Usu'#225'rio'
              Visible = True
            end>
        end
      end
      inherited pnFiltro: TPanel
        Width = 816
        Height = 89
        inherited pnPesq: TPanel
          Width = 816
          Height = 89
          inherited gbFiltroAvansado: TGroupBox
            Width = 812
            Height = 85
            inherited pnVoltar: TPanel
              Top = 70
              Width = 808
              inherited lblBack: TLabel
                Left = 781
              end
            end
          end
          inherited gbFiltro: TGroupBox
            Width = 812
            Height = 85
            object lb_origem: TLabel [0]
              Left = 16
              Top = 16
              Width = 44
              Height = 13
              Caption = 'Origem:'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'MS Sans Serif'
              Font.Style = [fsBold]
              ParentFont = False
            end
            object lblFilterStatus: TLabel [1]
              Left = 377
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
            object lb_destino: TLabel [2]
              Left = 196
              Top = 16
              Width = 48
              Height = 13
              Caption = 'Destino:'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'MS Sans Serif'
              Font.Style = [fsBold]
              ParentFont = False
            end
            object btnLimpaStatus: TSpeedButton [3]
              Left = 483
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
              Top = 70
              Width = 808
              inherited lblAdvancedSearch: TLabel
                Width = 808
                Visible = False
              end
            end
            object ed_origem: TEdit
              Left = 16
              Top = 32
              Width = 169
              Height = 21
              CharCase = ecUpperCase
              TabOrder = 1
              OnEnter = Entra
              OnExit = Sai
            end
            object lkFilterStatus: TComboBox
              Left = 377
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
            object ed_destino: TEdit
              Left = 196
              Top = 32
              Width = 169
              Height = 21
              CharCase = ecUpperCase
              TabOrder = 3
              OnEnter = Entra
              OnExit = Sai
            end
          end
        end
      end
    end
    inherited tsBaseCadastroConsulta: TTabSheet
      object Label1: TLabel
        Left = 72
        Top = 64
        Width = 33
        Height = 13
        Caption = 'Origem'
      end
      object Label2: TLabel
        Left = 312
        Top = 64
        Width = 36
        Height = 13
        Caption = 'Destino'
      end
      object cb_origem: TRxDBLookupCombo
        Left = 72
        Top = 80
        Width = 145
        Height = 21
        DropDownCount = 8
        DataField = 'ZN_ZNLID_ORIG'
        DataSource = dtsMaster
        LookupField = 'ZNL_ID'
        LookupDisplay = 'ZNL_DESCSHORT'
        LookupSource = DmSys.dtsZoneLocations
        TabOrder = 0
      end
      object cb_destino: TRxDBLookupCombo
        Left = 312
        Top = 80
        Width = 145
        Height = 21
        DropDownCount = 8
        DataField = 'ZN_ZNLID_DEST'
        DataSource = dtsMaster
        LookupField = 'ZNL_ID'
        LookupDisplay = 'ZNL_DESCSHORT'
        LookupSource = DmSys.dtsZoneLocations
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
    Top = 216
  end
  inherited actlstBase: TActionList
    Left = 88
    Top = 216
    inherited actFilter: TAction
      OnExecute = actFilterExecute
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
