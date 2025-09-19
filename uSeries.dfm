inherited FrmSeries: TFrmSeries
  Tag = 52
  Width = 635
  Height = 427
  Caption = 'S'#233'ries'
  PixelsPerInch = 96
  TextHeight = 13
  inherited cbBase: TCoolBar
    Width = 627
    Bands = <
      item
        Control = tbBase
        ImageIndex = -1
        MinHeight = 24
        Width = 623
      end>
    inherited tbBase: TToolBar
      Width = 610
    end
  end
  inherited pcBaseCadastro: TPageControl
    Width = 627
    Height = 345
    OnChange = pcBaseCadastroChange
    inherited tsBaseCadastroFiltro: TTabSheet
      Tag = 500
      inherited Splitter_Base1: TSplitter
        Top = 108
        Width = 619
      end
      inherited gbGrid: TGroupBox
        Top = 112
        Width = 619
        Height = 205
        inherited grdResultado: TDBGrid
          Width = 615
          Height = 188
          DataSource = dtsMaster
          Columns = <
            item
              Expanded = False
              FieldName = 'SE_ID'
              Title.Caption = 'C'#243'digo'
              Width = 90
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'SE_DESC'
              Title.Caption = 'Descri'#231#227'o'
              Width = 200
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'SE_REGDATE'
              Title.Caption = 'Registro'
              Width = 100
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'SE_REGUSER'
              Title.Caption = 'Usu'#225'rio'
              Width = 100
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'STATUS_ID'
              Title.Caption = 'Status'
              Width = 80
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'SE_VALIDITY'
              Title.Caption = 'Validade'
              Width = 100
              Visible = True
            end>
        end
      end
      inherited pnFiltro: TPanel
        Width = 619
        Height = 108
        inherited pnPesq: TPanel
          Width = 619
          Height = 108
          inherited gbfiltroavansado: TGroupBox
            Width = 615
            Height = 104
            inherited pnVoltar: TPanel
              Top = 89
              Width = 611
              inherited lblBack: TLabel
                Left = 584
              end
            end
          end
          inherited gbFiltro: TGroupBox
            Width = 615
            Height = 104
            object Label3: TLabel [0]
              Tag = 2387
              Left = 132
              Top = 16
              Width = 48
              Height = 13
              Caption = 'Descri'#231#227'o'
              FocusControl = edDesc
            end
            object lStatus: TLabel [1]
              Tag = 2390
              Left = 451
              Top = 16
              Width = 30
              Height = 13
              Caption = 'Status'
              FocusControl = lkFilterStatus
            end
            object Label5: TLabel [2]
              Tag = 2386
              Left = 11
              Top = 16
              Width = 33
              Height = 13
              Caption = 'C'#243'digo'
              FocusControl = edCodigo
            end
            inherited pnPesquiza: TPanel
              Top = 89
              Width = 611
              TabOrder = 1
              inherited lblAdvancedSearch: TLabel
                Width = 611
              end
            end
            object edDesc: TEdit
              Left = 132
              Top = 32
              Width = 297
              Height = 21
              CharCase = ecUpperCase
              TabOrder = 2
            end
            object lkFilterStatus: TComboBox
              Left = 451
              Top = 32
              Width = 113
              Height = 21
              ItemHeight = 13
              TabOrder = 3
              Items.Strings = (
                'Ativo'
                'Inativo')
            end
            object edCodigo: TEdit
              Left = 9
              Top = 32
              Width = 109
              Height = 21
              CharCase = ecUpperCase
              TabOrder = 0
            end
          end
        end
      end
    end
    inherited tsBaseCadastroConsulta: TTabSheet
      Tag = 501
      object Label2: TLabel
        Left = 176
        Top = 32
        Width = 48
        Height = 13
        Caption = 'Descri'#231#227'o'
        FocusControl = dbDesc
      end
      object Label6: TLabel
        Left = 16
        Top = 96
        Width = 41
        Height = 13
        Caption = 'Validade'
        FocusControl = dbVal
      end
      object Label1: TLabel
        Tag = 2390
        Left = 182
        Top = 96
        Width = 30
        Height = 13
        Caption = 'Status'
        FocusControl = dbCardUsersStatus
      end
      object Label4: TLabel
        Left = 16
        Top = 32
        Width = 33
        Height = 13
        Caption = 'C'#243'digo'
        FocusControl = dbCodigo
      end
      object dbDesc: TDBEdit
        Left = 176
        Top = 48
        Width = 417
        Height = 21
        CharCase = ecUpperCase
        DataField = 'SE_DESC'
        DataSource = dtsMaster
        TabOrder = 1
      end
      object dbVal: TDBEdit
        Left = 16
        Top = 112
        Width = 153
        Height = 21
        DataField = 'SE_VALIDITY'
        DataSource = dtsMaster
        TabOrder = 2
      end
      object dbCardUsersStatus: TRxDBComboBox
        Left = 182
        Top = 112
        Width = 134
        Height = 21
        Style = csDropDownList
        DataField = 'SE_STATUS'
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
      object dbCodigo: TDBEdit
        Left = 16
        Top = 48
        Width = 145
        Height = 21
        CharCase = ecUpperCase
        DataField = 'SE_ID'
        DataSource = dtsMaster
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
    DataSet = DmSys.cdsSeries
  end
end
