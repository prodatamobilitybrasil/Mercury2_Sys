inherited FrmMasterApp: TFrmMasterApp
  Tag = 44
  Left = 244
  Top = 114
  Width = 701
  Height = 453
  Caption = 'Aplica'#231#227'o Master'
  Constraints.MinHeight = 453
  Constraints.MinWidth = 701
  Position = poDesktopCenter
  PixelsPerInch = 96
  TextHeight = 13
  inherited cbBase: TCoolBar
    Width = 693
    Bands = <
      item
        Control = tbBase
        ImageIndex = -1
        MinHeight = 24
        Width = 689
      end>
    inherited tbBase: TToolBar
      Width = 676
    end
  end
  inherited pcBaseCadastro: TPageControl
    Width = 693
    Height = 371
    OnChange = pcBaseCadastroChange
    inherited tsBaseCadastroFiltro: TTabSheet
      inherited Splitter_Base1: TSplitter
        Width = 685
      end
      inherited gbGrid: TGroupBox
        Width = 685
        Height = 211
        inherited grdResultado: TDBGrid
          Width = 681
          Height = 194
          DataSource = dtsMaster
          Columns = <
            item
              Expanded = False
              FieldName = 'MA_ID'
              Title.Caption = 'C'#243'digo'
              Width = 120
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'MA_DESC'
              Title.Caption = 'Descri'#231#227'o'
              Width = 200
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'STATUS_ID'
              Title.Caption = 'Status'
              Width = 100
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'MA_REGDATE'
              Title.Caption = 'Registro'
              Width = 100
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'MA_REGUSER'
              Title.Caption = 'Usu'#225'rio'
              Width = 120
              Visible = True
            end>
        end
      end
      inherited pnFiltro: TPanel
        Width = 685
        inherited pnPesq: TPanel
          Width = 685
          inherited gbfiltroavansado: TGroupBox
            Width = 681
            inherited pnVoltar: TPanel
              Width = 677
              inherited lblBack: TLabel
                Left = 650
              end
            end
          end
          inherited gbFiltro: TGroupBox
            Width = 681
            object Label3: TLabel [0]
              Tag = 2163
              Left = 13
              Top = 28
              Width = 33
              Height = 13
              Caption = 'C'#243'digo'
              FocusControl = edCodigo
            end
            object Label4: TLabel [1]
              Tag = 2164
              Left = 150
              Top = 28
              Width = 48
              Height = 13
              Caption = 'Descri'#231#227'o'
              FocusControl = edDesc
            end
            object lStatus: TLabel [2]
              Tag = 2165
              Left = 408
              Top = 28
              Width = 30
              Height = 13
              Caption = 'Status'
              FocusControl = lkFilterStatus
            end
            inherited pnPesquiza: TPanel
              Width = 677
              inherited lblAdvancedSearch: TLabel
                Width = 677
              end
            end
            object edCodigo: TEdit
              Left = 13
              Top = 46
              Width = 111
              Height = 21
              MaxLength = 5
              TabOrder = 1
            end
            object edDesc: TEdit
              Left = 150
              Top = 46
              Width = 241
              Height = 21
              CharCase = ecUpperCase
              MaxLength = 50
              TabOrder = 2
            end
            object lkFilterStatus: TComboBox
              Left = 406
              Top = 44
              Width = 115
              Height = 21
              Style = csDropDownList
              ItemHeight = 13
              ItemIndex = 0
              TabOrder = 3
              Text = 'Ativo'
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
        Width = 685
        Height = 79
        Align = alTop
        TabOrder = 0
        object Label1: TLabel
          Left = 13
          Top = 20
          Width = 33
          Height = 13
          Caption = 'C'#243'digo'
          FocusControl = dbCodigo
        end
        object dbCodigo: TDBEdit
          Left = 13
          Top = 33
          Width = 118
          Height = 21
          DataField = 'MA_ID'
          DataSource = dtsMaster
          MaxLength = 5
          TabOrder = 0
        end
      end
      object GroupBox2: TGroupBox
        Left = 0
        Top = 79
        Width = 685
        Height = 264
        Align = alClient
        TabOrder = 1
        object Label2: TLabel
          Left = 13
          Top = 20
          Width = 48
          Height = 13
          Caption = 'Descri'#231#227'o'
          FocusControl = dbDesc
        end
        object lblStatusCardUsers: TLabel
          Tag = 2165
          Left = 390
          Top = 20
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
        object dbDesc: TDBEdit
          Left = 13
          Top = 37
          Width = 352
          Height = 21
          CharCase = ecUpperCase
          DataField = 'MA_DESC'
          DataSource = dtsMaster
          TabOrder = 0
        end
        object dbCardUsersStatus: TRxDBComboBox
          Left = 389
          Top = 37
          Width = 140
          Height = 21
          Style = csDropDownList
          DataField = 'MA_STATUS'
          DataSource = dtsMaster
          EnableValues = True
          ItemHeight = 13
          Items.Strings = (
            'Ativo'
            'Inativo')
          TabOrder = 1
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
    inherited actLog: TAction
      Tag = 1215
    end
  end
end
