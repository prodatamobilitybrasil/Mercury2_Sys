inherited FrmTimeLimits: TFrmTimeLimits
  Tag = 59
  Top = 111
  Width = 748
  Height = 457
  Caption = 'Limites de Tempo'
  Constraints.MinHeight = 457
  Constraints.MinWidth = 674
  PixelsPerInch = 96
  TextHeight = 13
  inherited cbBase: TCoolBar
    Width = 740
    Bands = <
      item
        Control = tbBase
        ImageIndex = -1
        MinHeight = 24
        Width = 736
      end>
    inherited tbBase: TToolBar
      Width = 723
      object lbFiltrado: TLabel
        Left = 354
        Top = 2
        Width = 111
        Height = 22
        Cursor = crHandPoint
        Hint = 'Limpar FILTRO'
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
        OnClick = lbFiltradoClick
      end
    end
  end
  inherited pcBaseCadastro: TPageControl
    Width = 740
    Height = 378
    inherited tsBaseCadastroFiltro: TTabSheet
      inherited Splitter_Base1: TSplitter
        Top = 89
        Width = 732
        Color = clBlack
        ParentColor = False
      end
      inherited gbGrid: TGroupBox
        Top = 93
        Width = 732
        Height = 257
        inherited grdResultado: TDBGrid
          Width = 728
          Height = 240
          DataSource = dtsMaster
          OnTitleClick = grdResultadoTitleClick
          Columns = <
            item
              Expanded = False
              FieldName = 'TL_DESC'
              Title.Caption = 'Descri'#231#227'o'
              Title.Color = clYellow
              Width = 250
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'TL_STATIME'
              Title.Caption = 'In'#237'cio'
              Width = 60
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'TL_ENDTIME'
              Title.Caption = 'Fim'
              Width = 60
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
              FieldName = 'TL_REGDATE'
              Title.Caption = 'Registro'
              Width = 121
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'TL_REGUSER'
              Title.Caption = 'Usu'#225'rio'
              Width = 120
              Visible = True
            end>
        end
      end
      inherited pnFiltro: TPanel
        Width = 732
        Height = 89
        inherited pnPesq: TPanel
          Width = 732
          Height = 89
          inherited gbFiltroAvansado: TGroupBox
            Width = 728
            Height = 85
            inherited pnVoltar: TPanel
              Top = 70
              Width = 724
              inherited lblBack: TLabel
                Left = 697
              end
            end
          end
          inherited gbFiltro: TGroupBox
            Width = 728
            Height = 85
            object Label10: TLabel [0]
              Tag = 2512
              Left = 332
              Top = 20
              Width = 30
              Height = 13
              Caption = 'Status'
              FocusControl = lkFilterStatus
            end
            object Label6: TLabel [1]
              Tag = 2509
              Left = 13
              Top = 20
              Width = 48
              Height = 13
              Caption = 'Descri'#231#227'o'
              FocusControl = edDesc
            end
            object btnLimpaStatus: TSpeedButton [2]
              Left = 449
              Top = 37
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
            inherited pnPesquiza: TPanel
              Top = 70
              Width = 724
              TabOrder = 2
              inherited lblAdvancedSearch: TLabel
                Width = 724
                Visible = False
              end
            end
            object edDesc: TEdit
              Left = 13
              Top = 38
              Width = 300
              Height = 21
              CharCase = ecUpperCase
              MaxLength = 50
              TabOrder = 0
              OnEnter = Entra
              OnExit = Sai
            end
            object lkFilterStatus: TComboBox
              Left = 330
              Top = 38
              Width = 119
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
          end
        end
      end
    end
    inherited tsBaseCadastroConsulta: TTabSheet
      object GroupBox1: TGroupBox
        Left = 0
        Top = 0
        Width = 732
        Height = 350
        Align = alClient
        TabOrder = 0
        object Label1: TLabel
          Left = 20
          Top = 39
          Width = 48
          Height = 13
          Caption = 'Descri'#231#227'o'
          FocusControl = dbDesc
        end
        object Label8: TLabel
          Tag = 2512
          Left = 436
          Top = 39
          Width = 30
          Height = 13
          Caption = 'Status'
          FocusControl = dbCardUsersStatus
        end
        object dbDesc: TDBEdit
          Left = 20
          Top = 56
          Width = 349
          Height = 21
          CharCase = ecUpperCase
          DataField = 'TL_DESC'
          DataSource = dtsMaster
          MaxLength = 50
          TabOrder = 0
        end
        object GroupBox2: TGroupBox
          Tag = 2519
          Left = 262
          Top = 120
          Width = 333
          Height = 111
          Caption = 'Dias'
          TabOrder = 3
          object dbchkSegunda: TDBCheckBox
            Left = 20
            Top = 26
            Width = 78
            Height = 14
            Caption = 'Segunda'
            DataField = 'TL_MONDAY'
            DataSource = dtsMaster
            TabOrder = 0
            ValueChecked = '1'
            ValueUnchecked = '0'
          end
          object dbchkTerca: TDBCheckBox
            Left = 20
            Top = 52
            Width = 78
            Height = 14
            Caption = 'Ter'#231'a'
            DataField = 'TL_TUESDAY'
            DataSource = dtsMaster
            TabOrder = 1
            ValueChecked = '1'
            ValueUnchecked = '0'
          end
          object dbchkQuarta: TDBCheckBox
            Left = 20
            Top = 78
            Width = 78
            Height = 14
            Caption = 'Quarta'
            DataField = 'TL_WEDNESDAY'
            DataSource = dtsMaster
            TabOrder = 2
            ValueChecked = '1'
            ValueUnchecked = '0'
          end
          object dbchkQuinta: TDBCheckBox
            Left = 120
            Top = 26
            Width = 79
            Height = 14
            Caption = 'Quinta'
            DataField = 'TL_THURSDAY'
            DataSource = dtsMaster
            TabOrder = 3
            ValueChecked = '1'
            ValueUnchecked = '0'
          end
          object dbchkSexta: TDBCheckBox
            Left = 120
            Top = 52
            Width = 79
            Height = 14
            Caption = 'Sexta'
            DataField = 'TL_FRIDAY'
            DataSource = dtsMaster
            TabOrder = 4
            ValueChecked = '1'
            ValueUnchecked = '0'
          end
          object dbchkSabado: TDBCheckBox
            Left = 120
            Top = 78
            Width = 79
            Height = 14
            Caption = 'S'#225'bado'
            DataField = 'TL_SATURDAY'
            DataSource = dtsMaster
            TabOrder = 5
            ValueChecked = '1'
            ValueUnchecked = '0'
          end
          object dbchkDomingo: TDBCheckBox
            Left = 221
            Top = 26
            Width = 79
            Height = 14
            Caption = 'Domingo'
            DataField = 'TL_SUNDAY'
            DataSource = dtsMaster
            TabOrder = 6
            ValueChecked = '1'
            ValueUnchecked = '0'
          end
          object dbchkFeriadoEsc: TDBCheckBox
            Left = 221
            Top = 52
            Width = 98
            Height = 14
            Caption = 'Feriado Escolar'
            DataField = 'TL_SCHOOLHOLIDAY'
            DataSource = dtsMaster
            TabOrder = 7
            ValueChecked = '1'
            ValueUnchecked = '0'
          end
          object dbchkFeriadoNac: TDBCheckBox
            Left = 221
            Top = 78
            Width = 104
            Height = 14
            Caption = 'Feriado Nacional'
            DataField = 'TL_OFFHOLIDAY'
            DataSource = dtsMaster
            TabOrder = 8
            ValueChecked = '1'
            ValueUnchecked = '0'
          end
        end
        object GroupBox3: TGroupBox
          Tag = 2529
          Left = 20
          Top = 120
          Width = 229
          Height = 113
          Caption = 'Per'#237'odo'
          TabOrder = 2
          object Label2: TLabel
            Tag = 2530
            Left = 44
            Top = 35
            Width = 53
            Height = 13
            Caption = 'Hora Inicial'
            FocusControl = edHHini
          end
          object Label4: TLabel
            Left = 65
            Top = 50
            Width = 5
            Height = 16
            Caption = ':'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -15
            Font.Name = 'MS Sans Serif'
            Font.Style = [fsBold]
            ParentFont = False
          end
          object Label3: TLabel
            Tag = 2532
            Left = 141
            Top = 35
            Width = 48
            Height = 13
            Caption = 'Hora Final'
            FocusControl = edHHFim
          end
          object Label5: TLabel
            Left = 162
            Top = 50
            Width = 5
            Height = 16
            Caption = ':'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -15
            Font.Name = 'MS Sans Serif'
            Font.Style = [fsBold]
            ParentFont = False
          end
          object edHHini: TCurrencyEdit
            Left = 44
            Top = 52
            Width = 20
            Height = 17
            AutoSize = False
            Ctl3D = False
            DecimalPlaces = 0
            DisplayFormat = '00'
            MaxValue = 23.000000000000000000
            ParentCtl3D = False
            TabOrder = 0
          end
          object edHMIni: TCurrencyEdit
            Left = 70
            Top = 52
            Width = 21
            Height = 17
            AutoSize = False
            Ctl3D = False
            DecimalPlaces = 0
            DisplayFormat = '00'
            MaxValue = 59.000000000000000000
            ParentCtl3D = False
            TabOrder = 1
          end
          object edHHFim: TCurrencyEdit
            Left = 141
            Top = 52
            Width = 20
            Height = 17
            AutoSize = False
            Ctl3D = False
            DecimalPlaces = 0
            DisplayFormat = '00'
            MaxValue = 23.000000000000000000
            ParentCtl3D = False
            TabOrder = 2
          end
          object edHMFim: TCurrencyEdit
            Left = 168
            Top = 52
            Width = 20
            Height = 17
            AutoSize = False
            Ctl3D = False
            DecimalPlaces = 0
            DisplayFormat = '00'
            MaxValue = 59.000000000000000000
            ParentCtl3D = False
            TabOrder = 3
          end
        end
        object dbCardUsersStatus: TRxDBComboBox
          Left = 436
          Top = 56
          Width = 125
          Height = 21
          Style = csDropDownList
          DataField = 'TL_STATUS'
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
  inherited actlstBase: TActionList
    inherited actFilter: TAction
      OnExecute = actFilterExecute
    end
  end
  inherited dtsMaster: TDataSource
    DataSet = DmSys.cdsTimeLimits
  end
end
