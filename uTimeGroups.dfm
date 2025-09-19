inherited FrmTimeGroups: TFrmTimeGroups
  Tag = 58
  Left = 244
  Width = 759
  Height = 478
  Caption = 'Grupos de Tempo'
  Constraints.MinHeight = 478
  Constraints.MinWidth = 759
  PixelsPerInch = 96
  TextHeight = 13
  inherited cbBase: TCoolBar
    Width = 751
    Bands = <
      item
        Control = tbBase
        ImageIndex = -1
        MinHeight = 24
        Width = 747
      end>
    inherited tbBase: TToolBar
      Width = 734
      object lbFiltrado: TLabel
        Left = 354
        Top = 2
        Width = 111
        Height = 22
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
    Width = 751
    Height = 399
    inherited tsBaseCadastroFiltro: TTabSheet
      inherited Splitter_Base1: TSplitter
        Top = 89
        Width = 743
        Color = clBlack
        ParentColor = False
      end
      inherited gbGrid: TGroupBox
        Top = 93
        Width = 743
        Height = 278
        inherited grdResultado: TDBGrid
          Width = 739
          Height = 261
          DataSource = dtsMaster
          OnTitleClick = grdResultadoTitleClick
          Columns = <
            item
              Alignment = taCenter
              Color = clAqua
              Expanded = False
              FieldName = 'TG_ID'
              Title.Alignment = taCenter
              Title.Caption = 'C'#243'digo'
              Title.Color = clYellow
              Width = 62
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'TG_DESC'
              Title.Caption = 'Descri'#231#227'o'
              Width = 290
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
              FieldName = 'TG_REGDATE'
              Title.Caption = 'Registro'
              Width = 120
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'TG_REGUSER'
              Title.Caption = 'Usu'#225'rio'
              Width = 150
              Visible = True
            end>
        end
      end
      inherited pnFiltro: TPanel
        Width = 743
        Height = 89
        inherited pnPesq: TPanel
          Width = 743
          Height = 89
          inherited gbFiltroAvansado: TGroupBox
            Width = 739
            Height = 85
            inherited pnVoltar: TPanel
              Top = 70
              Width = 735
              inherited lblBack: TLabel
                Left = 708
              end
            end
          end
          inherited gbFiltro: TGroupBox
            Width = 739
            Height = 85
            object Label2: TLabel [0]
              Tag = 2497
              Left = 20
              Top = 26
              Width = 48
              Height = 13
              Caption = 'Descri'#231#227'o'
              FocusControl = edDesc
            end
            object lStatus: TLabel [1]
              Tag = 2498
              Left = 330
              Top = 26
              Width = 30
              Height = 13
              Caption = 'Status'
              FocusControl = lkFilterStatus
            end
            object btnLimpaStatus: TSpeedButton [2]
              Left = 428
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
              Top = 70
              Width = 735
              inherited lblAdvancedSearch: TLabel
                Width = 735
                Visible = False
              end
            end
            object edDesc: TEdit
              Left = 20
              Top = 41
              Width = 280
              Height = 21
              CharCase = ecUpperCase
              MaxLength = 50
              TabOrder = 1
              OnEnter = Entra
              OnExit = Sai
            end
            object lkFilterStatus: TComboBox
              Left = 330
              Top = 41
              Width = 99
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
        Width = 743
        Height = 89
        Align = alTop
        TabOrder = 0
        object Label1: TLabel
          Left = 20
          Top = 23
          Width = 48
          Height = 13
          Caption = 'Descri'#231#227'o'
          FocusControl = dbDesc
        end
        object Label5: TLabel
          Tag = 2498
          Left = 371
          Top = 23
          Width = 30
          Height = 13
          Caption = 'Status'
          FocusControl = dbCardUsersStatus
        end
        object dbDesc: TDBEdit
          Left = 20
          Top = 41
          Width = 338
          Height = 21
          CharCase = ecUpperCase
          DataField = 'TG_DESC'
          DataSource = dtsMaster
          TabOrder = 0
        end
        object dbCardUsersStatus: TRxDBComboBox
          Left = 372
          Top = 41
          Width = 118
          Height = 21
          Style = csDropDownList
          DataField = 'TG_STATUS'
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
        Top = 89
        Width = 743
        Height = 282
        Align = alClient
        TabOrder = 1
        object GroupBox4: TGroupBox
          Tag = 2505
          Left = 2
          Top = 15
          Width = 351
          Height = 265
          Align = alLeft
          Caption = 'Tempos dispon'#237'veis'
          TabOrder = 0
          object lbDisponiveis: TListBox
            Left = 2
            Top = 15
            Width = 347
            Height = 248
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
        object GroupBox5: TGroupBox
          Tag = 2506
          Left = 353
          Top = 15
          Width = 388
          Height = 265
          Align = alClient
          Caption = '         Tempos selecionados'
          TabOrder = 1
          object lbSelecionadas: TListBox
            Left = 32
            Top = 15
            Width = 354
            Height = 248
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
            Height = 248
            Align = alLeft
            BevelOuter = bvNone
            TabOrder = 1
            object cbLineMt: TCoolBar
              Left = 1
              Top = 59
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
                  Action = actAddAllTimes
                  Wrap = True
                end
                object btnAddAllLineMt: TToolButton
                  Left = 0
                  Top = 24
                  Action = actAddTime
                  Wrap = True
                end
                object btnDelAllLineMt: TToolButton
                  Left = 0
                  Top = 46
                  Action = actDelTime
                  Wrap = True
                end
                object tbtnDeleteLineMt: TToolButton
                  Left = 0
                  Top = 68
                  Action = actDelAllTimes
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
    object actAddTime: TAction
      Tag = 2672
      Category = 'Tempo'
      Caption = 'actAddTime'
      ImageIndex = 22
      OnExecute = actAddTimeExecute
    end
    object actAddAllTimes: TAction
      Tag = 2673
      Category = 'Tempo'
      Caption = 'actAddAllTimes'
      ImageIndex = 21
      OnExecute = actAddAllTimesExecute
    end
    object actDelTime: TAction
      Tag = 2674
      Category = 'Tempo'
      Caption = 'actDelTime'
      ImageIndex = 24
      OnExecute = actDelTimeExecute
    end
    object actDelAllTimes: TAction
      Tag = 2675
      Category = 'Tempo'
      Caption = 'actDelAllTimes'
      ImageIndex = 23
      OnExecute = actDelAllTimesExecute
    end
  end
  inherited dtsMaster: TDataSource
    DataSet = DmSys.cdsTimeGroups
  end
end
