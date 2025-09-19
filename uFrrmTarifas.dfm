object FrmTarifas: TFrmTarifas
  Left = 238
  Top = 113
  Width = 718
  Height = 465
  Caption = 'Atualizador de Tarifas'
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  OnClose = FormClose
  OnCreate = FormCreate
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object Splitter1: TSplitter
    Left = 273
    Top = 41
    Width = 4
    Height = 352
    Color = clBlack
    ParentColor = False
  end
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 710
    Height = 41
    Align = alTop
    TabOrder = 0
    object Label1: TLabel
      Left = 112
      Top = 16
      Width = 32
      Height = 13
      Caption = 'Label1'
    end
  end
  object Panel2: TPanel
    Left = 0
    Top = 393
    Width = 710
    Height = 41
    Align = alBottom
    TabOrder = 1
    object Panel3: TPanel
      Left = 536
      Top = 1
      Width = 173
      Height = 39
      Align = alRight
      BevelOuter = bvNone
      TabOrder = 0
      object BitBtn1: TBitBtn
        Left = 9
        Top = 9
        Width = 75
        Height = 25
        TabOrder = 0
        Kind = bkOK
      end
      object BitBtn2: TBitBtn
        Left = 91
        Top = 8
        Width = 75
        Height = 25
        Caption = 'Cancelar'
        TabOrder = 1
        Kind = bkCancel
        Margin = 4
        Spacing = 2
      end
    end
    object Button1: TButton
      Left = 12
      Top = 13
      Width = 63
      Height = 18
      Caption = 'Relat'#243'rio'
      TabOrder = 1
      OnClick = Button1Click
    end
  end
  object pnEmpresas: TPanel
    Left = 0
    Top = 41
    Width = 273
    Height = 352
    Align = alLeft
    TabOrder = 2
    object pnNomeEmp: TPanel
      Left = 1
      Top = 1
      Width = 271
      Height = 22
      Align = alTop
      BevelWidth = 2
      Caption = 'Empresas'
      Font.Charset = ANSI_CHARSET
      Font.Color = clBlack
      Font.Height = -12
      Font.Name = 'Arial'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 0
    end
    object Panel5: TPanel
      Left = 1
      Top = 321
      Width = 271
      Height = 30
      Align = alBottom
      TabOrder = 1
    end
    object cbEmp: TCheckListBox
      Left = 1
      Top = 23
      Width = 271
      Height = 298
      OnClickCheck = cbEmpClickCheck
      Align = alClient
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -12
      Font.Name = 'Courier New'
      Font.Style = []
      ItemHeight = 15
      ParentFont = False
      TabOrder = 2
      OnClick = cbEmpClick
    end
  end
  object pnLinhas: TPanel
    Left = 277
    Top = 41
    Width = 433
    Height = 352
    Align = alClient
    TabOrder = 3
    object pnNomeLinha: TPanel
      Left = 1
      Top = 1
      Width = 431
      Height = 22
      Align = alTop
      BevelWidth = 2
      Caption = 'Linhas'
      Font.Charset = ANSI_CHARSET
      Font.Color = clBlack
      Font.Height = -12
      Font.Name = 'Arial'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 0
    end
    object cbLinhas: TCheckListBox
      Left = 1
      Top = 23
      Width = 431
      Height = 298
      OnClickCheck = cbLinhasClickCheck
      Align = alClient
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -12
      Font.Name = 'Courier New'
      Font.Style = []
      ItemHeight = 15
      ParentFont = False
      TabOrder = 1
      OnClick = cbLinhasClick
    end
    object Panel7: TPanel
      Left = 1
      Top = 321
      Width = 431
      Height = 30
      Align = alBottom
      TabOrder = 2
      object Button3: TButton
        Left = 4
        Top = 5
        Width = 60
        Height = 19
        Caption = 'Todas'
        TabOrder = 0
      end
      object Button4: TButton
        Left = 70
        Top = 5
        Width = 60
        Height = 19
        Caption = 'Nenhuma'
        TabOrder = 1
      end
      object rbLinhasSelec: TRadioButton
        Left = 152
        Top = 8
        Width = 89
        Height = 17
        Caption = 'Selecionadas'
        TabOrder = 2
      end
      object rbLinhasNaoSelec: TRadioButton
        Left = 240
        Top = 8
        Width = 113
        Height = 17
        Caption = 'N'#227'o selecionadas'
        TabOrder = 3
      end
      object rbLinhasTodas: TRadioButton
        Left = 350
        Top = 8
        Width = 53
        Height = 17
        Caption = 'Todas'
        TabOrder = 4
      end
    end
  end
end
