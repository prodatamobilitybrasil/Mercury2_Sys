object FrmNewIntegration: TFrmNewIntegration
  Tag = 45
  Left = 245
  Top = 116
  BorderIcons = []
  BorderStyle = bsSingle
  Caption = 'Nova Integra'#231#227'o'
  ClientHeight = 628
  ClientWidth = 767
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  Position = poDesktopCenter
  OnCreate = FormCreate
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object gbOrigem: TGroupBox
    Tag = 2175
    Left = 0
    Top = 0
    Width = 767
    Height = 75
    Align = alTop
    Caption = ' Origem '
    TabOrder = 0
    object Label2: TLabel
      Tag = 2176
      Left = 32
      Top = 21
      Width = 21
      Height = 13
      Caption = 'Tipo'
      FocusControl = dbTipo
    end
    object Label3: TLabel
      Tag = 2177
      Left = 197
      Top = 21
      Width = 88
      Height = 13
      Caption = 'Linha / Integra'#231#227'o'
      FocusControl = dbLinhaInteg
    end
    object Label4: TLabel
      Tag = 1061
      Left = 576
      Top = 21
      Width = 36
      Height = 13
      Caption = 'Sentido'
      FocusControl = db_Orig_Dir
    end
    object dbTipo: TComboBox
      Left = 32
      Top = 37
      Width = 145
      Height = 21
      ItemHeight = 13
      TabOrder = 0
      OnChange = dbTipoChange
      Items.Strings = (
        'Linha'
        'Integra'#231#227'o')
    end
    object db_Orig_Dir: TRxDBLookupCombo
      Left = 576
      Top = 37
      Width = 145
      Height = 21
      DropDownCount = 8
      LookupField = 'IDR_ID'
      LookupDisplay = 'IDR_DESC'
      LookupSource = dmSys1.dtsIntegrationDirections
      TabOrder = 2
      OnChange = db_Orig_DirChange
    end
    object dbLinhaInteg: TComboEdit
      Left = 197
      Top = 37
      Width = 361
      Height = 21
      ButtonHint = 'Ctrl+O'
      CharCase = ecUpperCase
      ClickKey = 16463
      Glyph.Data = {
        36030000424D3603000000000000360000002800000010000000100000000100
        18000000000000030000120B0000120B00000000000000000000FF00FFFF00FF
        FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
        FFFF00FFFF00FFFF00FFFF00FF1696CB1F9FD11293CBFF00FFFF00FFFF00FFFF
        00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF1696CB
        9AF3FB6CEAF830B1DC30B1DC30B1DC1FA0D31395CBFF00FFFF00FFFF00FFFF00
        FFFF00FFFF00FFFF00FFFF00FF1696CB90E2F287FFFF7FFBFF81FAFF7DF4FF74
        EEFE69E3F830B1DC30B1DC23A5D5FF00FFFF00FFFF00FFFF00FFFF00FF1696CB
        72CBE696FEFF77F6FF78F3FF77F2FF76F2FF76F0FF77F0FF7DF3FF5AD3F2199A
        D0FF00FFFF00FFFF00FFFF00FF1696CB1696CB95EBF878F8FF78F3FF77F2FF75
        F0FF74EEFE72EDFE73EDFF5CD5F33CBBE3FF00FFFF00FFFF00FFFF00FF1696CB
        60DDF01696CB87FEFF74F4FF75F3FF73F0FF74EEFE72EDFE73EDFF57D3F25ED8
        F3189CCFFF00FFFF00FFFF00FF1696CB7AF7FC1696CB92E2F292EBF88EEDFA8A
        F4FF73EFFF70EDFE73EDFF55CFEF0159043EBFE3FF00FFFF00FFFF00FF1696CB
        86FEFF6CEEFA1696CB1696CB1696CB1696CB9AEEFA77F0FF6EEEFF01590441E0
        730159040F92CAFF00FFFF00FF1696CB82FBFF7EFAFF7DFAFF7DF8FF77F4FF51
        D4EF1696CB88DAF001590436CB5F2DC5511CB035015904FF00FFFF00FF1696CB
        83FCFF7BF8FF79F6FF78F3FF79F4FF7AF7FF6AEAFC1696CB1696CB0A73121CB0
        330A80131F9ACFFF00FFFF00FF1696CB8EFFFF7BFBFF79F7FF7AF6FF76E7F877
        E6F87DE9FB7EEDFC82F0FF04670A0C9A18036906FF00FFFF00FFFF00FF1392CA
        1696CB87F2FA88F4FC6CE3F61899CE1392CA1696CB1797CC1D9CCF04770A0589
        0CFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF1696CB1C99CE1898CCFF00FFFF
        00FFFF00FFFF00FF036F07058A0C036706FF00FFFF00FFFF00FFFF00FFFF00FF
        FF00FFFF00FFFF00FFFF00FFFF00FF015603035E06046F0A037308025F05FF00
        FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
        00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF}
      ButtonWidth = 28
      NumGlyphs = 1
      TabOrder = 1
      OnButtonClick = dbLinhaIntegButtonClick
      OnKeyPress = dbLinhaIntegKeyPress
    end
  end
  object GroupBox2: TGroupBox
    Tag = 2179
    Left = 0
    Top = 75
    Width = 767
    Height = 74
    Align = alTop
    Caption = ' Destino '
    TabOrder = 1
    object Label6: TLabel
      Tag = 2180
      Left = 32
      Top = 22
      Width = 32
      Height = 13
      Caption = 'Linha  '
      FocusControl = dbLines
    end
    object Label7: TLabel
      Tag = 1061
      Left = 416
      Top = 22
      Width = 36
      Height = 13
      Caption = 'Sentido'
      FocusControl = db_Dest_Dir
    end
    object db_Dest_Dir: TRxDBLookupCombo
      Left = 416
      Top = 38
      Width = 145
      Height = 21
      DropDownCount = 8
      Enabled = False
      LookupField = 'IDR_ID'
      LookupDisplay = 'IDR_DESC'
      LookupSource = dmSys1.dtsIntegrationDirections
      TabOrder = 1
    end
    object dbLines: TComboEdit
      Left = 32
      Top = 38
      Width = 361
      Height = 21
      ButtonHint = 'Ctrl+D'
      CharCase = ecUpperCase
      ClickKey = 16452
      Enabled = False
      Glyph.Data = {
        36030000424D3603000000000000360000002800000010000000100000000100
        18000000000000030000120B0000120B00000000000000000000FF00FFFF00FF
        FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
        FFFF00FFFF00FFFF00FFFF00FF1696CB1F9FD11293CBFF00FFFF00FFFF00FFFF
        00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF1696CB
        9AF3FB6CEAF830B1DC30B1DC30B1DC1FA0D31395CBFF00FFFF00FFFF00FFFF00
        FFFF00FFFF00FFFF00FFFF00FF1696CB90E2F287FFFF7FFBFF81FAFF7DF4FF74
        EEFE69E3F830B1DC30B1DC23A5D5FF00FFFF00FFFF00FFFF00FFFF00FF1696CB
        72CBE696FEFF77F6FF78F3FF77F2FF76F2FF76F0FF77F0FF7DF3FF5AD3F2199A
        D0FF00FFFF00FFFF00FFFF00FF1696CB1696CB95EBF878F8FF78F3FF77F2FF75
        F0FF74EEFE72EDFE73EDFF5CD5F33CBBE3FF00FFFF00FFFF00FFFF00FF1696CB
        60DDF01696CB87FEFF74F4FF75F3FF73F0FF74EEFE72EDFE73EDFF57D3F25ED8
        F3189CCFFF00FFFF00FFFF00FF1696CB7AF7FC1696CB92E2F292EBF88EEDFA8A
        F4FF73EFFF70EDFE73EDFF55CFEF0159043EBFE3FF00FFFF00FFFF00FF1696CB
        86FEFF6CEEFA1696CB1696CB1696CB1696CB9AEEFA77F0FF6EEEFF01590441E0
        730159040F92CAFF00FFFF00FF1696CB82FBFF7EFAFF7DFAFF7DF8FF77F4FF51
        D4EF1696CB88DAF001590436CB5F2DC5511CB035015904FF00FFFF00FF1696CB
        83FCFF7BF8FF79F6FF78F3FF79F4FF7AF7FF6AEAFC1696CB1696CB0A73121CB0
        330A80131F9ACFFF00FFFF00FF1696CB8EFFFF7BFBFF79F7FF7AF6FF76E7F877
        E6F87DE9FB7EEDFC82F0FF04670A0C9A18036906FF00FFFF00FFFF00FF1392CA
        1696CB87F2FA88F4FC6CE3F61899CE1392CA1696CB1797CC1D9CCF04770A0589
        0CFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF1696CB1C99CE1898CCFF00FFFF
        00FFFF00FFFF00FF036F07058A0C036706FF00FFFF00FFFF00FFFF00FFFF00FF
        FF00FFFF00FFFF00FFFF00FFFF00FF015603035E06046F0A037308025F05FF00
        FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
        00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF}
      ButtonWidth = 28
      NumGlyphs = 1
      TabOrder = 0
      OnButtonClick = dbLinesButtonClick
      OnKeyPress = dbLinesKeyPress
    end
  end
  object GroupBox3: TGroupBox
    Tag = 2182
    Left = 0
    Top = 149
    Width = 767
    Height = 74
    Align = alTop
    Caption = ' Dados da Integra'#231#227'o '
    TabOrder = 2
    object Label8: TLabel
      Tag = 2183
      Left = 457
      Top = 18
      Width = 24
      Height = 13
      Caption = 'Valor'
      FocusControl = dbValor
    end
    object Label9: TLabel
      Tag = 2184
      Left = 233
      Top = 22
      Width = 33
      Height = 13
      Caption = 'Tempo'
      FocusControl = edTempo
    end
    object Label1: TLabel
      Tag = 2185
      Left = 324
      Top = 43
      Width = 23
      Height = 14
      Caption = 'Min.'
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Arial'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Label5: TLabel
      Left = 32
      Top = 22
      Width = 21
      Height = 13
      Caption = 'Tipo'
    end
    object dbValor: TCurrencyEdit
      Left = 457
      Top = 34
      Width = 121
      Height = 21
      AutoSize = False
      DisplayFormat = '0.00;-0.00'
      Enabled = False
      TabOrder = 0
    end
    object edTempo: TCurrencyEdit
      Left = 233
      Top = 38
      Width = 81
      Height = 21
      AutoSize = False
      DecimalPlaces = 0
      DisplayFormat = '0'
      Enabled = False
      TabOrder = 1
    end
    object cbIntegType: TComboBox
      Left = 32
      Top = 38
      Width = 177
      Height = 22
      Style = csOwnerDrawFixed
      ItemHeight = 16
      ItemIndex = 0
      TabOrder = 2
      Text = 'INTEGRA'#199#195'O'
      Items.Strings = (
        'INTEGRA'#199#195'O'
        'TRANSFER'#202'NCIA')
    end
  end
  object GroupBox4: TGroupBox
    Tag = 2186
    Left = 0
    Top = 223
    Width = 767
    Height = 162
    Align = alTop
    Caption = ' Detalhes '
    TabOrder = 3
    object Label10: TLabel
      Tag = 3463
      Left = 472
      Top = 24
      Width = 111
      Height = 13
      Caption = 'Data In'#237'cio de validade'
    end
    object Label11: TLabel
      Left = 635
      Top = 24
      Width = 24
      Height = 13
      Caption = 'Valor'
    end
    object lblLineIntegTimeGroup: TLabel
      Tag = 3473
      Left = 472
      Top = 72
      Width = 80
      Height = 13
      Caption = 'Grupo de Tempo'
      FocusControl = lkpLineIntegTimeGroup
    end
    object cbDetails: TCoolBar
      Left = 2
      Top = 15
      Width = 27
      Height = 145
      Align = alLeft
      AutoSize = True
      Bands = <
        item
          Control = tbDetails
          ImageIndex = -1
          MinHeight = 23
          Width = 141
        end>
      Vertical = True
      object tbDetails: TToolBar
        Left = 0
        Top = 9
        Width = 23
        Height = 132
        Align = alClient
        Caption = 'tbDetails'
        Images = FrmLineIntegration.imglstBase
        TabOrder = 0
        object tbtnNewDetail: TToolButton
          Tag = 1
          Left = 0
          Top = 2
          ImageIndex = 16
          ParentShowHint = False
          Wrap = True
          ShowHint = True
          OnClick = ButtonLineDetailClick
        end
        object tbtnEditDetail: TToolButton
          Tag = 2
          Left = 0
          Top = 24
          ImageIndex = 10
          ParentShowHint = False
          Wrap = True
          ShowHint = True
          OnClick = ButtonLineDetailClick
        end
        object tbtnDeleteDetail: TToolButton
          Tag = 3
          Left = 0
          Top = 46
          ImageIndex = 9
          ParentShowHint = False
          ShowHint = True
          OnClick = ButtonLineDetailClick
        end
      end
    end
    object edtLIDDate: TDBDateEdit
      Left = 472
      Top = 40
      Width = 141
      Height = 21
      DataField = 'LID_DATE'
      DataSource = dmSys1.dtsLineIntegrationDT
      DefaultToday = True
      DialogTitle = 'Selectione a Data'
      Enabled = False
      NumGlyphs = 2
      TabOrder = 1
      YearDigits = dyFour
    end
    object btnLIDSaveDetail: TBitBtn
      Left = 540
      Top = 120
      Width = 85
      Height = 33
      Caption = '&Gravar'
      TabOrder = 2
      Visible = False
      OnClick = ButtonLineDetailOkCancelClick
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
    object btnLIDCancelDetail: TBitBtn
      Left = 636
      Top = 120
      Width = 85
      Height = 33
      Caption = '&Cancelar'
      TabOrder = 3
      Visible = False
      OnClick = ButtonLineDetailOkCancelClick
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
    object edtLIDIntegValue: TRxDBCalcEdit
      Left = 636
      Top = 40
      Width = 121
      Height = 21
      DataField = 'LID_INTEGVALUE'
      DataSource = dmSys1.dtsLineIntegrationDT
      Enabled = False
      ButtonWidth = 0
      NumGlyphs = 2
      TabOrder = 4
    end
    object grdLineIntegrationDT: TDBGrid
      Left = 29
      Top = 15
      Width = 432
      Height = 145
      Align = alLeft
      DataSource = dmSys1.dtsLineIntegrationDT
      Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgConfirmDelete, dgCancelOnExit]
      TabOrder = 5
      TitleFont.Charset = DEFAULT_CHARSET
      TitleFont.Color = clWindowText
      TitleFont.Height = -11
      TitleFont.Name = 'MS Sans Serif'
      TitleFont.Style = []
      OnCellClick = grdLineIntegrationDTCellClick
      Columns = <
        item
          Expanded = False
          FieldName = 'LID_DATE'
          Title.Caption = 'DATA'
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'LID_INTEGVALUE'
          Title.Caption = 'VALOR'
          Width = 50
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'LITG_DESC'
          Title.Caption = 'GRUPO'
          Width = 124
          Visible = True
        end>
    end
    object lkpLineIntegTimeGroup: TDBLookupComboBox
      Left = 472
      Top = 88
      Width = 285
      Height = 21
      DataField = 'LITG_ID'
      DataSource = dmSys1.dtsLineIntegrationDT
      Enabled = False
      KeyField = 'LITG_ID'
      ListField = 'LITG_DESC'
      ListSource = dmSys1.dtsLineIntegTimeGroups
      TabOrder = 6
    end
  end
  object Panel1: TPanel
    Left = 0
    Top = 581
    Width = 767
    Height = 47
    Align = alBottom
    BevelInner = bvLowered
    TabOrder = 4
    object BitBtn1: TBitBtn
      Left = 568
      Top = 8
      Width = 85
      Height = 33
      Action = actSaveIntegration
      Caption = '&OK'
      TabOrder = 0
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
    object BitBtn2: TBitBtn
      Left = 664
      Top = 8
      Width = 85
      Height = 33
      Action = actCancelIntegration
      Caption = '&Cancelar'
      TabOrder = 1
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
  end
  object GroupBox1: TGroupBox
    Left = 0
    Top = 385
    Width = 767
    Height = 196
    Align = alClient
    Caption = 'Aplica'#231#245'es'
    TabOrder = 5
    object Label13: TLabel
      Left = 627
      Top = 56
      Width = 24
      Height = 13
      Caption = 'Valor'
    end
    object Label14: TLabel
      Tag = 3467
      Left = 472
      Top = 96
      Width = 80
      Height = 13
      Caption = 'Grupo de Tempo'
      FocusControl = lkpLineIntegTimeGroup2
    end
    object Label15: TLabel
      Tag = 3468
      Left = 472
      Top = 16
      Width = 36
      Height = 13
      Caption = 'Emissor'
      FocusControl = lkpIssuer
    end
    object Label16: TLabel
      Tag = 1670
      Left = 624
      Top = 16
      Width = 47
      Height = 13
      Caption = 'Aplica'#231#227'o'
      FocusControl = lkpApplication
    end
    object CoolBar1: TCoolBar
      Left = 2
      Top = 15
      Width = 27
      Height = 179
      Align = alLeft
      AutoSize = True
      Bands = <
        item
          Control = ToolBar1
          ImageIndex = -1
          MinHeight = 23
          Width = 175
        end>
      Vertical = True
      object ToolBar1: TToolBar
        Left = 0
        Top = 9
        Width = 23
        Height = 166
        Align = alClient
        Caption = 'tbDetails'
        Images = FrmLineIntegration.imglstBase
        TabOrder = 0
        object ToolButton1: TToolButton
          Tag = 1
          Left = 0
          Top = 2
          ImageIndex = 16
          ParentShowHint = False
          Wrap = True
          ShowHint = True
          OnClick = ButtonLineDetailXAppsClick
        end
        object ToolButton2: TToolButton
          Tag = 2
          Left = 0
          Top = 24
          ImageIndex = 10
          ParentShowHint = False
          Wrap = True
          ShowHint = True
          OnClick = ButtonLineDetailXAppsClick
        end
        object ToolButton3: TToolButton
          Tag = 3
          Left = 0
          Top = 46
          ImageIndex = 9
          ParentShowHint = False
          ShowHint = True
          OnClick = ButtonLineDetailXAppsClick
        end
      end
    end
    object btnLIDAPPSaveDetail: TBitBtn
      Left = 556
      Top = 144
      Width = 85
      Height = 33
      Caption = '&Gravar'
      TabOrder = 1
      Visible = False
      OnClick = ButtonLineDetailXAppsOkCancelClick
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
    object btnLIDAPPCancelDetail: TBitBtn
      Left = 652
      Top = 144
      Width = 85
      Height = 33
      Caption = '&Cancelar'
      TabOrder = 2
      Visible = False
      OnClick = ButtonLineDetailXAppsOkCancelClick
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
    object edtLIDAPPIntegValue: TRxDBCalcEdit
      Left = 624
      Top = 71
      Width = 133
      Height = 21
      DataField = 'LIDAPP_INTEGVALUE'
      DataSource = dmSys1.dtsLineIntegrationDTXApps
      ButtonWidth = 0
      NumGlyphs = 2
      TabOrder = 3
    end
    object grdLineIntegrationDTXApps: TDBGrid
      Left = 29
      Top = 15
      Width = 432
      Height = 179
      Align = alLeft
      DataSource = dmSys1.dtsLineIntegrationDTXApps
      Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgConfirmDelete, dgCancelOnExit]
      TabOrder = 4
      TitleFont.Charset = DEFAULT_CHARSET
      TitleFont.Color = clWindowText
      TitleFont.Height = -11
      TitleFont.Name = 'MS Sans Serif'
      TitleFont.Style = []
      Columns = <
        item
          Expanded = False
          FieldName = 'APP_ISS_ID'
          Title.Caption = 'Emissor'
          Width = 60
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'APP_ID'
          Title.Caption = 'Aplica'#231#227'o'
          Width = 60
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'LIDAPP_INTEGVALUE'
          Title.Caption = 'Valor'
          Width = 75
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'LITG_DESC'
          Title.Caption = 'Grupo'
          Width = 124
          Visible = True
        end>
    end
    object lkpLineIntegTimeGroup2: TDBLookupComboBox
      Left = 472
      Top = 112
      Width = 285
      Height = 21
      DataField = 'LITG_ID'
      DataSource = dmSys1.dtsLineIntegrationDTXApps
      KeyField = 'LITG_ID'
      ListField = 'LITG_DESC'
      ListSource = dmSys1.dtsLineIntegTimeGroups
      TabOrder = 5
    end
    object lkpIssuer: TDBLookupComboBox
      Left = 472
      Top = 32
      Width = 137
      Height = 21
      DataField = 'APP_ISS_ID'
      DataSource = dmSys1.dtsLineIntegrationDTXApps
      KeyField = 'ISS_ID'
      ListField = 'ISS_DESCSHORT'
      ListSource = DmSys.dtsIssuers
      TabOrder = 6
    end
    object lkpApplication: TDBLookupComboBox
      Left = 624
      Top = 32
      Width = 137
      Height = 21
      DataField = 'APP_ID'
      DataSource = dmSys1.dtsLineIntegrationDTXApps
      KeyField = 'APP_ID'
      ListField = 'APP_DESCSHORT'
      ListSource = DmSys.dtsApplications
      TabOrder = 7
    end
  end
  object ActionList1: TActionList
    Images = FrmLineIntegration.imglstBase
    Left = 680
    Top = 95
    object actSaveIntegration: TAction
      Tag = 2187
      Caption = '&Gravar'
      ImageIndex = 4
      OnExecute = actSaveIntegrationExecute
    end
    object actCancelIntegration: TAction
      Tag = 2188
      Caption = '&Cancelar'
      ImageIndex = 6
      OnExecute = actCancelIntegrationExecute
    end
  end
end
