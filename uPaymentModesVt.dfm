inherited FrmPaymentModesVt: TFrmPaymentModesVt
  Width = 539
  Height = 392
  Caption = 'Formas de Pagamento - VT'
  PixelsPerInch = 96
  TextHeight = 13
  inherited cbBase: TCoolBar
    Width = 531
    Bands = <
      item
        Control = tbBase
        ImageIndex = -1
        MinHeight = 24
        Width = 527
      end>
    inherited tbBase: TToolBar
      Width = 514
    end
  end
  inherited pcBaseCadastro: TPageControl
    Width = 531
    Height = 310
    OnChange = pcBaseCadastroChange
    inherited tsBaseCadastroFiltro: TTabSheet
      inherited Splitter_Base1: TSplitter
        Width = 523
      end
      inherited gbGrid: TGroupBox
        Width = 523
        Height = 150
        inherited grdResultado: TDBGrid
          Width = 519
          Height = 133
          DataSource = DmVtPos.dsPaymentModes
          Columns = <
            item
              Expanded = False
              FieldName = 'PM_DESC'
              Title.Caption = 'Forma de Pagamento'
              Width = 210
              Visible = True
            end>
        end
      end
      inherited pnFiltro: TPanel
        Width = 523
        inherited pnPesq: TPanel
          Width = 523
          inherited gbfiltroavansado: TGroupBox
            Width = 519
            inherited pnVoltar: TPanel
              Width = 515
              inherited lblBack: TLabel
                Left = 488
              end
            end
          end
          inherited gbFiltro: TGroupBox
            Width = 519
            object Label1: TLabel [0]
              Left = 16
              Top = 32
              Width = 35
              Height = 13
              Caption = 'Forma :'
            end
            inherited pnPesquiza: TPanel
              Width = 515
              inherited lblAdvancedSearch: TLabel
                Width = 515
              end
            end
            object edtFormas: TEdit
              Left = 64
              Top = 32
              Width = 241
              Height = 21
              TabOrder = 1
            end
          end
        end
      end
    end
    inherited tsBaseCadastroConsulta: TTabSheet
      object pcManutencao: TPageControl
        Left = 8
        Top = 8
        Width = 505
        Height = 273
        ActivePage = tsPaymentModes
        TabOrder = 0
        object tsPaymentModes: TTabSheet
          Caption = 'Forma de Pagamento'
          object lblPaymentModes: TLabel
            Left = 24
            Top = 24
            Width = 107
            Height = 13
            Caption = 'Forma de Pagamento :'
          end
          object edtPaymentModes: TEdit
            Left = 144
            Top = 21
            Width = 156
            Height = 21
            TabOrder = 0
          end
        end
        object tsPaymentDetails: TTabSheet
          Caption = 'Detalhes de Pagamento'
          ImageIndex = 1
          object Label3: TLabel
            Left = 220
            Top = 6
            Width = 107
            Height = 13
            Caption = 'Detalhes selecionados'
          end
          object Label4: TLabel
            Left = 22
            Top = 7
            Width = 99
            Height = 13
            Caption = 'Detalhes dispon'#237'veis'
          end
          object sbOut: TSpeedButton
            Left = 170
            Top = 70
            Width = 23
            Height = 22
            Glyph.Data = {
              76010000424D7601000000000000760000002800000020000000100000000100
              04000000000000010000120B0000120B00001000000000000000000000000000
              800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
              FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00333333333333
              3333333333333333333333333333333333333333333333333333333333333333
              3333333333333333333333333333333333333333333FF3333333333333003333
              3333333333773FF3333333333309003333333333337F773FF333333333099900
              33333FFFFF7F33773FF30000000999990033777777733333773F099999999999
              99007FFFFFFF33333F7700000009999900337777777F333F7733333333099900
              33333333337F3F77333333333309003333333333337F77333333333333003333
              3333333333773333333333333333333333333333333333333333333333333333
              3333333333333333333333333333333333333333333333333333}
            NumGlyphs = 2
          end
          object sbIn: TSpeedButton
            Left = 169
            Top = 38
            Width = 23
            Height = 22
            Glyph.Data = {
              76010000424D7601000000000000760000002800000020000000100000000100
              04000000000000010000120B0000120B00001000000000000000000000000000
              800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
              FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00333333333333
              3333333333333333333333333333333333333333333333333333333333333333
              3333333333333FF3333333333333003333333333333F77F33333333333009033
              333333333F7737F333333333009990333333333F773337FFFFFF330099999000
              00003F773333377777770099999999999990773FF33333FFFFF7330099999000
              000033773FF33777777733330099903333333333773FF7F33333333333009033
              33333333337737F3333333333333003333333333333377333333333333333333
              3333333333333333333333333333333333333333333333333333333333333333
              3333333333333333333333333333333333333333333333333333}
            NumGlyphs = 2
          end
          object SpeedButton1: TSpeedButton
            Left = 448
            Top = 88
            Width = 23
            Height = 22
            Glyph.Data = {
              76010000424D7601000000000000760000002800000020000000100000000100
              04000000000000010000120B0000120B00001000000000000000000000000000
              800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
              FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00333333000333
              3333333333777F33333333333309033333333333337F7F333333333333090333
              33333333337F7F33333333333309033333333333337F7F333333333333090333
              33333333337F7F33333333333309033333333333FF7F7FFFF333333000090000
              3333333777737777F333333099999990333333373F3333373333333309999903
              333333337F33337F33333333099999033333333373F333733333333330999033
              3333333337F337F3333333333099903333333333373F37333333333333090333
              33333333337F7F33333333333309033333333333337373333333333333303333
              333333333337F333333333333330333333333333333733333333}
            NumGlyphs = 2
          end
          object SpeedButton2: TSpeedButton
            Left = 448
            Top = 120
            Width = 23
            Height = 22
            Glyph.Data = {
              76010000424D7601000000000000760000002800000020000000100000000100
              04000000000000010000120B0000120B00001000000000000000000000000000
              800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
              FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00333333303333
              333333333337F33333333333333033333333333333373F333333333333090333
              33333333337F7F33333333333309033333333333337373F33333333330999033
              3333333337F337F33333333330999033333333333733373F3333333309999903
              333333337F33337F33333333099999033333333373333373F333333099999990
              33333337FFFF3FF7F33333300009000033333337777F77773333333333090333
              33333333337F7F33333333333309033333333333337F7F333333333333090333
              33333333337F7F33333333333309033333333333337F7F333333333333090333
              33333333337F7F33333333333300033333333333337773333333}
            NumGlyphs = 2
          end
          object dbgDetailsIn: TDBGrid
            Left = 219
            Top = 22
            Width = 214
            Height = 217
            DataSource = DmVtPos.dsDetailsIn
            Options = [dgTitles, dgColumnResize, dgTabs, dgRowSelect, dgAlwaysShowSelection, dgConfirmDelete, dgCancelOnExit]
            TabOrder = 0
            TitleFont.Charset = DEFAULT_CHARSET
            TitleFont.Color = clWindowText
            TitleFont.Height = -11
            TitleFont.Name = 'MS Sans Serif'
            TitleFont.Style = []
            OnDrawColumnCell = dbgDetailsInDrawColumnCell
            OnDblClick = dbgDetailsInDblClick
            Columns = <
              item
                Expanded = False
                FieldName = 'Pd_Desc'
                Width = 77
                Visible = True
              end
              item
                Expanded = False
                Title.Caption = 'Obrigat'#243'rio'
                Width = 100
                Visible = True
              end>
          end
          object dbgDetailsOut: TDBGrid
            Left = 20
            Top = 22
            Width = 133
            Height = 214
            DataSource = DmVtPos.dsDetalisOut
            Options = [dgTitles, dgColumnResize, dgTabs, dgRowSelect, dgAlwaysShowSelection, dgConfirmDelete, dgCancelOnExit]
            TabOrder = 1
            TitleFont.Charset = DEFAULT_CHARSET
            TitleFont.Color = clWindowText
            TitleFont.Height = -11
            TitleFont.Name = 'MS Sans Serif'
            TitleFont.Style = []
            Columns = <
              item
                Expanded = False
                FieldName = 'PD_DESC'
                Title.Caption = 'Detalhes'
                Visible = True
              end>
          end
        end
      end
    end
  end
  inherited actlstBase: TActionList
    inherited actFilter: TAction
      OnExecute = actFilterExecute
    end
  end
end
