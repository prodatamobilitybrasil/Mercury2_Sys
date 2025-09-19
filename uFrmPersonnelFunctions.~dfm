inherited FrmPersonnelFunctions: TFrmPersonnelFunctions
  Tag = 96
  Left = 245
  Width = 700
  Height = 515
  Caption = 'Cargos de Operador'
  Constraints.MinHeight = 515
  Constraints.MinWidth = 700
  PixelsPerInch = 96
  TextHeight = 13
  inherited cbBase: TCoolBar
    Width = 692
    Bands = <
      item
        Control = tbBase
        ImageIndex = -1
        MinHeight = 24
        Width = 688
      end>
    inherited tbBase: TToolBar
      Width = 675
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
    Width = 692
    Height = 436
    inherited tsBaseCadastroFiltro: TTabSheet
      inherited Splitter_Base1: TSplitter
        Top = 89
        Width = 684
        Color = clBlack
        ParentColor = False
      end
      inherited gbGrid: TGroupBox
        Top = 93
        Width = 684
        Height = 315
        inherited grdResultado: TDBGrid
          Width = 680
          Height = 298
          DataSource = dtsMaster
          OnTitleClick = grdResultadoTitleClick
          Columns = <
            item
              Expanded = False
              FieldName = 'PRST_DESC'
              Title.Caption = 'Cargo'
              Width = 183
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'PRST_ID'
              Title.Caption = 'LCargo'
              Visible = False
            end
            item
              Expanded = False
              FieldName = 'PF_DESC'
              Title.Caption = 'Fun'#231#227'o'
              Width = 288
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'STATUS_ID'
              Title.Caption = 'Status'
              Width = 80
              Visible = True
            end>
        end
      end
      inherited pnFiltro: TPanel
        Width = 684
        Height = 89
        inherited pnPesq: TPanel
          Width = 684
          Height = 89
          inherited gbFiltroAvansado: TGroupBox
            Width = 680
            Height = 85
            inherited pnVoltar: TPanel
              Top = 70
              Width = 676
              inherited lblBack: TLabel
                Left = 649
              end
            end
          end
          inherited gbFiltro: TGroupBox
            Width = 680
            Height = 85
            object Label1: TLabel [0]
              Tag = 3169
              Left = 16
              Top = 24
              Width = 38
              Height = 13
              Caption = 'Cargo:'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'MS Sans Serif'
              Font.Style = [fsBold]
              ParentFont = False
            end
            object Label2: TLabel [1]
              Tag = 3170
              Left = 228
              Top = 24
              Width = 47
              Height = 13
              Caption = 'Fun'#231#227'o:'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'MS Sans Serif'
              Font.Style = [fsBold]
              ParentFont = False
            end
            object Label3: TLabel [2]
              Tag = 3172
              Left = 440
              Top = 24
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
            object btnLimpaStatus: TSpeedButton [3]
              Left = 520
              Top = 39
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
              Width = 676
              inherited lblAdvancedSearch: TLabel
                Width = 676
                Visible = False
              end
            end
            object rxbdLookupCargo: TRxDBLookupCombo
              Left = 16
              Top = 40
              Width = 209
              Height = 21
              DropDownCount = 8
              LookupField = 'PRST_ID'
              LookupDisplay = 'PRST_DESC'
              LookupSource = DmSys.dtsPersonnelTypes
              TabOrder = 1
              OnEnter = Entra
              OnExit = Sai
            end
            object edtDesc: TEdit
              Left = 228
              Top = 40
              Width = 205
              Height = 21
              CharCase = ecUpperCase
              TabOrder = 2
              OnEnter = Entra
              OnExit = Sai
            end
            object cbStatus: TComboBox
              Left = 440
              Top = 40
              Width = 81
              Height = 21
              Style = csDropDownList
              ItemHeight = 13
              TabOrder = 3
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
      object LCargo: TLabel
        Tag = 3169
        Left = 16
        Top = 32
        Width = 34
        Height = 13
        Caption = 'LCargo'
        FocusControl = rxdbCargo
      end
      object LDesc: TLabel
        Left = 270
        Top = 32
        Width = 42
        Height = 13
        Caption = 'LFun'#231#227'o'
        FocusControl = dbDesc
      end
      object Label4: TLabel
        Tag = 3171
        Left = 496
        Top = 32
        Width = 36
        Height = 13
        Caption = 'LStatus'
        FocusControl = rxdbStatus
      end
      object rxdbCargo: TRxDBLookupCombo
        Left = 16
        Top = 48
        Width = 241
        Height = 21
        DropDownCount = 8
        DataField = 'PRST_ID'
        DataSource = dtsMaster
        LookupField = 'PRST_ID'
        LookupDisplay = 'PRST_DESC'
        LookupSource = DmSys.dtsPersonnelTypes
        TabOrder = 0
      end
      object dbDesc: TDBEdit
        Left = 270
        Top = 48
        Width = 217
        Height = 21
        CharCase = ecUpperCase
        DataField = 'PF_DESC'
        DataSource = dtsMaster
        TabOrder = 1
      end
      object rxdbStatus: TRxDBComboBox
        Left = 496
        Top = 48
        Width = 145
        Height = 21
        Style = csDropDownList
        DataField = 'PF_STATUS'
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
end
