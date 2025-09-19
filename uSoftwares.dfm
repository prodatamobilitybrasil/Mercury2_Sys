inherited FrmSoftwares: TFrmSoftwares
  Tag = 53
  Left = 240
  Width = 695
  Height = 421
  Caption = 'Softwares'
  KeyPreview = False
  PixelsPerInch = 96
  TextHeight = 13
  inherited cbBase: TCoolBar
    Width = 687
    Bands = <
      item
        Control = tbBase
        ImageIndex = -1
        MinHeight = 24
        Width = 683
      end>
    inherited tbBase: TToolBar
      Width = 670
    end
  end
  inherited pcBaseCadastro: TPageControl
    Width = 687
    Height = 342
    ActivePage = tsBaseCadastroConsulta
    inherited tsBaseCadastroFiltro: TTabSheet
      inherited Splitter_Base1: TSplitter
        Top = 118
        Width = 679
      end
      inherited gbGrid: TGroupBox
        Top = 122
        Width = 679
        Height = 192
        inherited grdResultado: TDBGrid
          Width = 675
          Height = 175
          DataSource = dtsMaster
          Columns = <
            item
              Expanded = False
              FieldName = 'SF_COD'
              Title.Caption = 'Sigla'
              Width = 133
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'SF_DESC'
              Title.Caption = 'Descri'#231#227'o'
              Width = 368
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'SFT_DESC'
              Title.Caption = 'Tipo'
              Width = 70
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'SF_PATH'
              Title.Caption = 'Local'
              Width = 261
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'STATUS_ID'
              Title.Caption = 'Status'
              Width = 61
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'SF_REGDATE'
              Title.Caption = 'Registro'
              Width = 86
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'SF_REGUSER'
              Title.Caption = 'Usu'#225'rio'
              Width = 189
              Visible = True
            end>
        end
      end
      inherited pnFiltro: TPanel
        Width = 679
        Height = 118
        inherited pnPesq: TPanel
          Width = 679
          Height = 118
          inherited gbFiltroAvansado: TGroupBox
            Width = 675
            Height = 114
            inherited pnVoltar: TPanel
              Top = 99
              Width = 671
              inherited lblBack: TLabel
                Left = 644
              end
            end
          end
          inherited gbFiltro: TGroupBox
            Width = 675
            Height = 114
            object Sigla: TLabel [0]
              Tag = 2400
              Left = 12
              Top = 16
              Width = 23
              Height = 13
              Caption = 'Sigla'
              FocusControl = edCod
            end
            object Label5: TLabel [1]
              Tag = 2401
              Left = 12
              Top = 64
              Width = 48
              Height = 13
              Caption = 'Descri'#231#227'o'
              FocusControl = edDesc
            end
            inherited pnPesquiza: TPanel
              Top = 99
              Width = 671
              inherited lblAdvancedSearch: TLabel
                Width = 671
              end
            end
            object edCod: TEdit
              Left = 12
              Top = 32
              Width = 120
              Height = 21
              CharCase = ecUpperCase
              TabOrder = 1
            end
            object edDesc: TEdit
              Left = 12
              Top = 80
              Width = 494
              Height = 21
              CharCase = ecUpperCase
              TabOrder = 2
            end
          end
        end
      end
    end
    inherited tsBaseCadastroConsulta: TTabSheet
      object gbSoftware: TGroupBox
        Left = 0
        Top = 0
        Width = 679
        Height = 109
        Align = alTop
        TabOrder = 0
        object Label1: TLabel
          Left = 12
          Top = 12
          Width = 23
          Height = 13
          Caption = 'Sigla'
          FocusControl = dbCod
        end
        object Label2: TLabel
          Left = 140
          Top = 12
          Width = 48
          Height = 13
          Caption = 'Descri'#231#227'o'
          FocusControl = dbDesc
        end
        object Label3: TLabel
          Left = 536
          Top = 12
          Width = 21
          Height = 13
          Caption = 'Tipo'
          FocusControl = dbTipo
        end
        object Label4: TLabel
          Left = 12
          Top = 56
          Width = 26
          Height = 13
          Caption = 'Local'
          FocusControl = dbPath
        end
        object btnOpenFile: TSpeedButton
          Left = 634
          Top = 72
          Width = 21
          Height = 21
          Caption = '...'
          OnClick = actOpenFileExecute
        end
        object dbCod: TDBEdit
          Left = 12
          Top = 28
          Width = 120
          Height = 21
          CharCase = ecUpperCase
          DataField = 'SF_COD'
          DataSource = dtsMaster
          TabOrder = 0
        end
        object dbDesc: TDBEdit
          Left = 140
          Top = 28
          Width = 389
          Height = 21
          CharCase = ecUpperCase
          DataField = 'SF_DESC'
          DataSource = dtsMaster
          MaxLength = 60
          TabOrder = 1
        end
        object dbTipo: TRxDBLookupCombo
          Left = 536
          Top = 28
          Width = 121
          Height = 21
          DropDownCount = 8
          DataField = 'SFT_ID'
          DataSource = dtsMaster
          LookupField = 'SFT_ID'
          LookupDisplay = 'SFT_DESC'
          LookupSource = dmSys1.dtsSoftwareTypes
          TabOrder = 2
        end
        object dbPath: TDBEdit
          Left = 12
          Top = 72
          Width = 622
          Height = 21
          CharCase = ecUpperCase
          DataField = 'SF_PATH'
          DataSource = dtsMaster
          MaxLength = 255
          TabOrder = 3
        end
      end
      object pgcVersions: TPageControl
        Left = 27
        Top = 109
        Width = 652
        Height = 205
        ActivePage = TabSheet1
        Align = alClient
        TabOrder = 1
        object TabSheet1: TTabSheet
          Tag = 2682
          Caption = 'Vers'#245'es'
          object btDisplayOK: TSpeedButton
            Left = 459
            Top = 99
            Width = 78
            Height = 26
            Action = actOkVersion
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
            Left = 546
            Top = 99
            Width = 78
            Height = 26
            Action = actCancelVersion
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
          object Label8: TLabel
            Left = 12
            Top = 12
            Width = 33
            Height = 13
            Caption = 'Vers'#227'o'
            FocusControl = dbMajorVersion
          end
          object Label9: TLabel
            Left = 116
            Top = 52
            Width = 36
            Height = 13
            Caption = 'Arquivo'
            FocusControl = dbVersionPath
          end
          object SpeedButton1: TSpeedButton
            Left = 604
            Top = 68
            Width = 21
            Height = 21
            Action = actOpenFile
          end
          object Label10: TLabel
            Left = 192
            Top = 12
            Width = 48
            Height = 13
            Caption = 'Descri'#231#227'o'
            FocusControl = dbVersionDesc
          end
          object Label11: TLabel
            Left = 528
            Top = 12
            Width = 27
            Height = 13
            Caption = 'In'#237'cio'
            FocusControl = dbVersionStartdate
          end
          object Label12: TLabel
            Left = 12
            Top = 52
            Width = 16
            Height = 13
            Caption = 'Fim'
            FocusControl = dbVersionEndDate
          end
          object dbBuild: TDBEdit
            Left = 144
            Top = 28
            Width = 42
            Height = 21
            CharCase = ecUpperCase
            DataField = 'SFV_BUILD'
            DataSource = dmSys1.dtsSoftwareVersions
            MaxLength = 2
            TabOrder = 4
          end
          object dbRelease: TDBEdit
            Left = 100
            Top = 28
            Width = 42
            Height = 21
            CharCase = ecUpperCase
            DataField = 'SFV_RELEASE'
            DataSource = dmSys1.dtsSoftwareVersions
            MaxLength = 2
            TabOrder = 3
          end
          object dbMinorVersion: TDBEdit
            Left = 56
            Top = 28
            Width = 42
            Height = 21
            CharCase = ecUpperCase
            DataField = 'SFV_MINORVERSION'
            DataSource = dmSys1.dtsSoftwareVersions
            MaxLength = 2
            TabOrder = 2
          end
          object dbMajorVersion: TDBEdit
            Left = 12
            Top = 28
            Width = 42
            Height = 21
            CharCase = ecUpperCase
            DataField = 'SFV_MAJORVERSION'
            DataSource = dmSys1.dtsSoftwareVersions
            MaxLength = 2
            TabOrder = 1
          end
          object dbVersionDesc: TDBEdit
            Left = 192
            Top = 28
            Width = 329
            Height = 21
            CharCase = ecUpperCase
            DataField = 'SFV_DESC'
            DataSource = dmSys1.dtsSoftwareVersions
            MaxLength = 60
            TabOrder = 5
          end
          object dbVersionEndDate: TDBDateEdit
            Left = 11
            Top = 68
            Width = 95
            Height = 21
            DataField = 'SFV_ENDDATE'
            DataSource = dmSys1.dtsSoftwareVersions
            NumGlyphs = 2
            TabOrder = 7
          end
          object dbVersionStartdate: TDBDateEdit
            Left = 528
            Top = 28
            Width = 97
            Height = 21
            DataField = 'SFV_STARTDATE'
            DataSource = dmSys1.dtsSoftwareVersions
            NumGlyphs = 2
            TabOrder = 6
          end
          object dbVersionPath: TDBEdit
            Left = 112
            Top = 68
            Width = 493
            Height = 21
            CharCase = ecUpperCase
            DataField = 'SFV_PATH'
            DataSource = dmSys1.dtsSoftwareVersions
            MaxLength = 255
            TabOrder = 8
          end
          object dbgVersions: TDBGrid
            Left = 0
            Top = 120
            Width = 644
            Height = 177
            DataSource = dmSys1.dtsSoftwareVersions
            ReadOnly = True
            TabOrder = 0
            TitleFont.Charset = DEFAULT_CHARSET
            TitleFont.Color = clWindowText
            TitleFont.Height = -11
            TitleFont.Name = 'MS Sans Serif'
            TitleFont.Style = []
            Columns = <
              item
                Expanded = False
                FieldName = 'VERSION_NUMBER'
                Title.Caption = 'Vers'#227'o'
                Width = 88
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'SFV_DESC'
                Title.Caption = 'Descri'#231#227'o'
                Width = 276
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'SFV_STARTDATE'
                Title.Caption = 'In'#237'cio'
                Width = 89
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'SFV_ENDDATE'
                Title.Caption = 'Fim'
                Width = 80
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'STATUS_ID'
                Title.Caption = 'Status'
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'SFV_PATH'
                Title.Caption = 'Arquivo'
                Width = 377
                Visible = True
              end>
          end
        end
      end
      object cbDetails: TCoolBar
        Left = 0
        Top = 109
        Width = 27
        Height = 205
        Align = alLeft
        AutoSize = True
        Bands = <
          item
            Control = tbDetails
            ImageIndex = -1
            MinHeight = 23
            Width = 201
          end>
        Vertical = True
        object tbDetails: TToolBar
          Left = 0
          Top = 9
          Width = 23
          Height = 192
          Align = alClient
          Caption = 'tbDetails'
          Images = imglstBase
          TabOrder = 0
          object tbtnNewVersion: TToolButton
            Left = 0
            Top = 2
            Action = actNewVersion
            ParentShowHint = False
            Wrap = True
            ShowHint = True
          end
          object tbtnEditVersion: TToolButton
            Left = 0
            Top = 24
            Action = actEditVersion
            ParentShowHint = False
            Wrap = True
            ShowHint = True
          end
          object tbtnDeleteVersion: TToolButton
            Left = 0
            Top = 46
            Action = actDeleteVersion
            ParentShowHint = False
            ShowHint = True
          end
        end
      end
    end
  end
  inherited actlstBase: TActionList
    inherited actFilter: TAction
      OnExecute = actFilterExecute
    end
    object actNewVersion: TAction
      Tag = 2764
      Category = 'Versions'
      Caption = 'actNewVersion'
      ImageIndex = 16
      OnExecute = actNewVersionExecute
    end
    object actEditVersion: TAction
      Tag = 2765
      Category = 'Versions'
      Caption = 'actEditVersion'
      ImageIndex = 10
      OnExecute = actEditVersionExecute
    end
    object actDeleteVersion: TAction
      Tag = 2766
      Category = 'Versions'
      Caption = 'actDeleteVersion'
      ImageIndex = 9
      OnExecute = actDeleteVersionExecute
    end
    object actOpenFile: TAction
      Tag = 2767
      Category = 'Ok-Cancel'
      Caption = 'actOpenFile'
      OnExecute = actOpenFileExecute
    end
    object actOkVersion: TAction
      Tag = 2768
      Category = 'Ok-Cancel'
      Caption = 'actOkVersion'
      OnExecute = actOkVersionExecute
    end
    object actCancelVersion: TAction
      Tag = 2769
      Category = 'Ok-Cancel'
      Caption = 'actCancelVersion'
      OnExecute = actCancelVersionExecute
    end
  end
  inherited mMnuBase: TMainMenu
    inherited mnuNavigator: TMenuItem
      OnClick = actProximoExecute
    end
  end
  object dlgOpenFile: TOpenDialog
    Left = 621
    Top = 8
  end
end
