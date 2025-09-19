inherited FrmTransportProvidersXInfoParameters: TFrmTransportProvidersXInfoParameters
  Tag = 136
  Caption = 'RDO Empresas x Par'#226'metros'
  PixelsPerInch = 96
  TextHeight = 13
  inherited pcBaseCadastro: TPageControl
    ActivePage = tsBaseCadastroConsulta
    OnChange = pcBaseCadastroChange
    inherited tsBaseCadastroFiltro: TTabSheet
      inherited gbGrid: TGroupBox
        inherited grdResultado: TDBGrid
          DataSource = dtsMaster
          Columns = <
            item
              Expanded = False
              FieldName = 'TPXIP_ID'
              Title.Caption = 'C'#243'digo'
              Width = 50
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'TP_DESC'
              Title.Caption = 'Empresa'
              Width = 250
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'IP_DESC'
              Title.Caption = 'Par'#226'metro'
              Width = 250
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'TPXIP_STATUS'
              Title.Caption = 'Status'
              Width = 50
              Visible = True
            end>
        end
      end
      inherited pnFiltro: TPanel
        inherited pnPesq: TPanel
          inherited gbFiltro: TGroupBox
            object lbl1: TLabel [0]
              Left = 8
              Top = 8
              Width = 33
              Height = 13
              Caption = 'C'#243'digo'
            end
            object lbl2: TLabel [1]
              Left = 95
              Top = 8
              Width = 46
              Height = 13
              Caption = 'Empresas'
            end
            object lbl3: TLabel [2]
              Left = 8
              Top = 46
              Width = 30
              Height = 13
              Caption = 'Status'
            end
            object lbl4: TLabel [3]
              Left = 95
              Top = 46
              Width = 53
              Height = 13
              Caption = 'Par'#226'metros'
            end
            object edtConCodigo: TEdit
              Left = 8
              Top = 24
              Width = 80
              Height = 21
              TabOrder = 1
            end
            object edtConStatus: TEdit
              Left = 8
              Top = 61
              Width = 80
              Height = 21
              TabOrder = 3
            end
            object edtConTransportProviders: TEdit
              Left = 95
              Top = 24
              Width = 552
              Height = 21
              TabOrder = 2
            end
            object edtConParameters: TEdit
              Left = 95
              Top = 61
              Width = 552
              Height = 21
              TabOrder = 4
            end
          end
        end
      end
    end
    inherited tsBaseCadastroConsulta: TTabSheet
      object gbManutencaoHeader: TGroupBox
        Left = 0
        Top = 0
        Width = 660
        Height = 105
        Align = alTop
        TabOrder = 0
        object lbl9: TLabel
          Left = 95
          Top = 46
          Width = 53
          Height = 13
          Caption = 'Par'#226'metros'
        end
        object lbl10: TLabel
          Left = 8
          Top = 8
          Width = 33
          Height = 13
          Caption = 'C'#243'digo'
        end
        object lbl11: TLabel
          Left = 95
          Top = 8
          Width = 46
          Height = 13
          Caption = 'Empresas'
        end
        object lbl12: TLabel
          Left = 8
          Top = 46
          Width = 30
          Height = 13
          Caption = 'Status'
        end
        object dbEdEmpresas: TRxDBLookupCombo
          Left = 96
          Top = 24
          Width = 555
          Height = 21
          DropDownCount = 8
          DataField = 'TP_ID'
          DataSource = dtsMaster
          LookupField = 'TP_ID'
          LookupDisplay = 'TP_DESC'
          LookupSource = DmSys.dtsTransportProviders
          TabOrder = 1
        end
        object dbEdParameters: TRxDBLookupCombo
          Left = 96
          Top = 64
          Width = 555
          Height = 21
          DropDownCount = 8
          EscapeClear = False
          DataField = 'IP_ID'
          DataSource = dtsMaster
          LookupField = 'IP_ID'
          LookupDisplay = 'IP_DESC'
          LookupSource = dmSys1.dtsInfoParameters
          TabOrder = 3
        end
        object dbEdCodigo: TDBEdit
          Left = 8
          Top = 24
          Width = 80
          Height = 21
          DataField = 'TPXIP_ID'
          DataSource = dtsMaster
          TabOrder = 0
        end
        object dbEdStatus: TDBEdit
          Left = 8
          Top = 64
          Width = 80
          Height = 21
          DataField = 'TPXIP_STATUS'
          DataSource = dtsMaster
          TabOrder = 2
        end
      end
      object gbManutencaoFooter: TGroupBox
        Left = 0
        Top = 104
        Width = 660
        Height = 187
        Align = alBottom
        TabOrder = 1
      end
    end
  end
  inherited actlstBase: TActionList
    inherited actFilter: TAction
      OnExecute = actFilterExecute
    end
  end
end
