inherited FrmStatisticalFamilies: TFrmStatisticalFamilies
  Tag = 55
  Left = 242
  Width = 820
  Height = 475
  Caption = 'Contador Estat'#237'stico'
  Constraints.MinHeight = 475
  Constraints.MinWidth = 697
  PixelsPerInch = 96
  TextHeight = 13
  inherited cbBase: TCoolBar
    Width = 812
    Bands = <
      item
        Control = tbBase
        ImageIndex = -1
        MinHeight = 24
        Width = 808
      end>
    inherited tbBase: TToolBar
      Width = 795
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
    Width = 812
    Height = 396
    inherited tsBaseCadastroFiltro: TTabSheet
      inherited Splitter_Base1: TSplitter
        Top = 100
        Width = 804
        Color = clBlack
        ParentColor = False
      end
      inherited gbGrid: TGroupBox
        Top = 104
        Width = 804
        Height = 264
        inherited grdResultado: TDBGrid
          Width = 800
          Height = 247
          DataSource = dtsMaster
          OnTitleClick = grdResultadoTitleClick
          Columns = <
            item
              Alignment = taCenter
              Color = clAqua
              Expanded = False
              FieldName = 'SF_ID'
              Title.Alignment = taCenter
              Title.Caption = 'C'#243'digo'
              Title.Color = clYellow
              Width = 69
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'SF_DESC'
              Title.Caption = 'Descri'#231#227'o'
              Width = 194
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'SF_SORTORDER'
              Title.Caption = 'Ordem'
              Width = 82
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'SG_DESC'
              Title.Caption = 'Grupo'
              Width = 107
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'STATUS_ID'
              Title.Caption = 'Status'
              Width = 70
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'SF_REGDATE'
              Title.Caption = 'Registro'
              Width = 94
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'SF_REGUSER'
              Title.Caption = 'Usu'#225'rio'
              Width = 130
              Visible = True
            end>
        end
      end
      inherited pnFiltro: TPanel
        Width = 804
        Height = 100
        inherited pnPesq: TPanel
          Width = 804
          Height = 100
          inherited gbFiltroAvansado: TGroupBox
            Width = 800
            Height = 96
            inherited pnVoltar: TPanel
              Top = 81
              Width = 796
              inherited lblBack: TLabel
                Left = 769
              end
            end
          end
          inherited gbFiltro: TGroupBox
            Width = 800
            Height = 96
            object Label4: TLabel [0]
              Tag = 2437
              Left = 20
              Top = 26
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
            object Label5: TLabel [1]
              Tag = 2438
              Left = 137
              Top = 26
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
            object lStatus: TLabel [2]
              Tag = 2440
              Left = 409
              Top = 26
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
              Left = 523
              Top = 40
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
              Top = 81
              Width = 796
              inherited lblAdvancedSearch: TLabel
                Width = 796
                Visible = False
              end
            end
            object edCodigo: TEdit
              Left = 20
              Top = 41
              Width = 98
              Height = 21
              TabOrder = 1
              OnEnter = Entra
              OnExit = Sai
              OnKeyPress = edCodigoKeyPress
            end
            object edDesc: TEdit
              Left = 137
              Top = 41
              Width = 254
              Height = 21
              CharCase = ecUpperCase
              MaxLength = 50
              TabOrder = 2
              OnEnter = Entra
              OnExit = Sai
            end
            object lkFilterStatus: TComboBox
              Left = 409
              Top = 41
              Width = 113
              Height = 21
              Style = csDropDownList
              ItemHeight = 13
              ItemIndex = 0
              TabOrder = 3
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
      object GroupBox2: TGroupBox
        Left = 0
        Top = 0
        Width = 804
        Height = 75
        Align = alTop
        TabOrder = 0
        object Label2: TLabel
          Left = 10
          Top = 21
          Width = 48
          Height = 13
          Caption = 'Descri'#231#227'o'
          FocusControl = dbDesc
        end
        object Label3: TLabel
          Left = 321
          Top = 21
          Width = 31
          Height = 13
          Caption = 'Ordem'
          FocusControl = dbSortOrder
        end
        object Label1: TLabel
          Left = 374
          Top = 21
          Width = 82
          Height = 13
          Caption = 'Grupo Estat'#237'stico'
          FocusControl = dbGrupo
        end
        object dbDesc: TDBEdit
          Left = 10
          Top = 36
          Width = 310
          Height = 21
          CharCase = ecUpperCase
          DataField = 'SF_DESC'
          DataSource = dtsMaster
          TabOrder = 0
        end
        object dbSortOrder: TDBEdit
          Left = 321
          Top = 36
          Width = 53
          Height = 21
          DataField = 'SF_SORTORDER'
          DataSource = dtsMaster
          MaxLength = 5
          TabOrder = 1
        end
        object dbGrupo: TRxDBLookupCombo
          Left = 374
          Top = 36
          Width = 158
          Height = 21
          DropDownCount = 8
          DataField = 'SG_ID'
          DataSource = dtsMaster
          LookupField = 'SG_ID'
          LookupDisplay = 'SG_DESC'
          LookupSource = DmSys.dtsStatisticalGroups
          TabOrder = 2
        end
        object dbrdStatus: TDBRadioGroup
          Tag = 2457
          Left = 533
          Top = 23
          Width = 144
          Height = 34
          Caption = 'Status'
          Columns = 2
          DataField = 'SF_STATUS'
          DataSource = dtsMaster
          Items.Strings = (
            'Ativo'
            'Inativo')
          TabOrder = 3
          Values.Strings = (
            'A'
            'I')
        end
      end
      object GroupBox3: TGroupBox
        Left = 0
        Top = 75
        Width = 804
        Height = 293
        Align = alClient
        TabOrder = 1
        object GroupBox1: TGroupBox
          Tag = 2648
          Left = 2
          Top = 15
          Width = 324
          Height = 276
          Align = alLeft
          Caption = 'Condi'#231#245'es dispon'#237'veis'
          TabOrder = 0
          object lbDisponiveis: TListBox
            Left = 2
            Top = 15
            Width = 320
            Height = 259
            Align = alClient
            DragMode = dmAutomatic
            Font.Charset = ANSI_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'Courier New'
            Font.Style = []
            ItemHeight = 14
            MultiSelect = True
            ParentFont = False
            TabOrder = 0
            TabWidth = 30
            OnDragDrop = lbDisponiveisDragDrop
            OnDragOver = lbDisponiveisDragOver
          end
        end
        object GroupBox4: TGroupBox
          Tag = 2649
          Left = 326
          Top = 15
          Width = 476
          Height = 276
          Align = alClient
          Caption = '         Condi'#231#245'es selecionadas'
          TabOrder = 1
          object lbSelecionadas: TListBox
            Left = 32
            Top = 15
            Width = 442
            Height = 259
            Align = alClient
            DragMode = dmAutomatic
            Font.Charset = ANSI_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'Courier New'
            Font.Style = []
            ItemHeight = 14
            MultiSelect = True
            ParentFont = False
            TabOrder = 0
            TabWidth = 30
            OnDragDrop = lbSelecionadasDragDrop
            OnDragOver = lbSelecionadasDragOver
          end
          object Panel1: TPanel
            Left = 2
            Top = 15
            Width = 30
            Height = 259
            Align = alLeft
            BevelOuter = bvNone
            TabOrder = 1
            object cbConditions: TCoolBar
              Left = 1
              Top = 88
              Width = 27
              Height = 113
              Align = alNone
              AutoSize = True
              Bands = <
                item
                  Control = tbLineMt
                  ImageIndex = -1
                  MinHeight = 23
                  Width = 109
                end>
              Enabled = False
              Vertical = True
              object tbLineMt: TToolBar
                Left = 0
                Top = 9
                Width = 23
                Height = 90
                Align = alNone
                AutoSize = True
                Caption = 'tbLineMt'
                EdgeBorders = []
                Images = imglstBase
                TabOrder = 0
                object tbtnNewLineMt: TToolButton
                  Left = 0
                  Top = 2
                  Action = actAddAllLineMt
                  ParentShowHint = False
                  Wrap = True
                  ShowHint = True
                end
                object btnAddAllLineMt: TToolButton
                  Left = 0
                  Top = 24
                  Action = actAddLineMt
                  ParentShowHint = False
                  Wrap = True
                  ShowHint = True
                end
                object btnDelAllLineMt: TToolButton
                  Left = 0
                  Top = 46
                  Action = actDelLineMt
                  ParentShowHint = False
                  Wrap = True
                  ShowHint = True
                end
                object tbtnDeleteLineMt: TToolButton
                  Left = 0
                  Top = 68
                  Action = actDelAllLineMt
                  ParentShowHint = False
                  ShowHint = True
                end
              end
            end
          end
        end
      end
    end
  end
  object Panel2: TPanel [2]
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
    object actAddLineMt: TAction
      Tag = 2644
      Category = 'Detail'
      Caption = 'actAddLineMt'
      ImageIndex = 22
      OnExecute = actAddLineMtExecute
    end
    object actAddAllLineMt: TAction
      Tag = 2645
      Category = 'Detail'
      Caption = 'actAddAllLineMt'
      ImageIndex = 21
      OnExecute = actAddAllLineMtExecute
    end
    object actDelLineMt: TAction
      Tag = 2646
      Category = 'Detail'
      Caption = 'actDelLineMt'
      ImageIndex = 24
      OnExecute = actDelLineMtExecute
    end
    object actDelAllLineMt: TAction
      Tag = 2647
      Category = 'Detail'
      Caption = 'actDelAllLineMt'
      ImageIndex = 23
      OnExecute = actDelAllLineMtExecute
    end
  end
end
