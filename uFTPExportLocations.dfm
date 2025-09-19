inherited FrmFTPExportLocations: TFrmFTPExportLocations
  Tag = 134
  Caption = 'Locais de Exporta'#231#227'o FTP Server'
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
              FieldName = 'FTPS_CODE'
              Title.Caption = 'C'#243'digo'
              Width = 40
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'FTPS_PERIODICITY'
              Title.Caption = 'Periodo'
              Width = 100
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'FTPS_ADDRESS'
              Title.Caption = 'Endereco FTP'
              Width = 200
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'FTPS_DIR'
              Title.Caption = 'Diretorio FTP'
              Width = 200
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'FTPS_USER'
              Title.Caption = 'Login'
              Width = 100
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'FTPS_PASSWORD'
              Title.Caption = 'Senha'
              Width = 100
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'FTPS_STATUS'
              Title.Caption = 'Status'
              Width = 40
              Visible = True
            end>
        end
      end
      inherited pnFiltro: TPanel
        inherited pnPesq: TPanel
          inherited gbFiltro: TGroupBox
            object Label7: TLabel [0]
              Left = 15
              Top = 13
              Width = 33
              Height = 13
              Caption = 'C'#243'digo'
            end
            object Label8: TLabel [1]
              Left = 143
              Top = 13
              Width = 69
              Height = 13
              Caption = 'Endere'#231'o FTP'
            end
            object Label9: TLabel [2]
              Left = 15
              Top = 52
              Width = 62
              Height = 13
              Caption = 'Diret'#243'rio FTP'
            end
            inherited pnPesquiza: TPanel
              TabOrder = 3
            end
            object edConsulCodigo: TEdit
              Left = 13
              Top = 29
              Width = 121
              Height = 21
              TabOrder = 0
            end
            object edConsulEndFTP: TEdit
              Left = 141
              Top = 29
              Width = 497
              Height = 21
              TabOrder = 1
            end
            object edConsulDirFTP: TEdit
              Left = 13
              Top = 68
              Width = 625
              Height = 21
              TabOrder = 2
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
        Height = 168
        Align = alClient
        TabOrder = 0
        object Label1: TLabel
          Left = 18
          Top = 16
          Width = 33
          Height = 13
          Caption = 'C'#243'digo'
        end
        object Label2: TLabel
          Left = 146
          Top = 16
          Width = 69
          Height = 13
          Caption = 'Endere'#231'o FTP'
        end
        object Label3: TLabel
          Left = 18
          Top = 55
          Width = 62
          Height = 13
          Caption = 'Diret'#243'rio FTP'
        end
        object Label4: TLabel
          Left = 18
          Top = 96
          Width = 26
          Height = 13
          Caption = 'Login'
        end
        object Label5: TLabel
          Left = 147
          Top = 96
          Width = 31
          Height = 13
          Caption = 'Senha'
        end
        object Label6: TLabel
          Left = 275
          Top = 96
          Width = 197
          Height = 13
          Caption = 'Per'#237'odo (tempo para fechamento arquivo)'
        end
        object dbCodigo: TDBEdit
          Left = 16
          Top = 32
          Width = 121
          Height = 21
          DataField = 'FTPS_CODE'
          DataSource = dtsMaster
          ReadOnly = True
          TabOrder = 0
        end
        object dbEnderecoFTP: TDBEdit
          Left = 144
          Top = 32
          Width = 497
          Height = 21
          DataField = 'FTPS_ADDRESS'
          DataSource = dtsMaster
          TabOrder = 1
        end
        object dbDiretorioFTP: TDBEdit
          Left = 16
          Top = 71
          Width = 625
          Height = 21
          DataField = 'FTPS_DIR'
          DataSource = dtsMaster
          TabOrder = 2
        end
        object dbLogin: TDBEdit
          Left = 16
          Top = 112
          Width = 121
          Height = 21
          DataField = 'FTPS_USER'
          DataSource = dtsMaster
          TabOrder = 3
        end
        object dbSenha: TDBEdit
          Left = 145
          Top = 112
          Width = 121
          Height = 21
          DataField = 'FTPS_PASSWORD'
          DataSource = dtsMaster
          TabOrder = 4
        end
        object dbPeriodo: TDBEdit
          Left = 273
          Top = 112
          Width = 121
          Height = 21
          DataField = 'FTPS_PERIODICITY'
          DataSource = dtsMaster
          MaxLength = 3
          TabOrder = 5
        end
      end
      object gbManutencaoFooter: TGroupBox
        Left = 0
        Top = 168
        Width = 660
        Height = 123
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
