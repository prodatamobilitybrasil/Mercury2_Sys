inherited FrmUserTypes: TFrmUserTypes
  Tag = 61
  Left = 486
  Top = 35
  Width = 744
  Height = 500
  Caption = 'Tipos de Usu'#225'rio'
  Constraints.MinHeight = 487
  Constraints.MinWidth = 744
  PixelsPerInch = 96
  TextHeight = 13
  inherited cbBase: TCoolBar
    Width = 736
    Bands = <
      item
        Control = tbBase
        ImageIndex = -1
        MinHeight = 24
        Width = 732
      end>
    inherited tbBase: TToolBar
      Width = 719
    end
  end
  inherited pcBaseCadastro: TPageControl
    Width = 736
    Height = 421
    inherited tsBaseCadastroFiltro: TTabSheet
      inherited Splitter_Base1: TSplitter
        Top = 140
        Width = 728
      end
      inherited gbGrid: TGroupBox
        Top = 144
        Width = 728
        Height = 249
        inherited grdResultado: TDBGrid
          Width = 724
          Height = 232
          DataSource = dtsMaster
          Columns = <
            item
              Expanded = False
              FieldName = 'UT_DESC'
              Title.Caption = 'Descri'#231#227'o'
              Width = 160
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'CARDTYPESDESC'
              Title.Caption = 'Tipo de Cart'#227'o'
              Width = 150
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'STATUS_ID'
              Title.Caption = 'Status'
              Width = 120
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'UT_REGDATE'
              Title.Caption = 'Registro'
              Width = 120
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'UT_REGUSER'
              Title.Caption = 'Usu'#225'rio'
              Width = 130
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'TIPODESC'
              Title.Caption = 'Tipo'
              Width = 150
              Visible = True
            end>
        end
      end
      inherited pnFiltro: TPanel
        Width = 728
        Height = 140
        inherited pnPesq: TPanel
          Width = 728
          Height = 140
          inherited gbFiltroAvansado: TGroupBox
            Width = 724
            Height = 136
            inherited pnVoltar: TPanel
              Top = 121
              Width = 720
              inherited lblBack: TLabel
                Left = 693
              end
            end
          end
          inherited gbFiltro: TGroupBox
            Width = 724
            Height = 136
            object Label1: TLabel [0]
              Tag = 3024
              Left = 272
              Top = 17
              Width = 48
              Height = 13
              Caption = 'Descri'#231#227'o'
              FocusControl = edDesc
            end
            object lStatus: TLabel [1]
              Tag = 2575
              Left = 17
              Top = 65
              Width = 30
              Height = 13
              Caption = 'Status'
              FocusControl = lkFilterStatus
            end
            object Label2: TLabel [2]
              Left = 17
              Top = 17
              Width = 70
              Height = 13
              Caption = 'Tipo de Cart'#227'o'
              FocusControl = edCardTypes
            end
            inherited pnPesquiza: TPanel
              Top = 121
              Width = 720
              TabOrder = 3
              inherited lblAdvancedSearch: TLabel
                Width = 720
              end
            end
            object edDesc: TEdit
              Left = 272
              Top = 33
              Width = 265
              Height = 21
              CharCase = ecUpperCase
              TabOrder = 1
            end
            object lkFilterStatus: TComboBox
              Left = 17
              Top = 80
              Width = 113
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
            object edCardTypes: TRxDBLookupCombo
              Left = 17
              Top = 33
              Width = 208
              Height = 20
              DropDownCount = 8
              LookupField = 'CTY_ID'
              LookupDisplay = 'CTY_DESC'
              LookupSource = DmSys.dtsCardTypes
              TabOrder = 0
            end
          end
        end
      end
    end
    inherited tsBaseCadastroConsulta: TTabSheet
      object GroupBox1: TGroupBox
        Left = 0
        Top = 0
        Width = 728
        Height = 121
        Align = alTop
        TabOrder = 0
        object lbDescricao: TLabel
          Tag = 3024
          Left = 252
          Top = 25
          Width = 48
          Height = 13
          Caption = 'Descri'#231#227'o'
        end
        object lbCardTpes: TLabel
          Left = 17
          Top = 25
          Width = 70
          Height = 13
          Caption = 'Tipo de Cart'#227'o'
          FocusControl = dblkCardTypes
        end
        object lbTipo: TLabel
          Left = 17
          Top = 75
          Width = 21
          Height = 13
          Caption = 'Tipo'
          FocusControl = dbtype
        end
        object lblStatusCardUsers: TLabel
          Tag = 2580
          Left = 252
          Top = 75
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
        object dbDesc: TDBEdit
          Left = 252
          Top = 41
          Width = 261
          Height = 21
          CharCase = ecUpperCase
          DataField = 'UT_DESC'
          DataSource = dtsMaster
          MaxLength = 15
          TabOrder = 1
        end
        object dblkCardTypes: TRxDBLookupCombo
          Left = 17
          Top = 41
          Width = 189
          Height = 20
          DropDownCount = 8
          DataField = 'CTY_ID'
          DataSource = dtsMaster
          LookupField = 'CTY_ID'
          LookupDisplay = 'CTY_DESC'
          LookupSource = DmSys.dtsCardTypes
          TabOrder = 0
        end
        object dbtype: TRxDBLookupCombo
          Left = 17
          Top = 90
          Width = 189
          Height = 20
          DropDownCount = 8
          DataField = 'UT_TYPE'
          DataSource = dtsMaster
          LookupField = 'UT_ID'
          LookupDisplay = 'UT_DESC'
          LookupSource = DmSys.dtsUserTypes
          TabOrder = 2
        end
        object dbCardUsersStatus: TRxDBComboBox
          Left = 252
          Top = 90
          Width = 117
          Height = 21
          Style = csDropDownList
          DataField = 'UT_STATUS'
          DataSource = dtsMaster
          EnableValues = True
          ItemHeight = 13
          Items.Strings = (
            'Ativo'
            'Inativo')
          TabOrder = 3
          Values.Strings = (
            'A'
            'I')
        end
      end
      object cbCardApps: TCoolBar
        Left = 0
        Top = 121
        Width = 27
        Height = 272
        Align = alLeft
        AutoSize = True
        Bands = <
          item
            Control = tbCardsApps
            ImageIndex = -1
            MinHeight = 23
            Width = 265
          end>
        Vertical = True
        object tbCardsApps: TToolBar
          Left = 0
          Top = 9
          Width = 23
          Height = 256
          Align = alClient
          Caption = 'tbCardsApps'
          Images = imglstBase
          TabOrder = 0
          object tbtnNewCardApp: TToolButton
            Left = 0
            Top = 2
            Action = actNewApp
            ParentShowHint = False
            Wrap = True
            ShowHint = True
          end
          object tbtnEditCardApp: TToolButton
            Left = 0
            Top = 24
            Action = actEditApp
            ParentShowHint = False
            Wrap = True
            ShowHint = True
          end
          object tbtnDeletePeriod: TToolButton
            Left = 0
            Top = 46
            Action = actDeleteApp
            ParentShowHint = False
            ShowHint = True
          end
        end
      end
      object pcSubApplications: TPageControl
        Left = 27
        Top = 121
        Width = 701
        Height = 272
        ActivePage = TabSheet1
        Align = alClient
        TabOrder = 2
        object TabSheet1: TTabSheet
          Tag = 2591
          Caption = 'Aplica'#231#245'es'
          object btDisplayCancel: TSpeedButton
            Left = 449
            Top = 127
            Width = 78
            Height = 32
            Action = actCancelApp
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
          object btDisplayOK: TSpeedButton
            Left = 353
            Top = 127
            Width = 78
            Height = 32
            Action = actOkApp
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
          object Label3: TLabel
            Tag = 1522
            Left = 18
            Top = 8
            Width = 47
            Height = 13
            Caption = 'Aplica'#231#227'o'
          end
          object dbLkApplications: TRxDBLookupCombo
            Left = 16
            Top = 24
            Width = 305
            Height = 21
            DropDownCount = 8
            DisplayAllFields = True
            LookupField = 'APP_ISS_ID'
            LookupDisplay = 'APP_ID; APP_DESCSHORT; ISS_DESCSHORT'
            LookupDisplayIndex = 1
            LookupSource = DmSys.dtsApplicationsLook
            TabOrder = 0
          end
          object dbgSubApplications: TDBGrid
            Left = 0
            Top = 0
            Width = 693
            Height = 244
            Align = alClient
            DataSource = DmSys.dtsUserTypesXApplicationsCad
            Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgRowSelect, dgConfirmDelete, dgCancelOnExit]
            TabOrder = 1
            TitleFont.Charset = DEFAULT_CHARSET
            TitleFont.Color = clWindowText
            TitleFont.Height = -11
            TitleFont.Name = 'MS Sans Serif'
            TitleFont.Style = []
            Columns = <
              item
                Expanded = False
                FieldName = 'ISS_DESCSHORT'
                Title.Caption = 'Emissor'
                Width = 160
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'APP_DESCSHORT'
                Title.Caption = 'Aplica'#231#227'o'
                Width = 280
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
    object actNewApp: TAction
      Tag = 2714
      Category = 'Applications'
      Caption = 'actNewApp'
      ImageIndex = 16
      OnExecute = actNewAppExecute
    end
    object actEditApp: TAction
      Tag = 2715
      Category = 'Applications'
      Caption = 'actEditApp'
      ImageIndex = 10
      OnExecute = actEditAppExecute
    end
    object actDeleteApp: TAction
      Tag = 2716
      Category = 'Applications'
      Caption = 'actDelete'
      ImageIndex = 9
      OnExecute = actDeleteAppExecute
    end
    object actOkApp: TAction
      Tag = 2717
      Category = 'Ok-Cancel'
      Caption = 'actOkApp'
      OnExecute = actOkAppExecute
    end
    object actCancelApp: TAction
      Tag = 2718
      Category = 'Ok-Cancel'
      Caption = 'actCancelApp'
      OnExecute = actCancelAppExecute
    end
  end
end
