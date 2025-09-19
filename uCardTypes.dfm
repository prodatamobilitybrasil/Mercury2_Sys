inherited FrmCardTypes: TFrmCardTypes
  Tag = 19
  Left = 191
  Top = 153
  Width = 711
  Height = 445
  Caption = 'Tipos de Cart'#227'o'
  Constraints.MinHeight = 445
  Constraints.MinWidth = 711
  PixelsPerInch = 96
  TextHeight = 13
  inherited cbBase: TCoolBar
    Width = 703
    Bands = <
      item
        Control = tbBase
        ImageIndex = -1
        MinHeight = 24
        Width = 699
      end>
    inherited tbBase: TToolBar
      Width = 686
    end
  end
  inherited pcBaseCadastro: TPageControl
    Width = 703
    Height = 363
    OnChange = pcBaseCadastroChange
    inherited tsBaseCadastroFiltro: TTabSheet
      inherited Splitter_Base1: TSplitter
        Top = 108
        Width = 695
      end
      inherited gbGrid: TGroupBox
        Top = 112
        Width = 695
        Height = 223
        inherited grdResultado: TDBGrid
          Width = 691
          Height = 206
          DataSource = dtsMaster
          Columns = <
            item
              Expanded = False
              FieldName = 'CTY_DESC'
              Title.Caption = 'Descri'#231#227'o'
              Width = 210
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'CTY_BLOCKSIZE'
              Width = 100
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'CTY_BLOCKSPERSECTOR'
              Width = 100
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'CTY_SECTORQTY'
              Width = 100
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'CTY_REGDATE'
              Title.Caption = 'Registro'
              Width = 100
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'CTY_REGUSER'
              Title.Caption = 'Usu'#225'rio'
              Width = 100
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'STATUS_ID'
              Width = 100
              Visible = True
            end>
        end
      end
      inherited pnFiltro: TPanel
        Width = 695
        Height = 108
        inherited pnPesq: TPanel
          Width = 695
          Height = 108
          inherited gbfiltroavansado: TGroupBox
            Width = 691
            Height = 104
            inherited pnVoltar: TPanel
              Top = 89
              Width = 687
              inherited lblBack: TLabel
                Left = 660
              end
            end
          end
          inherited gbFiltro: TGroupBox
            Width = 691
            Height = 104
            object Label10: TLabel [0]
              Tag = 1820
              Left = 14
              Top = 20
              Width = 48
              Height = 13
              Caption = 'Descri'#231#227'o'
              FocusControl = edDesc
            end
            object Label11: TLabel [1]
              Tag = 1839
              Left = 360
              Top = 20
              Width = 30
              Height = 13
              Caption = 'Status'
              FocusControl = lkFilterStatus
            end
            inherited pnPesquiza: TPanel
              Top = 89
              Width = 687
              inherited lblAdvancedSearch: TLabel
                Width = 687
              end
            end
            object edDesc: TEdit
              Left = 14
              Top = 38
              Width = 315
              Height = 21
              CharCase = ecUpperCase
              MaxLength = 50
              TabOrder = 1
            end
            object lkFilterStatus: TComboBox
              Left = 358
              Top = 38
              Width = 115
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
      object cbCardApps: TCoolBar
        Left = 0
        Top = 124
        Width = 27
        Height = 211
        Align = alLeft
        AutoSize = True
        Bands = <
          item
            Control = tbCardsApps
            ImageIndex = -1
            MinHeight = 23
            Width = 207
          end>
        Vertical = True
        object tbCardsApps: TToolBar
          Left = 0
          Top = 9
          Width = 23
          Height = 198
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
        Top = 124
        Width = 668
        Height = 211
        ActivePage = TabSheet1
        Align = alClient
        TabOrder = 1
        object TabSheet1: TTabSheet
          Tag = 1826
          Caption = 'Aplica'#231#245'es'
          object Label19: TLabel
            Tag = 1827
            Left = 16
            Top = 8
            Width = 47
            Height = 13
            Caption = 'Aplica'#231#227'o'
          end
          object btDisplayCancel: TSpeedButton
            Left = 544
            Top = 151
            Width = 98
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
            Left = 432
            Top = 151
            Width = 98
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
          object Label1: TLabel
            Left = 296
            Top = 8
            Width = 97
            Height = 13
            Caption = 'MASTERSECIDMIN'
            FocusControl = dbMastersecidmin
          end
          object Label6: TLabel
            Left = 456
            Top = 8
            Width = 100
            Height = 13
            Caption = 'MASTERSECIDMAX'
            FocusControl = dbMastersecidmax
          end
          object Label7: TLabel
            Left = 16
            Top = 59
            Width = 67
            Height = 13
            Caption = 'BUSECIDMIN'
            FocusControl = db_CTYAPP_BUSECIDMIN
          end
          object Label8: TLabel
            Left = 208
            Top = 59
            Width = 70
            Height = 13
            Caption = 'BUSECIDMAX'
            FocusControl = db_CTYAPP_BUSECIDMAX
          end
          object Label9: TLabel
            Left = 392
            Top = 59
            Width = 65
            Height = 13
            Caption = 'REPEATQTY'
            FocusControl = db_CTYAPP_REPEATQTY
          end
          object dbLkApplications: TRxDBLookupCombo
            Left = 16
            Top = 24
            Width = 265
            Height = 21
            DropDownCount = 8
            LookupField = 'APP_ID'
            LookupDisplay = 'APP_ID; APP_DESCSHORT; ISS_DESCLONG'
            LookupDisplayIndex = 1
            LookupSource = DmSys.dtsApplicationsLook
            TabOrder = 1
            OnCloseUp = dbLkApplicationsCloseUp
          end
          object edApp: TEdit
            Left = 19
            Top = 26
            Width = 242
            Height = 17
            BorderStyle = bsNone
            ReadOnly = True
            TabOrder = 2
          end
          object dbMastersecidmin: TDBEdit
            Left = 296
            Top = 24
            Width = 145
            Height = 21
            DataField = 'CTYAPP_MASTERSECIDMIN'
            DataSource = DmSys.dtsCardTypesXApplications
            TabOrder = 3
            OnChange = dbMastersecidminChange
          end
          object dbMastersecidmax: TDBEdit
            Left = 456
            Top = 24
            Width = 105
            Height = 21
            DataField = 'CTYAPP_MASTERSECIDMAX'
            DataSource = DmSys.dtsCardTypesXApplications
            TabOrder = 4
            OnChange = dbMastersecidmaxChange
          end
          object db_CTYAPP_BUSECIDMIN: TDBEdit
            Left = 16
            Top = 75
            Width = 169
            Height = 21
            DataField = 'CTYAPP_BUSECIDMIN'
            DataSource = DmSys.dtsCardTypesXApplications
            TabOrder = 5
            OnChange = db_CTYAPP_BUSECIDMINChange
          end
          object db_CTYAPP_BUSECIDMAX: TDBEdit
            Left = 208
            Top = 75
            Width = 169
            Height = 21
            DataField = 'CTYAPP_BUSECIDMAX'
            DataSource = DmSys.dtsCardTypesXApplications
            TabOrder = 6
            OnChange = db_CTYAPP_BUSECIDMAXChange
          end
          object db_CTYAPP_REPEATQTY: TDBEdit
            Left = 392
            Top = 75
            Width = 169
            Height = 21
            DataField = 'CTYAPP_REPEATQTY'
            DataSource = DmSys.dtsCardTypesXApplications
            TabOrder = 7
            OnChange = db_CTYAPP_REPEATQTYChange
          end
          object dbgAplicacoes: TDBGrid
            Left = 0
            Top = 0
            Width = 660
            Height = 183
            Align = alClient
            DataSource = DmSys.dtsCardTypesXApplications
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
                FieldName = 'APP_DESCSHORT'
                Title.Caption = 'Aplica'#231#227'o'
                Width = 200
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'ISS_DESCLONG'
                Title.Caption = 'Emissor'
                Width = 200
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'CTYAPP_BUSECIDMAX'
                Width = 80
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'CTYAPP_BUSECIDMIN'
                Width = 80
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'CTYAPP_MASTERSECIDMAX'
                Width = 80
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'CTYAPP_MASTERSECIDMIN'
                Width = 80
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'CTYAPP_REPEATQTY'
                Width = 80
                Visible = True
              end>
          end
        end
      end
      object GroupBox1: TGroupBox
        Left = 0
        Top = 0
        Width = 695
        Height = 124
        Align = alTop
        TabOrder = 2
        object Label2: TLabel
          Left = 16
          Top = 19
          Width = 48
          Height = 13
          Caption = 'Descri'#231#227'o'
          FocusControl = dbDesc
        end
        object Label5: TLabel
          Left = 16
          Top = 66
          Width = 135
          Height = 13
          Caption = 'CTY_BLOCKSPERSECTOR'
          FocusControl = db_CTY_BLOCKSPERSECTOR
        end
        object lStatus: TLabel
          Tag = 2713
          Left = 244
          Top = 67
          Width = 30
          Height = 13
          Caption = 'Status'
          FocusControl = dbCardUsersStatus
        end
        object Label3: TLabel
          Left = 368
          Top = 19
          Width = 93
          Height = 13
          Caption = 'CTY_SECTORQTY'
          FocusControl = db_CTY_SECTORQTY
        end
        object Label4: TLabel
          Left = 512
          Top = 19
          Width = 86
          Height = 13
          Caption = 'CTY_BLOCKSIZE'
          FocusControl = db_CTY_BLOCKSIZE
        end
        object dbDesc: TDBEdit
          Left = 16
          Top = 35
          Width = 337
          Height = 21
          CharCase = ecUpperCase
          DataField = 'CTY_DESC'
          DataSource = dtsMaster
          TabOrder = 0
        end
        object db_CTY_BLOCKSPERSECTOR: TDBEdit
          Left = 16
          Top = 82
          Width = 177
          Height = 21
          DataField = 'CTY_BLOCKSPERSECTOR'
          DataSource = dtsMaster
          MaxLength = 1
          TabOrder = 3
          OnChange = db_CTY_BLOCKSPERSECTORChange
        end
        object dbCardUsersStatus: TRxDBComboBox
          Left = 244
          Top = 84
          Width = 106
          Height = 21
          Style = csDropDownList
          DataField = 'CTY_STATUS'
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
        object db_CTY_SECTORQTY: TDBEdit
          Left = 368
          Top = 35
          Width = 129
          Height = 21
          DataField = 'CTY_SECTORQTY'
          DataSource = dtsMaster
          MaxLength = 2
          TabOrder = 1
          OnChange = db_CTY_SECTORQTYChange
        end
        object db_CTY_BLOCKSIZE: TDBEdit
          Left = 512
          Top = 35
          Width = 129
          Height = 21
          DataField = 'CTY_BLOCKSIZE'
          DataSource = dtsMaster
          MaxLength = 3
          TabOrder = 2
          OnChange = db_CTY_BLOCKSIZEChange
        end
      end
    end
  end
  inherited actlstBase: TActionList
    inherited actFilter: TAction
      OnExecute = actFilterExecute
    end
    object actNewApp: TAction
      Tag = 2708
      Category = 'Applications'
      Caption = 'actNewApp'
      ImageIndex = 16
      OnExecute = actNewAppExecute
    end
    object actEditApp: TAction
      Tag = 2709
      Category = 'Applications'
      Caption = 'actEditApp'
      ImageIndex = 10
      OnExecute = actEditAppExecute
    end
    object actDeleteApp: TAction
      Tag = 2710
      Category = 'Applications'
      Caption = 'actDeleteApp'
      ImageIndex = 9
      OnExecute = actDeleteAppExecute
    end
    object actOkApp: TAction
      Tag = 2711
      Category = 'Ok-Cancel'
      Caption = 'actOkApp'
      OnExecute = actOkAppExecute
    end
    object actCancelApp: TAction
      Tag = 2712
      Category = 'Ok-Cancel'
      Caption = 'actCancelApp'
      OnExecute = actCancelAppExecute
    end
  end
  inherited dtsMaster: TDataSource
    DataSet = DmSys.cdsCardTypes
  end
end
