inherited FrmLineSelGroups: TFrmLineSelGroups
  Tag = 31
  Left = 241
  Top = 110
  Width = 768
  Height = 595
  Caption = 'Sele'#231#227'o de Grupo de Linhas'
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
              Alignment = taCenter
              Color = clAqua
              Expanded = False
              FieldName = 'LSG_ID'
              Title.Alignment = taCenter
              Title.Caption = 'C'#243'digo'
              Width = 76
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'LSG_DESC'
              Title.Caption = 'Descri'#231#227'o'
              Title.Color = clYellow
              Width = 400
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
            object Label4: TLabel [0]
              Tag = 1922
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
        object dbDesc: TDBEdit
          Left = 13
          Top = 44
          Width = 276
          Height = 21
          CharCase = ecUpperCase
          DataField = 'LSG_DESC'
          DataSource = dtsMaster
          MaxLength = 50
          TabOrder = 0
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
                object btnAddAllLines: TToolButton
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
  inherited imglstBase: TImageList
    Left = 112
    Top = 208
  end
  inherited actlstBase: TActionList
    Left = 80
    Top = 208
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
    OnDataChange = dtsMasterDataChange
    Left = 49
    Top = 208
  end
  inherited mMnuBase: TMainMenu
    Left = 17
    Top = 208
  end
end
