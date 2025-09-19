object frmDetalhe: TfrmDetalhe
  Left = 239
  Top = 111
  BorderStyle = bsSingle
  Caption = 'Detalhes da Tabela InfoParameters'
  ClientHeight = 213
  ClientWidth = 532
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  Menu = MainMenu1
  OldCreateOrder = False
  Position = poScreenCenter
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object Label1: TLabel
    Left = 16
    Top = 63
    Width = 139
    Height = 16
    Caption = 'IP_BINID...................'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object Label2: TLabel
    Left = 16
    Top = 87
    Width = 140
    Height = 16
    Caption = 'IP_DESC...................'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object lblCOMMENT: TLabel
    Left = 16
    Top = 111
    Width = 175
    Height = 16
    Caption = 'IP_COMMENT...................'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object Label3: TLabel
    Left = 16
    Top = 39
    Width = 150
    Height = 16
    Caption = 'IP_ID............................'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object Label4: TLabel
    Left = 16
    Top = 135
    Width = 160
    Height = 16
    Caption = 'IP_STATUS...................'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object Label5: TLabel
    Left = 16
    Top = 159
    Width = 172
    Height = 16
    Caption = 'IP_REGDATE...................'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object Label6: TLabel
    Left = 16
    Top = 183
    Width = 173
    Height = 16
    Caption = 'IP_REGUSER...................'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object EditBINID: TEdit
    Left = 152
    Top = 61
    Width = 121
    Height = 21
    Color = clBtnFace
    ReadOnly = True
    TabOrder = 0
    Text = 'EditBINID'
  end
  object EditDESC: TEdit
    Left = 152
    Top = 85
    Width = 241
    Height = 21
    Color = clBtnFace
    ReadOnly = True
    TabOrder = 1
    Text = 'EditDESC'
  end
  object EditCOMMENT: TEdit
    Left = 152
    Top = 109
    Width = 369
    Height = 21
    Color = clBtnFace
    ReadOnly = True
    TabOrder = 2
    Text = 'EditCOMMENT'
  end
  object EditID: TEdit
    Left = 152
    Top = 37
    Width = 121
    Height = 21
    Color = clBtnFace
    ReadOnly = True
    TabOrder = 3
    Text = 'EditID'
  end
  object EditSTATUS: TEdit
    Left = 152
    Top = 133
    Width = 41
    Height = 21
    Color = clBtnFace
    ReadOnly = True
    TabOrder = 4
    Text = 'EditSTATUS'
  end
  object EditREGDATE: TEdit
    Left = 152
    Top = 157
    Width = 121
    Height = 21
    Color = clBtnFace
    ReadOnly = True
    TabOrder = 5
    Text = 'EditREGDATE'
  end
  object EditREGUSER: TEdit
    Left = 152
    Top = 181
    Width = 241
    Height = 21
    Color = clBtnFace
    ReadOnly = True
    TabOrder = 6
    Text = 'EditREGUSER'
  end
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 532
    Height = 28
    Align = alTop
    TabOrder = 7
    object btnVolta: TSpeedButton
      Left = 4
      Top = 4
      Width = 23
      Height = 22
      Glyph.Data = {
        76010000424D7601000000000000760000002800000020000000100000000100
        04000000000000010000120B0000120B00001000000000000000000000000000
        800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
        FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00333333333333
        33333333333333333333333333333333333333333333333333FF333333333333
        3000333333FFFFF3F77733333000003000B033333777773777F733330BFBFB00
        E00033337FFF3377F7773333000FBFB0E000333377733337F7773330FBFBFBF0
        E00033F7FFFF3337F7773000000FBFB0E000377777733337F7770BFBFBFBFBF0
        E00073FFFFFFFF37F777300000000FB0E000377777777337F7773333330BFB00
        000033333373FF77777733333330003333333333333777333333333333333333
        3333333333333333333333333333333333333333333333333333333333333333
        3333333333333333333333333333333333333333333333333333}
      NumGlyphs = 2
      OnClick = menuVoltaClick
    end
    object btnAvanca: TSpeedButton
      Left = 28
      Top = 4
      Width = 23
      Height = 22
      Glyph.Data = {
        76010000424D7601000000000000760000002800000020000000100000000100
        04000000000000010000120B0000120B00001000000000000000000000000000
        800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
        FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00333333333333
        3333333333333333333333333333333333333FFF333333333333000333333333
        3333777FFF3FFFFF33330B000300000333337F777F777773F333000E00BFBFB0
        3333777F773333F7F333000E0BFBF0003333777F7F3337773F33000E0FBFBFBF
        0333777F7F3333FF7FFF000E0BFBF0000003777F7F3337777773000E0FBFBFBF
        BFB0777F7F33FFFFFFF7000E0BF000000003777F7FF777777773000000BFB033
        33337777773FF733333333333300033333333333337773333333333333333333
        3333333333333333333333333333333333333333333333333333333333333333
        3333333333333333333333333333333333333333333333333333}
      NumGlyphs = 2
      OnClick = menuAvancaClick
    end
    object lblTotalItem: TLabel
      Left = 64
      Top = 8
      Width = 54
      Height = 13
      Caption = 'lblTotalItem'
    end
  end
  object MainMenu1: TMainMenu
    Left = 440
    Top = 136
    object meniSistema: TMenuItem
      Caption = 'Sistema'
      object menuAvanca: TMenuItem
        Caption = 'Avan'#231'a'
        ShortCut = 117
        OnClick = menuAvancaClick
      end
      object menuVolta: TMenuItem
        Caption = 'Volta'
        ShortCut = 116
        OnClick = menuVoltaClick
      end
      object N1: TMenuItem
        Caption = '-'
      end
      object menuFinaliza: TMenuItem
        Caption = 'Finaliza'
        ShortCut = 27
        OnClick = menuFinalizaClick
      end
    end
  end
end
