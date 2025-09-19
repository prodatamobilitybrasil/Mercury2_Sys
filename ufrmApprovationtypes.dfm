inherited frmApprovationTypes: TfrmApprovationTypes
  Tag = 105
  Width = 600
  Height = 400
  Caption = 'Tipos de Aprova'#231#227'o'
  Constraints.MinHeight = 400
  Constraints.MinWidth = 600
  OnDestroy = FormDestroy
  PixelsPerInch = 96
  TextHeight = 13
  inherited cbBase: TCoolBar
    Width = 592
    Bands = <
      item
        Control = tbBase
        ImageIndex = -1
        MinHeight = 24
        Width = 588
      end>
    inherited tbBase: TToolBar
      Width = 575
      inherited tbtnNew2: TToolButton
        Visible = False
      end
    end
  end
  inherited pcBaseCadastro: TPageControl
    Width = 592
    Height = 326
    inherited tsBaseCadastroFiltro: TTabSheet
      inherited Splitter_Base1: TSplitter
        Width = 584
      end
      inherited gbGrid: TGroupBox
        Width = 584
        Height = 166
        inherited grdResultado: TDBGrid
          Width = 580
          Height = 149
          DataSource = dtsMaster
        end
      end
      inherited pnFiltro: TPanel
        Width = 584
        inherited pnPesq: TPanel
          Width = 584
          inherited gbfiltroavansado: TGroupBox
            Width = 580
            inherited pnVoltar: TPanel
              Width = 576
              inherited lblBack: TLabel
                Left = 549
              end
            end
          end
          inherited gbFiltro: TGroupBox
            Width = 580
            object Label1: TLabel [0]
              Tag = 3231
              Left = 16
              Top = 24
              Width = 157
              Height = 13
              Caption = 'Descri'#231#227'o do Tipo de Aprova'#231#227'o'
            end
            inherited pnPesquiza: TPanel
              Width = 576
              inherited lblAdvancedSearch: TLabel
                Width = 576
                Visible = False
              end
            end
            object eDesc: TEdit
              Left = 16
              Top = 41
              Width = 337
              Height = 21
              CharCase = ecUpperCase
              TabOrder = 1
            end
          end
        end
      end
    end
    inherited tsBaseCadastroConsulta: TTabSheet
      object Label2: TLabel
        Tag = 3230
        Left = 20
        Top = 36
        Width = 33
        Height = 13
        Caption = 'C'#243'digo'
      end
      object Label3: TLabel
        Tag = 3231
        Left = 20
        Top = 80
        Width = 91
        Height = 13
        Caption = 'Tipo de Aprova'#231#227'o'
      end
      object dbedAPT_ID: TDBEdit
        Left = 17
        Top = 53
        Width = 84
        Height = 21
        CharCase = ecUpperCase
        DataField = 'APT_ID'
        DataSource = dtsMaster
        TabOrder = 0
      end
      object dbedAPT_DESC: TDBEdit
        Left = 17
        Top = 97
        Width = 249
        Height = 21
        CharCase = ecUpperCase
        DataField = 'APT_DESC'
        DataSource = dtsMaster
        TabOrder = 1
      end
    end
  end
  inherited actlstBase: TActionList
    inherited actFilter: TAction
      OnExecute = actFilterExecute
    end
    inherited actLog: TAction
      Visible = False
    end
  end
end
