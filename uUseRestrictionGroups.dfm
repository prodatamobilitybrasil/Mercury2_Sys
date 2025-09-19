inherited FrmUseRestrictionGroups: TFrmUseRestrictionGroups
  Tag = 16
  Left = 436
  Top = 227
  Width = 708
  Height = 499
  Caption = 'Uso de Restri'#231#227'o de Grupo'
  Constraints.MinHeight = 499
  Constraints.MinWidth = 708
  PixelsPerInch = 96
  TextHeight = 13
  inherited cbBase: TCoolBar
    Width = 692
    Bands = <
      item
        Control = tbBase
        ImageIndex = -1
        MinHeight = 24
        Width = 688
      end>
    inherited tbBase: TToolBar
      Width = 675
    end
  end
  inherited pcBaseCadastro: TPageControl
    Width = 692
    Height = 413
    ActivePage = tsBaseCadastroConsulta
    OnChange = pcBaseCadastroChange
    inherited tsBaseCadastroFiltro: TTabSheet
      inherited Splitter_Base1: TSplitter
        Top = 113
        Width = 684
      end
      inherited gbGrid: TGroupBox
        Top = 117
        Width = 684
        Height = 268
        inherited grdResultado: TDBGrid
          Width = 680
          Height = 251
          DataSource = dtsMaster
          Columns = <
            item
              Expanded = False
              FieldName = 'URG_ID'
              Visible = False
            end
            item
              Expanded = False
              FieldName = 'URG_DESC'
              Title.Caption = 'Descri'#231#227'o'
              Width = 310
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'URG_REGDATE'
              Visible = False
            end
            item
              Expanded = False
              FieldName = 'URG_REGUSER'
              Title.Caption = 'Usu'#225'rio'
              Visible = False
            end
            item
              Expanded = False
              FieldName = 'URG_STATUS'
              Title.Caption = 'Status'
              Visible = False
            end
            item
              Expanded = False
              FieldName = 'STATUS_ID'
              Title.Caption = 'Status'
              Width = 181
              Visible = True
            end>
        end
      end
      inherited pnFiltro: TPanel
        Width = 684
        Height = 113
        inherited pnPesq: TPanel
          Width = 684
          Height = 113
          inherited gbfiltroavansado: TGroupBox
            Width = 680
            Height = 109
            inherited pnVoltar: TPanel
              Top = 94
              Width = 676
              inherited lblBack: TLabel
                Left = 649
              end
            end
          end
          inherited gbFiltro: TGroupBox
            Width = 680
            Height = 109
            object lStatus: TLabel [0]
              Tag = 1767
              Left = 362
              Top = 25
              Width = 30
              Height = 13
              Caption = 'Status'
              FocusControl = lkFilterStatus
            end
            object lbl_desc: TLabel [1]
              Tag = 1764
              Left = 13
              Top = 25
              Width = 48
              Height = 13
              Caption = 'Descri'#231#227'o'
              FocusControl = edDesc
            end
            inherited pnPesquiza: TPanel
              Top = 94
              Width = 676
              TabOrder = 2
              inherited lblAdvancedSearch: TLabel
                Width = 676
              end
            end
            object lkFilterStatus: TComboBox
              Left = 362
              Top = 40
              Width = 113
              Height = 21
              Style = csDropDownList
              ItemHeight = 13
              ItemIndex = 0
              TabOrder = 1
              Text = 'Ativo'
              Items.Strings = (
                'Ativo'
                'Inativo')
            end
            object edDesc: TEdit
              Left = 13
              Top = 40
              Width = 300
              Height = 21
              CharCase = ecUpperCase
              MaxLength = 50
              TabOrder = 0
            end
          end
        end
      end
    end
    inherited tsBaseCadastroConsulta: TTabSheet
      object gbRestricao: TGroupBox
        Left = 0
        Top = 0
        Width = 684
        Height = 124
        Align = alTop
        TabOrder = 0
        object lbDescricao: TLabel
          Left = 26
          Top = 18
          Width = 48
          Height = 13
          Caption = 'Descri'#231#227'o'
          FocusControl = dbDesc
        end
        object lbl_Status: TLabel
          Tag = 1770
          Left = 316
          Top = 17
          Width = 30
          Height = 13
          Caption = 'Status'
          FocusControl = dbRestricaoStatus
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -12
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentFont = False
        end
        object dbDesc: TDBEdit
          Left = 26
          Top = 34
          Width = 274
          Height = 21
          CharCase = ecUpperCase
          DataField = 'URG_DESC'
          DataSource = dtsMaster
          TabOrder = 0
        end
        object dbRestricaoStatus: TRxDBComboBox
          Left = 314
          Top = 32
          Width = 137
          Height = 21
          Style = csDropDownList
          DataField = 'URG_STATUS'
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
      object pcRestricoes: TPageControl
        Left = 0
        Top = 124
        Width = 684
        Height = 261
        ActivePage = TabSheet1
        Align = alClient
        TabOrder = 1
        object TabSheet1: TTabSheet
          Tag = 1776
          Caption = 'Per'#237'odos'
          object btDisplayCancel: TSpeedButton
            Left = 451
            Top = 175
            Width = 98
            Height = 32
            Hint = 'Cancelar'
            Caption = 'Cancel'
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
            OnClick = actCancelAppExecute
          end
          object btDisplayOK: TSpeedButton
            Left = 344
            Top = 175
            Width = 98
            Height = 32
            Hint = 'OK'
            Caption = 'OK'
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
            OnClick = actOkAppExecute
          end
          object lbl_periodo: TLabel
            Left = 32
            Top = 40
            Width = 38
            Height = 13
            Caption = 'Per'#237'odo'
          end
          object lbl_limite: TLabel
            Left = 360
            Top = 40
            Width = 27
            Height = 13
            Caption = 'Limite'
          end
          object dbLkApplications: TRxDBLookupCombo
            Left = 32
            Top = 56
            Width = 305
            Height = 21
            DropDownCount = 8
            DisplayAllFields = True
            DataField = 'PUT_ID'
            DataSource = DmSys.dtsUseRestGroupsXPerUseTypes
            LookupField = 'PUT_ID'
            LookupDisplay = 'PUT_ID;PUT_DESC'
            LookupDisplayIndex = 1
            LookupSource = DmSys.dtsPeriodUseTypes
            TabOrder = 0
          end
          object dbe_limite: TDBEdit
            Left = 360
            Top = 56
            Width = 185
            Height = 21
            CharCase = ecUpperCase
            DataField = 'URGPUT_PERUSELIMIT'
            DataSource = DmSys.dtsUseRestGroupsXPerUseTypes
            TabOrder = 1
          end
          object dbgperiodos: TDBGrid
            Left = 27
            Top = 0
            Width = 649
            Height = 233
            Hint = 'Manuten'#231#227'o'
            Align = alClient
            DataSource = DmSys.dtsGridPeriodo
            Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgRowSelect, dgConfirmDelete, dgCancelOnExit]
            TabOrder = 2
            TitleFont.Charset = DEFAULT_CHARSET
            TitleFont.Color = clWindowText
            TitleFont.Height = -11
            TitleFont.Name = 'MS Sans Serif'
            TitleFont.Style = []
            Columns = <
              item
                Expanded = False
                FieldName = 'PUT_DESC'
                Title.Caption = 'Tipo de Per'#237'odo'
                Width = 200
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'URGPUT_PERUSELIMIT'
                Title.Caption = 'Limite'
                Width = 180
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'URGPUT_STATUS'
                Title.Caption = 'Status'
                Visible = True
              end>
          end
          object cbCardApps: TCoolBar
            Left = 0
            Top = 0
            Width = 27
            Height = 233
            Align = alLeft
            AutoSize = True
            Bands = <
              item
                Control = tbCardsApps
                ImageIndex = -1
                MinHeight = 23
                Width = 229
              end>
            Vertical = True
            object tbCardsApps: TToolBar
              Left = 0
              Top = 9
              Width = 23
              Height = 220
              Align = alLeft
              Caption = 'tbCardsApps'
              Images = imglstBase
              TabOrder = 0
              object tbtnNewCardApp: TToolButton
                Left = 0
                Top = 2
                Hint = 'Novo Per'#237'odo'
                Caption = 'actNewApp'
                ImageIndex = 16
                ParentShowHint = False
                Wrap = True
                ShowHint = True
                OnClick = NewAppExecute
              end
              object tbtnEditCardApp: TToolButton
                Tag = 3496
                Left = 0
                Top = 24
                Hint = 'Editar Per'#237'odo'
                Caption = 'actEditApp'
                ImageIndex = 10
                ParentShowHint = False
                Wrap = True
                ShowHint = True
                OnClick = actEditAppExecute
              end
              object tbtnDeletePeriod: TToolButton
                Left = 0
                Top = 46
                Hint = 'Excluir Per'#237'odo'
                Caption = 'actDeleteApp'
                ImageIndex = 9
                ParentShowHint = False
                ShowHint = True
                OnClick = actDeleteAppExecute
              end
            end
          end
        end
      end
    end
  end
  inherited actlstBase: TActionList
    inherited actFilter: TAction
      OnExecute = actFilterExecute
    end
    object actNewApp: TAction
      Tag = 2725
      Category = 'Applications'
      Caption = 'actNewApp'
      ImageIndex = 16
      OnExecute = NewAppExecute
    end
    object actEditApp: TAction
      Tag = 2726
      Category = 'Applications'
      Caption = 'actEditApp'
      ImageIndex = 10
      OnExecute = actEditAppExecute
    end
    object actDeleteApp: TAction
      Tag = 2727
      Category = 'Applications'
      Caption = 'actDeleteApp'
      ImageIndex = 9
      OnExecute = actDeleteAppExecute
    end
    object actOkApp: TAction
      Tag = 2728
      Category = 'Ok-Cancel'
      Caption = 'actOkApp'
      OnExecute = actOkAppExecute
    end
    object actCancelApp: TAction
      Tag = 2729
      Category = 'Ok-Cancel'
      Caption = 'actCancelApp'
      OnExecute = actCancelAppExecute
    end
  end
  object CdsGridPeriodo: TClientDataSet
    Aggregates = <>
    Params = <
      item
        DataType = ftUnknown
        ParamType = ptUnknown
      end>
    Left = 457
    Top = 8
    object CdsGridPeriodoURGPUT_ID: TIntegerField
      FieldName = 'URGPUT_ID'
    end
    object CdsGridPeriodoURG_ID: TIntegerField
      FieldName = 'URG_ID'
    end
    object CdsGridPeriodoPUT_ID: TIntegerField
      FieldName = 'PUT_ID'
    end
    object CdsGridPeriodoURGPUT_PERUSELIMIT: TIntegerField
      FieldName = 'URGPUT_PERUSELIMIT'
    end
    object CdsGridPeriodoURGPUT_STATUS: TStringField
      FieldName = 'URGPUT_STATUS'
      Size = 1
    end
    object CdsGridPeriodoURGPUT_REGDATE: TDateField
      FieldName = 'URGPUT_REGDATE'
    end
    object CdsGridPeriodoURGPUT_REGUSER: TStringField
      FieldName = 'URGPUT_REGUSER'
    end
  end
end
