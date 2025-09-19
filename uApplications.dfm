inherited FrmApplications: TFrmApplications
  Tag = 16
  Left = 241
  Top = 110
  Width = 1179
  Height = 591
  Caption = 'Aplica'#231#245'es'
  Constraints.MinHeight = 564
  Constraints.MinWidth = 798
  PixelsPerInch = 96
  TextHeight = 13
  inherited cbBase: TCoolBar
    Width = 1171
    Bands = <
      item
        Control = tbBase
        ImageIndex = -1
        MinHeight = 24
        Width = 1167
      end>
    inherited tbBase: TToolBar
      Width = 1154
      object lbFiltrado: TLabel
        Left = 354
        Top = 2
        Width = 111
        Height = 22
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
    Width = 1171
    Height = 512
    inherited tsBaseCadastroFiltro: TTabSheet
      inherited Splitter_Base1: TSplitter
        Top = 81
        Width = 1163
        Color = clBlack
        ParentColor = False
      end
      inherited gbGrid: TGroupBox
        Top = 85
        Width = 1163
        Height = 399
        inherited grdResultado: TDBGrid
          Width = 1159
          Height = 382
          DataSource = dtsMaster
          Options = [dgTitles, dgIndicator, dgColLines, dgRowLines, dgRowSelect, dgConfirmDelete]
          OnTitleClick = grdResultadoTitleClick
          Columns = <
            item
              Alignment = taCenter
              Color = clAqua
              Expanded = False
              FieldName = 'App_Id'
              Title.Alignment = taCenter
              Title.Caption = 'Aplica'#231#227'o'
              Title.Color = clYellow
              Width = 80
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'ISS_DESCLONG'
              Title.Caption = 'Emissor'
              Width = 120
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'App_Descshort'
              Title.Caption = 'Descri'#231#227'o curta'
              Width = 120
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'App_Desclong'
              Title.Caption = 'Descri'#231#227'o longa'
              Width = 200
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'SF_DESC'
              Title.Caption = 'Contador Estat'#237'stico'
              Width = 120
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'MA_DESC'
              Title.Caption = 'Aplica'#231#227'o Master'
              Width = 100
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'AF_DESC'
              Title.Caption = 'Fun'#231#227'o da Aplica'#231#227'o'
              Width = 129
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'VDM_DESC'
              Title.Caption = 'Display do Validador'
              Width = 117
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'KT_DESC'
              Title.Caption = 'Tipo de Chave'
              Width = 120
              Visible = True
            end>
        end
      end
      inherited pnFiltro: TPanel
        Width = 1163
        Height = 81
        inherited pnPesq: TPanel
          Width = 1163
          Height = 81
          inherited gbFiltroAvansado: TGroupBox
            Width = 1159
            Height = 77
            inherited pnVoltar: TPanel
              Top = 62
              Width = 1155
              inherited lblBack: TLabel
                Left = 1128
              end
            end
          end
          inherited gbFiltro: TGroupBox
            Width = 1159
            Height = 77
            object Label25: TLabel [0]
              Tag = 1671
              Left = 12
              Top = 16
              Width = 48
              Height = 13
              Caption = 'Emissor:'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'MS Sans Serif'
              Font.Style = [fsBold]
              ParentFont = False
            end
            object Label26: TLabel [1]
              Tag = 1670
              Left = 300
              Top = 16
              Width = 68
              Height = 13
              Caption = 'Applica'#231#227'o:'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'MS Sans Serif'
              Font.Style = [fsBold]
              ParentFont = False
            end
            object Label27: TLabel [2]
              Tag = 1682
              Left = 488
              Top = 16
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
            object btnLimpaStatus: TSpeedButton [3]
              Left = 607
              Top = 31
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
            object SpeedButton22: TSpeedButton [4]
              Left = 237
              Top = 31
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
              OnClick = SpeedButton22Click
            end
            inherited pnPesquiza: TPanel
              Top = 62
              Width = 1155
              TabOrder = 3
              inherited lblAdvancedSearch: TLabel
                Width = 1155
                Visible = False
              end
            end
            object eApp: TEdit
              Left = 300
              Top = 32
              Width = 153
              Height = 21
              TabOrder = 1
              OnEnter = Entra
              OnExit = Sai
            end
            object dblkIssuer: TRxDBLookupCombo
              Left = 12
              Top = 32
              Width = 225
              Height = 21
              DropDownCount = 8
              LookupField = 'ISS_ID'
              LookupDisplay = 'ISS_DESCLONG'
              LookupSource = DmSys.dtsIssuers
              TabOrder = 0
              OnEnter = Entra
              OnExit = Sai
            end
            object lkFilterStatus: TComboBox
              Left = 488
              Top = 32
              Width = 119
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
      object gbApp: TGroupBox
        Left = 0
        Top = 0
        Width = 1163
        Height = 481
        Align = alTop
        TabOrder = 0
        object Label1: TLabel
          Left = 16
          Top = 8
          Width = 47
          Height = 13
          Caption = 'Aplica'#231#227'o'
          FocusControl = dbApp
        end
        object Label2: TLabel
          Left = 136
          Top = 8
          Width = 36
          Height = 13
          Caption = 'Emissor'
          FocusControl = dbIssuers
        end
        object Label3: TLabel
          Left = 624
          Top = 8
          Width = 96
          Height = 13
          Caption = 'Contador Estat'#237'stico'
          FocusControl = dbSF
        end
        object Label7: TLabel
          Left = 16
          Top = 48
          Width = 76
          Height = 13
          Caption = 'Descri'#231#227'o Curta'
          FocusControl = dbDesc
        end
        object Label8: TLabel
          Left = 256
          Top = 48
          Width = 81
          Height = 13
          Caption = 'Descri'#231#227'o Longa'
          FocusControl = dbDescLong
        end
        object Label9: TLabel
          Left = 668
          Top = 48
          Width = 47
          Height = 13
          Caption = 'Prioridade'
          FocusControl = dbPriority
        end
        object Label10: TLabel
          Tag = 1689
          Left = 663
          Top = 132
          Width = 63
          Height = 13
          Caption = 'Valor M'#225'ximo'
          FocusControl = dbAPP_MAXVALUE
        end
        object Label11: TLabel
          Tag = 1690
          Left = 551
          Top = 132
          Width = 54
          Height = 13
          Caption = 'Valor Limite'
          FocusControl = RxDBCalcEdit1
        end
        object Label12: TLabel
          Left = 16
          Top = 131
          Width = 128
          Height = 13
          Caption = 'Tempo de Passback ( L.1 )'
          FocusControl = DBEdit12
        end
        object Label14: TLabel
          Left = 434
          Top = 131
          Width = 97
          Height = 13
          Caption = 'Qtde de Integra'#231#245'es'
          FocusControl = DBEdit14
        end
        object Label17: TLabel
          Tag = 1682
          Left = 640
          Top = 213
          Width = 30
          Height = 13
          Caption = 'Status'
          FocusControl = dbAppStatus
        end
        object Label4: TLabel
          Left = 16
          Top = 88
          Width = 82
          Height = 13
          Caption = 'Aplica'#231#227'o Master'
          FocusControl = RxDBLookupCombo3
        end
        object Label6: TLabel
          Left = 184
          Top = 88
          Width = 96
          Height = 13
          Caption = 'Display do Validador'
          FocusControl = dbVDMCode
        end
        object Label13: TLabel
          Left = 300
          Top = 131
          Width = 102
          Height = 13
          Caption = 'Tempo de Integra'#231#227'o'
          FocusControl = DBEdit13
        end
        object Label20: TLabel
          Tag = 1697
          Left = 18
          Top = 172
          Width = 105
          Height = 13
          Caption = 'Valor extens'#227'o de uso'
          FocusControl = dbAPP_EXTUSEVALUE
        end
        object Label5: TLabel
          Left = 597
          Top = 88
          Width = 101
          Height = 13
          Caption = 'Fun'#231#227'o da Aplica'#231#227'o'
          FocusControl = cmbAF_ID
        end
        object Label32: TLabel
          Tag = 1699
          Left = 103
          Top = 151
          Width = 23
          Height = 13
          Caption = 'Min.'
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object Label34: TLabel
          Tag = 3267
          Left = 135
          Top = 172
          Width = 46
          Height = 13
          Caption = 'app_algid'
          FocusControl = DBEdit1
        end
        object Label35: TLabel
          Tag = 3268
          Left = 246
          Top = 172
          Width = 83
          Height = 13
          Caption = 'app_invalidperiod'
          FocusControl = DBEdit3
        end
        object Label36: TLabel
          Tag = 3269
          Left = 508
          Top = 172
          Width = 38
          Height = 13
          Caption = 'app_kid'
          FocusControl = dbAppKid
        end
        object Label37: TLabel
          Tag = 3270
          Left = 640
          Top = 173
          Width = 50
          Height = 13
          Caption = 'app_kidbu'
          FocusControl = dbApp_KidBu
        end
        object Label39: TLabel
          Left = 18
          Top = 213
          Width = 70
          Height = 13
          Caption = 'Tipo de Chave'
          FocusControl = RxDBLookupCombo1
        end
        object Label40: TLabel
          Tag = 1683
          Left = 376
          Top = 8
          Width = 83
          Height = 13
          Caption = 'Aplica'#231#227'o Origem'
          FocusControl = dbLkApplicationsOrigem
        end
        object Label41: TLabel
          Left = 157
          Top = 131
          Width = 128
          Height = 13
          Caption = 'Tempo de Passback ( L.2 )'
          FocusControl = DBEdit6
        end
        object Label42: TLabel
          Tag = 1699
          Left = 243
          Top = 151
          Width = 23
          Height = 13
          Caption = 'Min.'
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object Label43: TLabel
          Tag = 1699
          Left = 397
          Top = 151
          Width = 23
          Height = 13
          Caption = 'Min.'
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object Label44: TLabel
          Tag = 3271
          Left = 257
          Top = 213
          Width = 102
          Height = 13
          Caption = 'App_Faregraceperiod'
          FocusControl = edtFareGracePeriod
        end
        object Label46: TLabel
          Tag = 3301
          Left = 394
          Top = 213
          Width = 93
          Height = 13
          Caption = 'Mostrar Perc. Saldo'
        end
        object Label47: TLabel
          Tag = 3302
          Left = 506
          Top = 213
          Width = 84
          Height = 13
          Caption = 'Regras de Tarifas'
        end
        object Label62: TLabel
          Tag = 3325
          Left = 356
          Top = 88
          Width = 142
          Height = 13
          Caption = 'Segundo Display do Validador'
          FocusControl = dblkAPP_DISPID2
        end
        object Label63: TLabel
          Tag = 3326
          Left = 528
          Top = 88
          Width = 54
          Height = 13
          Caption = 'Valor Inicial'
          FocusControl = dbeDISP2VALSTART
        end
        object Label74: TLabel
          Tag = 3403
          Left = 384
          Top = 172
          Width = 107
          Height = 13
          Caption = 'app_expdateextension'
        end
        object sbtnFareRule: TRxSpinButton
          Left = 606
          Top = 227
          Width = 20
          Height = 21
          DownGlyph.Data = {
            56000000424D56000000000000003E0000002800000006000000060000000100
            010000000000180000000000000000000000020000000200000000000000FFFF
            FF00CC0000008400000000000000CC000000CC000000CC000000}
          UpGlyph.Data = {
            56000000424D56000000000000003E0000002800000006000000060000000100
            010000000000180000000000000000000000020000000200000000000000FFFF
            FF00CC000000CC000000CC0000000000000084000000CC000000}
          FocusControl = dbedtFareRule
          OnBottomClick = sbtnFareRuleBottomClick
          OnTopClick = sbtnFareRuleTopClick
        end
        object Label75: TLabel
          Tag = 3446
          Left = 16
          Top = 251
          Width = 91
          Height = 13
          Caption = 'Tipo de Seguran'#231'a'
        end
        object Label76: TLabel
          Tag = 3447
          Left = 137
          Top = 251
          Width = 78
          Height = 13
          Caption = 'Key Bit Mask (A)'
          FocusControl = DBEdit8
        end
        object Label77: TLabel
          Tag = 3448
          Left = 273
          Top = 251
          Width = 63
          Height = 13
          Caption = 'Key Level (A)'
          FocusControl = DBEdit9
        end
        object Label78: TLabel
          Tag = 3447
          Left = 389
          Top = 251
          Width = 78
          Height = 13
          Caption = 'Key Bit Mask (B)'
          FocusControl = DBEdit10
        end
        object Label79: TLabel
          Tag = 3448
          Left = 520
          Top = 251
          Width = 63
          Height = 13
          Caption = 'Key Level (B)'
          FocusControl = DBEdit11
        end
        object Label80: TLabel
          Tag = 3449
          Left = 227
          Top = 251
          Width = 19
          Height = 13
          Caption = '( A )'
          FocusControl = DBEdit8
        end
        object Label81: TLabel
          Tag = 3449
          Left = 361
          Top = 251
          Width = 19
          Height = 13
          Caption = '( A )'
          FocusControl = DBEdit8
        end
        object Label82: TLabel
          Tag = 3450
          Left = 479
          Top = 251
          Width = 19
          Height = 13
          Caption = '( B )'
          FocusControl = DBEdit8
        end
        object Label83: TLabel
          Tag = 3450
          Left = 611
          Top = 251
          Width = 19
          Height = 13
          Caption = '( B )'
          FocusControl = DBEdit8
        end
        object Label86: TLabel
          Left = 640
          Top = 251
          Width = 54
          Height = 13
          Caption = 'Gloexpdate'
          FocusControl = DBEdit15
        end
        object dbIssuers: TRxDBLookupCombo
          Left = 136
          Top = 23
          Width = 228
          Height = 21
          DropDownCount = 8
          DataField = 'ISS_ID'
          DataSource = dtsMaster
          LookupField = 'ISS_ID'
          LookupDisplay = 'ISS_DESCLONG'
          LookupSource = DmSys.dtsIssuers
          TabOrder = 1
          OnChange = dbIssuersChange
          OnExit = dbAppExit
        end
        object dbApp: TDBEdit
          Left = 16
          Top = 23
          Width = 113
          Height = 21
          DataField = 'APP_ID'
          DataSource = dtsMaster
          TabOrder = 0
          OnChange = dbAppChange
          OnExit = dbAppExit
        end
        object dbSF: TRxDBLookupCombo
          Left = 624
          Top = 23
          Width = 147
          Height = 21
          DropDownCount = 8
          DataField = 'SF_ID'
          DataSource = dtsMaster
          LookupField = 'SF_ID'
          LookupDisplay = 'SF_DESC'
          LookupSource = DmSys.dtsStatisticalFamilies
          TabOrder = 3
        end
        object dbPriority: TDBEdit
          Left = 668
          Top = 64
          Width = 100
          Height = 21
          DataField = 'APP_PRIORITY'
          DataSource = dtsMaster
          TabOrder = 6
        end
        object dbDesc: TDBEdit
          Left = 16
          Top = 64
          Width = 225
          Height = 21
          CharCase = ecUpperCase
          DataField = 'APP_DESCSHORT'
          DataSource = dtsMaster
          TabOrder = 4
        end
        object dbDescLong: TDBEdit
          Left = 256
          Top = 64
          Width = 401
          Height = 21
          CharCase = ecUpperCase
          DataField = 'APP_DESCLONG'
          DataSource = dtsMaster
          TabOrder = 5
        end
        object DBEdit13: TDBEdit
          Left = 300
          Top = 147
          Width = 93
          Height = 21
          DataField = 'APP_TRANSFERTIME'
          DataSource = dtsMaster
          TabOrder = 12
        end
        object RxDBLookupCombo3: TRxDBLookupCombo
          Left = 16
          Top = 104
          Width = 165
          Height = 21
          DropDownCount = 8
          DataField = 'MA_ID'
          DataSource = dtsMaster
          ListStyle = lsDelimited
          LookupField = 'MA_ID'
          LookupDisplay = 'MA_DESC'
          LookupSource = DmSys.dtsMasterApplications
          TabOrder = 7
        end
        object dbVDMCode: TRxDBLookupCombo
          Left = 184
          Top = 104
          Width = 169
          Height = 21
          DropDownCount = 8
          DataField = 'VDM_CODE'
          DataSource = dtsMaster
          LookupField = 'VDM_CODE'
          LookupDisplay = 'VDM_DESC'
          LookupSource = DmSys.dtsValidatorDisplaysMT
          TabOrder = 8
        end
        object cmbAF_ID: TRxDBLookupCombo
          Left = 596
          Top = 104
          Width = 173
          Height = 21
          DropDownCount = 8
          DataField = 'AF_ID'
          DataSource = dtsMaster
          LookupField = 'AF_ID'
          LookupDisplay = 'AF_DESC'
          LookupSource = DmSys.dtsApplicationFunctions
          TabOrder = 9
        end
        object DBEdit12: TDBEdit
          Left = 16
          Top = 147
          Width = 79
          Height = 21
          DataField = 'APP_PBTIME1'
          DataSource = dtsMaster
          TabOrder = 10
        end
        object DBEdit14: TDBEdit
          Left = 434
          Top = 147
          Width = 103
          Height = 21
          DataField = 'APP_TRANSFERQTY'
          DataSource = dtsMaster
          TabOrder = 13
        end
        object dbAppStatus: TRxDBComboBox
          Left = 640
          Top = 227
          Width = 129
          Height = 21
          Style = csDropDownList
          DataField = 'APP_STATUS'
          DataSource = dtsMaster
          EnableValues = True
          ItemHeight = 13
          Items.Strings = (
            'Ativo'
            'Inativo')
          TabOrder = 25
          Values.Strings = (
            'A'
            'I')
        end
        object DBEdit1: TDBEdit
          Left = 135
          Top = 187
          Width = 98
          Height = 21
          DataField = 'APP_ALGID'
          DataSource = dtsMaster
          TabOrder = 17
        end
        object DBEdit3: TDBEdit
          Left = 245
          Top = 187
          Width = 108
          Height = 21
          DataField = 'APP_INVALIDPERIOD'
          DataSource = dtsMaster
          TabOrder = 18
        end
        object dbAppKid: TDBEdit
          Left = 508
          Top = 187
          Width = 117
          Height = 21
          DataField = 'APP_KID'
          DataSource = dtsMaster
          TabOrder = 20
        end
        object dbApp_KidBu: TDBEdit
          Left = 640
          Top = 187
          Width = 129
          Height = 21
          DataField = 'APP_KIDBU'
          DataSource = dtsMaster
          TabOrder = 21
        end
        object RxDBLookupCombo1: TRxDBLookupCombo
          Left = 18
          Top = 227
          Width = 223
          Height = 21
          DropDownCount = 8
          DataField = 'Kt_Code'
          DataSource = dtsMaster
          LookupField = 'Kt_Code'
          LookupDisplay = 'Kt_Desc'
          LookupSource = dmSys1.dtsKeyTypes
          TabOrder = 22
        end
        object dbLkApplicationsOrigem: TRxDBLookupCombo
          Left = 374
          Top = 22
          Width = 243
          Height = 21
          DropDownCount = 8
          DisplayAllFields = True
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Courier New'
          Font.Style = []
          LookupField = 'APP_ISS_ID'
          LookupDisplay = 'APP_ID; APP_DESCSHORT; ISS_DESCLONG'
          LookupDisplayIndex = 1
          LookupSource = DmSys.dtsOrigAppLook
          ParentFont = False
          TabOrder = 2
          OnCloseUp = dbLkApplicationsOrigemCloseUp
        end
        object DBEdit6: TDBEdit
          Left = 157
          Top = 147
          Width = 79
          Height = 21
          DataField = 'APP_PBTIME2'
          DataSource = dtsMaster
          TabOrder = 11
        end
        object edtFareGracePeriod: TDBEdit
          Left = 256
          Top = 227
          Width = 121
          Height = 21
          AutoSize = False
          DataField = 'APP_FAREGRACEPERIOD'
          DataSource = dtsMaster
          TabOrder = 23
          OnChange = edtFareGracePeriodChange
          OnKeyPress = edtFareGracePeriodKeyPress
        end
        object RxDBCalcEdit1: TRxDBCalcEdit
          Left = 551
          Top = 147
          Width = 100
          Height = 21
          DataField = 'APP_LIMVALUE'
          DataSource = dtsMaster
          ButtonWidth = -1
          NumGlyphs = 2
          TabOrder = 14
        end
        object dbAPP_MAXVALUE: TRxDBCalcEdit
          Left = 661
          Top = 147
          Width = 106
          Height = 21
          DataField = 'APP_MAXVALUE'
          DataSource = dtsMaster
          ButtonWidth = -1
          NumGlyphs = 2
          TabOrder = 15
        end
        object dbAPP_EXTUSEVALUE: TRxDBCalcEdit
          Left = 18
          Top = 187
          Width = 107
          Height = 21
          DataField = 'APP_EXTUSEVALUE'
          DataSource = dtsMaster
          ButtonWidth = -1
          NumGlyphs = 2
          TabOrder = 16
        end
        object DBEdit2: TDBEdit
          Left = 393
          Top = 227
          Width = 97
          Height = 21
          DataField = 'APP_DISPDIVFCT'
          DataSource = dtsMaster
          TabOrder = 24
        end
        object dblkAPP_DISPID2: TRxDBLookupCombo
          Left = 356
          Top = 104
          Width = 169
          Height = 21
          DropDownCount = 8
          DataField = 'APP_DISPID2'
          DataSource = dtsMaster
          LookupField = 'VDM_CODE'
          LookupDisplay = 'VDM_DESC'
          LookupSource = DmSys.dtsValidatorDisplaysMT
          TabOrder = 26
        end
        object dbeDISP2VALSTART: TDBEdit
          Left = 528
          Top = 104
          Width = 65
          Height = 21
          DataField = 'APP_DISPID2VALSTART'
          DataSource = dtsMaster
          TabOrder = 27
        end
        object DBEdit7: TDBEdit
          Left = 384
          Top = 187
          Width = 100
          Height = 21
          DataField = 'APP_EXPDATEEXTENSION'
          DataSource = dtsMaster
          TabOrder = 19
        end
        object dbedtFareRule: TDBEdit
          Left = 508
          Top = 227
          Width = 98
          Height = 21
          DataField = 'APP_FARERULE'
          DataSource = dtsMaster
          ReadOnly = True
          TabOrder = 28
        end
        object RxDBComboBox1: TRxDBComboBox
          Left = 18
          Top = 265
          Width = 111
          Height = 21
          Style = csDropDownList
          DataField = 'APP_SECTYPE'
          DataSource = dtsMaster
          EnableValues = True
          ItemHeight = 13
          Items.Strings = (
            'CRC'
            'APB SAM')
          TabOrder = 29
          Values.Strings = (
            '0'
            '1')
        end
        object DBEdit8: TDBEdit
          Left = 136
          Top = 265
          Width = 110
          Height = 21
          AutoSize = False
          DataField = 'APP_KEYBITMASKA'
          DataSource = dtsMaster
          TabOrder = 30
        end
        object DBEdit9: TDBEdit
          Left = 272
          Top = 265
          Width = 110
          Height = 21
          AutoSize = False
          DataField = 'APP_KEYLEVELA'
          DataSource = dtsMaster
          TabOrder = 31
        end
        object DBEdit10: TDBEdit
          Left = 388
          Top = 265
          Width = 110
          Height = 21
          AutoSize = False
          DataField = 'APP_KEYBITMASKB'
          DataSource = dtsMaster
          TabOrder = 32
        end
        object DBEdit11: TDBEdit
          Left = 520
          Top = 265
          Width = 110
          Height = 21
          AutoSize = False
          DataField = 'APP_KEYLEVELB'
          DataSource = dtsMaster
          TabOrder = 33
        end
        object DBEdit15: TDBEdit
          Left = 640
          Top = 264
          Width = 129
          Height = 21
          DataField = 'APP_GLOEXPDATE'
          DataSource = dtsMaster
          TabOrder = 34
        end
        object pcApplications: TPageControl
          Left = 18
          Top = 292
          Width = 781
          Height = 173
          ActivePage = tsTarifaSocial
          TabOrder = 35
          object tsBilheteUnico: TTabSheet
            Caption = 'Bilhete '#218'nico BUE'
            object GroupBox1: TGroupBox
              Left = 2
              Top = 2
              Width = 769
              Height = 105
              Caption = 'Bilhete '#218'nico'
              TabOrder = 0
              object Label84: TLabel
                Left = 8
                Top = 20
                Width = 96
                Height = 13
                Caption = 'App_BuDefaultType'
              end
              object Label85: TLabel
                Left = 128
                Top = 20
                Width = 69
                Height = 13
                Caption = 'App_budisplay'
              end
              object Label87: TLabel
                Left = 448
                Top = 20
                Width = 92
                Height = 13
                Caption = 'App_buintegdisplay'
              end
              object Label88: TLabel
                Left = 8
                Top = 64
                Width = 83
                Height = 13
                Caption = 'App_bupassback'
              end
              object Label89: TLabel
                Left = 136
                Top = 64
                Width = 71
                Height = 13
                Caption = 'App_budaylimit'
              end
              object Label90: TLabel
                Left = 272
                Top = 64
                Width = 101
                Height = 13
                Caption = 'App_buqtyexpiredays'
              end
              object RxDBLookupCombo5: TRxDBLookupCombo
                Left = 128
                Top = 36
                Width = 305
                Height = 21
                DropDownCount = 8
                DataField = 'App_budisplay'
                DataSource = dtsMaster
                LookupField = 'VDM_CODE'
                LookupDisplay = 'VDM_DESC'
                LookupSource = DmSys.dtsValidatorDisplaysMT
                TabOrder = 1
              end
              object RxDBLookupCombo6: TRxDBLookupCombo
                Left = 444
                Top = 36
                Width = 309
                Height = 21
                DropDownCount = 8
                DataField = 'App_buintegdisplay'
                DataSource = dtsMaster
                LookupField = 'VDM_CODE'
                LookupDisplay = 'VDM_DESC'
                LookupSource = DmSys.dtsValidatorDisplaysMT
                TabOrder = 2
              end
              object DBEdit16: TDBEdit
                Left = 8
                Top = 76
                Width = 110
                Height = 21
                AutoSize = False
                DataField = 'App_bupassback'
                DataSource = dtsMaster
                TabOrder = 3
              end
              object DBEdit17: TDBEdit
                Left = 132
                Top = 76
                Width = 110
                Height = 21
                AutoSize = False
                DataField = 'App_budaylimit'
                DataSource = dtsMaster
                TabOrder = 4
              end
              object DBEdit18: TDBEdit
                Left = 272
                Top = 76
                Width = 110
                Height = 21
                AutoSize = False
                DataField = 'App_buqtyexpiredays'
                DataSource = dtsMaster
                TabOrder = 5
              end
              object RxDBComboBox3: TRxDBComboBox
                Left = 10
                Top = 36
                Width = 111
                Height = 21
                Style = csDropDownList
                DataField = 'App_budefaulttype'
                DataSource = dtsMaster
                EnableValues = True
                ItemHeight = 13
                Items.Strings = (
                  'SEM DIREITO A BU'
                  'BU-RJ')
                TabOrder = 0
                Values.Strings = (
                  '1'
                  '2')
              end
            end
          end
          object tsBilheteUnicoMunicipal: TTabSheet
            Caption = 'Bilhete '#218'nico Municipal BUM'
            ImageIndex = 1
            object GroupBox2: TGroupBox
              Left = 2
              Top = 2
              Width = 769
              Height = 72
              Caption = 'Bilhete '#218'nico Municipal'
              TabOrder = 0
              object Label92: TLabel
                Left = 8
                Top = 18
                Width = 101
                Height = 13
                Caption = 'App_bu_mun_display'
              end
              object Label94: TLabel
                Left = 320
                Top = 21
                Width = 115
                Height = 13
                Caption = 'App_bu_mun_passback'
              end
              object Label95: TLabel
                Left = 448
                Top = 21
                Width = 103
                Height = 13
                Caption = 'App_bu_mun_daylimit'
              end
              object RxDBLookupCombo4: TRxDBLookupCombo
                Left = 8
                Top = 34
                Width = 305
                Height = 21
                DropDownCount = 8
                DataField = 'App_bu_mun_display'
                DataSource = dtsMaster
                LookupField = 'VDM_CODE'
                LookupDisplay = 'VDM_DESC'
                LookupSource = DmSys.dtsValidatorDisplaysMT
                TabOrder = 0
              end
              object DBEdit19: TDBEdit
                Left = 320
                Top = 33
                Width = 110
                Height = 21
                AutoSize = False
                DataField = 'App_bu_mun_passback'
                DataSource = dtsMaster
                TabOrder = 1
              end
              object DBEdit20: TDBEdit
                Left = 444
                Top = 33
                Width = 110
                Height = 21
                AutoSize = False
                DataField = 'App_bu_mun_daylimit'
                DataSource = dtsMaster
                TabOrder = 2
              end
            end
          end
          object tsTarifaSocial: TTabSheet
            Caption = 'Tarifa Social TS'
            ImageIndex = 2
            object GroupBox3: TGroupBox
              Left = 2
              Top = 2
              Width = 769
              Height = 135
              Caption = ' Tarifa Social  '
              TabOrder = 0
              object Label93: TLabel
                Left = 9
                Top = 21
                Width = 65
                Height = 13
                Caption = 'PassBack TS'
              end
              object Label96: TLabel
                Left = 137
                Top = 21
                Width = 61
                Height = 13
                Caption = 'Qtd TS / Dia'
              end
              object Label97: TLabel
                Left = 260
                Top = 21
                Width = 51
                Height = 13
                Caption = 'Display TS'
              end
              object Label91: TLabel
                Left = 260
                Top = 56
                Width = 72
                Height = 13
                Caption = 'Display ITG TS'
              end
              object Label98: TLabel
                Left = 13
                Top = 56
                Width = 87
                Height = 13
                Caption = 'Minutos Valida'#231#227'o'
              end
              object DBEdit21: TDBEdit
                Left = 9
                Top = 33
                Width = 110
                Height = 21
                AutoSize = False
                DataField = 'APP_TSPASSBACK'
                DataSource = dtsMaster
                TabOrder = 0
              end
              object DBEdit22: TDBEdit
                Left = 133
                Top = 33
                Width = 110
                Height = 21
                AutoSize = False
                DataField = 'APP_TSDAYLIMIT'
                DataSource = dtsMaster
                TabOrder = 1
              end
              object DBEdit25: TDBEdit
                Left = 9
                Top = 68
                Width = 110
                Height = 21
                AutoSize = False
                DataField = 'APP_CHECKVALIDATIONMINUTES'
                DataSource = dtsMaster
                TabOrder = 2
              end
              object RxDBLookupCombo7: TRxDBLookupCombo
                Left = 260
                Top = 33
                Width = 309
                Height = 21
                DropDownCount = 8
                DataField = 'APP_TSDISPLAY'
                DataSource = dtsMaster
                LookupField = 'VDM_CODE'
                LookupDisplay = 'VDM_DESC'
                LookupSource = DmSys.dtsValidatorDisplaysMT
                TabOrder = 3
              end
              object RxDBLookupCombo8: TRxDBLookupCombo
                Left = 260
                Top = 68
                Width = 309
                Height = 21
                DropDownCount = 8
                DataField = 'APP_TSINTEGDISPLAY'
                DataSource = dtsMaster
                LookupField = 'VDM_CODE'
                LookupDisplay = 'VDM_DESC'
                LookupSource = DmSys.dtsValidatorDisplaysMT
                TabOrder = 4
              end
            end
          end
        end
      end
      object pcSubApplications: TPageControl
        Left = 27
        Top = 481
        Width = 1136
        Height = 3
        ActivePage = TabSheet7
        Align = alClient
        MultiLine = True
        TabOrder = 1
        OnChange = pcSubApplicationsChange
        OnChanging = pcSubApplicationsChanging
        object TabSheet1: TTabSheet
          Tag = 1710
          Caption = 'Sub Aplica'#231#227'o'
          object Label18: TLabel
            Left = 16
            Top = 64
            Width = 56
            Height = 13
            Caption = 'Certifica'#231#227'o'
            FocusControl = dbCERTIFICATE
          end
          object Label19: TLabel
            Tag = 1670
            Left = 16
            Top = 8
            Width = 47
            Height = 13
            Caption = 'Aplica'#231#227'o'
            FocusControl = dbLkApplications
          end
          object btDisplayCancel: TSpeedButton
            Left = 227
            Top = 127
            Width = 98
            Height = 32
            Action = actSupAppCancel
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
            Left = 120
            Top = 127
            Width = 98
            Height = 32
            Action = actSubAppOK
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
          object dbCERTIFICATE: TDBEdit
            Left = 16
            Top = 80
            Width = 134
            Height = 21
            DataField = 'SA_CERTIFICATE'
            DataSource = DmSys.dtsSubApplications
            Enabled = False
            TabOrder = 2
          end
          object dbLkApplications: TRxDBLookupCombo
            Left = 16
            Top = 24
            Width = 313
            Height = 21
            DropDownCount = 8
            DisplayAllFields = True
            LookupField = 'APP_ISS_ID'
            LookupDisplay = 'APP_ID; APP_DESCSHORT; ISS_DESCLONG'
            LookupDisplayIndex = 1
            LookupSource = DmSys.dtsApplicationsLook
            TabOrder = 1
            OnCloseUp = dbLkApplicationsCloseUp
          end
          object dbgSubApplications: TDBGrid
            Left = 0
            Top = 0
            Width = 1128
            Height = 0
            Align = alClient
            DataSource = DmSys.dtsSubApplications
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
                FieldName = 'SUB_APPID'
                Title.Caption = 'Aplica'#231#227'o'
                Width = 120
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'ISS_DESCLONG'
                Title.Caption = 'Emissor'
                Width = 210
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'SA_CERTIFICATE'
                Title.Caption = 'Certifica'#231#227'o'
                Width = 100
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'STATUS_ID'
                Title.Caption = 'Status'
                Width = 90
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'SA_REGDATE'
                Title.Caption = 'Registro'
                Width = 110
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'SA_REGUSER'
                Title.Caption = 'Usu'#225'rio'
                Width = 110
                Visible = True
              end>
          end
        end
        object TabSheet2: TTabSheet
          Tag = 1721
          Caption = 'Validator Actions'
          ImageIndex = 1
          object Label22: TLabel
            Tag = 1722
            Left = 8
            Top = 11
            Width = 56
            Height = 13
            Caption = 'Dispon'#237'veis'
          end
          object SpeedButton1: TSpeedButton
            Left = 571
            Top = 71
            Width = 98
            Height = 32
            Action = actVAOK
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
            Left = 571
            Top = 119
            Width = 98
            Height = 32
            Action = actVACancel
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
            Tag = 1725
            Left = 312
            Top = 11
            Width = 64
            Height = 13
            Caption = 'Selecionadas'
          end
          object lbDisponiveis: TListBox
            Left = 8
            Top = 27
            Width = 241
            Height = 124
            DragMode = dmAutomatic
            ItemHeight = 13
            MultiSelect = True
            TabOrder = 1
            OnDragDrop = lbDisponiveisDragDrop
            OnDragOver = lbDisponiveisDragOver
          end
          object lbSelecionadas: TListBox
            Left = 304
            Top = 27
            Width = 241
            Height = 124
            DragMode = dmAutomatic
            ItemHeight = 13
            MultiSelect = True
            TabOrder = 2
            OnDragDrop = lbSelecionadasDragDrop
            OnDragOver = lbSelecionadasDragOver
          end
          object cbLineMt: TCoolBar
            Left = 264
            Top = 59
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
                Action = actVAAddAll
                ParentShowHint = False
                Wrap = True
                ShowHint = True
              end
              object btnAddAllLineMt: TToolButton
                Left = 0
                Top = 24
                Action = actVAAdd
                ParentShowHint = False
                Wrap = True
                ShowHint = True
              end
              object btnDelAllLineMt: TToolButton
                Left = 0
                Top = 46
                Action = actVADel
                ParentShowHint = False
                Wrap = True
                ShowHint = True
              end
              object tbtnDeleteLineMt: TToolButton
                Left = 0
                Top = 68
                Action = actVADelAll
                ParentShowHint = False
                ShowHint = True
              end
            end
          end
          object dbgAppsXValidatorActions: TDBGrid
            Left = 0
            Top = 0
            Width = 1128
            Height = 0
            Align = alClient
            DataSource = DmSys.dtsAppsXValidatorActions
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
                FieldName = 'VA_DESC'
                Title.Caption = 'Validator Actions'
                Width = 300
                Visible = True
              end>
          end
        end
        object TabSheet3: TTabSheet
          Tag = 1728
          Caption = 'Validator Conditions'
          ImageIndex = 2
          object SpeedButton3: TSpeedButton
            Left = 579
            Top = 119
            Width = 98
            Height = 32
            Action = actVCCancel
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
          object SpeedButton4: TSpeedButton
            Left = 579
            Top = 79
            Width = 98
            Height = 32
            Action = actVCOK
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
          object Label16: TLabel
            Tag = 1722
            Left = 8
            Top = 10
            Width = 56
            Height = 13
            Caption = 'Dispon'#237'veis'
          end
          object Label29: TLabel
            Tag = 1725
            Left = 312
            Top = 10
            Width = 64
            Height = 13
            Caption = 'Selecionadas'
          end
          object lbDisponiveisConditions: TListBox
            Left = 8
            Top = 25
            Width = 241
            Height = 126
            DragMode = dmAutomatic
            ItemHeight = 13
            MultiSelect = True
            TabOrder = 1
            OnDragDrop = lbDisponiveisConditionsDragDrop
            OnDragOver = lbDisponiveisConditionsDragOver
          end
          object lbSelecionadasConditions: TListBox
            Left = 304
            Top = 25
            Width = 241
            Height = 126
            DragMode = dmAutomatic
            ItemHeight = 13
            MultiSelect = True
            TabOrder = 2
            OnDragDrop = lbSelecionadasConditionsDragDrop
            OnDragOver = lbSelecionadasConditionsDragOver
          end
          object CoolBar1: TCoolBar
            Left = 264
            Top = 50
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
                Action = actVCAddAll
                Wrap = True
              end
              object btAddCondictions: TToolButton
                Left = 0
                Top = 24
                Action = actVCAdd
                Wrap = True
              end
              object btDelCondictions: TToolButton
                Left = 0
                Top = 46
                Action = actVCDel
                Wrap = True
              end
              object ToolButton4: TToolButton
                Left = 0
                Top = 68
                Action = actVCDelAll
              end
            end
          end
          object gdbValidatorConditions: TDBGrid
            Left = 0
            Top = 0
            Width = 1128
            Height = 0
            Align = alClient
            DataSource = DmSys.dtsAppsXValidatorConditions
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
                FieldName = 'VC_DESC'
                Title.Caption = 'Validator Conditions'
                Width = 300
                Visible = True
              end>
          end
        end
        object TabSheet4: TTabSheet
          Tag = 1735
          Caption = 'Validator Visual Actions'
          ImageIndex = 3
          object SpeedButton5: TSpeedButton
            Left = 627
            Top = 79
            Width = 98
            Height = 32
            Action = actVVAOK
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
          object SpeedButton6: TSpeedButton
            Left = 627
            Top = 119
            Width = 98
            Height = 32
            Action = actVVACancel
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
          object Label23: TLabel
            Tag = 1722
            Left = 8
            Top = 10
            Width = 56
            Height = 13
            Caption = 'Dispon'#237'veis'
          end
          object Label30: TLabel
            Tag = 1725
            Left = 328
            Top = 10
            Width = 64
            Height = 13
            Caption = 'Selecionadas'
          end
          object lbDispActions: TListBox
            Left = 16
            Top = 25
            Width = 265
            Height = 177
            DragMode = dmAutomatic
            ItemHeight = 13
            MultiSelect = True
            TabOrder = 1
            OnDragDrop = lbDispActionsDragDrop
            OnDragOver = lbDispActionsDragOver
          end
          object lbSelActions: TListBox
            Left = 328
            Top = 24
            Width = 281
            Height = 177
            DragMode = dmAutomatic
            ItemHeight = 13
            MultiSelect = True
            TabOrder = 2
            OnDragDrop = lbSelActionsDragDrop
            OnDragOver = lbSelActionsDragOver
          end
          object CoolBar2: TCoolBar
            Left = 293
            Top = 54
            Width = 27
            Height = 107
            Align = alNone
            AutoSize = True
            Bands = <
              item
                Control = ToolBar2
                ImageIndex = -1
                MinHeight = 23
                Width = 103
              end>
            Vertical = True
            object ToolBar2: TToolBar
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
              object ToolButton5: TToolButton
                Left = 0
                Top = 2
                Action = actVVAAddAll
                Wrap = True
              end
              object btAddVisualActions: TToolButton
                Left = 0
                Top = 24
                Action = actVVAAdd
                Wrap = True
              end
              object btDelVisualActions: TToolButton
                Left = 0
                Top = 46
                Action = actVVADel
                Wrap = True
              end
              object ToolButton8: TToolButton
                Left = 0
                Top = 68
                Action = actVVADelAll
              end
            end
          end
          object dbgVisualActions: TDBGrid
            Left = 0
            Top = 0
            Width = 1128
            Height = 0
            Align = alClient
            DataSource = DmSys.dtsAppsXValVisualActions
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
                FieldName = 'VVA_DESC'
                Title.Caption = 'Visual Actions'
                Width = 300
                Visible = True
              end>
          end
        end
        object TabSheet5: TTabSheet
          Tag = 1742
          Caption = 'Validator States'
          ImageIndex = 4
          object SpeedButton7: TSpeedButton
            Left = 592
            Top = 87
            Width = 98
            Height = 32
            Action = actOKVS
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
          object SpeedButton8: TSpeedButton
            Left = 592
            Top = 135
            Width = 98
            Height = 32
            Action = actCancelVS
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
          object Label24: TLabel
            Tag = 1725
            Left = 312
            Top = 10
            Width = 64
            Height = 13
            Caption = 'Selecionadas'
          end
          object Label31: TLabel
            Tag = 1722
            Left = 8
            Top = 10
            Width = 56
            Height = 13
            Caption = 'Dispon'#237'veis'
          end
          object CoolBar3: TCoolBar
            Left = 272
            Top = 48
            Width = 27
            Height = 129
            Align = alNone
            AutoSize = True
            Bands = <
              item
                Control = ToolBar3
                ImageIndex = -1
                MinHeight = 23
                Width = 125
              end>
            Vertical = True
            object ToolBar3: TToolBar
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
              object ToolButton9: TToolButton
                Left = 0
                Top = 2
                Action = actVSAddAll
                Wrap = True
              end
              object btAddStates: TToolButton
                Left = 0
                Top = 24
                ImageIndex = 22
                Wrap = True
                OnClick = actVSAddExecute
              end
              object btDelStates: TToolButton
                Left = 0
                Top = 46
                ImageIndex = 24
                Wrap = True
                OnClick = actVSDelExecute
              end
              object ToolButton12: TToolButton
                Left = 0
                Top = 68
                ImageIndex = 23
                OnClick = actVSDelAllExecute
              end
            end
          end
          object lbSelStates: TListBox
            Left = 312
            Top = 24
            Width = 241
            Height = 177
            DragMode = dmAutomatic
            ItemHeight = 13
            MultiSelect = True
            TabOrder = 2
            OnDragDrop = lbSelStatesDragDrop
            OnDragOver = lbSelStatesDragOver
          end
          object lbDispStates: TListBox
            Left = 16
            Top = 25
            Width = 241
            Height = 177
            DragMode = dmAutomatic
            ItemHeight = 13
            MultiSelect = True
            TabOrder = 3
            OnDragDrop = lbDispStatesDragDrop
            OnDragOver = lbDispStatesDragOver
          end
          object dbgValidatorStatesXApps: TDBGrid
            Left = 0
            Top = 0
            Width = 1128
            Height = 0
            Align = alClient
            DataSource = DmSys.dtsValidatorStatesXApps
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
                FieldName = 'VS_LONGDESC'
                Title.Caption = 'ValidatorStates'
                Width = 200
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
                FieldName = 'VSAPP_REGDATE'
                Title.Caption = 'Registro'
                Width = 120
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'VSAPP_REGUSER'
                Title.Caption = 'Usu'#225'rio'
                Width = 120
                Visible = True
              end>
          end
        end
        object TabSheet6: TTabSheet
          Tag = 1758
          Caption = 'Strings'
          ImageIndex = 5
          object Label21: TLabel
            Left = 16
            Top = 12
            Width = 47
            Height = 13
            Caption = 'Prioridade'
          end
          object Label64: TLabel
            Left = 124
            Top = 12
            Width = 27
            Height = 13
            Caption = 'String'
          end
          object Label38: TLabel
            Tag = 3266
            Left = 480
            Top = 12
            Width = 30
            Height = 13
            Caption = 'Status'
          end
          object SpeedButton9: TSpeedButton
            Left = 669
            Top = 63
            Width = 74
            Height = 32
            Action = actOKStrings
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
          object SpeedButton10: TSpeedButton
            Left = 669
            Top = 111
            Width = 74
            Height = 32
            Action = actCancelStrings
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
          object DBEdit5: TDBEdit
            Left = 16
            Top = 28
            Width = 69
            Height = 21
            DataField = 'APPSTR_PRIORITY'
            DataSource = DmSys.dtsApplicationStrings
            TabOrder = 3
          end
          object DBEdit4: TDBEdit
            Left = 124
            Top = 28
            Width = 329
            Height = 21
            CharCase = ecUpperCase
            DataField = 'APPSTR_STRING'
            DataSource = DmSys.dtsApplicationStrings
            MaxLength = 32
            TabOrder = 1
            OnKeyPress = DBEdit4KeyPress
          end
          object RxDBComboBox2: TRxDBComboBox
            Left = 481
            Top = 28
            Width = 105
            Height = 21
            Style = csDropDownList
            DataField = 'APPSTR_STATUS'
            DataSource = DmSys.dtsApplicationStrings
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
          object dbgStrings: TDBGrid
            Left = 0
            Top = 0
            Width = 1128
            Height = 0
            Align = alClient
            DataSource = DmSys.dtsApplicationStrings
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
                FieldName = 'APPSTR_STRING'
                Title.Caption = 'String'
                Width = 300
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'APPSTR_PRIORITY'
                Title.Caption = 'Prioridade'
                Width = 70
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'APPSTR_REGDATE'
                Title.Caption = 'Registro'
                Width = 100
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'APPSTR_REGUSER'
                Title.Caption = 'Usu'#225'rio'
                Width = 100
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'STATUS_ID'
                Title.Caption = 'Status'
                Width = 80
                Visible = True
              end>
          end
        end
        object tabVersoes: TTabSheet
          Caption = 'Vers'#245'es'
          ImageIndex = 6
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
            Left = 592
            Top = 87
            Width = 98
            Height = 32
            Action = actOkVersion
            Caption = 'Ok'
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
            Left = 592
            Top = 135
            Width = 98
            Height = 32
            Action = actCancelVersion
            Caption = 'Cancelar'
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
          object spnedtVersion: TRxSpinEdit
            Left = 16
            Top = 28
            Width = 57
            Height = 21
            Value = 1.000000000000000000
            TabOrder = 1
          end
          object dbedtVersionValidity: TDBDateEdit
            Left = 104
            Top = 28
            Width = 121
            Height = 21
            DataField = 'APPVER_VALIDITY'
            DataSource = dmSys1.dtsApplicationVersions
            NumGlyphs = 2
            TabOrder = 2
          end
          object dbedtVersionStatus: TRxDBComboBox
            Left = 253
            Top = 28
            Width = 105
            Height = 21
            Style = csDropDownList
            DataField = 'APPVER_STATUS'
            DataSource = dmSys1.dtsApplicationVersions
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
          object dbgVersions: TDBGrid
            Left = 0
            Top = 0
            Width = 1128
            Height = 0
            Align = alClient
            DataSource = dmSys1.dtsApplicationVersions
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
                FieldName = 'APPVER_VERSIONNBR'
                Title.Caption = 'Vers'#227'o'
                Width = 100
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'APPVER_VALIDITY'
                Title.Caption = 'Validade'
                Width = 120
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'APPVER_STATUS'
                Title.Caption = 'Status'
                Visible = True
              end>
          end
        end
        object TabSheet7: TTabSheet
          Caption = 'Desenhos dos Cart'#245'es'
          ImageIndex = 7
          object Label48: TLabel
            Tag = 1722
            Left = 20
            Top = 11
            Width = 56
            Height = 13
            Caption = 'Dispon'#237'veis'
          end
          object Label49: TLabel
            Tag = 1725
            Left = 344
            Top = 11
            Width = 64
            Height = 13
            Caption = 'Selecionadas'
          end
          object btnOkCardDesign: TSpeedButton
            Left = 615
            Top = 59
            Width = 98
            Height = 32
            Action = actCardDesignOK
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
          object btnCancelCardDesign: TSpeedButton
            Left = 615
            Top = 107
            Width = 98
            Height = 32
            Action = actCardDesignCancel
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
          object CoolBar5: TCoolBar
            Left = 288
            Top = 52
            Width = 27
            Height = 107
            Align = alNone
            AutoSize = True
            Bands = <
              item
                Control = ToolBar5
                ImageIndex = -1
                MinHeight = 23
                Width = 103
              end>
            Vertical = True
            object ToolBar5: TToolBar
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
              object btnAddAllCardDesign: TToolButton
                Left = 0
                Top = 2
                Action = actAddAllCardDesign
                ParentShowHint = False
                Wrap = True
                ShowHint = True
              end
              object btnAddOneCardDesign: TToolButton
                Left = 0
                Top = 24
                Action = actAddOneCardDesign
                ParentShowHint = False
                Wrap = True
                ShowHint = True
              end
              object btnDelOneCardDesign: TToolButton
                Left = 0
                Top = 46
                Action = actDelOneCardDesign
                ParentShowHint = False
                Wrap = True
                ShowHint = True
              end
              object btnDelAllCardDesign: TToolButton
                Left = 0
                Top = 68
                Action = actDelAllCardDesign
                ParentShowHint = False
                ShowHint = True
              end
            end
          end
          object lstDispCardDesign: TListBox
            Left = 20
            Top = 32
            Width = 241
            Height = 137
            DragMode = dmAutomatic
            ItemHeight = 13
            MultiSelect = True
            TabOrder = 1
            OnDragDrop = lbDisponiveisDragDrop
            OnDragOver = lbDisponiveisDragOver
          end
          object lstSelecCardDesign: TListBox
            Left = 344
            Top = 32
            Width = 241
            Height = 137
            DragMode = dmAutomatic
            ItemHeight = 13
            MultiSelect = True
            TabOrder = 2
            OnDragDrop = lbSelecionadasDragDrop
            OnDragOver = lbSelecionadasDragOver
          end
          object dbgCardDesign: TDBGrid
            Left = 0
            Top = 0
            Width = 1128
            Height = 0
            Align = alClient
            DataSource = dmSys1.dtsCardDesignxApps
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
                FieldName = 'CD_DESC'
                Title.Caption = 'Validator Actions'
                Width = 300
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'CDAPP_STATUS'
                Visible = True
              end>
          end
        end
        object TabSheet8: TTabSheet
          Caption = 'Templates dos Cart'#245'es'
          ImageIndex = 8
          object SpeedButton11: TSpeedButton
            Left = 643
            Top = 59
            Width = 98
            Height = 32
            Action = actCTXApplicationsOK
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
          object SpeedButton13: TSpeedButton
            Left = 643
            Top = 107
            Width = 98
            Height = 32
            Action = actCTXApplicationsCancel
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
          object Label50: TLabel
            Left = 4
            Top = 8
            Width = 93
            Height = 13
            Caption = 'Template de Cart'#227'o'
            FocusControl = RxDBLookupCombo2
          end
          object Label51: TLabel
            Left = 240
            Top = 8
            Width = 76
            Height = 13
            Caption = 'Grupo de tempo'
            FocusControl = rdbTimeGroups
          end
          object Label65: TLabel
            Left = 456
            Top = 7
            Width = 76
            Height = 13
            Caption = 'Tipo de per'#237'odo'
            FocusControl = rdbPerioduseTypes
          end
          object Label66: TLabel
            Left = 240
            Top = 54
            Width = 26
            Height = 13
            Caption = 'Linha'
            FocusControl = rdbLinha
          end
          object Label67: TLabel
            Left = 4
            Top = 55
            Width = 74
            Height = 13
            Caption = 'Grupo de linhas'
            FocusControl = rdbLineGroups
          end
          object Label68: TLabel
            Left = 4
            Top = 105
            Width = 94
            Height = 13
            Caption = 'Periodo de validade'
            FocusControl = rdbValidationPeriods
          end
          object Label69: TLabel
            Left = 240
            Top = 105
            Width = 79
            Height = 13
            Caption = 'Tipo de validade'
            FocusControl = rdbValidityTypes
          end
          object Label70: TLabel
            Left = 456
            Top = 105
            Width = 55
            Height = 13
            Caption = 'Quantidade'
            FocusControl = dbQtde
          end
          object Label71: TLabel
            Left = 456
            Top = 53
            Width = 60
            Height = 13
            Caption = 'Tipo de data'
            FocusControl = rdbDateStatus
          end
          object RxDBLookupCombo2: TRxDBLookupCombo
            Left = 4
            Top = 24
            Width = 213
            Height = 21
            DropDownCount = 8
            DisplayAllFields = True
            DataField = 'CTE_ID'
            DataSource = dmSys1.dtsCardTemplatesxApps
            LookupField = 'CTE_ID'
            LookupDisplay = 'CTE_DESC'
            LookupDisplayIndex = 1
            LookupSource = DmSys.dtsCardTemplates
            TabOrder = 0
          end
          object rdbTimeGroups: TRxDBLookupCombo
            Left = 240
            Top = 24
            Width = 193
            Height = 21
            DropDownCount = 8
            DataField = 'TG_ID'
            DataSource = dmSys1.dtsCardTemplatesxApps
            LookupField = 'TG_ID'
            LookupDisplay = 'TG_DESC'
            LookupSource = DmSys.dtsTimeGroups
            TabOrder = 1
          end
          object rdbPerioduseTypes: TRxDBLookupCombo
            Left = 456
            Top = 23
            Width = 145
            Height = 21
            DropDownCount = 8
            DataField = 'PUT_ID'
            DataSource = dmSys1.dtsCardTemplatesxApps
            LookupField = 'PUT_ID'
            LookupDisplay = 'PUT_DESC'
            LookupSource = dmSys1.dtsPeriodUseTypesLk
            TabOrder = 2
          end
          object rdbLinha: TRxDBLookupCombo
            Left = 240
            Top = 70
            Width = 193
            Height = 21
            DropDownCount = 8
            DataField = 'LM_ID'
            DataSource = dmSys1.dtsCardTemplatesxApps
            LookupField = 'LM_ID'
            LookupDisplay = 'LM_DESC'
            LookupSource = DmSys.dtsLineMT
            TabOrder = 4
          end
          object rdbLineGroups: TRxDBLookupCombo
            Left = 4
            Top = 71
            Width = 213
            Height = 21
            DropDownCount = 8
            DataField = 'LG_ID'
            DataSource = dmSys1.dtsCardTemplatesxApps
            LookupField = 'LG_ID'
            LookupDisplay = 'LG_DESC'
            LookupSource = DmSys.dtsLineGroups
            TabOrder = 3
          end
          object rdbValidationPeriods: TRxDBLookupCombo
            Left = 4
            Top = 121
            Width = 213
            Height = 21
            DropDownCount = 8
            DataField = 'VP_ID'
            DataSource = dmSys1.dtsCardTemplatesxApps
            LookupField = 'VP_ID'
            LookupDisplay = 'VP_DESC'
            LookupSource = dmSys1.dtsValidationPeriods
            TabOrder = 6
          end
          object rdbValidityTypes: TRxDBLookupCombo
            Left = 240
            Top = 121
            Width = 193
            Height = 21
            DropDownCount = 8
            DataField = 'VT_ID'
            DataSource = dmSys1.dtsCardTemplatesxApps
            LookupField = 'VT_ID'
            LookupDisplay = 'VT_DESC'
            LookupSource = dmSys1.dtsValidityTypes
            TabOrder = 7
          end
          object dbQtde: TDBEdit
            Left = 456
            Top = 121
            Width = 145
            Height = 21
            DataField = 'CTA_VALDATEQTY'
            DataSource = dmSys1.dtsCardTemplatesxApps
            TabOrder = 8
          end
          object rdbDateStatus: TRxDBLookupCombo
            Left = 456
            Top = 69
            Width = 145
            Height = 21
            DropDownCount = 8
            DataField = 'DS_ID'
            DataSource = dmSys1.dtsCardTemplatesxApps
            LookupField = 'DS_ID'
            LookupDisplay = 'DS_DESC'
            LookupSource = dmSys1.dtsDateStatus
            TabOrder = 5
          end
          object dbgCardTemplatesXApps: TDBGrid
            Left = 0
            Top = 0
            Width = 1128
            Height = 0
            Align = alClient
            DataSource = dmSys1.dtsCardTemplatesxApps
            Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgRowSelect, dgConfirmDelete, dgCancelOnExit]
            TabOrder = 9
            TitleFont.Charset = DEFAULT_CHARSET
            TitleFont.Color = clWindowText
            TitleFont.Height = -11
            TitleFont.Name = 'MS Sans Serif'
            TitleFont.Style = []
            Columns = <
              item
                Expanded = False
                FieldName = 'CTE_DESC'
                Title.Caption = 'Validator Actions'
                Width = 200
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'PUT_DESC'
                Width = 200
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'TG_DESC'
                Width = 200
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'VP_DESC'
                Width = 200
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'LG_DESC'
                Width = 200
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'LM_DESC'
                Width = 200
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'VT_DESC'
                Width = 200
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'DS_DESC'
                Width = 200
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'CTA_VALDATEQTY'
                Width = 100
                Visible = True
              end>
          end
        end
        object TabSheet9: TTabSheet
          Caption = 'Tipos de Cart'#245'es'
          ImageIndex = 9
          object SpeedButton14: TSpeedButton
            Left = 544
            Top = 121
            Width = 98
            Height = 32
            Action = actCancelCardTypesxApps
            Caption = 'Cancel'
            Glyph.Data = {
              36040000424D3604000000000000360000002800000010000000100000000100
              2000000000000004000000000000000000000000000000000000FF00FF00FF00
              FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
              FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
              FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
              FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
              FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
              FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
              FF00FF00FF00000084008484840084848400FF00FF00FF00FF00FF00FF00FF00
              FF00FF00FF008484840084848400FF00FF00FF00FF00FF00FF00FF00FF00FF00
              FF00FF00FF0000008400000084008484840084848400FF00FF00FF00FF00FF00
              FF00FF00FF000000840084848400FF00FF00FF00FF00FF00FF00FF00FF00FF00
              FF00FF00FF0084848400000084000000840084848400FF00FF00FF00FF00FF00
              FF008484840000008400FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
              FF00FF00FF00FF00FF0000008400000084008484840084848400FF00FF000000
              84000000840084848400FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
              FF00FF00FF00FF00FF0000008400000084000000840084848400848484000000
              840000008400FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
              FF00FF00FF00FF00FF00FF00FF00000084000000840000008400000084000000
              8400FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
              FF00FF00FF00FF00FF00FF00FF00000084000000840000008400000084008484
              8400FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
              FF00FF00FF008484840084848400000084000000840000008400000084008484
              840084848400FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
              FF00848484000000840000008400FF00FF00FF00FF0000008400000084000000
              84008484840084848400FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
              FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00000084000000
              8400000084008484840084848400FF00FF00FF00FF00FF00FF00FF00FF00FF00
              FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
              FF000000840000008400FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
              FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
              FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
              FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
              FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00}
            NumGlyphs = 2
          end
          object SpeedButton15: TSpeedButton
            Left = 432
            Top = 121
            Width = 98
            Height = 32
            Action = actOkCardTypesXApps
            Caption = 'OK'
            Glyph.Data = {
              36040000424D3604000000000000360000002800000010000000100000000100
              2000000000000004000000000000000000000000000000000000FF00FF00FF00
              FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
              FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
              FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
              FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
              FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
              FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
              FF00FF00FF00FF00FF00FF00FF00FF00FF0000000000FF00FF00FF00FF00FF00
              FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
              FF00FF00FF00FF00FF00FF00FF000000000000000000FF00FF00FF00FF00FF00
              FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
              FF00FF00FF00FF00FF00000000000000000000000000FF00FF00FF00FF00FF00
              FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
              FF00FF00FF000000000000000000FF00FF000000000000000000FF00FF00FF00
              FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
              FF000000000000000000FF00FF00FF00FF00FF00FF0000000000FF00FF00FF00
              FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
              FF0000000000FF00FF00FF00FF00FF00FF00FF00FF000000000000000000FF00
              FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
              FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF0000000000FF00
              FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
              FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF000000
              0000FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
              FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF000000
              000000000000FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
              FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
              FF0000000000FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
              FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
              FF00FF00FF0000000000FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
              FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
              FF00FF00FF00FF00FF0000000000FF00FF00FF00FF00FF00FF00FF00FF00FF00
              FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
              FF00FF00FF00FF00FF00FF00FF0000000000FF00FF00FF00FF00}
            NumGlyphs = 2
          end
          object Label52: TLabel
            Tag = 3318
            Left = 392
            Top = 59
            Width = 65
            Height = 13
            Caption = 'REPEATQTY'
            FocusControl = db_CTYAPP_REPEATQTY
          end
          object Label53: TLabel
            Tag = 3315
            Left = 392
            Top = 8
            Width = 100
            Height = 13
            Caption = 'MASTERSECIDMAX'
            FocusControl = dbMastersecidmax
          end
          object Label54: TLabel
            Tag = 3314
            Left = 208
            Top = 8
            Width = 97
            Height = 13
            Caption = 'MASTERSECIDMIN'
            FocusControl = dbMastersecidmin
          end
          object Label56: TLabel
            Tag = 3316
            Left = 16
            Top = 59
            Width = 67
            Height = 13
            Caption = 'BUSECIDMIN'
            FocusControl = db_CTYAPP_BUSECIDMIN
          end
          object Label57: TLabel
            Tag = 3317
            Left = 208
            Top = 59
            Width = 70
            Height = 13
            Caption = 'BUSECIDMAX'
            FocusControl = db_CTYAPP_BUSECIDMAX
          end
          object Label55: TLabel
            Tag = 3313
            Left = 16
            Top = 8
            Width = 70
            Height = 13
            Caption = 'Tipo de Cart'#227'o'
          end
          object db_CTYAPP_REPEATQTY: TDBEdit
            Left = 392
            Top = 75
            Width = 169
            Height = 21
            DataField = 'CTYAPP_REPEATQTY'
            DataSource = dmSys1.dtsCardTypesXApps
            TabOrder = 5
          end
          object dbMastersecidmax: TDBEdit
            Left = 392
            Top = 24
            Width = 105
            Height = 21
            DataField = 'CTYAPP_MASTERSECIDMAX'
            DataSource = dmSys1.dtsCardTypesXApps
            TabOrder = 2
          end
          object dbMastersecidmin: TDBEdit
            Left = 208
            Top = 24
            Width = 145
            Height = 21
            DataField = 'CTYAPP_MASTERSECIDMIN'
            DataSource = dmSys1.dtsCardTypesXApps
            TabOrder = 1
          end
          object db_CTYAPP_BUSECIDMIN: TDBEdit
            Left = 16
            Top = 75
            Width = 169
            Height = 21
            DataField = 'CTYAPP_BUSECIDMIN'
            DataSource = dmSys1.dtsCardTypesXApps
            TabOrder = 3
          end
          object db_CTYAPP_BUSECIDMAX: TDBEdit
            Left = 208
            Top = 75
            Width = 169
            Height = 21
            DataField = 'CTYAPP_BUSECIDMAX'
            DataSource = dmSys1.dtsCardTypesXApps
            TabOrder = 4
          end
          object cmbCardTypesXApps: TComboBox
            Left = 16
            Top = 24
            Width = 169
            Height = 21
            Style = csDropDownList
            ItemHeight = 13
            TabOrder = 0
          end
          object dbgCardTypesxApps: TDBGrid
            Left = 0
            Top = 0
            Width = 1128
            Height = 0
            Align = alClient
            DataSource = dmSys1.dtsCardTypesXApps
            Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgRowSelect, dgConfirmDelete, dgCancelOnExit]
            TabOrder = 6
            TitleFont.Charset = DEFAULT_CHARSET
            TitleFont.Color = clWindowText
            TitleFont.Height = -11
            TitleFont.Name = 'MS Sans Serif'
            TitleFont.Style = []
            Columns = <
              item
                Expanded = False
                FieldName = 'CTY_DESC'
                Title.Caption = 'Tipo de Cart'#227'o'
                Width = 200
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'CTYAPP_MASTERSECIDMIN'
                Title.Caption = 'MASTERSECIDMIN'
                Width = 110
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'CTYAPP_MASTERSECIDMAX'
                Title.Caption = 'MASTERSECIDMAX'
                Width = 110
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'CTYAPP_BUSECIDMIN'
                Title.Caption = 'BUSECIDMIN'
                Width = 100
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'CTYAPP_BUSECIDMAX'
                Title.Caption = 'BUSECIDMAX'
                Width = 100
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'CTYAPP_REPEATQTY'
                Title.Caption = 'REPEATQTY'
                Width = 100
                Visible = True
              end>
          end
        end
        object TabSheet10: TTabSheet
          Caption = 'Empresas'
          ImageIndex = 10
          object Label58: TLabel
            Tag = 1722
            Left = 20
            Top = 3
            Width = 56
            Height = 13
            Caption = 'Dispon'#237'veis'
          end
          object Label59: TLabel
            Tag = 1725
            Left = 344
            Top = 3
            Width = 64
            Height = 13
            Caption = 'Selecionadas'
          end
          object SpeedButton16: TSpeedButton
            Left = 615
            Top = 59
            Width = 98
            Height = 32
            Action = actTPXAppsOk
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
          object SpeedButton17: TSpeedButton
            Left = 615
            Top = 107
            Width = 98
            Height = 32
            Action = actTPXAppsCancel
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
          object CoolBar7: TCoolBar
            Left = 288
            Top = 32
            Width = 27
            Height = 107
            Align = alNone
            AutoSize = True
            Bands = <
              item
                Control = ToolBar7
                ImageIndex = -1
                MinHeight = 23
                Width = 103
              end>
            Vertical = True
            object ToolBar7: TToolBar
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
              object ToolButton10: TToolButton
                Left = 0
                Top = 2
                Action = actAddAllTPXApps
                ParentShowHint = False
                Wrap = True
                ShowHint = True
              end
              object ToolButton11: TToolButton
                Left = 0
                Top = 24
                Action = actAddOneTPXApps
                ParentShowHint = False
                Wrap = True
                ShowHint = True
              end
              object ToolButton13: TToolButton
                Left = 0
                Top = 46
                Action = actDelOneTPXApps
                ParentShowHint = False
                Wrap = True
                ShowHint = True
              end
              object ToolButton14: TToolButton
                Left = 0
                Top = 68
                Action = actDelAllTPXApps
                ParentShowHint = False
                ShowHint = True
              end
            end
          end
          object lstDispTPXApps: TListBox
            Left = 20
            Top = 16
            Width = 241
            Height = 137
            DragMode = dmAutomatic
            ItemHeight = 13
            MultiSelect = True
            TabOrder = 1
            OnDragDrop = lbDisponiveisDragDrop
            OnDragOver = lbDisponiveisDragOver
          end
          object lstSelecTPXApps: TListBox
            Left = 344
            Top = 16
            Width = 241
            Height = 137
            DragMode = dmAutomatic
            ItemHeight = 13
            MultiSelect = True
            TabOrder = 2
            OnDragDrop = lbSelecionadasDragDrop
            OnDragOver = lbSelecionadasDragOver
          end
          object dbgTPXApps: TDBGrid
            Left = 0
            Top = 0
            Width = 1128
            Height = 0
            Align = alClient
            DataSource = dmSys1.dtsTPXApps
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
                Title.Caption = 'Validator Actions'
                Width = 200
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'TPAPP_STATUS'
                Width = 200
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'TPAPP_REGDATE'
                Width = 200
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'TPAPP_REGUSER'
                Width = 200
                Visible = True
              end>
          end
        end
        object TabSheet11: TTabSheet
          Caption = 'Tipos de Usu'#225'rios'
          ImageIndex = 11
          object SpeedButton18: TSpeedButton
            Left = 615
            Top = 59
            Width = 98
            Height = 32
            Action = actUTXAppsOK
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
          object SpeedButton19: TSpeedButton
            Left = 615
            Top = 107
            Width = 98
            Height = 32
            Action = actUTXAppsCancel
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
          object Label60: TLabel
            Tag = 1725
            Left = 344
            Top = 3
            Width = 64
            Height = 13
            Caption = 'Selecionadas'
          end
          object Label61: TLabel
            Tag = 1722
            Left = 20
            Top = 3
            Width = 56
            Height = 13
            Caption = 'Dispon'#237'veis'
          end
          object lstSelecUTXApps: TListBox
            Left = 344
            Top = 16
            Width = 241
            Height = 137
            DragMode = dmAutomatic
            ItemHeight = 13
            MultiSelect = True
            TabOrder = 1
            OnDragDrop = lbSelecionadasDragDrop
            OnDragOver = lbSelecionadasDragOver
          end
          object CoolBar8: TCoolBar
            Left = 288
            Top = 32
            Width = 27
            Height = 107
            Align = alNone
            AutoSize = True
            Bands = <
              item
                Control = ToolBar8
                ImageIndex = -1
                MinHeight = 23
                Width = 103
              end>
            Vertical = True
            object ToolBar8: TToolBar
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
              object ToolButton15: TToolButton
                Left = 0
                Top = 2
                Action = actAddAllUTXApps
                ParentShowHint = False
                Wrap = True
                ShowHint = True
              end
              object ToolButton16: TToolButton
                Left = 0
                Top = 24
                Action = actAddOneUTXApps
                ParentShowHint = False
                Wrap = True
                ShowHint = True
              end
              object ToolButton17: TToolButton
                Left = 0
                Top = 46
                Action = actDelOneUTXApps
                ParentShowHint = False
                Wrap = True
                ShowHint = True
              end
              object ToolButton18: TToolButton
                Left = 0
                Top = 68
                Action = actDelAllUTXApps
                ParentShowHint = False
                ShowHint = True
              end
            end
          end
          object lstDispUTXApps: TListBox
            Left = 20
            Top = 16
            Width = 241
            Height = 137
            DragMode = dmAutomatic
            ItemHeight = 13
            MultiSelect = True
            TabOrder = 3
            OnDragDrop = lbDisponiveisDragDrop
            OnDragOver = lbDisponiveisDragOver
          end
          object dbgUTXApps: TDBGrid
            Left = 0
            Top = 0
            Width = 1128
            Height = 0
            Align = alClient
            DataSource = dmSys1.dtsUserTypesXApps
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
                FieldName = 'UT_DESC'
                Title.Caption = 'Validator Actions'
                Width = 400
                Visible = True
              end>
          end
        end
        object tabApplicationsXLineMT: TTabSheet
          Caption = 'Excess'#245'es de Linhas'
          ImageIndex = 12
          object SpeedButton20: TSpeedButton
            Left = 615
            Top = 107
            Width = 98
            Height = 32
            Action = actAppxLineMTCancel
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
          object SpeedButton21: TSpeedButton
            Left = 615
            Top = 59
            Width = 98
            Height = 32
            Action = actAppxLineMTOk
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
          object Label72: TLabel
            Tag = 1725
            Left = 344
            Top = -1
            Width = 64
            Height = 13
            Caption = 'Selecionadas'
          end
          object Label73: TLabel
            Tag = 1722
            Left = 20
            Top = -1
            Width = 56
            Height = 13
            Caption = 'Dispon'#237'veis'
          end
          object CoolBar4: TCoolBar
            Left = 292
            Top = 40
            Width = 27
            Height = 107
            Align = alNone
            AutoSize = True
            Bands = <
              item
                Control = ToolBar4
                ImageIndex = -1
                MinHeight = 23
                Width = 103
              end>
            Vertical = True
            object ToolBar4: TToolBar
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
              object ToolButton2: TToolButton
                Left = 0
                Top = 2
                Action = actAddAllAppxLineMT
                ParentShowHint = False
                Wrap = True
                ShowHint = True
              end
              object ToolButton3: TToolButton
                Left = 0
                Top = 24
                Action = actAddOneAppxLineMT
                ParentShowHint = False
                Wrap = True
                ShowHint = True
              end
              object ToolButton6: TToolButton
                Left = 0
                Top = 46
                Action = actDelOneAppxLineMT
                ParentShowHint = False
                Wrap = True
                ShowHint = True
              end
              object ToolButton7: TToolButton
                Left = 0
                Top = 68
                Action = actDelAllAppxLineMT
                ParentShowHint = False
                ShowHint = True
              end
            end
          end
          object lstSelecAppxLineMT: TListBox
            Left = 344
            Top = 16
            Width = 241
            Height = 137
            DragMode = dmAutomatic
            ItemHeight = 13
            MultiSelect = True
            TabOrder = 2
            OnDragDrop = lbSelecionadasDragDrop
            OnDragOver = lbSelecionadasDragOver
          end
          object lstDispAppxLineMT: TListBox
            Left = 20
            Top = 16
            Width = 241
            Height = 137
            DragMode = dmAutomatic
            ItemHeight = 13
            MultiSelect = True
            TabOrder = 3
            OnDragDrop = lbDisponiveisDragDrop
            OnDragOver = lbDisponiveisDragOver
          end
          object dbgAppsxLineMt: TDBGrid
            Left = 0
            Top = 0
            Width = 1128
            Height = 0
            Align = alClient
            DataSource = dmSys1.dtsApplicationsXLineMT
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
                FieldName = 'LM_DESC'
                Title.Caption = 'Linha'
                Width = 350
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'APPLM_REGDATE'
                Title.Caption = 'Data de Registro'
                Width = 100
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'APPLM_REGUSER'
                Title.Caption = 'Usu'#225'rio'
                Width = 150
                Visible = True
              end>
          end
        end
        object tabvehicletypesxapplications: TTabSheet
          Caption = 'Ve'#237'culo por Aplica'#231#227'o'
          ImageIndex = 13
          object dbgTransprovXVehTypesXApps: TDBGrid
            Left = 0
            Top = 0
            Width = 1070
            Height = 146
            Align = alClient
            DataSource = DmSys.dtsTransprovXVehTypesXApps
            TabOrder = 0
            TitleFont.Charset = DEFAULT_CHARSET
            TitleFont.Color = clWindowText
            TitleFont.Height = -11
            TitleFont.Name = 'MS Sans Serif'
            TitleFont.Style = []
            Columns = <
              item
                Expanded = False
                FieldName = 'VEHT_DESC'
                Title.Caption = 'Tipo de Ve'#237'culo'
                Width = 150
                Visible = True
              end
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
        Top = 481
        Width = 27
        Height = 3
        Align = alLeft
        AutoSize = True
        Bands = <
          item
            Control = tbCardsApps
            ImageIndex = -1
            MinHeight = 23
            Width = 9
          end>
        Vertical = True
        object tbCardsApps: TToolBar
          Left = 0
          Top = 9
          Width = 23
          Height = 0
          Align = alClient
          Caption = 'tbCardsApps'
          Images = imglstBase
          TabOrder = 0
          object tbtnNewCardApp: TToolButton
            Left = 0
            Top = 2
            Action = actInsertSubApp
            ParentShowHint = False
            Wrap = True
            ShowHint = True
          end
          object tbtnEditCardApp: TToolButton
            Left = 0
            Top = 24
            Action = actEditSubApp
            ParentShowHint = False
            Wrap = True
            ShowHint = True
          end
          object tbtnDeletePeriod: TToolButton
            Left = 0
            Top = 46
            Action = actDeleteSubApp
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
  inherited imglstBase: TImageList
    Left = 120
    Top = 208
  end
  inherited actlstBase: TActionList
    Left = 88
    Top = 208
    inherited actFilter: TAction
      OnExecute = actFilterExecute
    end
    object actOKVS: TAction
      Tag = 1714
      Category = 'ValidatorStates'
      Caption = 'OK'
      ImageIndex = 4
      OnExecute = actOKVSExecute
    end
    object actCancelVS: TAction
      Tag = 1713
      Category = 'ValidatorStates'
      Caption = 'Cancelar'
      ImageIndex = 6
      OnExecute = actCancelVSExecute
    end
    object actOKStrings: TAction
      Category = 'Strings'
      Caption = 'OK'
      ImageIndex = 4
      OnExecute = actOKStringsExecute
    end
    object actCancelStrings: TAction
      Category = 'Strings'
      Caption = 'Cancelar'
      ImageIndex = 6
      OnExecute = actCancelStringsExecute
    end
    object actVSAddAll: TAction
      Tag = 2741
      Category = 'ValidatorStates'
      Caption = 'actVSAddAll'
      ImageIndex = 21
      OnExecute = actVSAddAllExecute
    end
    object actVSAdd: TAction
      Tag = 2742
      Category = 'ValidatorStates'
      Caption = 'actVSAdd'
      ImageIndex = 22
      OnExecute = actVSAddExecute
    end
    object actVSDelAll: TAction
      Tag = 2743
      Category = 'ValidatorStates'
      Caption = 'actVSDelAll'
      ImageIndex = 23
      OnExecute = actVSDelAllExecute
    end
    object actVSDel: TAction
      Tag = 2744
      Category = 'ValidatorStates'
      Caption = 'actVSDel'
      ImageIndex = 24
      OnExecute = actVSDelExecute
    end
    object actVVAAddAll: TAction
      Tag = 2754
      Category = 'ValidatorVisualActions'
      Caption = 'actVVAAddAll'
      ImageIndex = 21
      OnExecute = actVVAAddAllExecute
    end
    object actVVAAdd: TAction
      Tag = 2755
      Category = 'ValidatorVisualActions'
      Caption = 'actVVAAdd'
      ImageIndex = 22
      OnExecute = actVVAAddExecute
    end
    object actVVADelAll: TAction
      Tag = 2759
      Category = 'ValidatorVisualActions'
      Caption = 'actVVADelAll'
      ImageIndex = 23
      OnExecute = actVVADelAllExecute
    end
    object actVVADel: TAction
      Tag = 2756
      Category = 'ValidatorVisualActions'
      Caption = 'actVVADel'
      ImageIndex = 24
      OnExecute = actVVADelExecute
    end
    object actVVAOK: TAction
      Tag = 1723
      Category = 'ValidatorVisualActions'
      Caption = 'actVVAOK'
      ImageIndex = 4
      OnExecute = actVVAOKExecute
    end
    object actVVACancel: TAction
      Tag = 1724
      Category = 'ValidatorVisualActions'
      Caption = 'actVVACancel'
      ImageIndex = 6
      OnExecute = actVVACancelExecute
    end
    object actVCOK: TAction
      Tag = 1723
      Category = 'ValidatorConditions'
      Caption = 'actVCOK'
      ImageIndex = 4
      OnExecute = actVCOKExecute
    end
    object actVCCancel: TAction
      Tag = 1724
      Category = 'ValidatorConditions'
      Caption = 'actVCCancel'
      ImageIndex = 6
      OnExecute = actVCCancelExecute
    end
    object actVCAddAll: TAction
      Tag = 2770
      Category = 'ValidatorConditions'
      Caption = 'actVCAddAll'
      ImageIndex = 21
      OnExecute = actVCAddAllExecute
    end
    object actVCAdd: TAction
      Tag = 2771
      Category = 'ValidatorConditions'
      Caption = 'actVCAdd'
      ImageIndex = 22
      OnExecute = actVCAddExecute
    end
    object actVCDel: TAction
      Tag = 2773
      Category = 'ValidatorConditions'
      Caption = 'actVCDel'
      ImageIndex = 24
      OnExecute = actVCDelExecute
    end
    object actVCDelAll: TAction
      Tag = 2772
      Category = 'ValidatorConditions'
      Caption = 'actVCDelAll'
      ImageIndex = 23
      OnExecute = actVCDelAllExecute
    end
    object actVAOK: TAction
      Tag = 1723
      Category = 'ValidatorActions'
      Caption = 'actVAOK'
      ImageIndex = 4
      OnExecute = actVAOKExecute
    end
    object actVACancel: TAction
      Tag = 1724
      Category = 'ValidatorActions'
      Caption = 'actVACancel'
      ImageIndex = 6
      OnExecute = actVACancelExecute
    end
    object actVAAddAll: TAction
      Tag = 2786
      Category = 'ValidatorActions'
      Caption = 'actVAAddAll'
      ImageIndex = 21
      OnExecute = actVAAddAllExecute
    end
    object actVAAdd: TAction
      Tag = 2787
      Category = 'ValidatorActions'
      Caption = 'actVAAdd'
      ImageIndex = 22
      OnExecute = actVAAddExecute
    end
    object actVADel: TAction
      Tag = 2789
      Category = 'ValidatorActions'
      Caption = 'actVADel'
      ImageIndex = 24
      OnExecute = actVADelExecute
    end
    object actVADelAll: TAction
      Tag = 2788
      Category = 'ValidatorActions'
      Caption = 'actVADelAll'
      ImageIndex = 23
      OnExecute = actVADelAllExecute
    end
    object actSubAppOK: TAction
      Tag = 1723
      Category = 'SubAplication'
      Caption = 'OK'
      ImageIndex = 4
      OnExecute = actSubAppOKExecute
    end
    object actSupAppCancel: TAction
      Tag = 1724
      Category = 'SubAplication'
      Caption = 'Cancelar'
      ImageIndex = 6
      OnExecute = actSupAppCancelExecute
    end
    object actInsertSubApp: TAction
      Tag = 1200
      Category = 'SubAplication'
      Caption = 'actInsertSubApp'
      ImageIndex = 16
      OnExecute = actInsertSubAppExecute
    end
    object actEditSubApp: TAction
      Tag = 2784
      Category = 'SubAplication'
      Caption = 'actEditsubApp'
      ImageIndex = 10
      OnExecute = actEditSubAppExecute
    end
    object actDeleteSubApp: TAction
      Tag = 1203
      Category = 'SubAplication'
      Caption = 'actDeleteSubApp'
      ImageIndex = 6
      OnExecute = actDeleteSubAppExecute
    end
    object actOkVersion: TAction
      Category = 'Version'
      Caption = 'actOkVersion'
      OnExecute = actOkVersionExecute
    end
    object actCancelVersion: TAction
      Category = 'Version'
      Caption = 'actCancelVersion'
      OnExecute = actCancelVersionExecute
    end
    object actAddAllCardDesign: TAction
      Category = 'CardDesign'
      Caption = 'actAddAllCardDesign'
      ImageIndex = 21
      OnExecute = actAddAllCardDesignExecute
    end
    object actAddOneCardDesign: TAction
      Category = 'CardDesign'
      Caption = 'actAddOneCardDesign'
      ImageIndex = 22
      OnExecute = actAddOneCardDesignExecute
    end
    object actDelAllCardDesign: TAction
      Category = 'CardDesign'
      Caption = 'actDelAllCardDesign'
      ImageIndex = 23
      OnExecute = actDelAllCardDesignExecute
    end
    object actDelOneCardDesign: TAction
      Category = 'CardDesign'
      Caption = 'actDelOneCardDesign'
      ImageIndex = 24
      OnExecute = actDelOneCardDesignExecute
    end
    object actCardDesignOK: TAction
      Tag = 1723
      Category = 'CardDesign'
      Caption = 'actCardDesignOK'
      ImageIndex = 4
      OnExecute = actCardDesignOKExecute
    end
    object actCardDesignCancel: TAction
      Tag = 1724
      Category = 'CardDesign'
      Caption = 'actCardDesignCancel'
      ImageIndex = 6
      OnExecute = actCardDesignCancelExecute
    end
    object actAddAllCTXApplications: TAction
      Category = 'CardTemplatesXApplications'
      Caption = 'actAddAllCTXApplications'
      ImageIndex = 21
    end
    object actAddOneCTXApplications: TAction
      Category = 'CardTemplatesXApplications'
      Caption = 'actAddOneCTXApplications'
      ImageIndex = 22
    end
    object actDellAllCTXApplications: TAction
      Category = 'CardTemplatesXApplications'
      Caption = 'actDellAllCTXApplications'
      ImageIndex = 23
    end
    object actDelOneCTXApplications: TAction
      Category = 'CardTemplatesXApplications'
      Caption = 'actDelOneCTXApplications'
      ImageIndex = 24
    end
    object actCTXApplicationsOK: TAction
      Tag = 1723
      Category = 'CardTemplatesXApplications'
      Caption = 'actCTXApplicationsOK'
      ImageIndex = 4
      OnExecute = actCTXApplicationsOKExecute
    end
    object actCTXApplicationsCancel: TAction
      Tag = 1724
      Category = 'CardTemplatesXApplications'
      Caption = 'actCTXApplicationsCancel'
      ImageIndex = 6
      OnExecute = actCTXApplicationsCancelExecute
    end
    object actOkCardTypesXApps: TAction
      Tag = 1723
      Category = 'CardTypesXApps'
      Caption = 'actOkCardTypesXApps'
      ImageIndex = 4
      OnExecute = actOkCardTypesXAppsExecute
    end
    object actCancelCardTypesxApps: TAction
      Tag = 1724
      Category = 'CardTypesXApps'
      Caption = 'actCancelCardTypesxApps'
      ImageIndex = 6
      OnExecute = actCancelCardTypesxAppsExecute
    end
    object actAddAllTPXApps: TAction
      Category = 'TPXApps'
      Caption = 'actAddAllTPXApps'
      ImageIndex = 21
      OnExecute = actAddAllTPXAppsExecute
    end
    object actAddOneTPXApps: TAction
      Category = 'TPXApps'
      Caption = 'actAddOneTPXApps'
      ImageIndex = 22
      OnExecute = actAddOneTPXAppsExecute
    end
    object actDelAllTPXApps: TAction
      Category = 'TPXApps'
      Caption = 'actDelAllTPXApps'
      ImageIndex = 23
      OnExecute = actDelAllTPXAppsExecute
    end
    object actDelOneTPXApps: TAction
      Category = 'TPXApps'
      Caption = 'actDelOneTPXApps'
      ImageIndex = 24
      OnExecute = actDelOneTPXAppsExecute
    end
    object actTPXAppsOk: TAction
      Tag = 1723
      Category = 'TPXApps'
      Caption = 'actTPXAppsOk'
      ImageIndex = 4
      OnExecute = actTPXAppsOkExecute
    end
    object actTPXAppsCancel: TAction
      Tag = 1724
      Category = 'TPXApps'
      Caption = 'actTPXAppsCancel'
      ImageIndex = 6
      OnExecute = actTPXAppsCancelExecute
    end
    object actAddAllUTXApps: TAction
      Category = 'UTXApps'
      Caption = 'actAddAllUTXApps'
      ImageIndex = 21
      OnExecute = actAddAllUTXAppsExecute
    end
    object actAddOneUTXApps: TAction
      Category = 'UTXApps'
      Caption = 'actAddOneUTXApps'
      ImageIndex = 22
      OnExecute = actAddOneUTXAppsExecute
    end
    object actDelAllUTXApps: TAction
      Category = 'UTXApps'
      Caption = 'actDelAllUTXApps'
      ImageIndex = 23
      OnExecute = actDelAllUTXAppsExecute
    end
    object actDelOneUTXApps: TAction
      Category = 'UTXApps'
      Caption = 'actDelOneUTXApps'
      ImageIndex = 24
      OnExecute = actDelOneUTXAppsExecute
    end
    object actUTXAppsOK: TAction
      Tag = 1723
      Category = 'UTXApps'
      Caption = 'actUTXAppsOK'
      ImageIndex = 4
      OnExecute = actUTXAppsOKExecute
    end
    object actUTXAppsCancel: TAction
      Tag = 1724
      Category = 'UTXApps'
      Caption = 'actUTXAppsCancel'
      ImageIndex = 6
      OnExecute = actUTXAppsCancelExecute
    end
    object actAppxLineMTOk: TAction
      Tag = 1714
      Category = 'ApplicationsXLineMT'
      Caption = 'actAppxLineMTOk'
      ImageIndex = 4
      OnExecute = actAppxLineMTOkExecute
    end
    object actAppxLineMTCancel: TAction
      Tag = 1713
      Category = 'ApplicationsXLineMT'
      Caption = 'actAppxLineMTCancel'
      ImageIndex = 6
      OnExecute = actAppxLineMTCancelExecute
    end
    object actAddAllAppxLineMT: TAction
      Category = 'ApplicationsXLineMT'
      Caption = 'actAddAllAppxLineMT'
      ImageIndex = 21
      OnExecute = actAddAllAppxLineMTExecute
    end
    object actAddOneAppxLineMT: TAction
      Category = 'ApplicationsXLineMT'
      Caption = 'actAddOneAppxLineMT'
      ImageIndex = 22
      OnExecute = actAddOneAppxLineMTExecute
    end
    object actDelAllAppxLineMT: TAction
      Category = 'ApplicationsXLineMT'
      Caption = 'actDelAllAppxLineMT'
      ImageIndex = 23
      OnExecute = actDelAllAppxLineMTExecute
    end
    object actDelOneAppxLineMT: TAction
      Category = 'ApplicationsXLineMT'
      Caption = 'actDelOneAppxLineMT'
      ImageIndex = 24
      OnExecute = actDelOneAppxLineMTExecute
    end
  end
  inherited dtsMaster: TDataSource
    Left = 57
    Top = 208
  end
  inherited mMnuBase: TMainMenu
    Left = 25
    Top = 208
  end
end
