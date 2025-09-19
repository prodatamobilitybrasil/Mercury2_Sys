inherited FrmHolidays: TFrmHolidays
  Tag = 36
  Left = 287
  Top = 197
  Width = 661
  Height = 433
  Caption = 'Feriados'
  PixelsPerInch = 96
  TextHeight = 13
  inherited cbBase: TCoolBar
    Width = 653
    Bands = <
      item
        Control = tbBase
        ImageIndex = -1
        MinHeight = 24
        Width = 649
      end>
    inherited tbBase: TToolBar
      Width = 636
    end
  end
  inherited pcBaseCadastro: TPageControl
    Width = 653
    Height = 351
    ActivePage = tsBaseCadastroConsulta
    OnChange = pcBaseCadastroChange
    inherited tsBaseCadastroFiltro: TTabSheet
      inherited Splitter_Base1: TSplitter
        Top = 111
        Width = 645
        Height = 3
      end
      inherited gbGrid: TGroupBox
        Top = 114
        Width = 645
        Height = 209
        inherited grdResultado: TDBGrid
          Width = 641
          Height = 192
          DataSource = dtsMaster
          Columns = <
            item
              Expanded = False
              FieldName = 'HOL_DATE'
              Title.Caption = 'Data'
              Width = 80
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'HOL_DESC'
              Title.Caption = 'Feriado'
              Width = 280
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'STATUS_ID'
              Title.Caption = 'Status'
              Width = 70
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'HOL_REGDATE'
              Title.Caption = 'Registro'
              Width = 100
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'HOL_REGUSER'
              Title.Caption = 'Usu'#225'rio'
              Width = 100
              Visible = True
            end>
        end
      end
      inherited pnFiltro: TPanel
        Width = 645
        Height = 111
        inherited pnPesq: TPanel
          Width = 645
          Height = 111
          inherited gbfiltroavansado: TGroupBox
            Width = 641
            Height = 107
            inherited pnVoltar: TPanel
              Top = 92
              Width = 637
              inherited lblBack: TLabel
                Left = 610
              end
            end
          end
          inherited gbFiltro: TGroupBox
            Width = 641
            Height = 107
            object Label3: TLabel [0]
              Tag = 2053
              Left = 16
              Top = 16
              Width = 23
              Height = 13
              Caption = 'Data'
              FocusControl = edData
            end
            object Label4: TLabel [1]
              Tag = 2054
              Left = 144
              Top = 16
              Width = 35
              Height = 13
              Caption = 'Feriado'
              FocusControl = edFeriado
            end
            object lStatus: TLabel [2]
              Tag = 2055
              Left = 402
              Top = 16
              Width = 30
              Height = 13
              Caption = 'Status'
              FocusControl = lkFilterStatus
            end
            inherited pnPesquiza: TPanel
              Top = 92
              Width = 637
              inherited lblAdvancedSearch: TLabel
                Width = 637
              end
            end
            object edData: TDateEdit
              Left = 15
              Top = 32
              Width = 114
              Height = 21
              NumGlyphs = 2
              TabOrder = 1
            end
            object edFeriado: TEdit
              Left = 144
              Top = 32
              Width = 241
              Height = 21
              CharCase = ecUpperCase
              TabOrder = 2
            end
            object lkFilterStatus: TComboBox
              Left = 402
              Top = 32
              Width = 113
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
        Width = 645
        Height = 323
        Align = alClient
        TabOrder = 0
        object Label1: TLabel
          Left = 16
          Top = 16
          Width = 23
          Height = 13
          Caption = 'Data'
          FocusControl = dbDate
        end
        object Label2: TLabel
          Left = 16
          Top = 72
          Width = 35
          Height = 13
          Caption = 'Feriado'
          FocusControl = dbDesc
        end
        object lblStatusCardUsers: TLabel
          Tag = 2055
          Left = 212
          Top = 14
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
        object Label5: TLabel
          Left = 436
          Top = 14
          Width = 21
          Height = 13
          Caption = 'Tipo'
        end
        object dbDate: TDBDateEdit
          Left = 16
          Top = 32
          Width = 121
          Height = 21
          DataField = 'HOL_DATE'
          DataSource = dtsMaster
          NumGlyphs = 2
          TabOrder = 0
        end
        object dbDesc: TDBEdit
          Left = 16
          Top = 88
          Width = 499
          Height = 21
          CharCase = ecUpperCase
          DataField = 'HOL_DESC'
          DataSource = dtsMaster
          TabOrder = 1
        end
        object dbCardUsersStatus: TRxDBComboBox
          Tag = 2055
          Left = 212
          Top = 29
          Width = 143
          Height = 21
          Style = csDropDownList
          DataField = 'HOL_STATUS'
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
        object RxDBComboBox1: TRxDBComboBox
          Tag = 2055
          Left = 436
          Top = 29
          Width = 157
          Height = 21
          Style = csDropDownList
          DataField = 'HOL_TYPE'
          DataSource = dtsMaster
          EnableValues = True
          ItemHeight = 13
          Items.Strings = (
            'Nenhum'
            'Escolar'
            'P'#250'blico'
            'Escolar e P'#250'blico'
            'Outros')
          TabOrder = 3
          Values.Strings = (
            '0'
            '1'
            '2'
            '3'
            '4')
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
    DataSet = DmSys.cdsHolidays
  end
end
