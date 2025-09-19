inherited FrmLineGroups: TFrmLineGroups
  Tag = 31
  Left = 246
  Width = 768
  Height = 595
  Caption = 'Grupo de Linhas'
  Constraints.MinHeight = 595
  Constraints.MinWidth = 768
  PixelsPerInch = 96
  TextHeight = 13
  inherited cbBase: TCoolBar
    Width = 760
    Bands = <
      item
        Control = tbBase
        ImageIndex = -1
        MinHeight = 24
        Width = 756
      end>
    inherited tbBase: TToolBar
      Width = 743
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
    Width = 760
    Height = 516
    inherited tsBaseCadastroFiltro: TTabSheet
      inherited Splitter_Base1: TSplitter
        Top = 81
        Width = 752
        Color = clBlack
        ParentColor = False
      end
      inherited gbGrid: TGroupBox
        Top = 85
        Width = 752
        Height = 403
        inherited grdResultado: TDBGrid
          Width = 748
          Height = 386
          DataSource = dtsMaster
          OnTitleClick = grdResultadoTitleClick
          Columns = <
            item
              Expanded = False
              FieldName = 'LG_DESC'
              Title.Caption = 'Descri'#231#227'o'
              Title.Color = clYellow
              Width = 512
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'STATUS_ID'
              Title.Caption = 'Status'
              Width = 90
              Visible = True
            end>
        end
      end
      inherited pnFiltro: TPanel
        Width = 752
        Height = 81
        inherited pnPesq: TPanel
          Width = 752
          Height = 81
          inherited gbFiltroAvansado: TGroupBox
            Width = 748
            Height = 77
            inherited pnVoltar: TPanel
              Top = 62
              Width = 744
              inherited lblBack: TLabel
                Left = 717
              end
            end
          end
          inherited gbFiltro: TGroupBox
            Width = 748
            Height = 77
            object btnLimpaStatus: TSpeedButton [0]
              Left = 449
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
            object Label2: TLabel [1]
              Left = 13
              Top = 20
              Width = 104
              Height = 13
              Caption = 'Grupos de Linhas:'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'MS Sans Serif'
              Font.Style = [fsBold]
              ParentFont = False
            end
            object Label3: TLabel [2]
              Left = 344
              Top = 21
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
              Top = 62
              Width = 744
              inherited lblAdvancedSearch: TLabel
                Width = 744
                Visible = False
              end
            end
            object edGrupo: TEdit
              Left = 13
              Top = 37
              Width = 292
              Height = 21
              CharCase = ecUpperCase
              TabOrder = 1
              OnEnter = Entra
              OnExit = Sai
            end
            object lkFilterStatus: TComboBox
              Left = 344
              Top = 37
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
      object GroupBox1: TGroupBox
        Left = 0
        Top = 0
        Width = 752
        Height = 97
        Align = alTop
        TabOrder = 0
        object Label1: TLabel
          Left = 13
          Top = 28
          Width = 48
          Height = 13
          Caption = 'Descri'#231#227'o'
          FocusControl = dbDesc
        end
        object Label5: TLabel
          Tag = 1924
          Left = 321
          Top = 28
          Width = 30
          Height = 13
          Caption = 'Status'
          FocusControl = dbCardUsersStatus
        end
        object dbDesc: TDBEdit
          Left = 13
          Top = 44
          Width = 276
          Height = 21
          CharCase = ecUpperCase
          DataField = 'LG_DESC'
          DataSource = dtsMaster
          MaxLength = 50
          TabOrder = 0
        end
        object dbCardUsersStatus: TRxDBComboBox
          Left = 321
          Top = 44
          Width = 117
          Height = 21
          Style = csDropDownList
          DataField = 'LG_STATUS'
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
      object GroupBox3: TGroupBox
        Left = 0
        Top = 97
        Width = 752
        Height = 391
        Align = alClient
        TabOrder = 1
        object GroupBox2: TGroupBox
          Tag = 1929
          Left = 2
          Top = 15
          Width = 351
          Height = 374
          Align = alLeft
          Caption = 'Linhas dispon'#237'veis'
          TabOrder = 0
          object lbDisponiveis: TListBox
            Left = 2
            Top = 15
            Width = 347
            Height = 357
            Align = alClient
            DragMode = dmAutomatic
            Font.Charset = ANSI_CHARSET
            Font.Color = clWindowText
            Font.Height = -12
            Font.Name = 'Courier New'
            Font.Style = []
            ItemHeight = 15
            MultiSelect = True
            ParentFont = False
            TabOrder = 0
            TabWidth = 30
            OnDragDrop = lbDisponiveisDragDrop
            OnDragOver = lbDisponiveisDragOver
            OnMouseDown = lbDisponiveisMouseDown
          end
        end
        object GroupBox4: TGroupBox
          Tag = 1930
          Left = 353
          Top = 15
          Width = 397
          Height = 374
          Align = alClient
          Caption = '         Linhas selecionadas'
          TabOrder = 1
          object lbSelecionadas: TListBox
            Left = 32
            Top = 15
            Width = 363
            Height = 357
            Align = alClient
            DragMode = dmAutomatic
            Font.Charset = ANSI_CHARSET
            Font.Color = clWindowText
            Font.Height = -12
            Font.Name = 'Courier New'
            Font.Style = []
            ItemHeight = 15
            MultiSelect = True
            ParentFont = False
            TabOrder = 0
            TabWidth = 30
            OnDragDrop = lbSelecionadasDragDrop
            OnDragOver = lbSelecionadasDragOver
            OnMouseDown = lbSelecionadasMouseDown
          end
          object Panel1: TPanel
            Left = 2
            Top = 15
            Width = 30
            Height = 357
            Align = alLeft
            BevelOuter = bvNone
            TabOrder = 1
            object cbLineMt: TCoolBar
              Left = 1
              Top = 96
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
              Vertical = True
              object tbLineMt: TToolBar
                Left = 0
                Top = 9
                Width = 23
                Height = 94
                Align = alNone
                AutoSize = True
                ButtonHeight = 23
                Caption = 'tbLineMt'
                EdgeBorders = []
                Images = imglstBase
                TabOrder = 0
                object tbtnNewLineMt: TToolButton
                  Left = 0
                  Top = 2
                  Action = actAddAllLines
                  Wrap = True
                end
                object btnAddAllLineMt: TToolButton
                  Left = 0
                  Top = 25
                  Action = actAddLine
                  Wrap = True
                end
                object btnDelAllLineMt: TToolButton
                  Left = 0
                  Top = 48
                  Action = actDelLine
                  Wrap = True
                end
                object tbtnDeleteLineMt: TToolButton
                  Left = 0
                  Top = 71
                  Action = actDelAllLines
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
    object actAddLine: TAction
      Tag = 2668
      Category = 'Lines'
      Caption = 'actAddLine'
      ImageIndex = 22
      OnExecute = actAddLineExecute
    end
    object actAddAllLines: TAction
      Tag = 2669
      Category = 'Lines'
      Caption = 'actAddAllLines'
      ImageIndex = 21
      OnExecute = actAddAllLinesExecute
    end
    object actDelLine: TAction
      Tag = 2670
      Category = 'Lines'
      Caption = 'actDelLine'
      ImageIndex = 24
      OnExecute = actDelLineExecute
    end
    object actDelAllLines: TAction
      Tag = 2671
      Category = 'Lines'
      Caption = 'actDelAllLines'
      ImageIndex = 23
      OnExecute = actDelAllLinesExecute
    end
  end
  inherited dtsMaster: TDataSource
    DataSet = DmSys.cdsLineGroups
    OnDataChange = dtsMasterDataChange
  end
end
