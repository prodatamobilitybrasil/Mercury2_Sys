inherited FrmReloadPeriod: TFrmReloadPeriod
  Tag = 51
  Left = 194
  Top = 114
  Width = 754
  Height = 503
  Caption = 'Per'#237'odos de Recargas'
  Constraints.MinHeight = 503
  Constraints.MinWidth = 754
  PixelsPerInch = 96
  TextHeight = 13
  inherited cbBase: TCoolBar
    Width = 746
    Bands = <
      item
        Control = tbBase
        ImageIndex = -1
        MinHeight = 24
        Width = 742
      end>
    inherited tbBase: TToolBar
      Width = 729
    end
  end
  inherited pcBaseCadastro: TPageControl
    Width = 746
    Height = 421
    OnChange = pcBaseCadastroChange
    inherited tsBaseCadastroFiltro: TTabSheet
      inherited Splitter_Base1: TSplitter
        Top = 114
        Width = 738
      end
      inherited gbGrid: TGroupBox
        Top = 118
        Width = 738
        Height = 275
        inherited grdResultado: TDBGrid
          Width = 734
          Height = 258
          DataSource = dtsMaster
          Columns = <
            item
              Expanded = False
              FieldName = 'RPM_YEAR'
              Title.Caption = 'Ano'
              Width = 90
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'PERIODO'
              Title.Caption = 'Periodo'
              Visible = False
            end
            item
              Expanded = False
              FieldName = 'RPM_START'
              Title.Caption = 'Data Inicial'
              Width = 110
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'RPM_END'
              Title.Caption = 'Data Final'
              Width = 110
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
              FieldName = 'RPM_REGDATE'
              Title.Caption = 'Registro'
              Width = 120
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'RPM_REGUSER'
              Title.Caption = 'Usu'#225'rio'
              Width = 150
              Visible = True
            end>
        end
      end
      inherited pnFiltro: TPanel
        Width = 738
        Height = 114
        inherited pnPesq: TPanel
          Width = 738
          Height = 114
          inherited gbfiltroavansado: TGroupBox
            Width = 734
            Height = 110
            inherited pnVoltar: TPanel
              Top = 95
              Width = 730
              inherited lblBack: TLabel
                Left = 703
              end
            end
          end
          inherited gbFiltro: TGroupBox
            Width = 734
            Height = 110
            object Label7: TLabel [0]
              Tag = 2358
              Left = 16
              Top = 24
              Width = 19
              Height = 13
              Caption = 'Ano'
              FocusControl = edAno
            end
            object lStatus: TLabel [1]
              Tag = 2362
              Left = 442
              Top = 25
              Width = 30
              Height = 13
              Caption = 'Status'
              FocusControl = lkFilterStatus
            end
            object Label1: TLabel [2]
              Left = 145
              Top = 26
              Width = 53
              Height = 13
              Caption = 'Data Inicial'
              FocusControl = dbDTSstart
            end
            object Label9: TLabel [3]
              Left = 298
              Top = 26
              Width = 48
              Height = 13
              Caption = 'Data Final'
              FocusControl = dbDTSEnd
            end
            inherited pnPesquiza: TPanel
              Top = 95
              Width = 730
              TabOrder = 4
              inherited lblAdvancedSearch: TLabel
                Width = 730
              end
            end
            object lkFilterStatus: TComboBox
              Left = 442
              Top = 40
              Width = 127
              Height = 21
              Style = csDropDownList
              ItemHeight = 13
              TabOrder = 3
              Items.Strings = (
                'Ativo'
                'Inativo')
            end
            object edAno: TSpinEdit
              Left = 16
              Top = 40
              Width = 97
              Height = 22
              MaxValue = 0
              MinValue = 0
              TabOrder = 0
              Value = 0
            end
            object edDtInicial: TDateEdit
              Left = 144
              Top = 40
              Width = 121
              Height = 21
              NumGlyphs = 2
              TabOrder = 1
            end
            object edDtFinal: TDateEdit
              Left = 296
              Top = 40
              Width = 121
              Height = 21
              NumGlyphs = 2
              TabOrder = 2
            end
          end
        end
      end
    end
    inherited tsBaseCadastroConsulta: TTabSheet
      object pgcDetail: TPageControl
        Left = 0
        Top = 86
        Width = 738
        Height = 307
        ActivePage = TabSheet1
        Align = alBottom
        TabOrder = 1
        object TabSheet1: TTabSheet
          Caption = 'Detalhes'
          object Label4: TLabel
            Left = 52
            Top = 66
            Width = 100
            Height = 13
            Caption = 'M'#225'ximo de Recargas'
          end
          object Label6: TLabel
            Left = 308
            Top = 66
            Width = 63
            Height = 13
            Caption = 'Valor M'#225'ximo'
            FocusControl = DBEdit2
          end
          object btDisplayOK: TSpeedButton
            Left = 351
            Top = 135
            Width = 72
            Height = 26
            Action = actOkDet
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
          object btDisplayCancel: TSpeedButton
            Left = 435
            Top = 135
            Width = 79
            Height = 26
            Action = actCancelDet
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
          object Label5: TLabel
            Tag = 2377
            Left = 52
            Top = 15
            Width = 47
            Height = 13
            Caption = 'Aplica'#231#227'o'
            FocusControl = dbLkApplications
          end
          object Label8: TLabel
            Tag = 2367
            Left = 393
            Top = 17
            Width = 30
            Height = 13
            Caption = 'Status'
            FocusControl = RxDBComboBox1
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clBlack
            Font.Height = -12
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            ParentFont = False
          end
          object cbCardApps: TCoolBar
            Left = 0
            Top = 0
            Width = 27
            Height = 279
            Align = alLeft
            AutoSize = True
            Bands = <
              item
                Control = tbCardsApps
                ImageIndex = -1
                MinHeight = 23
                Width = 275
              end>
            Vertical = True
            object tbCardsApps: TToolBar
              Left = 0
              Top = 9
              Width = 23
              Height = 266
              Align = alClient
              Caption = 'tbCardsApps'
              Images = imglstBase
              TabOrder = 0
              object tbtnNewCardApp: TToolButton
                Left = 0
                Top = 2
                Action = actNewDetail
                Wrap = True
              end
              object tbtnEditCardApp: TToolButton
                Left = 0
                Top = 24
                Action = actEditDetail
                Wrap = True
              end
              object tbtnDeletePeriod: TToolButton
                Left = 0
                Top = 46
                Action = actDelDetail
              end
            end
          end
          object DBEdit2: TDBEdit
            Left = 308
            Top = 81
            Width = 205
            Height = 21
            DataField = 'RPD_MAXAMOUNT'
            DataSource = DmSys.dtsReloadPeriodDT
            TabOrder = 3
          end
          object dbLkApplications: TRxDBLookupCombo
            Left = 52
            Top = 33
            Width = 325
            Height = 20
            DropDownCount = 8
            DisplayAllFields = True
            EmptyValue = '0'
            LookupField = 'APP_ISS_ID'
            LookupDisplay = 'APP_ID; APP_DESCSHORT; ISS_DESCLONG'
            LookupDisplayIndex = 1
            LookupSource = DmSys.dtsApplicationsLook
            TabOrder = 0
            OnCloseUp = dbLkApplicationsCloseUp
          end
          object RxDBComboBox1: TRxDBComboBox
            Left = 393
            Top = 33
            Width = 120
            Height = 21
            Style = csDropDownList
            DataField = 'RPD_STATUS'
            DataSource = DmSys.dtsReloadPeriodDT
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
          object db_RPD_MAXRELOADS: TRxDBCalcEdit
            Left = 52
            Top = 81
            Width = 249
            Height = 21
            DataField = 'RPD_MAXRELOADS'
            DataSource = DmSys.dtsReloadPeriodDT
            Alignment = taLeftJustify
            ButtonWidth = -1
            NumGlyphs = 2
            TabOrder = 2
          end
          object dbgDetalhes: TDBGrid
            Left = 27
            Top = 0
            Width = 703
            Height = 279
            Align = alClient
            DataSource = DmSys.dtsReloadPeriodDT
            Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgRowSelect, dgConfirmDelete]
            TabOrder = 5
            TitleFont.Charset = DEFAULT_CHARSET
            TitleFont.Color = clWindowText
            TitleFont.Height = -11
            TitleFont.Name = 'MS Sans Serif'
            TitleFont.Style = []
            Columns = <
              item
                Expanded = False
                FieldName = 'APP_DESCSHORT'
                Title.Caption = 'Aplica'#231#227'o'
                Width = 130
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'ISS_DESCLONG'
                Title.Caption = 'Emissor'
                Width = 130
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'RPD_MAXRELOADS'
                Title.Caption = 'M'#225'ximo de Recargas'
                Width = 150
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'RPD_MAXAMOUNT'
                Title.Caption = 'Valor M'#225'ximo'
                Width = 150
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'STATUS_ID'
                Title.Caption = 'Status'
                Width = 100
                Visible = True
              end>
          end
        end
      end
      object gbReload: TGroupBox
        Left = 0
        Top = 0
        Width = 738
        Height = 86
        Align = alClient
        Ctl3D = True
        ParentCtl3D = False
        TabOrder = 0
        object Label2: TLabel
          Left = 145
          Top = 18
          Width = 53
          Height = 13
          Caption = 'Data Inicial'
          FocusControl = dbDTSstart
        end
        object Label3: TLabel
          Left = 314
          Top = 18
          Width = 48
          Height = 13
          Caption = 'Data Final'
          FocusControl = dbDTSEnd
        end
        object lblStatusCardUsers: TLabel
          Tag = 2362
          Left = 477
          Top = 18
          Width = 30
          Height = 13
          Caption = 'Status'
          FocusControl = dbCardUsersStatus
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -12
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentFont = False
        end
        object Label10: TLabel
          Left = 16
          Top = 18
          Width = 19
          Height = 13
          Caption = 'Ano'
          FocusControl = db_Year
        end
        object dbCardUsersStatus: TRxDBComboBox
          Left = 477
          Top = 32
          Width = 143
          Height = 21
          Style = csDropDownList
          DataField = 'RPM_STATUS'
          DataSource = dtsMaster
          EnableValues = True
          ItemHeight = 13
          Items.Strings = (
            'Ativo'
            'Inativo')
          TabOrder = 4
          Values.Strings = (
            'A'
            'I')
        end
        object dbDTSstart: TDBDateEdit
          Left = 144
          Top = 32
          Width = 129
          Height = 21
          DataField = 'RPM_START'
          DataSource = dtsMaster
          NumGlyphs = 2
          TabOrder = 2
        end
        object dbDTSEnd: TDBDateEdit
          Left = 312
          Top = 32
          Width = 121
          Height = 21
          DataField = 'RPM_END'
          DataSource = dtsMaster
          NumGlyphs = 2
          TabOrder = 3
        end
        object db_Year: TDBEdit
          Left = 16
          Top = 32
          Width = 89
          Height = 21
          DataField = 'RPM_YEAR'
          DataSource = dtsMaster
          TabOrder = 0
        end
        object sbYear: TSpinButton
          Left = 104
          Top = 33
          Width = 15
          Height = 21
          Ctl3D = True
          DownGlyph.Data = {
            0E010000424D0E01000000000000360000002800000009000000060000000100
            200000000000D800000000000000000000000000000000000000008080000080
            8000008080000080800000808000008080000080800000808000008080000080
            8000008080000080800000808000000000000080800000808000008080000080
            8000008080000080800000808000000000000000000000000000008080000080
            8000008080000080800000808000000000000000000000000000000000000000
            0000008080000080800000808000000000000000000000000000000000000000
            0000000000000000000000808000008080000080800000808000008080000080
            800000808000008080000080800000808000}
          ParentCtl3D = False
          TabOrder = 1
          UpGlyph.Data = {
            0E010000424D0E01000000000000360000002800000009000000060000000100
            200000000000D800000000000000000000000000000000000000008080000080
            8000008080000080800000808000008080000080800000808000008080000080
            8000000000000000000000000000000000000000000000000000000000000080
            8000008080000080800000000000000000000000000000000000000000000080
            8000008080000080800000808000008080000000000000000000000000000080
            8000008080000080800000808000008080000080800000808000000000000080
            8000008080000080800000808000008080000080800000808000008080000080
            800000808000008080000080800000808000}
          OnDownClick = sbYearDownClick
          OnUpClick = sbYearUpClick
        end
      end
    end
  end
  inherited actlstBase: TActionList
    inherited actFilter: TAction
      OnExecute = actFilterExecute
    end
    object actNewDetail: TAction
      Tag = 2676
      Category = 'Detail'
      Caption = 'actNewDetail'
      ImageIndex = 16
      OnExecute = actNewDetailExecute
    end
    object actEditDetail: TAction
      Tag = 2677
      Category = 'Detail'
      Caption = 'actEditDetail'
      ImageIndex = 10
      OnExecute = actEditDetailExecute
    end
    object actDelDetail: TAction
      Tag = 2678
      Category = 'Detail'
      Caption = 'actDelDetail'
      ImageIndex = 9
      OnExecute = actDelDetailExecute
    end
    object actOkDet: TAction
      Tag = 2375
      Category = 'Ok-Cancel'
      Caption = 'actOkDet'
      OnExecute = actOkDetExecute
    end
    object actCancelDet: TAction
      Tag = 2376
      Category = 'Ok-Cancel'
      Caption = 'actCancelDet'
      OnExecute = actCancelDetExecute
    end
  end
end
