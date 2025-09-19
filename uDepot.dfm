inherited FrmDepots: TFrmDepots
  Tag = 20
  Left = 241
  Top = 111
  Width = 748
  Height = 514
  Caption = 'Garagens'
  PixelsPerInch = 96
  TextHeight = 13
  inherited cbBase: TCoolBar
    Width = 740
    Bands = <
      item
        Control = tbBase
        ImageIndex = -1
        MinHeight = 24
        Width = 736
      end>
    inherited tbBase: TToolBar
      Width = 723
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
    Width = 740
    Height = 435
    inherited tsBaseCadastroFiltro: TTabSheet
      inherited Splitter_Base1: TSplitter
        Top = 81
        Width = 732
        Color = clBlack
        ParentColor = False
      end
      inherited gbGrid: TGroupBox
        Top = 85
        Width = 732
        Height = 322
        inherited grdResultado: TDBGrid
          Width = 728
          Height = 305
          DataSource = dtsMaster
          OnTitleClick = grdResultadoTitleClick
          Columns = <
            item
              Expanded = False
              FieldName = 'DP_DESC'
              Title.Caption = 'Descri'#231#227'o'
              Title.Color = clYellow
              Width = 406
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'STATUS_ID'
              Title.Caption = 'Status'
              Visible = False
            end
            item
              Expanded = False
              FieldName = 'DP_REGDATE'
              Title.Caption = 'Registro'
              Width = 125
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'DP_REGUSER'
              Title.Caption = 'Usu'#225'rio'
              Width = 152
              Visible = True
            end>
        end
      end
      inherited pnFiltro: TPanel
        Width = 732
        Height = 81
        inherited pnPesq: TPanel
          Width = 732
          Height = 81
          inherited gbFiltroAvansado: TGroupBox
            Width = 728
            Height = 77
            inherited pnVoltar: TPanel
              Top = 62
              Width = 724
              inherited lblBack: TLabel
                Left = 697
              end
            end
          end
          inherited gbFiltro: TGroupBox
            Width = 728
            Height = 77
            object Label2: TLabel [0]
              Tag = 1843
              Left = 12
              Top = 16
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
            inherited pnPesquiza: TPanel
              Top = 62
              Width = 724
              inherited lblAdvancedSearch: TLabel
                Width = 724
                Visible = False
              end
            end
            object edDesc: TEdit
              Left = 12
              Top = 32
              Width = 301
              Height = 21
              CharCase = ecUpperCase
              MaxLength = 50
              TabOrder = 1
              OnEnter = Entra
              OnExit = Sai
            end
          end
        end
      end
    end
    inherited tsBaseCadastroConsulta: TTabSheet
      object gbDepot: TGroupBox
        Left = 0
        Top = 0
        Width = 732
        Height = 77
        Align = alTop
        TabOrder = 0
        object Label1: TLabel
          Left = 12
          Top = 20
          Width = 48
          Height = 13
          Caption = 'Descri'#231#227'o'
          FocusControl = dbDesc
        end
        object dbDesc: TDBEdit
          Left = 12
          Top = 36
          Width = 285
          Height = 21
          CharCase = ecUpperCase
          DataField = 'DP_DESC'
          DataSource = dtsMaster
          TabOrder = 0
        end
      end
      object cbCardApps: TCoolBar
        Left = 0
        Top = 77
        Width = 27
        Height = 330
        Align = alLeft
        AutoSize = True
        Bands = <
          item
            Control = tbCardsApps
            ImageIndex = -1
            MinHeight = 23
            Width = 326
          end>
        Vertical = True
        object tbCardsApps: TToolBar
          Left = 0
          Top = 9
          Width = 23
          Height = 317
          Align = alClient
          Caption = 'tbCardsApps'
          Images = imglstBase
          TabOrder = 0
          object tbtnNewTP: TToolButton
            Left = 0
            Top = 2
            Action = actNewDetail
            ParentShowHint = False
            Wrap = True
            ShowHint = True
          end
          object tbtnEditTP: TToolButton
            Left = 0
            Top = 24
            Action = actEditDetail
            ParentShowHint = False
            Wrap = True
            ShowHint = True
          end
          object tbtnDeleteTP: TToolButton
            Left = 0
            Top = 46
            Action = actDelDetail
            ParentShowHint = False
            ShowHint = True
            Visible = False
          end
        end
      end
      object pgcTransportProviders: TPageControl
        Left = 27
        Top = 77
        Width = 705
        Height = 330
        ActivePage = TabSheet1
        Align = alClient
        TabOrder = 2
        object TabSheet1: TTabSheet
          Tag = 1850
          Caption = 'Empresas'
          object Panel5: TPanel
            Left = 0
            Top = 0
            Width = 697
            Height = 302
            Align = alClient
            BevelOuter = bvNone
            TabOrder = 0
            object Panel1: TPanel
              Left = 0
              Top = 0
              Width = 324
              Height = 273
              Align = alLeft
              BevelOuter = bvNone
              TabOrder = 0
              object Label9: TLabel
                Tag = 2706
                Left = 0
                Top = 0
                Width = 109
                Height = 13
                Align = alTop
                Caption = 'Linhas Dispon'#237'veis'
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clWindowText
                Font.Height = -11
                Font.Name = 'MS Sans Serif'
                Font.Style = [fsBold]
                ParentFont = False
                Transparent = True
              end
              object lbDisponiveis: TListBox
                Left = 0
                Top = 13
                Width = 324
                Height = 260
                Align = alClient
                DragMode = dmAutomatic
                ItemHeight = 13
                MultiSelect = True
                TabOrder = 0
                TabWidth = 30
                OnDragDrop = lbDisponiveisDragDrop
                OnDragOver = lbDisponiveisDragOver
              end
            end
            object Panel2: TPanel
              Left = 324
              Top = 0
              Width = 37
              Height = 273
              Align = alLeft
              BevelOuter = bvNone
              TabOrder = 1
              object cbLineMt: TCoolBar
                Left = 5
                Top = 97
                Width = 27
                Height = 107
                Align = alNone
                AutoSize = True
                Bands = <
                  item
                    Control = tbLineMt
                    ImageIndex = -1
                    MinHeight = 23
                    Width = 103
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
                    Action = actAddAllLineMt
                    Wrap = True
                  end
                  object btnAddAllLineMt: TToolButton
                    Left = 0
                    Top = 24
                    Action = actAddLineMt
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
                    Action = actDelAllLineMt
                  end
                end
              end
            end
            object Panel3: TPanel
              Left = 361
              Top = 0
              Width = 336
              Height = 273
              Align = alClient
              BevelOuter = bvNone
              TabOrder = 2
              object Label10: TLabel
                Tag = 2707
                Left = 0
                Top = 0
                Width = 118
                Height = 13
                Align = alTop
                Caption = 'Linhas Selecionadas'
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clWindowText
                Font.Height = -11
                Font.Name = 'MS Sans Serif'
                Font.Style = [fsBold]
                ParentFont = False
                Transparent = True
              end
              object lbSelecionadas: TListBox
                Left = 0
                Top = 13
                Width = 336
                Height = 260
                Align = alClient
                DragMode = dmAutomatic
                ItemHeight = 13
                MultiSelect = True
                TabOrder = 0
                TabWidth = 30
                OnDragDrop = lbSelecionadasDragDrop
                OnDragOver = lbSelecionadasDragOver
              end
            end
            object Panel4: TPanel
              Left = 0
              Top = 273
              Width = 697
              Height = 29
              Align = alBottom
              BevelOuter = bvNone
              TabOrder = 3
              object btDisplayCancel: TSpeedButton
                Left = 612
                Top = 3
                Width = 80
                Height = 26
                Action = actCancelEmpr
                Glyph.Data = {
                  DE010000424DDE01000000000000760000002800000024000000120000000100
                  0400000000006801000000000000000000001000000000000000000000000000
                  80000080000000808000800000008000800080800000C0C0C000808080000000
                  FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00333333333333
                  333333333333333333333333000033338833333333333333333F333333333333
                  0000333911833333983333333388F333333F3333000033391118333911833333
                  38F38F333F88F33300003339111183911118333338F338F3F8338F3300003333
                  911118111118333338F3338F833338F3000033333911111111833333338F3338
                  3333F8330000333333911111183333333338F333333F83330000333333311111
                  8333333333338F3333383333000033333339111183333333333338F333833333
                  00003333339111118333333333333833338F3333000033333911181118333333
                  33338333338F333300003333911183911183333333383338F338F33300003333
                  9118333911183333338F33838F338F33000033333913333391113333338FF833
                  38F338F300003333333333333919333333388333338FFF830000333333333333
                  3333333333333333333888330000333333333333333333333333333333333333
                  0000}
                NumGlyphs = 2
              end
              object btnDisplayOK: TBitBtn
                Left = 516
                Top = 3
                Width = 80
                Height = 26
                Action = actOkEmpr
                Caption = 'actOkEmpr'
                Default = True
                TabOrder = 0
                Glyph.Data = {
                  DE010000424DDE01000000000000760000002800000024000000120000000100
                  0400000000006801000000000000000000001000000000000000000000000000
                  8000008000000080800080000000800080008080000080808000C0C0C0000000
                  FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00333333333333
                  3333333333333333333333330000333333333333333333333333F33333333333
                  00003333344333333333333333377F3333333333000033334224333333333333
                  337337F3333333330000333422224333333333333733337F3333333300003342
                  222224333333333373333337F3333333000034222A22224333333337F337F333
                  7F33333300003222A3A2224333333337F3737F337F33333300003A2A333A2224
                  33333337F73337F337F33333000033A33333A222433333337333337F337F3333
                  0000333333333A222433333333333337F337F33300003333333333A222433333
                  333333337F337F33000033333333333A222433333333333337F337F300003333
                  33333333A222433333333333337F337F00003333333333333A22433333333333
                  3337F37F000033333333333333A223333333333333337F730000333333333333
                  333A333333333333333337330000333333333333333333333333333333333333
                  0000}
                NumGlyphs = 2
              end
            end
          end
          object dbgTransportProviders: TDBGrid
            Left = 0
            Top = 0
            Width = 697
            Height = 302
            Align = alClient
            DataSource = dmSys1.dtsDepotsXTransportProviders
            ReadOnly = True
            TabOrder = 1
            TitleFont.Charset = DEFAULT_CHARSET
            TitleFont.Color = clWindowText
            TitleFont.Height = -11
            TitleFont.Name = 'MS Sans Serif'
            TitleFont.Style = []
            Columns = <
              item
                Expanded = False
                FieldName = 'TP_DESC'
                Title.Caption = 'Empresa'
                Width = 620
                Visible = True
              end>
          end
        end
      end
    end
  end
  object Panel6: TPanel [2]
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
    object actNewDetail: TAction
      Tag = 2665
      Category = 'Detail'
      Caption = 'actNewDetail'
      ImageIndex = 16
      OnExecute = actNewDetailExecute
    end
    object actEditDetail: TAction
      Tag = 2666
      Category = 'Detail'
      Caption = 'actEditDetail'
      ImageIndex = 10
      OnExecute = actEditDetailExecute
    end
    object actDelDetail: TAction
      Tag = 2667
      Category = 'Detail'
      Caption = 'actDelDetail'
      Enabled = False
      ImageIndex = 9
      OnExecute = actDelDetailExecute
    end
    object actOkEmpr: TAction
      Tag = 1852
      Category = 'Empresa'
      Caption = 'actOkEmpr'
      OnExecute = actOkEmprExecute
    end
    object actCancelEmpr: TAction
      Tag = 1851
      Category = 'Empresa'
      Caption = 'actCancelEmpr'
      OnExecute = actCancelEmprExecute
    end
    object actAddAllLineMt: TAction
      Category = 'Empresa'
      Caption = 'actAddAllLineMt'
      ImageIndex = 21
      OnExecute = actAddAllLineMtExecute
    end
    object actAddLineMt: TAction
      Category = 'Empresa'
      Caption = 'actAddLineMt'
      ImageIndex = 22
      OnExecute = actAddLineMtExecute
    end
    object actDelLineMt: TAction
      Category = 'Empresa'
      Caption = 'actDelLineMt'
      ImageIndex = 24
      OnExecute = actDelLineMtExecute
    end
    object actDelAllLineMt: TAction
      Category = 'Empresa'
      Caption = 'actDelAllLineMt'
      ImageIndex = 23
      OnExecute = actDelAllLineMtExecute
    end
  end
end
