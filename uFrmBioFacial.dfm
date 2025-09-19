inherited FrmBioFacial: TFrmBioFacial
  Tag = 35
  Left = 241
  Top = 112
  Width = 959
  Height = 495
  Caption = 'Tipos de Biometria Facial'
  PixelsPerInch = 96
  TextHeight = 13
  inherited cbBase: TCoolBar
    Width = 951
    Bands = <
      item
        Control = tbBase
        ImageIndex = -1
        MinHeight = 24
        Width = 947
      end>
    inherited tbBase: TToolBar
      Width = 934
      inherited tbtnNew1: TToolButton
        Visible = False
      end
      object lbFiltrado: TLabel
        Left = 354
        Top = 2
        Width = 111
        Height = 22
        Cursor = crHandPoint
        Hint = 'Limpa FILTRO'
        AutoSize = False
        Caption = ' FILTRADO'
        Color = clBtnFace
        Font.Charset = ANSI_CHARSET
        Font.Color = clRed
        Font.Height = -19
        Font.Name = 'Courier New'
        Font.Style = [fsBold]
        ParentColor = False
        ParentFont = False
        Visible = False
        OnClick = btnLimpaFiltroClick
      end
    end
  end
  inherited pcBaseCadastro: TPageControl
    Width = 951
    Height = 416
    inherited tsBaseCadastroFiltro: TTabSheet
      OnShow = tsBaseCadastroFiltroShow
      inherited Splitter_Base1: TSplitter
        Top = 89
        Width = 943
        Color = clBlack
        ParentColor = False
      end
      inherited gbGrid: TGroupBox
        Top = 93
        Width = 943
        Height = 295
        inherited grdResultado: TDBGrid
          Width = 939
          Height = 278
          DataSource = dtsMaster
          Options = [dgTitles, dgColumnResize, dgColLines, dgRowLines, dgRowSelect, dgAlwaysShowSelection]
          ParentFont = False
          TitleFont.Style = [fsBold]
          OnCellClick = grdResultadoCellClick
          OnTitleClick = grdResultadoTitleClick
          Columns = <
            item
              Alignment = taCenter
              Color = clAqua
              Expanded = False
              FieldName = 'BIDC_ID'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Height = -11
              Font.Name = 'MS Sans Serif'
              Font.Style = [fsBold]
              Title.Alignment = taCenter
              Title.Caption = 'ID'
              Title.Color = clLime
              Width = 56
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'BIDL_DESC'
              Title.Caption = 'Empresa'
              Visible = True
            end
            item
              Alignment = taCenter
              Expanded = False
              FieldName = 'ISS_ID'
              Title.Alignment = taCenter
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'APP_ID'
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'App_Desclong'
              Title.Caption = 'Aplica'#231#227'o'
              Width = 200
              Visible = True
            end
            item
              Alignment = taCenter
              Expanded = False
              FieldName = 'BIAC_ID'
              Title.Alignment = taCenter
              Visible = True
            end
            item
              Alignment = taCenter
              Expanded = False
              FieldName = 'status_desc'
              Title.Alignment = taCenter
              Title.Caption = 'Situa'#231#227'o'
              Width = 89
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'BIDC_REGDATE'
              Width = 120
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'BIDC_REGUSER'
              Visible = True
            end>
        end
      end
      inherited pnFiltro: TPanel
        Width = 943
        Height = 89
        inherited pnPesq: TPanel
          Width = 943
          Height = 89
          inherited gbFiltroAvansado: TGroupBox
            Width = 939
            Height = 85
            object Splitter1: TSplitter [0]
              Left = 153
              Top = 15
              Height = 55
              Color = clBlack
              ParentColor = False
            end
            inherited pnVoltar: TPanel
              Top = 70
              Width = 935
              inherited lblBack: TLabel
                Left = 908
              end
            end
            object Panel6: TPanel
              Left = 2
              Top = 15
              Width = 151
              Height = 55
              Align = alLeft
              TabOrder = 1
              object Panel7: TPanel
                Left = 1
                Top = 1
                Width = 149
                Height = 24
                Align = alTop
                BevelInner = bvLowered
                Caption = 'Campos:'
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clWindowText
                Font.Height = -13
                Font.Name = 'MS Sans Serif'
                Font.Style = [fsBold]
                ParentFont = False
                TabOrder = 0
              end
              object lbCampos: TListBox
                Left = 1
                Top = 25
                Width = 149
                Height = 29
                Align = alClient
                ItemHeight = 13
                TabOrder = 1
                OnClick = lbCamposClick
              end
            end
            object Panel4: TPanel
              Left = 156
              Top = 15
              Width = 781
              Height = 55
              Align = alClient
              TabOrder = 2
              object Panel5: TPanel
                Left = 1
                Top = 1
                Width = 779
                Height = 32
                Align = alTop
                TabOrder = 0
                object Label1: TLabel
                  Left = 5
                  Top = 6
                  Width = 70
                  Height = 18
                  Caption = 'Filtro:'
                  Font.Charset = ANSI_CHARSET
                  Font.Color = clWindowText
                  Font.Height = -16
                  Font.Name = 'Courier New'
                  Font.Style = [fsBold]
                  ParentFont = False
                  ParentShowHint = False
                  ShowHint = False
                end
                object editFiltro: TEdit
                  Left = 82
                  Top = 5
                  Width = 415
                  Height = 21
                  Color = clBtnFace
                  ReadOnly = True
                  TabOrder = 0
                end
              end
              object Panel8: TPanel
                Left = 1
                Top = 33
                Width = 779
                Height = 21
                Align = alClient
                TabOrder = 1
                object Splitter2: TSplitter
                  Left = 137
                  Top = 33
                  Height = 128
                  Color = clBlack
                  ParentColor = False
                end
                object Panel9: TPanel
                  Left = 1
                  Top = 33
                  Width = 136
                  Height = 128
                  Align = alLeft
                  TabOrder = 0
                  object Panel10: TPanel
                    Left = 1
                    Top = 1
                    Width = 134
                    Height = 24
                    Align = alTop
                    BevelInner = bvLowered
                    Caption = 'Conectores:'
                    Font.Charset = DEFAULT_CHARSET
                    Font.Color = clWindowText
                    Font.Height = -13
                    Font.Name = 'MS Sans Serif'
                    Font.Style = [fsBold]
                    ParentFont = False
                    TabOrder = 0
                  end
                  object lbConector: TListBox
                    Left = 1
                    Top = 25
                    Width = 134
                    Height = 102
                    Align = alClient
                    ItemHeight = 13
                    TabOrder = 1
                    OnClick = lbConectorClick
                  end
                end
                object Panel11: TPanel
                  Left = 1
                  Top = 1
                  Width = 777
                  Height = 32
                  Align = alTop
                  TabOrder = 1
                  object Label2: TLabel
                    Left = 5
                    Top = 6
                    Width = 60
                    Height = 18
                    Caption = 'Valor:'
                    Font.Charset = ANSI_CHARSET
                    Font.Color = clWindowText
                    Font.Height = -16
                    Font.Name = 'Courier New'
                    Font.Style = [fsBold]
                    ParentFont = False
                  end
                  object editValor: TEdit
                    Left = 80
                    Top = 5
                    Width = 415
                    Height = 21
                    TabOrder = 0
                  end
                end
                object Panel12: TPanel
                  Left = 140
                  Top = 33
                  Width = 317
                  Height = 128
                  Align = alLeft
                  TabOrder = 2
                  Visible = False
                  object Panel13: TPanel
                    Left = 1
                    Top = 1
                    Width = 315
                    Height = 24
                    Align = alTop
                    BevelInner = bvLowered
                    Caption = 'Valores:'
                    Font.Charset = DEFAULT_CHARSET
                    Font.Color = clWindowText
                    Font.Height = -13
                    Font.Name = 'MS Sans Serif'
                    Font.Style = [fsBold]
                    ParentFont = False
                    TabOrder = 0
                  end
                  object ListBox3: TListBox
                    Left = 1
                    Top = 25
                    Width = 315
                    Height = 102
                    Align = alClient
                    ItemHeight = 13
                    TabOrder = 1
                  end
                end
              end
            end
          end
          inherited gbFiltro: TGroupBox
            Width = 939
            Height = 85
            ParentColor = False
            object btnLimpaStatus: TSpeedButton [0]
              Left = 341
              Top = 31
              Width = 21
              Height = 21
              Glyph.Data = {
                76010000424D7601000000000000760000002800000020000000100000000100
                04000000000000010000120B0000120B00001000000000000000000000000000
                800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
                FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00555555555555
                55555FFFFFFF5F55FFF5777777757559995777777775755777F7555555555550
                305555555555FF57F7F555555550055BB0555555555775F777F55555550FB000
                005555555575577777F5555550FB0BF0F05555555755755757F555550FBFBF0F
                B05555557F55557557F555550BFBF0FB005555557F55575577F555500FBFBFB0
                B05555577F555557F7F5550E0BFBFB00B055557575F55577F7F550EEE0BFB0B0
                B05557FF575F5757F7F5000EEE0BFBF0B055777FF575FFF7F7F50000EEE00000
                B0557777FF577777F7F500000E055550805577777F7555575755500000555555
                05555777775555557F5555000555555505555577755555557555}
              NumGlyphs = 2
              OnClick = btnLimpaStatusClick
            end
            object lbStatus: TLabel [1]
              Left = 246
              Top = 16
              Width = 41
              Height = 13
              Caption = 'Status:'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'MS Sans Serif'
              Font.Style = [fsBold]
              ParentFont = False
            end
            object btnLimpaEmpresa: TSpeedButton [2]
              Left = 207
              Top = 31
              Width = 21
              Height = 21
              Glyph.Data = {
                76010000424D7601000000000000760000002800000020000000100000000100
                04000000000000010000120B0000120B00001000000000000000000000000000
                800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
                FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00555555555555
                55555FFFFFFF5F55FFF5777777757559995777777775755777F7555555555550
                305555555555FF57F7F555555550055BB0555555555775F777F55555550FB000
                005555555575577777F5555550FB0BF0F05555555755755757F555550FBFBF0F
                B05555557F55557557F555550BFBF0FB005555557F55575577F555500FBFBFB0
                B05555577F555557F7F5550E0BFBFB00B055557575F55577F7F550EEE0BFB0B0
                B05557FF575F5757F7F5000EEE0BFBF0B055777FF575FFF7F7F50000EEE00000
                B0557777FF577777F7F500000E055550805577777F7555575755500000555555
                05555777775555557F5555000555555505555577755555557555}
              NumGlyphs = 2
              OnClick = btnLimpaEmpresaClick
            end
            object lbEmpresa: TLabel [3]
              Left = 14
              Top = 16
              Width = 59
              Height = 13
              Caption = 'Empresas:'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'MS Sans Serif'
              Font.Style = [fsBold]
              ParentFont = False
            end
            inherited pnPesquiza: TPanel
              Top = 70
              Width = 935
              inherited lblAdvancedSearch: TLabel
                Width = 935
              end
            end
            object lkFilterStatus: TComboBox
              Left = 246
              Top = 32
              Width = 94
              Height = 21
              Style = csDropDownList
              ItemHeight = 13
              TabOrder = 1
              OnEnter = Entra
              OnExit = Sai
              Items.Strings = (
                'Ativo'
                'Inativo')
            end
            object cbEmp: TComboBox
              Left = 14
              Top = 32
              Width = 193
              Height = 21
              Style = csDropDownList
              ItemHeight = 13
              TabOrder = 2
              OnEnter = Entra
              OnExit = Sai
            end
          end
        end
      end
    end
    inherited tsBaseCadastroConsulta: TTabSheet
      OnShow = tsBaseCadastroConsultaShow
      object Label3: TLabel
        Left = 357
        Top = 50
        Width = 184
        Height = 16
        Caption = 'Empresa................'
        Font.Charset = ANSI_CHARSET
        Font.Color = clMaroon
        Font.Height = -13
        Font.Name = 'Courier New'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object Splitter3: TSplitter
        Left = 345
        Top = 44
        Height = 344
        Color = clBlack
        ParentColor = False
      end
      object Label4: TLabel
        Left = 357
        Top = 82
        Width = 160
        Height = 16
        Caption = 'ISS_ID..............'
        Font.Charset = ANSI_CHARSET
        Font.Color = clMaroon
        Font.Height = -13
        Font.Name = 'Courier New'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object Label5: TLabel
        Left = 357
        Top = 114
        Width = 152
        Height = 16
        Caption = 'APP_ID.............'
        Font.Charset = ANSI_CHARSET
        Font.Color = clMaroon
        Font.Height = -13
        Font.Name = 'Courier New'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object Label6: TLabel
        Left = 357
        Top = 146
        Width = 160
        Height = 16
        Caption = 'Aplica'#231#227'o...........'
        Font.Charset = ANSI_CHARSET
        Font.Color = clMaroon
        Font.Height = -13
        Font.Name = 'Courier New'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object Label7: TLabel
        Left = 357
        Top = 178
        Width = 160
        Height = 16
        Caption = 'BIAC_ID.............'
        Font.Charset = ANSI_CHARSET
        Font.Color = clMaroon
        Font.Height = -13
        Font.Name = 'Courier New'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object lblID: TLabel
        Left = 653
        Top = 50
        Width = 88
        Height = 16
        Caption = 'BIDL_ID....'
        Font.Charset = ANSI_CHARSET
        Font.Color = clMaroon
        Font.Height = -13
        Font.Name = 'Courier New'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object Label8: TLabel
        Left = 357
        Top = 210
        Width = 160
        Height = 16
        Caption = 'BIDC_STATUS.........'
        Font.Charset = ANSI_CHARSET
        Font.Color = clMaroon
        Font.Height = -13
        Font.Name = 'Courier New'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object pnIncluindo: TPanel
        Left = 0
        Top = 22
        Width = 943
        Height = 22
        Align = alTop
        BevelInner = bvLowered
        Caption = 'I N C L U I N D O'
        Font.Charset = ANSI_CHARSET
        Font.Color = clMaroon
        Font.Height = -16
        Font.Name = 'Courier New'
        Font.Style = [fsBold]
        ParentFont = False
        TabOrder = 0
      end
      object pnEditando: TPanel
        Left = 0
        Top = 0
        Width = 943
        Height = 22
        Align = alTop
        BevelInner = bvLowered
        Caption = 'E D I T A N D O'
        Font.Charset = ANSI_CHARSET
        Font.Color = clMaroon
        Font.Height = -16
        Font.Name = 'Courier New'
        Font.Style = [fsBold]
        ParentFont = False
        TabOrder = 1
      end
      object cbEmpresas: TComboBox
        Left = 496
        Top = 48
        Width = 145
        Height = 21
        Style = csDropDownList
        ItemHeight = 13
        TabOrder = 2
      end
      object Panel14: TPanel
        Left = 0
        Top = 44
        Width = 345
        Height = 344
        Align = alLeft
        TabOrder = 3
        object Panel15: TPanel
          Left = 1
          Top = 1
          Width = 343
          Height = 42
          Align = alTop
          TabOrder = 0
          object Label9: TLabel
            Left = 1
            Top = 2
            Width = 48
            Height = 16
            Caption = 'ISS_ID'
            Font.Charset = ANSI_CHARSET
            Font.Color = clMaroon
            Font.Height = -13
            Font.Name = 'Courier New'
            Font.Style = [fsBold]
            ParentFont = False
          end
          object Label10: TLabel
            Left = 62
            Top = 2
            Width = 48
            Height = 16
            Caption = 'APP_ID'
            Font.Charset = ANSI_CHARSET
            Font.Color = clMaroon
            Font.Height = -13
            Font.Name = 'Courier New'
            Font.Style = [fsBold]
            ParentFont = False
          end
          object Label11: TLabel
            Left = 153
            Top = 2
            Width = 96
            Height = 16
            Caption = 'APP_DESCLONG'
            Font.Charset = ANSI_CHARSET
            Font.Color = clMaroon
            Font.Height = -13
            Font.Name = 'Courier New'
            Font.Style = [fsBold]
            ParentFont = False
          end
          object EditIss: TEdit
            Left = 1
            Top = 18
            Width = 57
            Height = 21
            TabOrder = 0
            OnChange = EditChange
          end
          object EditApp: TEdit
            Left = 57
            Top = 18
            Width = 57
            Height = 21
            TabOrder = 1
            OnChange = EditChange
          end
          object EditDesc: TEdit
            Left = 113
            Top = 18
            Width = 185
            Height = 21
            CharCase = ecUpperCase
            TabOrder = 2
            OnChange = EditChange
          end
        end
        object DBGrid1: TDBGrid
          Left = 1
          Top = 43
          Width = 343
          Height = 300
          Align = alClient
          DataSource = dsApp
          Options = [dgTitles, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgAlwaysShowSelection, dgConfirmDelete, dgCancelOnExit]
          TabOrder = 1
          TitleFont.Charset = DEFAULT_CHARSET
          TitleFont.Color = clWindowText
          TitleFont.Height = -11
          TitleFont.Name = 'MS Sans Serif'
          TitleFont.Style = []
          OnCellClick = DBGrid1CellClick
        end
      end
      object EditISS_ID: TEdit
        Left = 496
        Top = 80
        Width = 73
        Height = 21
        ReadOnly = True
        TabOrder = 4
        Text = 'EditISS_ID'
      end
      object EditAPP_ID: TEdit
        Left = 496
        Top = 112
        Width = 73
        Height = 21
        ReadOnly = True
        TabOrder = 5
        Text = 'EditAPP_ID'
      end
      object EditAplicativo: TEdit
        Left = 496
        Top = 144
        Width = 265
        Height = 21
        ReadOnly = True
        TabOrder = 6
        Text = 'EditAplicativo'
      end
      object EditBIAC_ID: TEdit
        Left = 496
        Top = 176
        Width = 73
        Height = 21
        TabOrder = 7
        OnKeyPress = SoNumero
      end
      object EditID: TEdit
        Left = 736
        Top = 48
        Width = 33
        Height = 21
        ReadOnly = True
        TabOrder = 8
      end
      object Panel16: TPanel
        Left = 496
        Top = 205
        Width = 148
        Height = 27
        BevelInner = bvLowered
        TabOrder = 9
        object rbIncAtivo: TRadioButton
          Left = 6
          Top = 6
          Width = 75
          Height = 17
          Caption = 'Ativo'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -13
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
          TabOrder = 0
        end
        object rbIncInativo: TRadioButton
          Left = 78
          Top = 6
          Width = 69
          Height = 17
          Caption = 'Inativo'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -13
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
          TabOrder = 1
        end
      end
      object cbTodas: TCheckBox
        Left = 792
        Top = 49
        Width = 57
        Height = 17
        Caption = 'Todas'
        Font.Charset = ANSI_CHARSET
        Font.Color = clMaroon
        Font.Height = -12
        Font.Name = 'Courier New'
        Font.Style = [fsBold]
        ParentFont = False
        TabOrder = 10
      end
    end
  end
  object Panel1: TPanel [2]
    Left = 350
    Top = 30
    Width = 138
    Height = 17
    TabOrder = 2
    object lblContador: TRxLabel
      Left = 1
      Top = 1
      Width = 136
      Height = 15
      Align = alClient
      Alignment = taCenter
      Caption = '1.123.123 registro(s)'
      Color = clMoneyGreen
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentColor = False
      ParentFont = False
      ShadowSize = 0
    end
  end
  inherited imglstBase: TImageList
    Left = 112
    Top = 304
  end
  inherited actlstBase: TActionList
    Left = 80
    Top = 304
    inherited actFilter: TAction
      OnExecute = actFilterExecute
    end
  end
  inherited dtsMaster: TDataSource
    Left = 49
    Top = 304
  end
  inherited mMnuBase: TMainMenu
    Left = 17
    Top = 304
    inherited Sistema1: TMenuItem
      inherited Sair1: TMenuItem
        ShortCut = 0
      end
    end
  end
  object dsApp: TDataSource
    DataSet = DmSys.cdsGeral
    Left = 144
    Top = 304
  end
end
