inherited FrmObjectTranslation: TFrmObjectTranslation
  Tag = 81
  Left = 206
  Top = 150
  Width = 782
  Height = 489
  Caption = 'FrmObjectTranslation'
  PixelsPerInch = 96
  TextHeight = 13
  inherited cbBase: TCoolBar
    Width = 774
    Bands = <
      item
        Control = tbBase
        ImageIndex = -1
        MinHeight = 24
        Width = 770
      end>
    inherited tbBase: TToolBar
      Width = 757
    end
  end
  inherited pcBaseCadastro: TPageControl
    Width = 774
    Height = 407
    ActivePage = tsBaseCadastroConsulta
    inherited tsBaseCadastroFiltro: TTabSheet
      Tag = 500
      Caption = 'XXXXX'
      inherited Splitter_Base1: TSplitter
        Top = 65
        Width = 766
      end
      inherited gbGrid: TGroupBox
        Top = 69
        Width = 766
        Height = 310
        inherited grdResultado: TDBGrid
          Width = 762
          Height = 293
          DataSource = dtsMaster
          Columns = <
            item
              Expanded = False
              FieldName = 'OTM_ID'
              Width = 55
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'OTM_DESC'
              Width = 329
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'OTM_REGDATE'
              Width = 126
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'OTM_REGUSER'
              Width = 154
              Visible = True
            end>
        end
      end
      inherited pnFiltro: TPanel
        Width = 766
        Height = 65
        inherited pnPesq: TPanel
          Width = 766
          Height = 65
          inherited gbfiltroavansado: TGroupBox
            Width = 762
            Height = 61
            inherited pnVoltar: TPanel
              Top = 46
              Width = 758
              inherited lblBack: TLabel
                Left = 731
              end
            end
          end
          inherited gbFiltro: TGroupBox
            Width = 762
            Height = 61
            object Label1: TLabel [0]
              Tag = 3090
              Left = 12
              Top = 12
              Width = 59
              Height = 13
              Caption = 'OTM_DESC'
              FocusControl = edDesc
            end
            inherited pnPesquiza: TPanel
              Top = 46
              Width = 758
              inherited lblAdvancedSearch: TLabel
                Width = 758
              end
            end
            object edDesc: TEdit
              Left = 12
              Top = 28
              Width = 301
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
      Tag = 501
      Caption = 'XXXXX'
      object GroupBox1: TGroupBox
        Left = 0
        Top = 0
        Width = 766
        Height = 65
        Align = alTop
        TabOrder = 0
        object Label2: TLabel
          Left = 14
          Top = 14
          Width = 59
          Height = 13
          Caption = 'OTM_DESC'
          FocusControl = dbDesc
        end
        object dbDesc: TDBEdit
          Left = 14
          Top = 30
          Width = 301
          Height = 21
          CharCase = ecUpperCase
          DataField = 'OTM_DESC'
          DataSource = dtsMaster
          MaxLength = 50
          TabOrder = 0
        end
      end
      object PageControl1: TPageControl
        Left = 0
        Top = 65
        Width = 766
        Height = 314
        ActivePage = TabSheet1
        Align = alClient
        TabOrder = 1
        object TabSheet1: TTabSheet
          Tag = 3102
          Caption = 'ITEMS'
          object cbItems: TCoolBar
            Left = 0
            Top = 0
            Width = 27
            Height = 286
            Align = alLeft
            AutoSize = True
            Bands = <
              item
                Control = tbItems
                ImageIndex = -1
                MinHeight = 23
                Width = 282
              end>
            Vertical = True
            object tbItems: TToolBar
              Left = 0
              Top = 9
              Width = 23
              Height = 273
              Align = alClient
              ButtonHeight = 25
              Images = imglstBase
              TabOrder = 0
              object tbtnNewDetail: TToolButton
                Left = 0
                Top = 2
                Action = actNewItem
                ParentShowHint = False
                Wrap = True
                ShowHint = True
              end
              object tbtnEditDetail: TToolButton
                Left = 0
                Top = 27
                Action = actEditItem
                ParentShowHint = False
                Wrap = True
                ShowHint = True
              end
              object ToolButton3: TToolButton
                Left = 0
                Top = 52
                Action = actDeleteItem
              end
            end
          end
          object Panel1: TPanel
            Left = 27
            Top = 0
            Width = 731
            Height = 286
            Align = alClient
            BevelOuter = bvNone
            TabOrder = 1
            object Splitter1: TSplitter
              Left = 0
              Top = 111
              Width = 731
              Height = 3
              Cursor = crVSplit
              Align = alTop
            end
            object Panel2: TPanel
              Left = 0
              Top = 0
              Width = 731
              Height = 111
              Align = alTop
              BevelInner = bvRaised
              BevelOuter = bvLowered
              TabOrder = 0
              object Panel4: TPanel
                Left = 2
                Top = 2
                Width = 727
                Height = 107
                Align = alClient
                BevelOuter = bvNone
                TabOrder = 1
                object Label3: TLabel
                  Left = 12
                  Top = 16
                  Width = 58
                  Height = 13
                  Caption = 'OTD_DESC'
                  FocusControl = dbOtdDesc
                end
                object dbOtdDesc: TDBEdit
                  Left = 12
                  Top = 32
                  Width = 353
                  Height = 21
                  CharCase = ecUpperCase
                  DataField = 'OTD_DESC'
                  DataSource = dmSys1.dtsObjectTranslationDT
                  MaxLength = 50
                  TabOrder = 0
                end
                object Panel5: TPanel
                  Left = 0
                  Top = 78
                  Width = 727
                  Height = 29
                  Align = alBottom
                  BevelOuter = bvNone
                  TabOrder = 1
                  object Panel6: TPanel
                    Left = 562
                    Top = 0
                    Width = 165
                    Height = 29
                    Align = alRight
                    BevelOuter = bvNone
                    TabOrder = 0
                    object BitBtn1: TBitBtn
                      Left = 8
                      Top = 2
                      Width = 75
                      Height = 25
                      Action = actItemOk
                      Caption = 'actItemOk'
                      TabOrder = 0
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
                    end
                    object BitBtn2: TBitBtn
                      Left = 88
                      Top = 2
                      Width = 75
                      Height = 25
                      Action = actItemCancel
                      Caption = 'actItemCancel'
                      TabOrder = 1
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
                    end
                  end
                end
              end
              object grdItems: TDBGrid
                Left = 700
                Top = 2
                Width = 29
                Height = 63
                DataSource = dmSys1.dtsObjectTranslationDT
                ReadOnly = True
                TabOrder = 0
                TitleFont.Charset = DEFAULT_CHARSET
                TitleFont.Color = clWindowText
                TitleFont.Height = -11
                TitleFont.Name = 'MS Sans Serif'
                TitleFont.Style = []
                Columns = <
                  item
                    Expanded = False
                    FieldName = 'OTD_ID'
                    Width = 48
                    Visible = True
                  end
                  item
                    Expanded = False
                    FieldName = 'OTD_DESC'
                    Width = 253
                    Visible = True
                  end
                  item
                    Expanded = False
                    FieldName = 'OTD_FIELDVALUE'
                    Width = 94
                    Visible = True
                  end
                  item
                    Expanded = False
                    FieldName = 'OTD_REGDATE'
                    Width = 92
                    Visible = True
                  end
                  item
                    Expanded = False
                    FieldName = 'OTD_REGUSER'
                    Width = 128
                    Visible = True
                  end>
              end
            end
            object PageControl2: TPageControl
              Left = 0
              Top = 114
              Width = 731
              Height = 172
              ActivePage = TabSheet2
              Align = alClient
              TabOrder = 1
              object TabSheet2: TTabSheet
                Tag = 3049
                Caption = 'LANGUAGES'
                object CoolBar1: TCoolBar
                  Left = 0
                  Top = 0
                  Width = 27
                  Height = 144
                  Align = alLeft
                  AutoSize = True
                  Bands = <
                    item
                      Control = ToolBar1
                      ImageIndex = -1
                      MinHeight = 23
                      Width = 140
                    end>
                  Vertical = True
                  object ToolBar1: TToolBar
                    Left = 0
                    Top = 9
                    Width = 23
                    Height = 131
                    Align = alClient
                    ButtonHeight = 25
                    Images = imglstBase
                    TabOrder = 0
                    object ToolButton1: TToolButton
                      Left = 0
                      Top = 2
                      Action = actNewLanguage
                      ParentShowHint = False
                      Wrap = True
                      ShowHint = True
                    end
                    object ToolButton2: TToolButton
                      Left = 0
                      Top = 27
                      Action = actEditLanguage
                      ParentShowHint = False
                      Wrap = True
                      ShowHint = True
                    end
                    object ToolButton4: TToolButton
                      Left = 0
                      Top = 52
                      Action = actDeleteLanguage
                    end
                  end
                end
                object Panel3: TPanel
                  Left = 27
                  Top = 0
                  Width = 696
                  Height = 144
                  Align = alClient
                  BevelInner = bvRaised
                  BevelOuter = bvLowered
                  TabOrder = 1
                  object Panel7: TPanel
                    Left = 2
                    Top = 2
                    Width = 692
                    Height = 140
                    Align = alClient
                    BevelOuter = bvNone
                    TabOrder = 1
                    object Label14: TLabel
                      Left = 12
                      Top = 16
                      Width = 57
                      Height = 13
                      Caption = 'LNG_DESC'
                      FocusControl = dblkLanguage
                    end
                    object Label4: TLabel
                      Left = 12
                      Top = 60
                      Width = 110
                      Height = 13
                      Caption = 'OTDLNG_FIELDDESC'
                      FocusControl = dbOtdLngFieldDesc
                    end
                    object dblkLanguage: TRxDBLookupCombo
                      Left = 12
                      Top = 32
                      Width = 285
                      Height = 21
                      DropDownCount = 8
                      DataField = 'LNG_ID'
                      DataSource = dmSys1.dtsObjectTranslationDTxLanguages
                      LookupField = 'LNG_ID'
                      LookupDisplay = 'LNG_DESC'
                      LookupSource = dmSys1.dtsLanguages
                      TabOrder = 0
                    end
                    object dbOtdLngFieldDesc: TDBEdit
                      Left = 12
                      Top = 76
                      Width = 353
                      Height = 21
                      DataField = 'OTDLNG_FIELDDESC'
                      DataSource = dmSys1.dtsObjectTranslationDTxLanguages
                      MaxLength = 50
                      TabOrder = 1
                    end
                    object Panel8: TPanel
                      Left = 0
                      Top = 111
                      Width = 692
                      Height = 29
                      Align = alBottom
                      BevelOuter = bvNone
                      TabOrder = 2
                      object Panel9: TPanel
                        Left = 527
                        Top = 0
                        Width = 165
                        Height = 29
                        Align = alRight
                        BevelOuter = bvNone
                        TabOrder = 0
                        object BitBtn3: TBitBtn
                          Left = 8
                          Top = 2
                          Width = 75
                          Height = 25
                          Action = actLanguageOk
                          Caption = 'actLanguageOk'
                          TabOrder = 0
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
                        end
                        object BitBtn4: TBitBtn
                          Left = 88
                          Top = 2
                          Width = 75
                          Height = 25
                          Action = actLanguageCancel
                          Caption = 'actLanguageCancel'
                          TabOrder = 1
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
                        end
                      end
                    end
                  end
                  object grdLanguages: TDBGrid
                    Left = 668
                    Top = 2
                    Width = 26
                    Height = 75
                    DataSource = dmSys1.dtsObjectTranslationDTxLanguages
                    ReadOnly = True
                    TabOrder = 0
                    TitleFont.Charset = DEFAULT_CHARSET
                    TitleFont.Color = clWindowText
                    TitleFont.Height = -11
                    TitleFont.Name = 'MS Sans Serif'
                    TitleFont.Style = []
                    Columns = <
                      item
                        Expanded = False
                        FieldName = 'LNG_DESC'
                        Width = 128
                        Visible = True
                      end
                      item
                        Expanded = False
                        FieldName = 'OTDLNG_FIELDDESC'
                        Width = 234
                        Visible = True
                      end
                      item
                        Expanded = False
                        FieldName = 'OTDLNG_REGDATE'
                        Width = 158
                        Visible = True
                      end
                      item
                        Expanded = False
                        FieldName = 'OTDLNG_REGUSER'
                        Width = 120
                        Visible = True
                      end>
                  end
                end
              end
            end
          end
        end
      end
    end
  end
  inherited actlstBase: TActionList
    object actNewItem: TAction
      Tag = 3103
      Category = 'Items'
      Caption = 'actNewItem'
      ImageIndex = 16
      OnExecute = actNewItemExecute
    end
    object actEditItem: TAction
      Tag = 3104
      Category = 'Items'
      Caption = 'actEditItem'
      ImageIndex = 10
      OnExecute = actEditItemExecute
    end
    object actDeleteItem: TAction
      Tag = 3105
      Category = 'Items'
      Caption = 'actDeleteItem'
      ImageIndex = 9
      OnExecute = actDeleteItemExecute
    end
    object actNewLanguage: TAction
      Tag = 3106
      Category = 'Languages'
      Caption = 'actNewLanguage'
      ImageIndex = 16
      OnExecute = actNewLanguageExecute
    end
    object actEditLanguage: TAction
      Tag = 3107
      Category = 'Languages'
      Caption = 'actEditLanguage'
      ImageIndex = 10
      OnExecute = actEditLanguageExecute
    end
    object actDeleteLanguage: TAction
      Tag = 3108
      Category = 'Languages'
      Caption = 'actDeleteLanguage'
      ImageIndex = 9
      OnExecute = actDeleteLanguageExecute
    end
    object actItemOk: TAction
      Tag = 3109
      Category = 'Items'
      Caption = 'actItemOk'
      ImageIndex = 4
      OnExecute = actItemOkExecute
    end
    object actItemCancel: TAction
      Tag = 3110
      Category = 'Items'
      Caption = 'actItemCancel'
      ImageIndex = 6
      OnExecute = actItemCancelExecute
    end
    object actLanguageOk: TAction
      Tag = 3111
      Category = 'Languages'
      Caption = 'actLanguageOk'
      ImageIndex = 4
      OnExecute = actLanguageOkExecute
    end
    object actLanguageCancel: TAction
      Tag = 3112
      Category = 'Languages'
      Caption = 'actLanguageCancel'
      ImageIndex = 6
      OnExecute = actLanguageCancelExecute
    end
  end
end
