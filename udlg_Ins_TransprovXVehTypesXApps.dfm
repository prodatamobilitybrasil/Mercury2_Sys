object dlg_Ins_TransprovXVehTypesXApps: Tdlg_Ins_TransprovXVehTypesXApps
  Left = 275
  Top = 185
  Width = 348
  Height = 187
  Caption = 'Selecione a empresa e o tipo de ve'#237'culo'
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  Position = poDesktopCenter
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object Label1: TLabel
    Left = 72
    Top = 17
    Width = 41
    Height = 13
    Caption = 'Empresa'
  end
  object Label2: TLabel
    Left = 70
    Top = 57
    Width = 75
    Height = 13
    Caption = 'Tipo de ve'#237'culo'
  end
  object cb_tipos_veiculos: TComboBox
    Left = 70
    Top = 72
    Width = 193
    Height = 21
    AutoComplete = False
    Style = csDropDownList
    ItemHeight = 13
    TabOrder = 1
  end
  object BitBtn1: TBitBtn
    Left = 78
    Top = 104
    Width = 75
    Height = 25
    TabOrder = 2
    OnClick = BitBtn1Click
    Kind = bkOK
  end
  object BitBtn2: TBitBtn
    Left = 166
    Top = 104
    Width = 75
    Height = 25
    Caption = 'Cancelar'
    TabOrder = 3
    OnClick = BitBtn2Click
    Kind = bkCancel
  end
  object cb_empresas: TComboBox
    Left = 70
    Top = 31
    Width = 193
    Height = 21
    AutoComplete = False
    Style = csDropDownList
    ItemHeight = 13
    TabOrder = 0
  end
end
