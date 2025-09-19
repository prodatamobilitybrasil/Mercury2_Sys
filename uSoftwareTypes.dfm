inherited FrmSoftwareTypes: TFrmSoftwareTypes
  Tag = 54
  Left = 288
  Top = 195
  Width = 627
  Caption = 'Tipos de Software'
  PixelsPerInch = 96
  TextHeight = 13
  inherited cbBase: TCoolBar
    Width = 619
    Bands = <
      item
        Control = tbBase
        ImageIndex = -1
        MinHeight = 24
        Width = 615
      end>
    inherited tbBase: TToolBar
      Width = 602
    end
  end
  inherited pcBaseCadastro: TPageControl
    Width = 619
    inherited tsBaseCadastroFiltro: TTabSheet
      inherited Splitter_Base1: TSplitter
        Top = 96
        Width = 611
      end
      inherited gbGrid: TGroupBox
        Top = 100
        Width = 611
        Height = 195
        inherited grdResultado: TDBGrid
          Width = 607
          Height = 178
          DataSource = dtsMaster
          Columns = <
            item
              Expanded = False
              FieldName = 'SFT_DESC'
              Title.Caption = 'Descri'#231#227'o'
              Width = 198
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'SFT_REGDATE'
              Title.Caption = 'Registro'
              Width = 117
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'SFT_REGUSER'
              Title.Caption = 'Usu'#225'rio'
              Width = 233
              Visible = True
            end>
        end
      end
      inherited pnFiltro: TPanel
        Width = 611
        Height = 96
        inherited pnPesq: TPanel
          Width = 611
          Height = 96
          inherited gbfiltroavansado: TGroupBox
            Width = 607
            Height = 92
            inherited pnVoltar: TPanel
              Top = 77
              Width = 603
              inherited lblBack: TLabel
                Left = 576
              end
            end
          end
          inherited gbFiltro: TGroupBox
            Width = 607
            Height = 92
            object Label2: TLabel [0]
              Tag = 2431
              Left = 16
              Top = 16
              Width = 48
              Height = 13
              Caption = 'Descri'#231#227'o'
              FocusControl = edDesc
            end
            inherited pnPesquiza: TPanel
              Top = 77
              Width = 603
              inherited lblAdvancedSearch: TLabel
                Width = 603
              end
            end
            object edDesc: TEdit
              Left = 16
              Top = 32
              Width = 160
              Height = 21
              TabOrder = 1
            end
          end
        end
      end
    end
    inherited tsBaseCadastroConsulta: TTabSheet
      object Label1: TLabel
        Left = 16
        Top = 16
        Width = 48
        Height = 13
        Caption = 'Descri'#231#227'o'
        FocusControl = dbDesc
      end
      object dbDesc: TDBEdit
        Left = 16
        Top = 32
        Width = 160
        Height = 21
        CharCase = ecUpperCase
        DataField = 'SFT_DESC'
        DataSource = dtsMaster
        MaxLength = 20
        TabOrder = 0
      end
    end
  end
  inherited actlstBase: TActionList
    inherited actFilter: TAction
      OnExecute = actFilterExecute
    end
  end
  inherited dtsMaster: TDataSource
    DataSet = dmSys1.cdsSoftwareTypes
  end
end
