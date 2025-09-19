inherited FrmProviderTypes: TFrmProviderTypes
  Tag = 50
  Top = 111
  Width = 705
  Height = 418
  Caption = 'Tipo de Provedores'
  PixelsPerInch = 96
  TextHeight = 13
  inherited cbBase: TCoolBar
    Width = 697
    Bands = <
      item
        Control = tbBase
        ImageIndex = -1
        MinHeight = 24
        Width = 693
      end>
    inherited tbBase: TToolBar
      Width = 680
    end
  end
  inherited pcBaseCadastro: TPageControl
    Width = 697
    Height = 339
    inherited tsBaseCadastroFiltro: TTabSheet
      inherited Splitter_Base1: TSplitter
        Top = 98
        Width = 689
        Height = 3
      end
      inherited gbGrid: TGroupBox
        Top = 101
        Width = 689
        Height = 210
        inherited grdResultado: TDBGrid
          Width = 685
          Height = 193
          DataSource = dtsMaster
          Columns = <
            item
              Expanded = False
              FieldName = 'PRVT_CODE'
              Title.Caption = 'C'#243'digo'
              Width = 94
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'PRVT_DESC'
              Title.Caption = 'Descri'#231#227'o'
              Width = 250
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'PRVT_REGDATE'
              Title.Caption = 'Registro'
              Width = 110
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'PRVT_REGUSER'
              Title.Caption = 'Usu'#225'rio'
              Width = 110
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'STATUS_ID'
              Title.Caption = 'Status'
              Width = 90
              Visible = True
            end>
        end
      end
      inherited pnFiltro: TPanel
        Width = 689
        Height = 98
        inherited pnPesq: TPanel
          Width = 689
          Height = 98
          inherited gbFiltroAvansado: TGroupBox
            Width = 685
            Height = 94
            inherited pnVoltar: TPanel
              Top = 79
              Width = 681
              inherited lblBack: TLabel
                Left = 654
              end
            end
          end
          inherited gbFiltro: TGroupBox
            Width = 685
            Height = 94
            object Label3: TLabel [0]
              Tag = 2347
              Left = 152
              Top = 24
              Width = 48
              Height = 13
              Caption = 'Descri'#231#227'o'
              FocusControl = edDesc
            end
            object Label25: TLabel [1]
              Tag = 2350
              Left = 496
              Top = 24
              Width = 30
              Height = 13
              Caption = 'Status'
              FocusControl = lkFilterStatus
            end
            object Label4: TLabel [2]
              Tag = 2346
              Left = 8
              Top = 24
              Width = 33
              Height = 13
              Caption = 'C'#243'digo'
              FocusControl = eCodigo
            end
            inherited pnPesquiza: TPanel
              Top = 79
              Width = 681
              TabOrder = 2
              inherited lblAdvancedSearch: TLabel
                Width = 681
              end
            end
            object edDesc: TEdit
              Left = 151
              Top = 40
              Width = 314
              Height = 21
              CharCase = ecUpperCase
              TabOrder = 1
            end
            object eCodigo: TEdit
              Left = 8
              Top = 40
              Width = 121
              Height = 21
              TabOrder = 0
            end
            object lkFilterStatus: TComboBox
              Left = 495
              Top = 40
              Width = 130
              Height = 21
              ItemHeight = 13
              TabOrder = 3
              Items.Strings = (
                'Ativo'
                'Inativo')
            end
          end
        end
      end
    end
    inherited tsBaseCadastroConsulta: TTabSheet
      object GroupBox1: TGroupBox
        Left = 0
        Top = 0
        Width = 689
        Height = 311
        Align = alClient
        TabOrder = 0
        object Label2: TLabel
          Left = 144
          Top = 32
          Width = 48
          Height = 13
          Caption = 'Descri'#231#227'o'
          FocusControl = dbDesc
        end
        object Label1: TLabel
          Tag = 2352
          Left = 8
          Top = 96
          Width = 30
          Height = 13
          Caption = 'Status'
          FocusControl = dbProviderTypesStatus
        end
        object Label5: TLabel
          Left = 8
          Top = 32
          Width = 33
          Height = 13
          Caption = 'C'#243'digo'
          FocusControl = dbCodigo
        end
        object dbDesc: TDBEdit
          Left = 144
          Top = 48
          Width = 385
          Height = 21
          CharCase = ecUpperCase
          DataField = 'PRVT_DESC'
          DataSource = dtsMaster
          TabOrder = 1
        end
        object dbProviderTypesStatus: TRxDBComboBox
          Left = 9
          Top = 112
          Width = 127
          Height = 21
          Style = csDropDownList
          DataField = 'PRVT_STATUS'
          DataSource = dtsMaster
          EnableValues = True
          ItemHeight = 13
          Items.Strings = (
            'Ativo'
            'Inativo')
          TabOrder = 2
          Values.Strings = (
            'A'
            'I')
        end
        object dbCodigo: TDBEdit
          Left = 8
          Top = 48
          Width = 124
          Height = 21
          DataField = 'PRVT_CODE'
          DataSource = dtsMaster
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
