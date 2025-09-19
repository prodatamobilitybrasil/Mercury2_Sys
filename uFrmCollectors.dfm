inherited FrmCollectors: TFrmCollectors
  Tag = 28
  Left = 213
  Top = 139
  Width = 760
  Height = 518
  Caption = 'Recebedorias'
  Constraints.MinHeight = 518
  Constraints.MinWidth = 760
  PixelsPerInch = 96
  TextHeight = 13
  inherited cbBase: TCoolBar
    Width = 752
    Bands = <
      item
        Control = tbBase
        ImageIndex = -1
        MinHeight = 24
        Width = 748
      end>
    inherited tbBase: TToolBar
      Width = 735
    end
  end
  inherited pcBaseCadastro: TPageControl
    Width = 752
    Height = 436
    OnChange = pcBaseCadastroChange
    inherited tsBaseCadastroFiltro: TTabSheet
      inherited Splitter_Base1: TSplitter
        Width = 744
      end
      inherited gbGrid: TGroupBox
        Width = 744
        Height = 276
        inherited grdResultado: TDBGrid
          Width = 740
          Height = 259
          DataSource = dtsMaster
          Columns = <
            item
              Expanded = False
              FieldName = 'Col_Desc'
              Title.Caption = 'Descri'#231#227'o'
              Width = 250
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'Col_Version'
              Title.Caption = 'Vers'#227'o'
              Width = 120
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'Col_Regdate'
              Title.Caption = 'Registro'
              Width = 100
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'Col_Reguser'
              Title.Caption = 'Usu'#225'rio'
              Width = 100
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
        Width = 744
        inherited pnPesq: TPanel
          Width = 744
          inherited gbfiltroavansado: TGroupBox
            Width = 740
            inherited pnVoltar: TPanel
              Width = 736
              inherited lblBack: TLabel
                Left = 709
              end
            end
          end
          inherited gbFiltro: TGroupBox
            Width = 740
            object Label1: TLabel [0]
              Tag = 1891
              Left = 16
              Top = 19
              Width = 48
              Height = 13
              Caption = 'Descri'#231#227'o'
              FocusControl = eDesc
            end
            object Label27: TLabel [1]
              Tag = 1895
              Left = 340
              Top = 19
              Width = 30
              Height = 13
              Caption = 'Status'
              FocusControl = lkFilterStatus
            end
            object Label4: TLabel [2]
              Tag = 1892
              Left = 16
              Top = 67
              Width = 33
              Height = 13
              Caption = 'Vers'#227'o'
              FocusControl = eVersao
            end
            inherited pnPesquiza: TPanel
              Width = 736
              inherited lblAdvancedSearch: TLabel
                Width = 736
              end
            end
            object eDesc: TEdit
              Left = 16
              Top = 35
              Width = 289
              Height = 21
              CharCase = ecUpperCase
              TabOrder = 1
            end
            object lkFilterStatus: TComboBox
              Left = 338
              Top = 35
              Width = 119
              Height = 21
              Style = csDropDownList
              ItemHeight = 13
              TabOrder = 2
              Items.Strings = (
                'Ativo'
                'Inativo')
            end
            object eVersao: TEdit
              Left = 16
              Top = 84
              Width = 289
              Height = 21
              CharCase = ecUpperCase
              TabOrder = 3
            end
          end
        end
      end
    end
    inherited tsBaseCadastroConsulta: TTabSheet
      object GroupBox1: TGroupBox
        Left = 0
        Top = 0
        Width = 744
        Height = 121
        Align = alTop
        TabOrder = 0
        object Label2: TLabel
          Left = 16
          Top = 15
          Width = 48
          Height = 13
          Caption = 'Descri'#231#227'o'
          FocusControl = dbDesc
        end
        object lblStatusCardUsers: TLabel
          Tag = 1895
          Left = 516
          Top = 15
          Width = 30
          Height = 13
          Caption = 'Status'
          FocusControl = dbCollectsStatus
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -12
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentFont = False
        end
        object Label3: TLabel
          Left = 16
          Top = 62
          Width = 33
          Height = 13
          Caption = 'Vers'#227'o'
          FocusControl = dbVersion
        end
        object dbDesc: TDBEdit
          Left = 16
          Top = 31
          Width = 457
          Height = 21
          CharCase = ecUpperCase
          DataField = 'COL_DESC'
          DataSource = dtsMaster
          TabOrder = 0
        end
        object dbCollectsStatus: TRxDBComboBox
          Left = 515
          Top = 31
          Width = 134
          Height = 21
          Style = csDropDownList
          DataField = 'COL_STATUS'
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
        object dbVersion: TDBEdit
          Left = 16
          Top = 78
          Width = 297
          Height = 21
          CharCase = ecUpperCase
          DataField = 'COL_VERSION'
          DataSource = dtsMaster
          TabOrder = 2
        end
      end
      object pcSubApplications: TPageControl
        Left = 27
        Top = 121
        Width = 717
        Height = 287
        ActivePage = TabSheet2
        Align = alClient
        TabOrder = 1
        object TabSheet2: TTabSheet
          Caption = 'Empresas'
          ImageIndex = 1
          object Label22: TLabel
            Tag = 1903
            Left = 8
            Top = 11
            Width = 56
            Height = 13
            Caption = 'Dispon'#237'veis'
          end
          object SpeedButton1: TSpeedButton
            Left = 603
            Top = 135
            Width = 98
            Height = 32
            Action = actOkTProv
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
            Left = 603
            Top = 183
            Width = 98
            Height = 32
            Action = actCancelTProv
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
            Tag = 1906
            Left = 320
            Top = 11
            Width = 64
            Height = 13
            Caption = 'Selecionadas'
          end
          object lbDisponiveis: TListBox
            Left = 8
            Top = 27
            Width = 257
            Height = 246
            DragMode = dmAutomatic
            ItemHeight = 13
            MultiSelect = True
            TabOrder = 1
            OnDragDrop = lbDisponiveisDragDrop
            OnDragOver = lbDisponiveisDragOver
          end
          object lbSelecionadas: TListBox
            Left = 320
            Top = 25
            Width = 257
            Height = 246
            DragMode = dmAutomatic
            ItemHeight = 13
            MultiSelect = True
            TabOrder = 2
            OnDragDrop = lbSelecionadasDragDrop
            OnDragOver = lbSelecionadasDragOver
          end
          object cbLineMt: TCoolBar
            Left = 280
            Top = 83
            Width = 27
            Height = 118
            Align = alNone
            AutoSize = True
            Bands = <
              item
                Control = tbLineMt
                ImageIndex = -1
                MinHeight = 23
                Width = 114
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
                Action = actAddAllTProv
                Wrap = True
              end
              object btnAddAllLineMt: TToolButton
                Left = 0
                Top = 24
                Action = actAddTProv
                Wrap = True
              end
              object btnDelAllLineMt: TToolButton
                Left = 0
                Top = 46
                Action = actDelTProv
                Wrap = True
              end
              object tbtnDeleteLineMt: TToolButton
                Left = 0
                Top = 68
                Action = actDelAllTProv
              end
            end
          end
          object dbgCollectorsXTP: TDBGrid
            Left = 0
            Top = 0
            Width = 709
            Height = 259
            Align = alClient
            DataSource = DmSys.dtsCollectorsXTransportProviders
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
                FieldName = 'TP_DESC'
                Title.Caption = 'Empresa'
                Width = 300
                Visible = True
              end>
          end
        end
      end
      object cbCardApps: TCoolBar
        Left = 0
        Top = 121
        Width = 27
        Height = 287
        Align = alLeft
        AutoSize = True
        Bands = <
          item
            Control = tbCardsApps
            ImageIndex = -1
            MinHeight = 23
            Width = 283
          end>
        Vertical = True
        object tbCardsApps: TToolBar
          Left = 0
          Top = 9
          Width = 23
          Height = 274
          Align = alClient
          Caption = 'tbCardsApps'
          Images = imglstBase
          TabOrder = 0
          object tbtnNewTP: TToolButton
            Left = 0
            Top = 2
            Action = actNewTProv
            ParentShowHint = False
            Wrap = True
            ShowHint = True
          end
          object tbtnEditTP: TToolButton
            Left = 0
            Top = 24
            Action = actEditTProv
            ParentShowHint = False
            Wrap = True
            ShowHint = True
          end
          object tbtnDeletePeriod: TToolButton
            Left = 0
            Top = 46
            Action = actDeleteTProv
            ParentShowHint = False
            ShowHint = True
            Visible = False
          end
        end
      end
    end
  end
  inherited actlstBase: TActionList
    inherited actFilter: TAction
      OnExecute = actFilterExecute
    end
    object actNewTProv: TAction
      Tag = 2732
      Caption = 'actNewTProv'
      ImageIndex = 16
      OnExecute = actNewTProvExecute
    end
    object actEditTProv: TAction
      Tag = 2733
      Caption = 'actEditTProv'
      ImageIndex = 10
      OnExecute = actEditTProvExecute
    end
    object actDeleteTProv: TAction
      Tag = 2734
      Caption = 'actDeleteTProv'
      ImageIndex = 9
      OnExecute = actDeleteTProvExecute
    end
    object actOkTProv: TAction
      Tag = 2735
      Caption = 'actOkTProv'
      OnExecute = actOkTProvExecute
    end
    object actCancelTProv: TAction
      Tag = 2736
      Caption = 'actCancelTProv'
      OnExecute = actCancelTProvExecute
    end
    object actAddAllTProv: TAction
      Tag = 2737
      Caption = 'actAddAllTProv'
      ImageIndex = 21
      OnExecute = actAddAllTProvExecute
    end
    object actAddTProv: TAction
      Tag = 2738
      Caption = 'actAddTProv'
      ImageIndex = 22
      OnExecute = actAddTProvExecute
    end
    object actDelTProv: TAction
      Tag = 2739
      Caption = 'actDelTProv'
      ImageIndex = 24
      OnExecute = actDelTProvExecute
    end
    object actDelAllTProv: TAction
      Tag = 2740
      Caption = 'actDelAllTProv'
      ImageIndex = 23
      OnExecute = actDelAllTProvExecute
    end
  end
  inherited dtsMaster: TDataSource
    DataSet = DmSys.cdsCollectors
  end
end
