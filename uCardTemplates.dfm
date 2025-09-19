inherited FrmCardTemplates: TFrmCardTemplates
  Tag = 18
  Left = 243
  Top = 110
  Width = 771
  Height = 472
  Caption = 'Templates do Cart'#227'o'
  Constraints.MinHeight = 472
  Constraints.MinWidth = 756
  PixelsPerInch = 96
  TextHeight = 13
  inherited cbBase: TCoolBar
    Width = 763
    Bands = <
      item
        Control = tbBase
        ImageIndex = -1
        MinHeight = 24
        Width = 759
      end>
    inherited tbBase: TToolBar
      Width = 746
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
    Width = 763
    Height = 393
    inherited tsBaseCadastroFiltro: TTabSheet
      inherited Splitter_Base1: TSplitter
        Top = 89
        Width = 755
        Color = clBlack
        ParentColor = False
      end
      inherited gbGrid: TGroupBox
        Top = 93
        Width = 755
        Height = 272
        inherited grdResultado: TDBGrid
          Width = 751
          Height = 255
          DataSource = dtsMaster
          OnTitleClick = grdResultadoTitleClick
          Columns = <
            item
              Expanded = False
              FieldName = 'CTE_DESC'
              Title.Caption = 'Descri'#231#227'o'
              Title.Color = clYellow
              Width = 190
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'UT_DESC'
              Title.Caption = 'Tipo de Usu'#225'rio'
              Width = 180
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
              FieldName = 'CTE_REGDATE'
              Title.Caption = 'Registro'
              Width = 120
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'CTE_REGUSER'
              Title.Caption = 'Usu'#225'rio'
              Width = 120
              Visible = True
            end>
        end
      end
      inherited pnFiltro: TPanel
        Width = 755
        Height = 89
        inherited pnPesq: TPanel
          Width = 755
          Height = 89
          inherited gbFiltroAvansado: TGroupBox
            Width = 751
            Height = 85
            inherited pnVoltar: TPanel
              Top = 70
              Width = 747
              inherited lblBack: TLabel
                Left = 720
              end
            end
          end
          inherited gbFiltro: TGroupBox
            Width = 751
            Height = 85
            object Label7: TLabel [0]
              Tag = 1786
              Left = 13
              Top = 28
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
            object lStatus: TLabel [1]
              Tag = 1788
              Left = 362
              Top = 28
              Width = 41
              Height = 13
              Caption = 'Status:'
              FocusControl = lkFilterStatus
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'MS Sans Serif'
              Font.Style = [fsBold]
              ParentFont = False
            end
            object btnLimpaStatus: TSpeedButton [2]
              Left = 475
              Top = 42
              Width = 21
              Height = 21
              Glyph.Data = {
                76010000424D7601000000000000760000002800000020000000100000000100
                04000000000000010000120B0000120B00001000000000000000000000000000
                800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
                FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00555555555555
                55555FFFFFFF5F55FFF5777777757559995777777775755777F7555555555550
                305555555555FF57F7F555555550055BB0555555555775F777F55555550FB000
                005555555575577777F5555550FB0BF0F05555555755755757F555550FBFBF0F
                B05555557F55557557F555550BFBF0FB005555557F55575577F555500FBFBFB0
                B05555577F555557F7F5550E0BFBFB00B055557575F55577F7F550EEE0BFB0B0
                B05557FF575F5757F7F5000EEE0BFBF0B055777FF575FFF7F7F50000EEE00000
                B0557777FF577777F7F500000E055550805577777F7555575755500000555555
                05555777775555557F5555000555555505555577755555557555}
              NumGlyphs = 2
              OnClick = btnLimpaStatusClick
            end
            inherited pnPesquiza: TPanel
              Top = 70
              Width = 747
              inherited lblAdvancedSearch: TLabel
                Width = 747
                Visible = False
              end
            end
            object edDesc: TEdit
              Left = 13
              Top = 43
              Width = 300
              Height = 21
              CharCase = ecUpperCase
              MaxLength = 50
              TabOrder = 1
              OnEnter = Entra
              OnExit = Sai
            end
            object lkFilterStatus: TComboBox
              Left = 362
              Top = 43
              Width = 113
              Height = 21
              Style = csDropDownList
              ItemHeight = 13
              ItemIndex = 0
              TabOrder = 2
              Text = 'Ativo'
              OnEnter = Entra
              OnExit = Sai
              Items.Strings = (
                'Ativo'
                'Inativo')
            end
          end
        end
      end
    end
    inherited tsBaseCadastroConsulta: TTabSheet
      object gbTemplates: TGroupBox
        Left = 0
        Top = 0
        Width = 755
        Height = 129
        Align = alTop
        TabOrder = 0
        object lbDesc: TLabel
          Left = 20
          Top = 23
          Width = 48
          Height = 13
          Caption = 'Descri'#231#227'o'
          FocusControl = dbDesc
        end
        object Label2: TLabel
          Left = 358
          Top = 23
          Width = 75
          Height = 13
          Caption = 'Tipo de Usu'#225'rio'
          FocusControl = dbUt_Id
        end
        object lblStatusCardUsers: TLabel
          Tag = 1795
          Left = 358
          Top = 72
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
        object Label11: TLabel
          Left = 20
          Top = 71
          Width = 70
          Height = 13
          Caption = 'Tipo de Cart'#227'o'
        end
        object dbDesc: TDBEdit
          Left = 20
          Top = 40
          Width = 312
          Height = 21
          CharCase = ecUpperCase
          DataField = 'CTE_DESC'
          DataSource = dtsMaster
          TabOrder = 0
        end
        object dbUt_Id: TRxDBLookupCombo
          Left = 358
          Top = 40
          Width = 241
          Height = 20
          DropDownCount = 8
          DataField = 'UT_ID'
          DataSource = dtsMaster
          LookupField = 'UT_ID'
          LookupDisplay = 'UT_DESC'
          LookupSource = DmSys.dtsUserTypes
          TabOrder = 1
        end
        object dbCardUsersStatus: TRxDBComboBox
          Left = 358
          Top = 87
          Width = 143
          Height = 21
          Style = csDropDownList
          DataField = 'CTE_STATUS'
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
        object dbCty_ID: TRxDBLookupCombo
          Left = 20
          Top = 88
          Width = 241
          Height = 20
          DropDownCount = 8
          DataField = 'CTY_ID'
          DataSource = dtsMaster
          LookupField = 'CTY_ID'
          LookupDisplay = 'CTY_DESC'
          LookupSource = DmSys.dtsCardTypes
          TabOrder = 2
        end
      end
      object pcSubApplications: TPageControl
        Tag = 2719
        Left = 27
        Top = 129
        Width = 728
        Height = 236
        ActivePage = TabSheet1
        Align = alClient
        TabOrder = 1
        object TabSheet1: TTabSheet
          Caption = 'Aplica'#231#245'es'
          object Label19: TLabel
            Tag = 1796
            Left = 4
            Top = 8
            Width = 47
            Height = 13
            Caption = 'Aplica'#231#227'o'
            FocusControl = dbLkApplications
          end
          object btDisplayCancel: TSpeedButton
            Left = 603
            Top = 174
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
            Left = 496
            Top = 174
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
            Left = 567
            Top = 8
            Width = 76
            Height = 13
            Caption = 'Tipo de per'#237'odo'
            FocusControl = rdbPerioduseTypes
          end
          object Label3: TLabel
            Left = 304
            Top = 8
            Width = 76
            Height = 13
            Caption = 'Grupo de tempo'
            FocusControl = rdbTimeGroups
          end
          object Label4: TLabel
            Left = 4
            Top = 113
            Width = 94
            Height = 13
            Caption = 'Periodo de validade'
            FocusControl = rdbValidationPeriods
          end
          object Label5: TLabel
            Left = 4
            Top = 55
            Width = 74
            Height = 13
            Caption = 'Grupo de linhas'
            FocusControl = rdbLineGroups
          end
          object Label6: TLabel
            Left = 240
            Top = 54
            Width = 26
            Height = 13
            Caption = 'Linha'
            FocusControl = rdbLinha
          end
          object Label9: TLabel
            Left = 504
            Top = 53
            Width = 60
            Height = 13
            Caption = 'Tipo de data'
            FocusControl = rdbDateStatus
          end
          object Label12: TLabel
            Left = 456
            Top = 8
            Width = 92
            Height = 13
            Caption = 'Lim. de Uso p/ Per.'
          end
          object dbLkApplications: TRxDBLookupCombo
            Left = 4
            Top = 24
            Width = 289
            Height = 21
            DropDownCount = 8
            DisplayAllFields = True
            LookupField = 'APP_ISS_ID'
            LookupDisplay = 'APP_ID; APP_DESCSHORT; ISS_DESCLONG'
            LookupDisplayIndex = 1
            LookupSource = DmSys.dtsApplicationsLook
            TabOrder = 1
          end
          object rdbPerioduseTypes: TRxDBLookupCombo
            Left = 567
            Top = 24
            Width = 129
            Height = 21
            DropDownCount = 8
            DataField = 'PUT_ID'
            DataSource = DmSys.dtsCardTemplatesXApp
            LookupField = 'PUT_ID'
            LookupDisplay = 'PUT_DESC'
            LookupSource = dmSys1.dtsPeriodUseTypesLk
            TabOrder = 3
          end
          object rdbLineGroups: TRxDBLookupCombo
            Left = 4
            Top = 71
            Width = 217
            Height = 21
            DropDownCount = 8
            DataField = 'LG_ID'
            DataSource = DmSys.dtsCardTemplatesXApp
            LookupField = 'LG_ID'
            LookupDisplay = 'LG_DESC'
            LookupSource = DmSys.dtsLineGroups
            TabOrder = 4
          end
          object rdbTimeGroups: TRxDBLookupCombo
            Left = 304
            Top = 24
            Width = 141
            Height = 21
            DropDownCount = 8
            DataField = 'TG_ID'
            DataSource = DmSys.dtsCardTemplatesXApp
            LookupField = 'TG_ID'
            LookupDisplay = 'TG_DESC'
            LookupSource = DmSys.dtsTimeGroups
            TabOrder = 2
          end
          object rdbValidationPeriods: TRxDBLookupCombo
            Left = 4
            Top = 129
            Width = 214
            Height = 21
            DropDownCount = 8
            DataField = 'VP_ID'
            DataSource = DmSys.dtsCardTemplatesXApp
            LookupField = 'VP_ID'
            LookupDisplay = 'VP_DESC'
            LookupSource = dmSys1.dtsValidationPeriods
            TabOrder = 7
          end
          object rdbLinha: TRxDBLookupCombo
            Left = 240
            Top = 70
            Width = 257
            Height = 21
            DropDownCount = 8
            DataField = 'LM_ID'
            DataSource = DmSys.dtsCardTemplatesXApp
            LookupField = 'LM_ID'
            LookupDisplay = 'LM_DESC'
            LookupSource = DmSys.dtsLineMT
            TabOrder = 5
          end
          object rdbDateStatus: TRxDBLookupCombo
            Left = 504
            Top = 69
            Width = 193
            Height = 21
            DropDownCount = 8
            DataField = 'DS_ID'
            DataSource = DmSys.dtsCardTemplatesXApp
            LookupField = 'DS_ID'
            LookupDisplay = 'DS_DESC'
            LookupSource = dmSys1.dtsDateStatus
            TabOrder = 6
            OnChange = rdbDateStatusChange
          end
          object gbAuto: TGroupBox
            Left = 240
            Top = 96
            Width = 457
            Height = 61
            Caption = 'C'#225'lculo Autom'#225'tico de Validade'
            TabOrder = 8
            object Label8: TLabel
              Left = 200
              Top = 16
              Width = 79
              Height = 13
              Caption = 'Tipo de validade'
              FocusControl = rdbValidityTypes
            end
            object Label10: TLabel
              Left = 12
              Top = 16
              Width = 152
              Height = 13
              Caption = 'Quantidade de Per'#237'odo Vari'#225'vel'
              FocusControl = dbQtde
            end
            object rdbValidityTypes: TRxDBLookupCombo
              Left = 200
              Top = 32
              Width = 245
              Height = 21
              DropDownCount = 8
              DataField = 'VT_ID'
              DataSource = DmSys.dtsCardTemplatesXApp
              LookupField = 'VT_ID'
              LookupDisplay = 'VT_DESC'
              LookupSource = dmSys1.dtsValidityTypes
              TabOrder = 1
            end
            object dbQtde: TDBEdit
              Left = 12
              Top = 32
              Width = 177
              Height = 21
              DataField = 'CTA_VALDATEQTY'
              DataSource = DmSys.dtsCardTemplatesXApp
              TabOrder = 0
            end
          end
          object dbePeriodUseLimit: TDBEdit
            Left = 456
            Top = 24
            Width = 97
            Height = 21
            DataField = 'CTA_PERUSELIMIT'
            DataSource = DmSys.dtsCardTemplatesXApp
            MaxLength = 3
            TabOrder = 9
          end
          object dbgAplicacoes: TDBGrid
            Left = 0
            Top = 0
            Width = 720
            Height = 208
            Align = alClient
            DataSource = DmSys.dtsCardTemplatesXApp
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
                FieldName = 'TG_DESC'
                Title.Caption = 'Grupo de Tempo'
                Width = 150
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'PUT_DESC'
                Title.Caption = 'Tipo de per'#237'odo'
                Width = 100
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'LG_DESC'
                Title.Caption = 'Grupo de Linhas'
                Width = 150
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'LM_DESC'
                Title.Caption = 'Linha'
                Width = 150
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'DS_DESC'
                Title.Caption = 'Tipo de data'
                Width = 150
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'VP_DESC'
                Title.Caption = 'Per'#237'odo de validade'
                Width = 150
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'VT_DESC'
                Title.Caption = 'Tipo de validade'
                Width = 150
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'CTA_VALDATEQTY'
                Title.Caption = 'Quantidade'
                Width = 80
                Visible = True
              end>
          end
        end
      end
      object cbCardApps: TCoolBar
        Left = 0
        Top = 129
        Width = 27
        Height = 236
        Align = alLeft
        AutoSize = True
        Bands = <
          item
            Control = tbCardsApps
            ImageIndex = -1
            MinHeight = 23
            Width = 232
          end>
        Vertical = True
        object tbCardsApps: TToolBar
          Left = 0
          Top = 9
          Width = 23
          Height = 223
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
    object actNewApp: TAction
      Tag = 2720
      Category = 'Applications'
      Caption = 'actNewApp'
      ImageIndex = 16
      OnExecute = actNewAppExecute
    end
    object actEditApp: TAction
      Tag = 2721
      Category = 'Applications'
      Caption = 'actEditApp'
      ImageIndex = 10
      OnExecute = actEditAppExecute
    end
    object actDeleteApp: TAction
      Tag = 2722
      Category = 'Applications'
      Caption = 'actDeleteApp'
      ImageIndex = 9
      OnExecute = actDeleteAppExecute
    end
    object actOkApp: TAction
      Tag = 2723
      Category = 'Ok-Cancel'
      Caption = 'actOkApp'
      OnExecute = actOkAppExecute
    end
    object actCancelApp: TAction
      Tag = 2724
      Category = 'Ok-Cancel'
      Caption = 'actCancelApp'
      OnExecute = actCancelAppExecute
    end
  end
end
