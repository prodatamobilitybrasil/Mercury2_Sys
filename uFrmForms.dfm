inherited FrmForms: TFrmForms
  Tag = 65
  Left = 185
  Top = 184
  Width = 788
  Height = 424
  Caption = 'Formul'#225'rios'
  PixelsPerInch = 96
  TextHeight = 13
  inherited cbBase: TCoolBar
    Width = 780
    Bands = <
      item
        Control = tbBase
        ImageIndex = -1
        MinHeight = 24
        Width = 776
      end>
    inherited tbBase: TToolBar
      Width = 763
    end
  end
  inherited pcBaseCadastro: TPageControl
    Width = 780
    Height = 342
    ActivePage = tsBaseCadastroConsulta
    OnChange = pcBaseCadastroChange
    inherited tsBaseCadastroFiltro: TTabSheet
      inherited Splitter_Base1: TSplitter
        Top = 84
        Width = 772
      end
      inherited gbGrid: TGroupBox
        Top = 88
        Width = 772
        Height = 226
        inherited grdResultado: TDBGrid
          Width = 768
          Height = 209
          DataSource = dtsMaster
          Columns = <
            item
              Expanded = False
              FieldName = 'FRM_ID'
              Width = 68
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'FRM_DESC'
              Title.Caption = 'Descri'#231#227'o'
              Width = 343
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'FRM_REGDATE'
              Title.Caption = 'Registro'
              Width = 134
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'FRM_REGUSER'
              Title.Caption = 'Usu'#225'rio'
              Width = 140
              Visible = True
            end>
        end
      end
      inherited pnFiltro: TPanel
        Width = 772
        Height = 84
        inherited pnPesq: TPanel
          Width = 772
          Height = 84
          inherited gbfiltroavansado: TGroupBox
            Width = 768
            Height = 80
            inherited pnVoltar: TPanel
              Top = 65
              Width = 764
              inherited lblBack: TLabel
                Left = 737
              end
            end
          end
          inherited gbFiltro: TGroupBox
            Width = 768
            Height = 80
            object Label1: TLabel [0]
              Tag = 2685
              Left = 16
              Top = 16
              Width = 48
              Height = 13
              Caption = 'Descri'#231#227'o'
              FocusControl = edDesc
            end
            inherited pnPesquiza: TPanel
              Top = 65
              Width = 764
              inherited lblAdvancedSearch: TLabel
                Width = 764
              end
            end
            object edDesc: TEdit
              Left = 16
              Top = 32
              Width = 372
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
      object grbForm: TGroupBox
        Left = 0
        Top = 0
        Width = 772
        Height = 84
        Align = alTop
        TabOrder = 0
        object Label2: TLabel
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
          Width = 372
          Height = 21
          CharCase = ecUpperCase
          DataField = 'FRM_DESC'
          DataSource = dtsMaster
          MaxLength = 50
          TabOrder = 0
        end
      end
    end
  end
  inherited imglstBase: TImageList
    Left = 464
    Top = 4
  end
  inherited actlstBase: TActionList
    Left = 432
    Top = 4
    inherited actFilter: TAction
      OnExecute = actFilterExecute
    end
  end
  inherited dtsMaster: TDataSource
    DataSet = dmSys1.cdsForms
    Left = 401
    Top = 4
  end
  inherited mMnuBase: TMainMenu
    Left = 369
    Top = 4
  end
end
