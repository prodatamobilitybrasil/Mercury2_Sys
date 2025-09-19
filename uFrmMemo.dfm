object frmMemo: TfrmMemo
  Left = 239
  Top = 111
  Width = 928
  Height = 480
  Caption = 'Relat'#243'rio'
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  KeyPreview = True
  OldCreateOrder = False
  Position = poScreenCenter
  OnKeyPress = FormKeyPress
  PixelsPerInch = 96
  TextHeight = 13
  object Panel1: TPanel
    Left = 0
    Top = 408
    Width = 920
    Height = 41
    Align = alBottom
    TabOrder = 0
    object Panel2: TPanel
      Left = 831
      Top = 1
      Width = 88
      Height = 39
      Align = alRight
      BevelOuter = bvNone
      TabOrder = 0
      object BitBtn1: TBitBtn
        Left = 8
        Top = 8
        Width = 75
        Height = 25
        Caption = '&Fechar'
        TabOrder = 0
        Kind = bkClose
      end
    end
  end
  object Memo: TMemo
    Left = 0
    Top = 0
    Width = 920
    Height = 408
    Align = alClient
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -12
    Font.Name = 'Courier New'
    Font.Style = []
    ParentFont = False
    ScrollBars = ssBoth
    TabOrder = 1
    WordWrap = False
  end
end
