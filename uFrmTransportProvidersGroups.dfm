inherited frmTransportProvidersGroups: TfrmTransportProvidersGroups
  Tag = 85
  Left = 245
  Top = 112
  Width = 804
  Height = 575
  Caption = 'Relacionamento de Empresas'
  Constraints.MinHeight = 575
  PixelsPerInch = 96
  TextHeight = 13
  inherited cbBase: TCoolBar
    Width = 796
    Bands = <
      item
        Control = tbBase
        ImageIndex = -1
        MinHeight = 24
        Width = 792
      end>
    inherited tbBase: TToolBar
      Width = 779
      object lbFiltrado: TLabel
        Left = 354
        Top = 2
        Width = 111
        Height = 22
        Cursor = crHandPoint
        Hint = 'Limpa FILTRO'
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
    Width = 796
    Height = 496
    Constraints.MinHeight = 496
    Constraints.MinWidth = 796
    inherited tsBaseCadastroFiltro: TTabSheet
      inherited Splitter_Base1: TSplitter
        Top = 89
        Width = 788
        Color = clBlack
        ParentColor = False
      end
      inherited gbGrid: TGroupBox
        Top = 93
        Width = 788
        Height = 375
        inherited grdResultado: TDBGrid
          Width = 784
          Height = 358
          DataSource = dtsMaster
          OnTitleClick = grdResultadoTitleClick
          Columns = <
            item
              Alignment = taCenter
              Color = clAqua
              Expanded = False
              FieldName = 'TP_ID'
              Title.Alignment = taCenter
              Title.Caption = 'C'#243'digo'
              Title.Color = clYellow
              Width = 70
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'TP_DESC'
              Title.Caption = 'Descri'#231#227'o'
              Width = 260
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'TP_REGDATE'
              Visible = False
            end
            item
              Expanded = False
              FieldName = 'TP_REGUSER'
              Visible = False
            end
            item
              Expanded = False
              FieldName = 'STATUS_ID'
              Visible = False
            end>
        end
      end
      inherited pnFiltro: TPanel
        Width = 788
        Height = 89
        inherited pnPesq: TPanel
          Width = 788
          Height = 89
          inherited gbFiltroAvansado: TGroupBox
            Width = 784
            Height = 85
            inherited pnVoltar: TPanel
              Top = 70
              Width = 780
              inherited lblBack: TLabel
                Left = 753
              end
            end
          end
          inherited gbFiltro: TGroupBox
            Width = 784
            Height = 85
            object Label1: TLabel [0]
              Tag = 3118
              Left = 16
              Top = 24
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
              Top = 70
              Width = 780
              inherited lblAdvancedSearch: TLabel
                Width = 780
                Visible = False
              end
            end
            object eDesc: TEdit
              Left = 16
              Top = 41
              Width = 337
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
      object Panel1: TPanel
        Left = 0
        Top = 0
        Width = 788
        Height = 65
        Align = alTop
        BevelInner = bvRaised
        BevelOuter = bvLowered
        TabOrder = 0
        object Label2: TLabel
          Tag = 1521
          Left = 11
          Top = 12
          Width = 57
          Height = 13
          Caption = 'TPG_DESC'
        end
        object dbedDesc: TDBLookupComboBox
          Left = 12
          Top = 28
          Width = 349
          Height = 21
          DataField = 'TP_ID'
          DataSource = dmSys1.dtsAcceptedTransportProviders
          Enabled = False
          KeyField = 'TP_ID'
          ListField = 'TP_DESC'
          ListSource = DmSys.dtsTransportProviders
          TabOrder = 0
          OnClick = dbedDescClick
        end
      end
      object GroupBox2: TGroupBox
        Left = 0
        Top = 65
        Width = 788
        Height = 403
        Align = alClient
        TabOrder = 1
        object Label9: TLabel
          Tag = 2706
          Left = 11
          Top = 30
          Width = 105
          Height = 13
          Caption = 'Empresas Dispon'#237'veis'
        end
        object Label10: TLabel
          Tag = 2707
          Left = 418
          Top = 30
          Width = 113
          Height = 13
          Caption = 'Empresas Selecionadas'
        end
        object lbDisponiveis: TListBox
          Left = 9
          Top = 48
          Width = 361
          Height = 353
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
          TabWidth = 20
          OnDragDrop = lbDisponiveisDragDrop
          OnDragOver = lbDisponiveisDragOver
        end
        object lbSelecionadas: TListBox
          Left = 416
          Top = 48
          Width = 361
          Height = 353
          DragMode = dmAutomatic
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -12
          Font.Name = 'Courier New'
          Font.Style = []
          ItemHeight = 15
          MultiSelect = True
          ParentFont = False
          TabOrder = 1
          TabWidth = 20
          OnDragDrop = lbSelecionadasDragDrop
          OnDragOver = lbSelecionadasDragOver
        end
        object cbTransportproviders: TCoolBar
          Left = 380
          Top = 166
          Width = 29
          Height = 106
          Align = alNone
          AutoSize = True
          Bands = <
            item
              Control = tbLineMt
              ImageIndex = -1
              Width = 102
            end>
          Vertical = True
          object tbLineMt: TToolBar
            Left = 0
            Top = 9
            Width = 25
            Height = 93
            Align = alNone
            Caption = 'tbLineMt'
            EdgeBorders = []
            Images = imglstBase
            TabOrder = 0
            object tbtnNewLineMt: TToolButton
              Left = 0
              Top = 2
              Action = actNewAllLineMt
              Wrap = True
            end
            object btnAddAllLineMt: TToolButton
              Left = 0
              Top = 24
              Action = actNewLineMt
              Wrap = True
            end
            object btnDelAllLineMt: TToolButton
              Left = 0
              Top = 46
              Action = actDelLineMt
              Wrap = True
            end
            object tbtnDeleteLineMt: TToolButton
              Left = 0
              Top = 68
              Action = actDeAlllLineMt
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
    Top = 217
  end
  inherited actlstBase: TActionList
    Left = 80
    Top = 217
    object actNewAllLineMt: TAction [0]
      Tag = 2668
      Category = 'Empresas'
      Caption = 'actNewAllLineMt'
      Enabled = False
      ImageIndex = 21
      OnExecute = actNewAllLineMtExecute
    end
    inherited actFilter: TAction
      OnExecute = actFilterExecute
    end
    object actNewLineMt: TAction
      Tag = 2669
      Category = 'Empresas'
      Caption = 'actNewLineMt'
      Enabled = False
      ImageIndex = 22
      OnExecute = actNewLineMtExecute
    end
    object actDelLineMt: TAction
      Tag = 2670
      Category = 'Empresas'
      Caption = 'actDelLineMt'
      Enabled = False
      ImageIndex = 24
      OnExecute = actDelLineMtExecute
    end
    object actDeAlllLineMt: TAction
      Tag = 2671
      Category = 'Empresas'
      Caption = 'actDeAlllLineMt'
      Enabled = False
      ImageIndex = 23
      OnExecute = actDeAlllLineMtExecute
    end
  end
  inherited dtsMaster: TDataSource
    DataSet = dmSys1.cdsTransportProvidersGroups
    OnDataChange = dtsMasterDataChange
    Left = 49
    Top = 216
  end
  inherited mMnuBase: TMainMenu
    Left = 17
    Top = 216
  end
end
