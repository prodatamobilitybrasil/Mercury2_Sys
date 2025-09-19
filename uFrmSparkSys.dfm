inherited FrmSys: TFrmSys
  Left = 11
  Top = 77
  Width = 755
  Height = 465
  Caption = 'Spark - Sys'
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  inherited cbBase: TCoolBar
    Width = 747
    Bands = <
      item
        Control = tbBase
        ImageIndex = -1
        MinHeight = 24
        Width = 743
      end>
    inherited tbBase: TToolBar
      Width = 730
    end
  end
  inherited pcBaseCadastro: TPageControl
    Width = 747
    Height = 410
    OnChange = pcBaseCadastroChange
    OnChanging = pcBaseCadastroChanging
    inherited tsBaseCadastroFiltro: TTabSheet
      inherited Splitter_Base1: TSplitter
        Width = 739
      end
      inherited gbGrid: TGroupBox
        Width = 739
        Height = 250
        inherited grdResultado: TDBGrid
          Width = 735
          Height = 233
          DataSource = dtsMaster
          Columns = <
            item
              Expanded = False
              FieldName = 'LM_DESC'
              Width = 100
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'LM_DESCSHORT'
              Title.Caption = 'Linha'
              Width = 180
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'LM_VIADESC'
              Width = 400
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'STATUS_ID'
              Width = 100
              Visible = True
            end>
        end
      end
      inherited pnFiltro: TPanel
        Width = 739
        inherited pnPesq: TPanel
          Width = 739
          inherited gbfiltroavansado: TGroupBox
            Width = 735
            inherited pnVoltar: TPanel
              Width = 731
              inherited lblBack: TLabel
                Left = 704
              end
            end
          end
          inherited gbFiltro: TGroupBox
            Width = 735
            object Label1: TLabel [0]
              Left = 13
              Top = 20
              Width = 31
              Height = 13
              Caption = 'Linhas'
            end
            object lblFilterStatus: TLabel [1]
              Left = 264
              Top = 17
              Width = 30
              Height = 13
              Caption = 'Status'
              FocusControl = lkFilterStatus
            end
            inherited pnPesquiza: TPanel
              Width = 731
              inherited lblAdvancedSearch: TLabel
                Width = 731
              end
            end
            object edtLinha: TEdit
              Left = 13
              Top = 35
              Width = 215
              Height = 21
              TabOrder = 1
            end
            object lkFilterStatus: TComboBox
              Left = 264
              Top = 34
              Width = 73
              Height = 21
              ItemHeight = 13
              TabOrder = 2
              Items.Strings = (
                'Ativo'
                'Inativo')
            end
          end
        end
      end
    end
    inherited tsBaseCadastroConsulta: TTabSheet
      object TGroupBox
        Left = 0
        Top = 0
        Width = 739
        Height = 382
        Align = alClient
        TabOrder = 0
        object Label4: TLabel
          Left = 24
          Top = 20
          Width = 33
          Height = 13
          Caption = 'C'#243'digo'
          FocusControl = dbLinhaDesc
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -12
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentFont = False
        end
        object Label5: TLabel
          Left = 154
          Top = 20
          Width = 48
          Height = 13
          Caption = 'Descri'#231#227'o'
          FocusControl = dbDescShort
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -12
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentFont = False
        end
        object Label6: TLabel
          Left = 24
          Top = 77
          Width = 42
          Height = 13
          Caption = 'Percurso'
          FocusControl = DBEdit6
        end
        object lblStatusCardUsers: TLabel
          Left = 233
          Top = 131
          Width = 30
          Height = 13
          Caption = 'Status'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -12
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentFont = False
        end
        object Fl_Code: TLabel
          Left = 455
          Top = 77
          Width = 39
          Height = 13
          Caption = 'Fl_Code'
        end
        object Label2: TLabel
          Left = 455
          Top = 20
          Width = 40
          Height = 13
          Caption = 'Lt_Code'
        end
        object Label3: TLabel
          Left = 26
          Top = 133
          Width = 57
          Height = 13
          Caption = 'Localiza'#231#227'o'
        end
        object dbLinhaDesc: TDBEdit
          Left = 24
          Top = 36
          Width = 113
          Height = 21
          DataField = 'LM_DESC'
          DataSource = dtsMaster
          TabOrder = 0
        end
        object dbDescShort: TDBEdit
          Left = 154
          Top = 37
          Width = 281
          Height = 21
          DataField = 'LM_DESCSHORT'
          DataSource = dtsMaster
          TabOrder = 1
        end
        object DBEdit6: TDBEdit
          Left = 24
          Top = 93
          Width = 412
          Height = 21
          DataField = 'LM_VIADESC'
          DataSource = dtsMaster
          TabOrder = 2
        end
        object dbCardUsersStatus: TRxDBComboBox
          Left = 234
          Top = 150
          Width = 118
          Height = 21
          Style = csDropDownList
          DataField = 'LM_STATUS'
          DataSource = dtsMaster
          EnableValues = True
          ItemHeight = 13
          Items.Strings = (
            'Ativo'
            'Inativo')
          TabOrder = 3
          Values.Strings = (
            'A'
            'I')
        end
        object RxDBLookupCombo1: TRxDBLookupCombo
          Left = 456
          Top = 93
          Width = 143
          Height = 20
          DropDownCount = 8
          DataField = 'FL_ID'
          DataSource = dtsMaster
          LookupField = 'FL_ID'
          LookupDisplay = 'FL_DESC'
          LookupSource = DmSys.dtsFarelevels
          TabOrder = 4
        end
        object RxDBLookupCombo2: TRxDBLookupCombo
          Left = 455
          Top = 37
          Width = 144
          Height = 20
          DropDownCount = 8
          DataField = 'LT_CODE'
          DataSource = dtsMaster
          LookupField = 'LT_CODE'
          LookupDisplay = 'LT_DESC'
          LookupSource = DmSys.dtsLineTypes
          TabOrder = 5
        end
        object RxDBLookupCombo3: TRxDBLookupCombo
          Left = 26
          Top = 150
          Width = 176
          Height = 20
          DropDownCount = 8
          DataField = 'LOC_CODE'
          DataSource = dtsMaster
          LookupField = 'LOC_CODE'
          LookupDisplay = 'LOC_DESC'
          LookupSource = DmSys.dtsLocations
          TabOrder = 6
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
    DataSet = DmSys.cdsLineMt
  end
end
