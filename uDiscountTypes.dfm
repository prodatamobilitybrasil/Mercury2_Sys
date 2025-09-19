inherited FrmDiscountTypes: TFrmDiscountTypes
  Tag = 21
  Left = 252
  Top = 187
  Width = 619
  Height = 446
  Caption = 'Tipos de Descontos'
  PixelsPerInch = 96
  TextHeight = 13
  inherited cbBase: TCoolBar
    Width = 611
    Bands = <
      item
        Control = tbBase
        ImageIndex = -1
        MinHeight = 24
        Width = 607
      end>
    inherited tbBase: TToolBar
      Width = 594
      ButtonHeight = 23
    end
  end
  inherited pcBaseCadastro: TPageControl
    Width = 611
    Height = 364
    OnChange = pcBaseCadastroChange
    inherited tsBaseCadastroFiltro: TTabSheet
      inherited Splitter_Base1: TSplitter
        Width = 603
      end
      inherited gbGrid: TGroupBox
        Width = 603
        Height = 204
        inherited grdResultado: TDBGrid
          Width = 599
          Height = 187
          DataSource = dtsMaster
          Columns = <
            item
              Expanded = False
              FieldName = 'DT_ID'
              Title.Caption = 'C'#243'digo'
              Width = 80
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'DT_DESC'
              Title.Caption = 'Descri'#231#227'o'
              Width = 400
              Visible = True
            end>
        end
      end
      inherited pnFiltro: TPanel
        Width = 603
        inherited pnPesq: TPanel
          Width = 603
          inherited gbfiltroavansado: TGroupBox
            Width = 599
            inherited pnVoltar: TPanel
              Width = 595
              inherited lblBack: TLabel
                Left = 568
              end
            end
          end
          inherited gbFiltro: TGroupBox
            Width = 599
            object Label1: TLabel [0]
              Tag = 1858
              Left = 13
              Top = 26
              Width = 48
              Height = 13
              Caption = 'Descri'#231#227'o'
              FocusControl = edDescricao
            end
            inherited pnPesquiza: TPanel
              Width = 595
              inherited lblAdvancedSearch: TLabel
                Width = 595
              end
            end
            object edDescricao: TEdit
              Left = 13
              Top = 41
              Width = 292
              Height = 21
              CharCase = ecUpperCase
              TabOrder = 1
            end
          end
        end
      end
    end
    inherited tsBaseCadastroConsulta: TTabSheet
      object GroupBox1: TGroupBox
        Left = 0
        Top = 0
        Width = 603
        Height = 336
        Align = alClient
        TabOrder = 0
        object Label2: TLabel
          Left = 20
          Top = 26
          Width = 48
          Height = 13
          Caption = 'Descri'#231#227'o'
          FocusControl = dbDescricao
        end
        object dbDescricao: TDBEdit
          Left = 20
          Top = 43
          Width = 377
          Height = 21
          CharCase = ecUpperCase
          DataField = 'DT_DESC'
          DataSource = dtsMaster
          MaxLength = 20
          TabOrder = 0
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
