inherited FrmAcceptedFct: TFrmAcceptedFct
  Tag = 26
  Left = 242
  Top = 112
  Width = 807
  Height = 601
  Caption = 'Relacionamento de Funcion'#225'rios'
  Constraints.MinHeight = 601
  Constraints.MinWidth = 807
  PixelsPerInch = 96
  TextHeight = 13
  inherited cbBase: TCoolBar
    Width = 799
    Bands = <
      item
        Control = tbBase
        ImageIndex = -1
        MinHeight = 24
        Width = 795
      end>
    inherited tbBase: TToolBar
      Width = 782
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
    Width = 799
    Height = 522
    OnChanging = nil
    inherited tsBaseCadastroFiltro: TTabSheet
      inherited Splitter_Base1: TSplitter
        Top = 81
        Width = 791
      end
      inherited gbGrid: TGroupBox
        Top = 85
        Width = 791
        Height = 409
        inherited grdResultado: TDBGrid
          Width = 787
          Height = 392
          DataSource = dtsMaster
          OnKeyDown = nil
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
              Width = 80
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'TP_DESC'
              Title.Caption = 'Empresa'
              Width = 602
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'TP_DESC'
              Visible = False
            end
            item
              Expanded = False
              Visible = False
            end
            item
              Expanded = False
              Visible = False
            end
            item
              Expanded = False
              Visible = False
            end>
        end
      end
      inherited pnFiltro: TPanel
        Width = 791
        Height = 81
        inherited pnPesq: TPanel
          Width = 791
          Height = 81
          inherited gbFiltroAvansado: TGroupBox
            Width = 787
            Height = 77
            inherited pnVoltar: TPanel
              Top = 62
              Width = 783
              inherited lblBack: TLabel
                Left = 756
              end
            end
          end
          inherited gbFiltro: TGroupBox
            Width = 787
            Height = 77
            object Label1: TLabel [0]
              Tag = 3116
              Left = 128
              Top = 16
              Width = 53
              Height = 13
              Caption = 'Empresa:'
              FocusControl = rxLkTransportProviders
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'MS Sans Serif'
              Font.Style = [fsBold]
              ParentFont = False
            end
            object Label3: TLabel [1]
              Tag = 3117
              Left = 8
              Top = 16
              Width = 44
              Height = 13
              Caption = 'C'#243'digo:'
              FocusControl = edTp_id
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'MS Sans Serif'
              Font.Style = [fsBold]
              ParentFont = False
            end
            inherited pnPesquiza: TPanel
              Top = 62
              Width = 783
              TabOrder = 2
              inherited lblAdvancedSearch: TLabel
                Width = 783
                Visible = False
              end
            end
            object rxLkTransportProviders: TRxDBLookupCombo
              Left = 128
              Top = 32
              Width = 297
              Height = 21
              DropDownCount = 8
              LookupField = 'TP_ID'
              LookupDisplay = 'TP_DESC'
              LookupSource = DmBase.dtsTransportProvider
              TabOrder = 1
              OnChange = rxLkTransportProvidersChange
              OnEnter = Entra
              OnExit = Sai
            end
            object edTp_id: TEdit
              Left = 8
              Top = 32
              Width = 107
              Height = 21
              TabOrder = 0
              OnChange = edTp_idChange
              OnEnter = Entra
              OnExit = Sai
              OnKeyPress = edTp_idKeyPress
            end
          end
        end
      end
    end
    inherited tsBaseCadastroConsulta: TTabSheet
      OnEnter = tsBaseCadastroConsultaEnter
      object GroupBox2: TGroupBox
        Left = 0
        Top = 100
        Width = 791
        Height = 394
        Align = alClient
        TabOrder = 0
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
              ImageIndex = 21
              Wrap = True
              OnClick = tbtnNewLineMtClick
            end
            object btnAddAllLineMt: TToolButton
              Left = 0
              Top = 24
              ImageIndex = 22
              Wrap = True
              OnClick = btnAddAllLineMtClick
            end
            object btnDelAllLineMt: TToolButton
              Left = 0
              Top = 46
              ImageIndex = 24
              Wrap = True
              OnClick = btnDelAllLineMtClick
            end
            object tbtnDeleteLineMt: TToolButton
              Left = 0
              Top = 68
              ImageIndex = 23
              OnClick = tbtnDeleteLineMtClick
            end
          end
        end
      end
      object TPanel
        Left = 0
        Top = 0
        Width = 791
        Height = 100
        Align = alTop
        BevelInner = bvRaised
        BevelOuter = bvLowered
        TabOrder = 1
        object Label2: TLabel
          Tag = 3116
          Left = 24
          Top = 24
          Width = 41
          Height = 13
          Caption = 'Empresa'
          FocusControl = rxLkTProv
        end
        object rxLkTProv: TDBLookupComboBox
          Left = 24
          Top = 40
          Width = 313
          Height = 21
          KeyField = 'TP_ID'
          ListField = 'TP_DESC'
          ListSource = dmSys1.dtsTransportprovidersAccepted
          TabOrder = 0
          OnCloseUp = rxLkTProvCloseUp
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
end
