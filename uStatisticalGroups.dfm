inherited FrmStatisticalGroups: TFrmStatisticalGroups
  Tag = 56
  Left = 230
  Top = 169
  Width = 751
  Height = 494
  Caption = 'Grupos Estat'#237'sticos'
  Constraints.MinHeight = 494
  Constraints.MinWidth = 751
  PixelsPerInch = 96
  TextHeight = 13
  inherited cbBase: TCoolBar
    Width = 743
    Bands = <
      item
        Control = tbBase
        ImageIndex = -1
        MinHeight = 24
        Width = 739
      end>
    inherited tbBase: TToolBar
      Width = 726
    end
  end
  inherited pcBaseCadastro: TPageControl
    Width = 743
    Height = 412
    OnChange = pcBaseCadastroChange
    inherited tsBaseCadastroFiltro: TTabSheet
      inherited Splitter_Base1: TSplitter
        Width = 735
      end
      inherited gbGrid: TGroupBox
        Width = 735
        Height = 252
        inherited grdResultado: TDBGrid
          Width = 731
          Height = 235
          DataSource = dtsMaster
          Columns = <
            item
              Expanded = False
              FieldName = 'SG_DESC'
              Title.Caption = 'Descri'#231#227'o'
              Width = 240
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'SG_DESCSHORT'
              Title.Caption = 'Descri'#231#227'o curta'
              Width = 200
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'SG_SORTORDER'
              Title.Caption = 'Ordem'
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'SG_REGDATE'
              Title.Caption = 'Registro'
              Width = 100
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'SG_REGUSER'
              Title.Caption = 'Usu'#225'rio'
              Width = 120
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'SG_SORTORDER'
              Title.Caption = 'Ordem'
              Visible = False
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
        Width = 735
        inherited pnPesq: TPanel
          Width = 735
          inherited gbfiltroavansado: TGroupBox
            Width = 731
            inherited pnVoltar: TPanel
              Width = 727
              inherited lblBack: TLabel
                Left = 700
              end
            end
          end
          inherited gbFiltro: TGroupBox
            Width = 731
            object lbDesc: TLabel [0]
              Tag = 2452
              Left = 16
              Top = 24
              Width = 48
              Height = 13
              Caption = 'Descri'#231#227'o'
              FocusControl = eDesc
            end
            object Label27: TLabel [1]
              Tag = 2457
              Left = 388
              Top = 24
              Width = 30
              Height = 13
              Caption = 'Status'
              FocusControl = lkFilterStatus
            end
            inherited pnPesquiza: TPanel
              Width = 727
              inherited lblAdvancedSearch: TLabel
                Width = 727
              end
            end
            object eDesc: TEdit
              Left = 16
              Top = 40
              Width = 345
              Height = 21
              CharCase = ecUpperCase
              TabOrder = 1
            end
            object lkFilterStatus: TComboBox
              Left = 388
              Top = 40
              Width = 119
              Height = 21
              Style = csDropDownList
              ItemHeight = 13
              ItemIndex = 0
              TabOrder = 2
              Text = 'Ativo'
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
        Width = 735
        Height = 113
        Align = alTop
        TabOrder = 0
        object Label2: TLabel
          Left = 16
          Top = 24
          Width = 48
          Height = 13
          Caption = 'Descri'#231#227'o'
          FocusControl = dbDesc
        end
        object Label3: TLabel
          Left = 352
          Top = 24
          Width = 76
          Height = 13
          Caption = 'Descri'#231#227'o Curta'
          FocusControl = dbDescCurto
        end
        object Label5: TLabel
          Left = 524
          Top = 24
          Width = 31
          Height = 13
          Caption = 'Ordem'
          FocusControl = dbOrdem
        end
        object dbDesc: TDBEdit
          Left = 17
          Top = 40
          Width = 332
          Height = 21
          CharCase = ecUpperCase
          DataField = 'SG_DESC'
          DataSource = dtsMaster
          TabOrder = 0
        end
        object dbDescCurto: TDBEdit
          Left = 352
          Top = 40
          Width = 169
          Height = 21
          CharCase = ecUpperCase
          DataField = 'SG_DESCSHORT'
          DataSource = dtsMaster
          TabOrder = 1
        end
        object dbOrdem: TDBEdit
          Left = 524
          Top = 40
          Width = 53
          Height = 21
          DataField = 'SG_SORTORDER'
          DataSource = dtsMaster
          MaxLength = 2
          TabOrder = 2
        end
        object dbrdStatus: TDBRadioGroup
          Tag = 2457
          Left = 584
          Top = 25
          Width = 141
          Height = 37
          Caption = 'Status'
          Columns = 2
          DataField = 'SG_STATUS'
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
      object cbStaGroups: TCoolBar
        Left = 0
        Top = 113
        Width = 27
        Height = 271
        Align = alLeft
        AutoSize = True
        Bands = <
          item
            Control = tbCardsApps
            ImageIndex = -1
            MinHeight = 23
            Width = 267
          end>
        Vertical = True
        object tbCardsApps: TToolBar
          Left = 0
          Top = 9
          Width = 23
          Height = 258
          Align = alClient
          Caption = 'tbCardsApps'
          Images = imglstBase
          TabOrder = 0
          object tbtnNewCardApp: TToolButton
            Left = 0
            Top = 2
            Action = actNewDetail
            ParentShowHint = False
            Wrap = True
            ShowHint = True
          end
          object tbtnEditCardApp: TToolButton
            Left = 0
            Top = 24
            Action = actEditDetail
            ParentShowHint = False
            Wrap = True
            ShowHint = True
          end
          object tbtnDeletePeriod: TToolButton
            Left = 0
            Top = 46
            Action = actDeleteDetail
            ParentShowHint = False
            ShowHint = True
            Visible = False
          end
        end
      end
      object pcDetalhes: TPageControl
        Left = 27
        Top = 113
        Width = 708
        Height = 271
        ActivePage = TabSheet2
        Align = alClient
        TabOrder = 2
        OnChange = pcDetalhesChange
        OnChanging = pcDetalhesChanging
        object TabSheet1: TTabSheet
          Tag = 2463
          Caption = 'Condi'#231#245'es'
          object Label1: TLabel
            Left = 16
            Top = 17
            Width = 56
            Height = 13
            Caption = 'Dispon'#237'veis'
            FocusControl = lbDisponiveis
          end
          object Label4: TLabel
            Left = 322
            Top = 19
            Width = 64
            Height = 13
            Caption = 'Selecionadas'
            FocusControl = lbSelecionadas
          end
          object SpeedButton3: TSpeedButton
            Left = 595
            Top = 111
            Width = 88
            Height = 32
            Action = actOkCond
            Glyph.Data = {
              DE010000424DDE01000000000000760000002800000024000000120000000100
              0400000000006801000000000000000000001000000000000000000000000000
              80000080000000808000800000008000800080800000C0C0C000808080000000
              FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00333333333333
              3333333333333333333333330000333333333333333333333333F33333333333
              00003333344333333333333333388F3333333333000033334224333333333333
              338338F3333333330000333422224333333333333833338F3333333300003342
              222224333333333383333338F3333333000034222A22224333333338F338F333
              8F33333300003222A3A2224333333338F3838F338F33333300003A2A333A2224
              33333338F83338F338F33333000033A33333A222433333338333338F338F3333
              0000333333333A222433333333333338F338F33300003333333333A222433333
              333333338F338F33000033333333333A222433333333333338F338F300003333
              33333333A222433333333333338F338F00003333333333333A22433333333333
              3338F38F000033333333333333A223333333333333338F830000333333333333
              333A333333333333333338330000333333333333333333333333333333333333
              0000}
            NumGlyphs = 2
          end
          object SpeedButton4: TSpeedButton
            Left = 595
            Top = 159
            Width = 88
            Height = 32
            Action = actCancelCond
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
          object lbDisponiveis: TListBox
            Tag = 2464
            Left = 16
            Top = 33
            Width = 257
            Height = 198
            DragMode = dmAutomatic
            ItemHeight = 13
            MultiSelect = True
            TabOrder = 1
            OnDragDrop = lbDisponiveisDragDrop
            OnDragOver = lbDisponiveisDragOver
          end
          object CoolBar1: TCoolBar
            Left = 284
            Top = 82
            Width = 27
            Height = 107
            Align = alNone
            AutoSize = True
            Bands = <
              item
                Control = ToolBar1
                ImageIndex = -1
                MinHeight = 23
                Width = 103
              end>
            Vertical = True
            object ToolBar1: TToolBar
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
              object ToolButton1: TToolButton
                Left = 0
                Top = 2
                Action = actAddAllCond
                Wrap = True
              end
              object btnAddAllLineMtC: TToolButton
                Left = 0
                Top = 24
                Action = actAddCond
                Wrap = True
              end
              object btnDelAllLineMtC: TToolButton
                Left = 0
                Top = 46
                Action = actDelCond
                Wrap = True
              end
              object ToolButton4: TToolButton
                Left = 0
                Top = 68
                Action = actDelAllCond
              end
            end
          end
          object lbSelecionadas: TListBox
            Tag = 2465
            Left = 320
            Top = 33
            Width = 257
            Height = 198
            DragMode = dmAutomatic
            ItemHeight = 13
            MultiSelect = True
            TabOrder = 3
            OnDragDrop = lbSelecionadasDragDrop
            OnDragOver = lbSelecionadasDragOver
          end
          object dbgStaGroupsXConditions: TDBGrid
            Left = 0
            Top = 0
            Width = 700
            Height = 243
            Align = alClient
            DataSource = DmSys.dtsStatGroupsXConditions
            Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgRowSelect, dgConfirmDelete, dgCancelOnExit]
            TabOrder = 0
            TitleFont.Charset = DEFAULT_CHARSET
            TitleFont.Color = clWindowText
            TitleFont.Height = -11
            TitleFont.Name = 'MS Sans Serif'
            TitleFont.Style = []
            Columns = <
              item
                Expanded = False
                FieldName = 'SGC_DESC'
                Title.Caption = 'Descri'#231#227'o'
                Width = 350
                Visible = True
              end>
          end
        end
        object TabSheet2: TTabSheet
          Tag = 2470
          Caption = 'Empresas'
          ImageIndex = 1
          object Label22: TLabel
            Tag = 2471
            Left = 1
            Top = 4
            Width = 56
            Height = 13
            Caption = 'Dispon'#237'veis'
            FocusControl = lbDisponiveisTP
          end
          object SpeedButton1: TSpeedButton
            Left = 616
            Top = 127
            Width = 78
            Height = 32
            Action = actOkEmpr
            Glyph.Data = {
              DE010000424DDE01000000000000760000002800000024000000120000000100
              0400000000006801000000000000000000001000000000000000000000000000
              80000080000000808000800000008000800080800000C0C0C000808080000000
              FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00333333333333
              3333333333333333333333330000333333333333333333333333F33333333333
              00003333344333333333333333388F3333333333000033334224333333333333
              338338F3333333330000333422224333333333333833338F3333333300003342
              222224333333333383333338F3333333000034222A22224333333338F338F333
              8F33333300003222A3A2224333333338F3838F338F33333300003A2A333A2224
              33333338F83338F338F33333000033A33333A222433333338333338F338F3333
              0000333333333A222433333333333338F338F33300003333333333A222433333
              333333338F338F33000033333333333A222433333333333338F338F300003333
              33333333A222433333333333338F338F00003333333333333A22433333333333
              3338F38F000033333333333333A223333333333333338F830000333333333333
              333A333333333333333338330000333333333333333333333333333333333333
              0000}
            NumGlyphs = 2
          end
          object SpeedButton2: TSpeedButton
            Left = 616
            Top = 175
            Width = 78
            Height = 32
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
          object Label28: TLabel
            Tag = 2474
            Left = 319
            Top = 4
            Width = 64
            Height = 13
            Caption = 'Selecionadas'
            FocusControl = lbSelecionadasTP
          end
          object lbDisponiveisTP: TListBox
            Left = 1
            Top = 20
            Width = 287
            Height = 211
            DragMode = dmAutomatic
            ItemHeight = 13
            MultiSelect = True
            TabOrder = 0
            OnDragDrop = lbDisponiveisTPDragDrop
            OnDragOver = lbDisponiveisTPDragOver
          end
          object lbSelecionadasTP: TListBox
            Left = 319
            Top = 20
            Width = 287
            Height = 211
            DragMode = dmAutomatic
            ItemHeight = 13
            MultiSelect = True
            TabOrder = 1
            OnDragDrop = lbSelecionadasTPDragDrop
            OnDragOver = lbSelecionadasTPDragOver
          end
          object cbLineMt: TCoolBar
            Left = 291
            Top = 71
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
                Action = actAddAllEmpr
                Wrap = True
              end
              object btnAddAllLineMt: TToolButton
                Left = 0
                Top = 24
                Action = actAddEmpr
                Wrap = True
              end
              object btnDelAllLineMt: TToolButton
                Left = 0
                Top = 46
                Action = actDelEmpr
                Wrap = True
              end
              object tbtnDeleteLineMt: TToolButton
                Left = 0
                Top = 68
                Action = actDelAllEmpr
              end
            end
          end
          object dbgTPxStatGroups: TDBGrid
            Left = 0
            Top = 0
            Width = 700
            Height = 243
            Align = alClient
            DataSource = DmSys.dtsTransportProvidersXStatGroups
            Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgRowSelect, dgConfirmDelete, dgCancelOnExit]
            TabOrder = 3
            TitleFont.Charset = DEFAULT_CHARSET
            TitleFont.Color = clWindowText
            TitleFont.Height = -11
            TitleFont.Name = 'MS Sans Serif'
            TitleFont.Style = []
            Columns = <
              item
                Expanded = False
                FieldName = 'TP_DESC'
                Title.Caption = 'Descri'#231#227'o'
                Width = 350
                Visible = True
              end>
          end
        end
      end
    end
  end
  inherited actlstBase: TActionList
    inherited actFilter: TAction
      OnExecute = actFilterExecute
    end
    object actNewDetail: TAction
      Tag = 2651
      Category = 'Detail'
      Caption = 'actNewDetail'
      ImageIndex = 16
      OnExecute = actNewDetailExecute
    end
    object actEditDetail: TAction
      Tag = 2652
      Category = 'Detail'
      Caption = 'actEditDetail'
      ImageIndex = 10
      OnExecute = actEditDetailExecute
    end
    object actDeleteDetail: TAction
      Tag = 2653
      Category = 'Detail'
      Caption = 'actDeleteDetail'
      ImageIndex = 9
      OnExecute = actDeleteDetailExecute
    end
    object actAddCond: TAction
      Tag = 2655
      Category = 'Condicoes'
      Caption = 'actAddCond'
      ImageIndex = 22
      OnExecute = actAddCondExecute
    end
    object actAddAllCond: TAction
      Tag = 2656
      Category = 'Condicoes'
      Caption = 'actAddAllCond'
      ImageIndex = 21
      OnExecute = actAddAllCondExecute
    end
    object actDelCond: TAction
      Tag = 2657
      Category = 'Condicoes'
      Caption = 'actDelCond'
      ImageIndex = 24
      OnExecute = actDelCondExecute
    end
    object actDelAllCond: TAction
      Tag = 2658
      Category = 'Condicoes'
      Caption = 'actDelAllCond'
      ImageIndex = 23
      OnExecute = actDelAllCondExecute
    end
    object actOkCond: TAction
      Tag = 2659
      Category = 'Condicoes'
      Caption = 'actOkCond'
      OnExecute = actOkCondExecute
    end
    object actCancelCond: TAction
      Tag = 2660
      Category = 'Condicoes'
      Caption = 'actCancelCond'
      OnExecute = actCancelCondExecute
    end
    object actAddEmpr: TAction
      Tag = 2661
      Category = 'Empresas'
      ImageIndex = 22
      OnExecute = actAddEmprExecute
    end
    object actAddAllEmpr: TAction
      Tag = 2662
      Category = 'Empresas'
      ImageIndex = 21
      OnExecute = actAddAllEmprExecute
    end
    object actDelEmpr: TAction
      Tag = 2663
      Category = 'Empresas'
      ImageIndex = 24
      OnExecute = actDelEmprExecute
    end
    object actDelAllEmpr: TAction
      Tag = 2664
      Category = 'Empresas'
      ImageIndex = 23
      OnExecute = actDelAllEmprExecute
    end
    object actOkEmpr: TAction
      Tag = 2466
      Category = 'Empresas'
      OnExecute = actOkEmprExecute
    end
    object actCancelEmpr: TAction
      Tag = 2467
      Category = 'Empresas'
      OnExecute = actCancelEmprExecute
    end
  end
  inherited dtsMaster: TDataSource
    DataSet = DmSys.cdsStatisticalGroups
  end
end
