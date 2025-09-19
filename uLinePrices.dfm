inherited FrmLinePrices: TFrmLinePrices
  Left = 164
  Top = 185
  Width = 736
  Height = 424
  Caption = 'Pre'#231'os das Linhas'
  PixelsPerInch = 96
  TextHeight = 13
  inherited cbBase: TCoolBar
    Width = 720
    Bands = <
      item
        Control = tbBase
        ImageIndex = -1
        MinHeight = 24
        Width = 716
      end>
    inherited tbBase: TToolBar
      Width = 703
    end
  end
  inherited pcBaseCadastro: TPageControl
    Width = 720
    Height = 338
    ActivePage = tsBaseCadastroFiltro
    OnChange = pcBaseCadastroChange
    inherited tsBaseCadastroFiltro: TTabSheet
      inherited Splitter_Base1: TSplitter
        Width = 712
      end
      inherited gbGrid: TGroupBox
        Width = 712
        Height = 178
        inherited grdResultado: TDBGrid
          Width = 703
          Height = 185
          Align = alNone
          DataSource = dtsMaster
          Columns = <
            item
              Expanded = False
              FieldName = 'LDT_DESC'
              Title.Caption = 'Linha'
              Width = 180
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'LP_DATE'
              Title.Caption = 'Data'
              Width = 90
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'LP_FARE'
              Title.Caption = 'Fare'
              Width = 120
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
              FieldName = 'LP_REGDATE'
              Title.Caption = 'Registro'
              Width = 100
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'LP_REGUSER'
              Title.Caption = 'Usu'#225'rio'
              Width = 120
              Visible = True
            end>
        end
      end
      inherited pnFiltro: TPanel
        Width = 712
        inherited pnPesq: TPanel
          Width = 712
          inherited gbfiltroavansado: TGroupBox
            Width = 708
            inherited pnVoltar: TPanel
              Width = 704
              inherited lblBack: TLabel
                Left = 677
              end
            end
          end
          inherited gbFiltro: TGroupBox
            Width = 708
            object Label5: TLabel [0]
              Left = 259
              Top = 20
              Width = 21
              Height = 13
              Caption = 'Fare'
            end
            object Label10: TLabel [1]
              Left = 7
              Top = 68
              Width = 30
              Height = 13
              Caption = 'Status'
            end
            object Label6: TLabel [2]
              Left = 7
              Top = 20
              Width = 26
              Height = 13
              Caption = 'Linha'
            end
            inherited pnPesquiza: TPanel
              Width = 704
              TabOrder = 3
              inherited lblAdvancedSearch: TLabel
                Width = 704
              end
            end
            object edFare: TEdit
              Left = 259
              Top = 38
              Width = 144
              Height = 21
              TabOrder = 1
            end
            object lkFilterStatus: TComboBox
              Left = 7
              Top = 82
              Width = 130
              Height = 21
              ItemHeight = 13
              TabOrder = 2
              Items.Strings = (
                'Ativo'
                'Inativo')
            end
            object edLinha: TRxDBLookupCombo
              Left = 7
              Top = 38
              Width = 218
              Height = 20
              DropDownCount = 8
              LookupField = 'LDT_ID'
              LookupDisplay = 'LDT_DESC'
              TabOrder = 0
            end
          end
        end
      end
    end
    inherited tsBaseCadastroConsulta: TTabSheet
      object GroupBox1: TGroupBox
        Left = 0
        Top = 0
        Width = 712
        Height = 310
        Align = alClient
        TabOrder = 0
        object Label1: TLabel
          Left = 26
          Top = 26
          Width = 26
          Height = 13
          Caption = 'Linha'
        end
        object Label2: TLabel
          Left = 280
          Top = 26
          Width = 23
          Height = 13
          Caption = 'Data'
        end
        object Label3: TLabel
          Left = 26
          Top = 84
          Width = 47
          Height = 13
          Caption = 'LP_FARE'
          FocusControl = DBEdit3
        end
        object Label4: TLabel
          Left = 461
          Top = 26
          Width = 30
          Height = 13
          Caption = 'Status'
        end
        object Label7: TLabel
          Left = 280
          Top = 84
          Width = 29
          Height = 13
          Caption = 'FL_ID'
        end
        object DBEdit3: TDBEdit
          Left = 26
          Top = 99
          Width = 199
          Height = 21
          DataField = 'LP_FARE'
          DataSource = dtsMaster
          MaxLength = 20
          TabOrder = 0
        end
        object dbLkLinha: TRxDBLookupCombo
          Left = 26
          Top = 41
          Width = 199
          Height = 20
          DropDownCount = 8
          DataField = 'LDT_ID'
          DataSource = dtsMaster
          LookupField = 'LDT_ID'
          LookupDisplay = 'LDT_DESC'
          TabOrder = 1
        end
        object dbCardUsersStatus: TRxDBComboBox
          Left = 460
          Top = 41
          Width = 124
          Height = 21
          Style = csDropDownList
          DataField = 'LP_STATUS'
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
        object RxDBLookupCombo1: TRxDBLookupCombo
          Left = 278
          Top = 99
          Width = 187
          Height = 20
          DropDownCount = 8
          DataField = 'FL_ID'
          DataSource = dtsMaster
          LookupField = 'FL_ID'
          LookupDisplay = 'FL_DESC'
          LookupSource = DmSys.dtsFarelevels
          TabOrder = 3
        end
        object dbDate: TDateEdit
          Left = 278
          Top = 41
          Width = 131
          Height = 21
          NumGlyphs = 2
          TabOrder = 4
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
    DataSet = DmSys.cdsLinePrices
  end
end
