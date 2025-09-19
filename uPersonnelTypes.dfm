inherited FrmPersonnelTypes: TFrmPersonnelTypes
  Tag = 47
  Left = 194
  Top = 114
  Width = 790
  Height = 551
  Caption = 'Tipos de Fun'#231#245'es'
  PixelsPerInch = 96
  TextHeight = 13
  inherited cbBase: TCoolBar
    Width = 782
    Bands = <
      item
        Control = tbBase
        ImageIndex = -1
        MinHeight = 24
        Width = 778
      end>
    inherited tbBase: TToolBar
      Width = 765
    end
  end
  inherited pcBaseCadastro: TPageControl
    Width = 782
    Height = 469
    ActivePage = tsBaseCadastroConsulta
    OnChange = pcBaseCadastroChange
    inherited tsBaseCadastroFiltro: TTabSheet
      inherited Splitter_Base1: TSplitter
        Width = 774
      end
      inherited gbGrid: TGroupBox
        Width = 774
        Height = 309
        inherited grdResultado: TDBGrid
          Width = 770
          Height = 292
          DataSource = dtsMaster
          Columns = <
            item
              Expanded = False
              FieldName = 'PRST_ID'
              Title.Caption = 'C'#243'digo'
              Width = 100
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'PRST_DESC'
              Title.Caption = 'Descri'#231#227'o'
              Width = 450
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
        Width = 774
        inherited pnPesq: TPanel
          Width = 774
          inherited gbfiltroavansado: TGroupBox
            Width = 770
            inherited pnVoltar: TPanel
              Width = 766
              inherited lblBack: TLabel
                Left = 739
              end
            end
          end
          inherited gbFiltro: TGroupBox
            Width = 770
            object Label3: TLabel [0]
              Tag = 2200
              Left = 13
              Top = 20
              Width = 33
              Height = 13
              Caption = 'C'#243'digo'
              FocusControl = edPRSTID
            end
            object Label4: TLabel [1]
              Tag = 2201
              Left = 137
              Top = 20
              Width = 48
              Height = 13
              Caption = 'Descri'#231#227'o'
              FocusControl = edPRSTDESC
            end
            object lStatus: TLabel [2]
              Tag = 2202
              Left = 479
              Top = 20
              Width = 30
              Height = 13
              Caption = 'Status'
              FocusControl = lkFilterStatus
            end
            inherited pnPesquiza: TPanel
              Width = 766
              inherited lblAdvancedSearch: TLabel
                Width = 766
              end
            end
            object edPRSTID: TEdit
              Left = 13
              Top = 37
              Width = 98
              Height = 21
              CharCase = ecUpperCase
              TabOrder = 1
            end
            object edPRSTDESC: TEdit
              Left = 137
              Top = 37
              Width = 332
              Height = 21
              CharCase = ecUpperCase
              TabOrder = 2
            end
            object lkFilterStatus: TComboBox
              Left = 479
              Top = 37
              Width = 138
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
      object gbPersonnel: TGroupBox
        Left = 0
        Top = 0
        Width = 774
        Height = 441
        Align = alClient
        TabOrder = 0
        object Label1: TLabel
          Left = 21
          Top = 50
          Width = 33
          Height = 13
          Caption = 'C'#243'digo'
          FocusControl = dbPrstId
        end
        object Label2: TLabel
          Left = 119
          Top = 50
          Width = 48
          Height = 13
          Caption = 'Descri'#231#227'o'
          FocusControl = dbDesc
        end
        object lblStatusCardUsers: TLabel
          Tag = 2202
          Left = 487
          Top = 50
          Width = 30
          Height = 13
          Caption = 'Status'
          FocusControl = dbCardUsersStatus
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -12
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentFont = False
        end
        object dbPrstId: TDBEdit
          Left = 21
          Top = 64
          Width = 85
          Height = 21
          DataField = 'PRST_ID'
          DataSource = DmSys.dtsPersonnelTypes
          MaxLength = 5
          TabOrder = 0
        end
        object dbDesc: TDBEdit
          Left = 119
          Top = 64
          Width = 358
          Height = 21
          CharCase = ecUpperCase
          DataField = 'PRST_DESC'
          DataSource = DmSys.dtsPersonnelTypes
          TabOrder = 1
        end
        object dbCardUsersStatus: TRxDBComboBox
          Left = 486
          Top = 64
          Width = 106
          Height = 21
          Style = csDropDownList
          DataField = 'PRST_STATUS'
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
      end
    end
  end
  inherited actlstBase: TActionList
    inherited actFilter: TAction
      OnExecute = actFilterExecute
    end
  end
  inherited dtsMaster: TDataSource
    DataSet = DmSys.cdsPersonnelTypes
  end
end
