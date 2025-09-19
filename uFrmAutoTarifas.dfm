object FrmAutoTarifas: TFrmAutoTarifas
  Left = 241
  Top = 111
  Width = 710
  Height = 482
  Caption = 'Automatiza'#231#227'o de Tarifas'
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  Menu = MainMenu1
  OldCreateOrder = False
  Position = poScreenCenter
  OnClose = FormClose
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 702
    Height = 28
    Align = alTop
    TabOrder = 0
    object btnOpenPlanilha: TSpeedButton
      Left = 69
      Top = 3
      Width = 23
      Height = 22
      Hint = 'Abrir arquivo EXCEL'
      Glyph.Data = {
        76010000424D7601000000000000760000002800000020000000100000000100
        04000000000000010000120B0000120B00001000000000000000000000000000
        800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
        FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00555555555555
        5555555555555555555555555555555555555555555555555555555555555555
        555555555555555555555555555555555555555FFFFFFFFFF555550000000000
        55555577777777775F55500B8B8B8B8B05555775F555555575F550F0B8B8B8B8
        B05557F75F555555575F50BF0B8B8B8B8B0557F575FFFFFFFF7F50FBF0000000
        000557F557777777777550BFBFBFBFB0555557F555555557F55550FBFBFBFBF0
        555557F555555FF7555550BFBFBF00055555575F555577755555550BFBF05555
        55555575FFF75555555555700007555555555557777555555555555555555555
        5555555555555555555555555555555555555555555555555555}
      NumGlyphs = 2
      ParentShowHint = False
      ShowHint = True
      OnClick = btnOpenPlanilhaClick
    end
    object Label1: TLabel
      Left = 120
      Top = 6
      Width = 61
      Height = 16
      Caption = 'Planilha:'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clMaroon
      Font.Height = -13
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object SpeedButton1: TSpeedButton
      Left = 92
      Top = 3
      Width = 23
      Height = 22
      Hint = 'Processar Planilha'
      Glyph.Data = {
        36040000424D3604000000000000360000002800000010000000100000000100
        2000000000000004000000000000000000000000000000000000FF00FF00FF00
        FF00FF00FF00FF00FF00FF00FF0000000000FF00FF00FF00FF00FF00FF00FF00
        FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
        FF00FF00FF00FF00FF00FF00FF008482840000000000FF00FF00FF00FF00FF00
        FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
        FF00FF00FF00FF00FF00FF00FF00FF00FF000000000000000000FF00FF00FF00
        FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
        FF00FF00FF00FF00FF00FF00FF00FF00FF000000000000FFFF0000000000FF00
        FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
        FF00FF00FF00FF00FF000000000000000000000000000000000000FFFF000000
        0000FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
        FF00FF00FF00FF00FF000000000000FFFF0000FFFF0000FFFF0000FFFF0000FF
        FF0000000000FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
        FF00FF00FF00FF00FF00FF00FF0000000000FFFFFF0000FFFF00000000000000
        00000000000000000000FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
        FF00FF00FF00FF00FF00FF00FF000000000000FFFF0000FFFF0000FFFF000000
        0000FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
        FF00000000000000000000000000000000000000000000FFFF00FFFFFF0000FF
        FF0000000000FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
        FF0000000000FFFFFF0000FFFF0000FFFF0000FFFF00FFFFFF0000FFFF0000FF
        FF0000FFFF0000000000FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
        FF00FF00FF0000000000FFFFFF0000FFFF00FFFFFF0000FFFF00000000000000
        0000000000000000000000000000FF00FF00FF00FF00FF00FF00FF00FF00FF00
        FF00FF00FF000000000000FFFF00FFFFFF0000FFFF00FFFFFF0000FFFF000000
        0000FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
        FF00FF00FF00FF00FF000000000000FFFF00FFFFFF0000FFFF00FFFFFF0000FF
        FF0000000000FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
        FF00FF00FF00FF00FF0000000000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
        FF00FFFFFF0000000000FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
        FF00FF00FF00FF00FF00FF00FF0000000000FFFFFF0000FFFF00FFFFFF00FFFF
        FF0000FFFF00FFFFFF0000000000FF00FF00FF00FF00FF00FF00FF00FF00FF00
        FF00FF00FF00FF00FF00FF00FF00000000000000000000000000000000000000
        000000000000000000000000000000000000FF00FF00FF00FF00}
      ParentShowHint = False
      ShowHint = True
      OnClick = menuProcessaPlanilhaClick
    end
    object btnProcessaDiretorio: TSpeedButton
      Left = 3
      Top = 3
      Width = 23
      Height = 22
      Hint = 'Processar Diret'#243'rio de Planilhas'
      Glyph.Data = {
        76010000424D7601000000000000760000002800000020000000100000000100
        04000000000000010000120B0000120B00001000000000000000000000000000
        800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
        FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00303333333333
        333337F3333333333333303333333333333337F33FFFFF3FF3FF303300000300
        300337FF77777F77377330000BBB0333333337777F337F33333330330BB00333
        333337F373F773333333303330033333333337F3377333333333303333333333
        333337F33FFFFF3FF3FF303300000300300337FF77777F77377330000BBB0333
        333337777F337F33333330330BB00333333337F373F773333333303330033333
        333337F3377333333333303333333333333337FFFF3FF3FFF333000003003000
        333377777F77377733330BBB0333333333337F337F33333333330BB003333333
        333373F773333333333330033333333333333773333333333333}
      NumGlyphs = 2
      ParentShowHint = False
      ShowHint = True
      OnClick = menuProcessaDiretorioClick
    end
    object EditNomePlanilha: TEdit
      Left = 184
      Top = 4
      Width = 513
      Height = 21
      TabOrder = 0
    end
  end
  object Panel2: TPanel
    Left = 0
    Top = 390
    Width = 702
    Height = 41
    Align = alBottom
    TabOrder = 1
    object Panel3: TPanel
      Left = 523
      Top = 1
      Width = 178
      Height = 39
      Align = alRight
      BevelOuter = bvNone
      TabOrder = 0
      object BitBtn2: TBitBtn
        Left = 96
        Top = 7
        Width = 75
        Height = 25
        Caption = '&Fechar'
        TabOrder = 0
        Kind = bkClose
        Margin = 10
      end
    end
    object btnExcell: TButton
      Left = 8
      Top = 8
      Width = 75
      Height = 25
      Caption = 'EXCELL'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 1
      Visible = False
      OnClick = btnExcellClick
    end
  end
  object PageControl: TPageControl
    Left = 0
    Top = 28
    Width = 702
    Height = 362
    ActivePage = tabRelatorio
    Align = alClient
    TabOrder = 2
    object tabRelatorio: TTabSheet
      Caption = 'Relat'#243'rio'
      object pnRelatorio: TPanel
        Left = 0
        Top = 0
        Width = 694
        Height = 334
        Align = alClient
        TabOrder = 0
        object Panel5: TPanel
          Left = 1
          Top = 1
          Width = 692
          Height = 24
          Align = alTop
          BevelInner = bvRaised
          Caption = 'R E L A T '#211' R I O'
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Height = -16
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          ParentFont = False
          TabOrder = 0
        end
        object memoLog: TRichEdit
          Left = 1
          Top = 25
          Width = 692
          Height = 308
          Align = alClient
          ScrollBars = ssBoth
          TabOrder = 1
          WordWrap = False
        end
      end
    end
    object tabParametros: TTabSheet
      Caption = 'Par'#226'metros'
      ImageIndex = 1
      object Label2: TLabel
        Left = 16
        Top = 67
        Width = 181
        Height = 16
        Caption = 'Diret'#243'rio Aprocessar.........'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clMaroon
        Font.Height = -13
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object Label3: TLabel
        Left = 16
        Top = 98
        Width = 189
        Height = 16
        Caption = 'Diret'#243'rio Processado..........'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clMaroon
        Font.Height = -13
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object Label4: TLabel
        Left = 16
        Top = 130
        Width = 214
        Height = 16
        Caption = 'Diret'#243'rio Erro..............................'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clMaroon
        Font.Height = -13
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object Label5: TLabel
        Left = 16
        Top = 162
        Width = 249
        Height = 16
        Caption = 'Diret'#243'rio Relat'#243'rio..............................'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clMaroon
        Font.Height = -13
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object Panel4: TPanel
        Left = 0
        Top = 0
        Width = 694
        Height = 24
        Align = alTop
        BevelInner = bvRaised
        Caption = 'Par'#226'metros'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Height = -16
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        ParentFont = False
        TabOrder = 0
      end
      object editDirAprocessar: TDirectoryEdit
        Left = 176
        Top = 64
        Width = 505
        Height = 21
        NumGlyphs = 1
        TabOrder = 1
        Text = 'editDirAprocessar'
      end
      object editDirProcessado: TDirectoryEdit
        Left = 176
        Top = 96
        Width = 505
        Height = 21
        NumGlyphs = 1
        TabOrder = 2
        Text = 'editDirProcessado'
      end
      object editDirErro: TDirectoryEdit
        Left = 176
        Top = 128
        Width = 505
        Height = 21
        NumGlyphs = 1
        TabOrder = 3
        Text = 'editDirErro'
      end
      object editDirRelatorio: TDirectoryEdit
        Left = 176
        Top = 160
        Width = 505
        Height = 21
        NumGlyphs = 1
        TabOrder = 4
        Text = 'editDirRelatorio'
      end
    end
  end
  object MainMenu1: TMainMenu
    Left = 8
    Top = 56
    object Sistema1: TMenuItem
      Caption = 'Sistema'
      object Sair1: TMenuItem
        Caption = 'Sair'
        ShortCut = 27
        OnClick = Sair1Click
      end
    end
    object Rotinas1: TMenuItem
      Caption = 'Rotinas'
      object menuProcessa: TMenuItem
        Caption = 'Processar Planilha'
        OnClick = menuProcessaPlanilhaClick
      end
      object menuProcessaDiretorio: TMenuItem
        Caption = 'Processar Diretorio'
        ShortCut = 116
        OnClick = menuProcessaDiretorioClick
      end
    end
  end
  object OpenDialog: TOpenDialog
    DefaultExt = '*.xlsx'
    Filter = 'Planilha|*.xlsx|Planilha Antiga|*.xls'
    InitialDir = 'c:\'
    Left = 40
    Top = 56
  end
end
