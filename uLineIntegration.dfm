inherited FrmLineIntegration: TFrmLineIntegration
  Tag = 40
  Left = 231
  Top = 31
  Width = 793
  Height = 654
  Caption = 'Mapa de Integra'#231#245'es'
  PixelsPerInch = 96
  TextHeight = 13
  inherited cbBase: TCoolBar
    Width = 785
    Bands = <
      item
        Control = tbBase
        ImageIndex = -1
        MinHeight = 24
        Width = 781
      end>
    inherited tbBase: TToolBar
      Width = 768
    end
  end
  inherited pcBaseCadastro: TPageControl
    Width = 785
    Height = 575
    OnChange = pcBaseCadastroChange
    inherited tsBaseCadastroFiltro: TTabSheet
      inherited Splitter_Base1: TSplitter
        Width = 777
      end
      inherited gbGrid: TGroupBox
        Width = 777
        Height = 415
        inherited grdResultado: TDBGrid
          Width = 773
          Height = 398
          DataSource = dtsMaster
          Columns = <
            item
              Expanded = False
              FieldName = 'LM_DESCSHORT'
              Title.Caption = 'Linha'
              Width = 500
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'LI_ORIG_TYPE'
              Title.Caption = 'Tipo'
              Visible = False
            end
            item
              Expanded = False
              FieldName = 'LI_ORIG_LIID'
              Visible = False
            end
            item
              Expanded = False
              FieldName = 'LI_ORIG_LMID'
              Visible = False
            end
            item
              Expanded = False
              FieldName = 'LDR_DESC'
              Title.Caption = 'Sentido'
              Visible = False
            end
            item
              Expanded = False
              FieldName = 'LI_INTEG_VALUE'
              Title.Caption = 'Valor'
              Visible = False
            end
            item
              Expanded = False
              FieldName = 'LI_INTEG_TIME'
              Title.Caption = 'Tempo'
              Visible = False
            end>
        end
      end
      inherited pnFiltro: TPanel
        Width = 777
        inherited pnPesq: TPanel
          Width = 777
          inherited gbfiltroavansado: TGroupBox
            Width = 773
            inherited pnVoltar: TPanel
              Width = 769
              inherited lblBack: TLabel
                Left = 742
              end
            end
          end
          inherited gbFiltro: TGroupBox
            Width = 773
            object Label2: TLabel [0]
              Tag = 2116
              Left = 8
              Top = 32
              Width = 26
              Height = 13
              Caption = 'Linha'
            end
            inherited pnPesquiza: TPanel
              Width = 769
              inherited lblAdvancedSearch: TLabel
                Width = 769
              end
            end
            object dbkLineMT: TRxDBLookupCombo
              Left = 8
              Top = 48
              Width = 369
              Height = 21
              DropDownCount = 8
              LookupField = 'LM_ID'
              LookupDisplay = 'LM_DESC'
              LookupSource = DmSys.dtsLineMT
              TabOrder = 1
            end
          end
        end
      end
    end
    inherited tsBaseCadastroConsulta: TTabSheet
      object Splitter1: TSplitter
        Left = 0
        Top = 239
        Width = 777
        Height = 2
        Cursor = crVSplit
        Align = alBottom
      end
      object Panel1: TPanel
        Left = 0
        Top = 0
        Width = 777
        Height = 55
        Align = alTop
        BevelInner = bvLowered
        TabOrder = 0
        object Label1: TLabel
          Left = 8
          Top = 8
          Width = 26
          Height = 13
          Caption = 'Linha'
          FocusControl = dbLineMT
        end
        object dbLineMT: TRxDBLookupCombo
          Left = 8
          Top = 24
          Width = 249
          Height = 21
          DropDownCount = 8
          Enabled = False
          LookupField = 'LM_ID'
          LookupDisplay = 'LM_DESCSHORT'
          LookupSource = DmSys.dtsLineMT
          TabOrder = 0
          OnCloseUp = dbLineMTCloseUp
        end
        object btnDeleteIntegration: TBitBtn
          Left = 652
          Top = 22
          Width = 119
          Height = 29
          Caption = 'Excluir Integra'#231#227'o'
          TabOrder = 1
          OnClick = btnDeleteIntegrationClick
          Glyph.Data = {
            36040000424D3604000000000000360000002800000010000000100000000100
            2000000000000004000000000000000000000000000000000000FF00FF00FF00
            FF00FF00FF0094949400B5B5B500B5B5B500B5B5B50094949400FF00FF00FF00
            FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
            FF00C6C6C600DEDEDE00F7F7F700F7FFFF00F7F7F700F7F7F700EFEFEF00CECE
            CE0094949400FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF009C63
            6300C6C6C600DEDEDE00F7F7F700F7FFFF00FFCE3100F7F7F700C6D6EF006363
            9C0063639C00FFCECE0094949400FF00FF00FF00FF00FF00FF00FF00FF009C63
            6300C6C6C600DEDEDE00F7F7F700F7FFFF00FFCE6300C6D6EF00FFCE3100FF9C
            6300FF636300FF633100B5B5B5009C9C9C00FF00FF00FF00FF00FF00FF009C63
            6300C6C6C600DEDEDE00F7F7F700F7FFFF00FFCE6300FFCE3100FF9C6300D6E7
            E700FFCECE00FFCECE0063639C00A5A5A50063313100FF00FF00FF00FF009C63
            6300C6C6C600DEDEDE00F7F7F700F7FFFF00FFCE6300FFFF0000FF9C3100D6E7
            E700FFCECE00FFCECE00CE310000A5A5A50063313100FF00FF00FF00FF009C63
            6300C6C6C600DEDEDE00F7F7F700F7FFFF00FFFF9C00FFCE3100EFEFEF00D6E7
            E700FFCECE00FFCECE00B5B5B500A5A5A50063313100FF00FF00FF00FF009C63
            6300C6C6C600DEDEDE00F7F7F700F7FFFF00F7F7F700FFCE3100EFEFEF00D6E7
            E700FFCECE00FF313100CE310000A5A5A50063313100FF00FF00FF00FF009C63
            6300C6C6C600DEDEDE00F7F7F700F7FFFF00F7F7F700FFCE31009C9CCE00C6D6
            EF00FFCECE00FF313100CE310000A5A5A50063313100FF00FF00FF00FF009C63
            6300C6C6C600DEDEDE00F7F7F700F7FFFF00F7F7F700F7F7F700FF9C3100FF63
            6300FF633100CE3100009C003100A5A5A50063313100FF00FF00FF00FF009C63
            6300C6C6C600C6C6C600C6C6C600C6C6C600B5B5B500B5B5B500B5B5B500CECE
            CE00CECECE00FFCECE009C003100A5A5A50063313100FF00FF00FF00FF009C63
            6300CEFFFF0063639C00633131009C6363009C636300A5A5A500D6E7E700C6D6
            EF00C6C6C600A5A5A500B5B5B500A5A5A50063313100FF00FF00FF00FF009C63
            63006331310031636300FFEFCE00FFEFCE0052525200FFCECE00EFEFEF000031
            63009C636300D6E7E700A5A5A500CE9C9C0063313100FF00FF00FF00FF00FF00
            FF0063313100FFCECE003163630052525200FFCECE00EFEFEF00CE9C6300CE9C
            6300FFFFFF00C6D6EF009C636300D6E7E70063313100FF00FF00FF00FF00FF00
            FF00FF00FF00CE9C9C00FFCECE0000313100FFCECE0031000000FFEFCE00FFEF
            CE00CECE9C00CE9C6300310000008484840063313100FF00FF00FF00FF00FF00
            FF00FF00FF00FF00FF00FF00FF0000639C00525252009C9CCE00C6D6EF005252
            5200FFFFFF0063313100737373009C636300FF00FF00FF00FF00}
        end
      end
      object sgIntegration: TStringGrid
        Left = 0
        Top = 55
        Width = 777
        Height = 184
        Align = alClient
        ColCount = 12
        DefaultColWidth = 100
        DefaultRowHeight = 19
        FixedCols = 0
        RowCount = 2
        Options = [goFixedVertLine, goFixedHorzLine, goVertLine, goHorzLine, goRangeSelect, goRowSelect]
        TabOrder = 1
        OnSelectCell = sgIntegrationSelectCell
      end
      object Panel2: TPanel
        Left = 0
        Top = 241
        Width = 777
        Height = 153
        Align = alBottom
        BevelInner = bvLowered
        TabOrder = 2
        object GroupBox1: TGroupBox
          Tag = 2123
          Left = 2
          Top = 2
          Width = 773
          Height = 149
          Align = alClient
          Caption = ' Detalhes '
          TabOrder = 0
          object grdLineIntegrationDT: TDBGrid
            Left = 2
            Top = 15
            Width = 769
            Height = 132
            Align = alClient
            DataSource = dmSys1.dtsLineIntegrationDT
            Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgConfirmDelete, dgCancelOnExit]
            TabOrder = 0
            TitleFont.Charset = DEFAULT_CHARSET
            TitleFont.Color = clWindowText
            TitleFont.Height = -11
            TitleFont.Name = 'MS Sans Serif'
            TitleFont.Style = []
            OnCellClick = grdLineIntegrationDTCellClick
            Columns = <
              item
                Expanded = False
                FieldName = 'LID_DATE'
                Title.Caption = 'DATA'
                Width = 124
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'LID_INTEGVALUE'
                Title.Caption = 'VALOR'
                Width = 138
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'LITG_DESC'
                Title.Caption = 'GRUPO'
                Visible = False
              end>
          end
        end
      end
      object Panel3: TPanel
        Left = 0
        Top = 394
        Width = 777
        Height = 153
        Align = alBottom
        BevelInner = bvLowered
        TabOrder = 3
        object GroupBox2: TGroupBox
          Tag = 2123
          Left = 2
          Top = 2
          Width = 773
          Height = 149
          Align = alClient
          Caption = 'Aplica'#231#245'es'
          TabOrder = 0
          object DBGrid1: TDBGrid
            Left = 2
            Top = 15
            Width = 769
            Height = 132
            Align = alClient
            DataSource = dmSys1.dtsLineIntegrationDTXApps
            Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgConfirmDelete, dgCancelOnExit]
            TabOrder = 0
            TitleFont.Charset = DEFAULT_CHARSET
            TitleFont.Color = clWindowText
            TitleFont.Height = -11
            TitleFont.Name = 'MS Sans Serif'
            TitleFont.Style = []
            Columns = <
              item
                Expanded = False
                FieldName = 'APP_ISS_ID'
                Title.Caption = 'Emissor'
                Width = 60
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'APP_ID'
                Title.Caption = 'Aplica'#231#227'o'
                Width = 60
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'LIDAPP_INTEGVALUE'
                Title.Caption = 'Valor'
                Width = 75
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'LITG_DESC'
                Title.Caption = 'Grupo'
                Width = 124
                Visible = True
              end>
          end
        end
      end
    end
  end
  inherited imglstBase: TImageList
    Left = 588
  end
  inherited actlstBase: TActionList
    inherited actFilter: TAction
      OnExecute = actFilterExecute
    end
    inherited actDelete: TAction
      Enabled = False
    end
  end
end
