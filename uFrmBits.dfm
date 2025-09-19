object FrmBits: TFrmBits
  Left = 244
  Top = 113
  Width = 373
  Height = 592
  Caption = 'FrmBits'
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object lbBIT: TCheckListBox
    Left = 0
    Top = 41
    Width = 365
    Height = 479
    OnClickCheck = lbBITClickCheck
    Align = alClient
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Courier New'
    Font.Style = []
    ItemHeight = 14
    ParentFont = False
    TabOrder = 0
    OnKeyUp = lbBITKeyUp
  end
  object Panel1: TPanel
    Left = 0
    Top = 520
    Width = 365
    Height = 41
    Align = alBottom
    TabOrder = 1
    object Panel2: TPanel
      Left = 189
      Top = 1
      Width = 175
      Height = 39
      Align = alRight
      BevelOuter = bvNone
      TabOrder = 0
      object btnOK: TBitBtn
        Left = 10
        Top = 9
        Width = 75
        Height = 25
        TabOrder = 0
        OnClick = btnOKClick
        Kind = bkOK
      end
      object BitBtn2: TBitBtn
        Left = 94
        Top = 9
        Width = 75
        Height = 25
        Caption = 'Cancelar'
        TabOrder = 1
        Kind = bkCancel
        Margin = 4
        Spacing = 1
      end
    end
    object btnAltera: TButton
      Left = 15
      Top = 11
      Width = 114
      Height = 17
      Caption = 'Altera Descri'#231#227'o (F2)'
      TabOrder = 1
      OnClick = btnAlteraClick
    end
  end
  object pnValor: TPanel
    Left = 0
    Top = 0
    Width = 365
    Height = 41
    Align = alTop
    Caption = '2147483648'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -32
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 2
  end
end
