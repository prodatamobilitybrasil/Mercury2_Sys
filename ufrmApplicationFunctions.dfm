inherited frmApplicationFunction: TfrmApplicationFunction
  Tag = 131
  Left = 486
  Top = 258
  Caption = 'Fun'#231#245'es da Aplica'#231#227'o'
  PixelsPerInch = 96
  TextHeight = 13
  inherited cbBase: TCoolBar
    inherited tbBase: TToolBar
      inherited tbtnNew2: TToolButton
        Visible = False
      end
    end
  end
  inherited pcBaseCadastro: TPageControl
    ActivePage = tsBaseCadastroConsulta
    OnChange = pcBaseCadastroChange
    inherited tsBaseCadastroFiltro: TTabSheet
      inherited gbGrid: TGroupBox
        inherited grdResultado: TDBGrid
          DataSource = dtsMaster
          Columns = <
            item
              Expanded = False
              FieldName = 'AF_DESC'
              Title.Caption = 'Descri'#231#227'o'
              Width = 443
              Visible = True
            end>
        end
      end
      inherited pnFiltro: TPanel
        inherited pnPesq: TPanel
          inherited gbFiltro: TGroupBox
            object Label1: TLabel [0]
              Tag = 3008
              Left = 12
              Top = 16
              Width = 48
              Height = 13
              Caption = 'Descri'#231#227'o'
              FocusControl = edDesc
            end
            inherited pnPesquiza: TPanel
              Top = 107
              Height = 15
              inherited lblAdvancedSearch: TLabel
                Top = 2
              end
            end
            object edDesc: TEdit
              Left = 12
              Top = 32
              Width = 360
              Height = 21
              CharCase = ecUpperCase
              MaxLength = 50
              TabOrder = 1
            end
          end
        end
      end
    end
    inherited tsBaseCadastroConsulta: TTabSheet
      object GroupBox1: TGroupBox
        Left = 0
        Top = 0
        Width = 660
        Height = 73
        Align = alTop
        TabOrder = 0
        object Label2: TLabel
          Tag = 3008
          Left = 14
          Top = 18
          Width = 48
          Height = 13
          Caption = 'Descri'#231#227'o'
          FocusControl = dbDesc
        end
        object dbDesc: TDBEdit
          Left = 14
          Top = 34
          Width = 360
          Height = 21
          CharCase = ecUpperCase
          DataField = 'AF_DESC'
          DataSource = dtsMaster
          MaxLength = 50
          ReadOnly = True
          TabOrder = 0
        end
      end
      object pcDetail: TPageControl
        Left = 27
        Top = 73
        Width = 633
        Height = 218
        ActivePage = TabSheet1
        Align = alClient
        TabOrder = 1
        object TabSheet1: TTabSheet
          Tag = 3263
          Caption = 'Vers'#245'es'
          object Label15: TLabel
            Tag = 3263
            Left = 16
            Top = 12
            Width = 33
            Height = 13
            Caption = 'Vers'#227'o'
          end
          object Label33: TLabel
            Tag = 3262
            Left = 104
            Top = 12
            Width = 41
            Height = 13
            Caption = 'Validade'
          end
          object Label45: TLabel
            Tag = 3266
            Left = 252
            Top = 12
            Width = 30
            Height = 13
            Caption = 'Status'
          end
          object btnOkVersion: TSpeedButton
            Left = 435
            Top = 61
            Width = 98
            Height = 32
            Action = actNewVersionOk
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
          object SpeedButton12: TSpeedButton
            Left = 435
            Top = 99
            Width = 98
            Height = 32
            Action = actCancelBtn
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
          object dbedtVersionValidity: TDBDateEdit
            Left = 104
            Top = 28
            Width = 121
            Height = 21
            DataField = 'AFV_VALIDITY'
            DataSource = DmSys.dstApplicationFunctionVersions
            NumGlyphs = 2
            TabOrder = 1
          end
          object dbedtVersionStatus: TRxDBComboBox
            Left = 253
            Top = 28
            Width = 105
            Height = 21
            Style = csDropDownList
            DataField = 'AFV_STATUS'
            DataSource = DmSys.dstApplicationFunctionVersions
            EnableValues = True
            ItemHeight = 13
            Items.Strings = (
              'Ativo'
              'Inativo')
            TabOrder = 2
            Values.Strings = (
              'A'
              'I')
          end
          object DBEdit1: TDBEdit
            Left = 18
            Top = 26
            Width = 53
            Height = 21
            CharCase = ecUpperCase
            DataField = 'AFV_VERSIONNBR'
            DataSource = DmSys.dstApplicationFunctionVersions
            MaxLength = 50
            ReadOnly = True
            TabOrder = 3
          end
          object grdObjects: TDBGrid
            Left = 0
            Top = 0
            Width = 633
            Height = 202
            DataSource = DmSys.dstApplicationFunctionVersions
            Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgConfirmDelete, dgCancelOnExit]
            TabOrder = 0
            TitleFont.Charset = DEFAULT_CHARSET
            TitleFont.Color = clWindowText
            TitleFont.Height = -11
            TitleFont.Name = 'MS Sans Serif'
            TitleFont.Style = []
            Columns = <
              item
                Expanded = False
                FieldName = 'AFV_VERSIONNBR'
                Title.Caption = 'Vers'#227'o N'#250'mero'
                Width = 129
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'AFV_VALIDITY'
                Title.Caption = 'Validade'
                Width = 131
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'AFV_STATUS'
                Title.Caption = 'Status'
                Visible = True
              end>
          end
        end
      end
      object cbDetail: TCoolBar
        Left = 0
        Top = 73
        Width = 27
        Height = 218
        Align = alLeft
        AutoSize = True
        Bands = <
          item
            Control = tbDetail
            ImageIndex = -1
            MinHeight = 23
            Width = 214
          end>
        Vertical = True
        object tbDetail: TToolBar
          Left = 0
          Top = 9
          Width = 23
          Height = 205
          Align = alClient
          ButtonHeight = 26
          Images = imglstBase
          TabOrder = 0
          object tbtnEditDetail: TToolButton
            Left = 0
            Top = 2
            Action = actNewDetail
            ParentShowHint = False
            Wrap = True
            ShowHint = True
          end
          object tbtnNewDetail: TToolButton
            Left = 0
            Top = 28
            Action = actEditDetail
            ParentShowHint = False
            Wrap = True
            ShowHint = True
          end
          object ToolButton1: TToolButton
            Left = 0
            Top = 54
            Action = actDeletDetail
          end
        end
      end
    end
  end
  inherited actlstBase: TActionList
    Left = 554
    inherited actFilter: TAction
      OnExecute = actFilterExecute
    end
    inherited actInsert: TAction
      Enabled = False
    end
    inherited actDelete: TAction
      Enabled = False
    end
    object actNewDetail: TAction
      Category = 'Detail'
      Caption = 'Novo'
      Hint = 'Novo'
      ImageIndex = 16
      OnExecute = actNewDetailExecute
    end
    object actEditDetail: TAction
      Category = 'Detail'
      Caption = 'Editar'
      Hint = 'Editar'
      ImageIndex = 10
      OnExecute = actEditDetailExecute
    end
    object actDeletDetail: TAction
      Category = 'Detail'
      Caption = 'Deletar'
      Hint = 'Desativar'
      ImageIndex = 14
      OnExecute = actDeletDetailExecute
    end
    object actNewVersionOk: TAction
      Category = 'Buttons'
      Caption = 'Ok'
      Hint = 'Gravar'
      ImageIndex = 4
      OnExecute = actNewVersionOkExecute
    end
    object actCancelBtn: TAction
      Category = 'Buttons'
      Caption = 'Cancelar'
      ImageIndex = 6
      OnExecute = actCancelBtnExecute
    end
  end
end
