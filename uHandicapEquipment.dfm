inherited frmHandicapEquipment: TfrmHandicapEquipment
  Tag = 122
  Width = 796
  BorderIcons = [biSystemMenu, biMinimize]
  Caption = 'Equipamentos para Deficiente'
  PixelsPerInch = 96
  TextHeight = 13
  inherited cbBase: TCoolBar
    Width = 788
    Bands = <
      item
        Control = tbBase
        ImageIndex = -1
        MinHeight = 24
        Width = 784
      end>
    inherited tbBase: TToolBar
      Width = 771
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
    Width = 788
    inherited tsBaseCadastroFiltro: TTabSheet
      Tag = 0
      inherited Splitter_Base1: TSplitter
        Top = 97
        Width = 780
        Color = clBlack
        ParentColor = False
      end
      inherited gbGrid: TGroupBox
        Top = 101
        Width = 780
        Height = 197
        inherited grdResultado: TDBGrid
          Width = 776
          Height = 180
          DataSource = dtsMaster
          OnTitleClick = grdResultadoTitleClick
          Columns = <
            item
              Alignment = taCenter
              Color = clAqua
              Expanded = False
              FieldName = 'HCE_ID'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'MS Sans Serif'
              Font.Style = [fsBold]
              Title.Alignment = taCenter
              Title.Caption = 'C'#243'digo'
              Title.Color = clYellow
              Width = 53
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'HCE_DESC'
              Title.Caption = 'Descri'#231#227'o'
              Width = 267
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'HCE_STATUS'
              Title.Caption = 'Status'
              Width = 58
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'HCE_REGDATE'
              Title.Caption = 'Data'
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'HCE_REGUSER'
              Title.Caption = 'Usu'#225'rio'
              Visible = True
            end>
        end
      end
      inherited pnFiltro: TPanel
        Width = 780
        Height = 97
        inherited pnPesq: TPanel
          Width = 780
          Height = 97
          inherited gbFiltroAvansado: TGroupBox
            Width = 776
            Height = 93
            inherited pnVoltar: TPanel
              Top = 78
              Width = 772
              inherited lblBack: TLabel
                Left = 745
              end
            end
          end
          inherited gbFiltro: TGroupBox
            Width = 776
            Height = 93
            object Label3: TLabel [0]
              Left = 16
              Top = 28
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
            object Label4: TLabel [1]
              Left = 500
              Top = 28
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
              Left = 600
              Top = 43
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
              Top = 78
              Width = 772
              inherited lblAdvancedSearch: TLabel
                Width = 772
                Visible = False
              end
            end
            object edtPesqDesc: TEdit
              Left = 16
              Top = 44
              Width = 441
              Height = 21
              CharCase = ecUpperCase
              TabOrder = 1
              OnEnter = Entra
              OnExit = Sai
            end
            object cbxProcura: TComboBox
              Left = 500
              Top = 44
              Width = 100
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
        Left = 32
        Top = 52
        Width = 51
        Height = 13
        Caption = 'Descri'#231#227'o:'
      end
      object Label2: TLabel
        Left = 472
        Top = 52
        Width = 33
        Height = 13
        Caption = 'Status:'
      end
      object dbeHCE_DESC: TDBEdit
        Left = 88
        Top = 48
        Width = 361
        Height = 21
        CharCase = ecUpperCase
        DataField = 'HCE_DESC'
        DataSource = dtsMaster
        TabOrder = 0
      end
      object dbcHCE_STATUS: TRxDBComboBox
        Left = 512
        Top = 48
        Width = 145
        Height = 21
        Style = csDropDownList
        DataField = 'HCE_STATUS'
        DataSource = dtsMaster
        EnableValues = True
        ItemHeight = 13
        Items.Strings = (
          'Ativo'
          'Inativo')
        TabOrder = 1
        Values.Strings = (
          'A'
          'I')
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
    Top = 224
  end
  inherited actlstBase: TActionList
    Left = 88
    Top = 224
    inherited actFilter: TAction
      OnExecute = actFilterExecute
    end
  end
  inherited dtsMaster: TDataSource
    Left = 57
    Top = 224
  end
  inherited mMnuBase: TMainMenu
    Left = 25
    Top = 224
  end
end
