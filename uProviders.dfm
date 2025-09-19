inherited FrmProviders: TFrmProviders
  Left = 112
  Top = 21
  Width = 816
  Height = 634
  Caption = 'Provedores'
  Position = poDesktopCenter
  WindowState = wsMaximized
  PixelsPerInch = 96
  TextHeight = 13
  inherited cbBase: TCoolBar
    Width = 808
    Bands = <
      item
        Control = tbBase
        ImageIndex = -1
        MinHeight = 24
        Width = 804
      end>
    inherited tbBase: TToolBar
      Width = 791
    end
  end
  inherited pcBaseCadastro: TPageControl
    Width = 808
    Height = 552
    ActivePage = tsBaseCadastroConsulta
    OnChange = pcBaseCadastroChange
    inherited tsBaseCadastroFiltro: TTabSheet
      inherited Splitter_Base1: TSplitter
        Width = 800
      end
      inherited gbGrid: TGroupBox
        Width = 800
        Height = 392
        inherited grdResultado: TDBGrid
          Width = 796
          Height = 375
          DataSource = dtsMaster
          Columns = <
            item
              Expanded = False
              FieldName = 'PRV_ID'
              Title.Caption = 'C'#243'digo'
              Width = 80
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'Prv_Desc'
              Title.Caption = 'Descri'#231#227'o'
              Width = 200
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'Prv_Shortdesc'
              Title.Caption = 'Descri'#231#227'o curta'
              Width = 150
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'Prv_Longdesc'
              Title.Caption = 'Descri'#231#227'o longa'
              Width = 300
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'Prv_Address'
              Title.Caption = 'Endere'#231'o'
              Width = 219
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'Zip_Code'
              Title.Caption = 'Cep'
              Width = 87
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'Prv_Contact'
              Title.Caption = 'Contato'
              Width = 150
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'Prv_Tel'
              Title.Caption = 'Telefone'
              Width = 120
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'Prv_Fax'
              Title.Caption = 'Fax'
              Width = 120
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'Prv_Email'
              Title.Caption = 'E-Mail'
              Width = 140
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'Prv_Regdate'
              Title.Caption = 'Registro'
              Width = 90
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'Prv_Reguser'
              Title.Caption = 'Usu'#225'rio'
              Width = 120
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'STATUS_ID'
              Title.Caption = 'Status'
              Width = 100
              Visible = True
            end>
        end
      end
      inherited pnFiltro: TPanel
        Width = 800
        inherited pnPesq: TPanel
          Width = 800
          inherited gbfiltroavansado: TGroupBox
            Width = 796
            inherited pnVoltar: TPanel
              Width = 792
              inherited lblBack: TLabel
                Left = 765
              end
            end
          end
          inherited gbFiltro: TGroupBox
            Width = 796
            object Label24: TLabel [0]
              Left = 16
              Top = 24
              Width = 48
              Height = 13
              Caption = 'Descri'#231#227'o'
            end
            object Label25: TLabel [1]
              Left = 360
              Top = 72
              Width = 30
              Height = 13
              Caption = 'Status'
            end
            object Label26: TLabel [2]
              Left = 360
              Top = 24
              Width = 46
              Height = 13
              Caption = 'Endere'#231'o'
            end
            object Label28: TLabel [3]
              Left = 16
              Top = 72
              Width = 42
              Height = 13
              Caption = 'Telefone'
            end
            inherited pnPesquiza: TPanel
              Width = 792
              inherited lblAdvancedSearch: TLabel
                Width = 792
              end
            end
            object edDesc: TEdit
              Left = 16
              Top = 40
              Width = 300
              Height = 21
              CharCase = ecUpperCase
              TabOrder = 1
            end
            object edAdress: TEdit
              Left = 360
              Top = 40
              Width = 300
              Height = 21
              CharCase = ecUpperCase
              TabOrder = 2
            end
            object edTel: TEdit
              Left = 16
              Top = 89
              Width = 200
              Height = 21
              TabOrder = 3
            end
            object lkFilterStatus: TComboBox
              Left = 360
              Top = 89
              Width = 177
              Height = 21
              ItemHeight = 13
              TabOrder = 4
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
        Width = 800
        Height = 344
        Align = alTop
        TabOrder = 0
        object Label3: TLabel
          Left = 8
          Top = 8
          Width = 48
          Height = 13
          Caption = 'Descri'#231#227'o'
        end
        object Label5: TLabel
          Left = 606
          Top = 8
          Width = 33
          Height = 13
          Caption = 'C'#243'digo'
        end
        object Label6: TLabel
          Left = 635
          Top = 265
          Width = 88
          Height = 13
          Caption = 'PRV_CARDUSED'
        end
        object Label7: TLabel
          Left = 349
          Top = 8
          Width = 75
          Height = 13
          Caption = 'Descri'#231#227'o curta'
        end
        object Label8: TLabel
          Left = 8
          Top = 49
          Width = 77
          Height = 13
          Caption = 'Descri'#231#227'o longa'
        end
        object Label9: TLabel
          Left = 347
          Top = 49
          Width = 37
          Height = 13
          Caption = 'Contato'
        end
        object Label17: TLabel
          Left = 6
          Top = 259
          Width = 58
          Height = 13
          Caption = 'Observa'#231#227'o'
        end
        object Label18: TLabel
          Left = 515
          Top = 264
          Width = 72
          Height = 13
          Caption = 'PRV_VATNBR'
        end
        object Label22: TLabel
          Left = 635
          Top = 304
          Width = 89
          Height = 13
          Caption = 'Ramo de atividade'
        end
        object Label23: TLabel
          Left = 517
          Top = 302
          Width = 84
          Height = 13
          Caption = 'PRV_FEEDBACK'
        end
        object Label2: TLabel
          Left = 611
          Top = 48
          Width = 30
          Height = 13
          Caption = 'Status'
        end
        object dbDesc: TDBEdit
          Left = 8
          Top = 24
          Width = 328
          Height = 21
          CharCase = ecUpperCase
          DataField = 'PRV_DESC'
          DataSource = dtsMaster
          TabOrder = 0
        end
        object dbShotDesc: TDBEdit
          Left = 348
          Top = 24
          Width = 240
          Height = 21
          CharCase = ecUpperCase
          DataField = 'PRV_SHORTDESC'
          DataSource = dtsMaster
          TabOrder = 1
        end
        object dbPrv_Code: TDBEdit
          Left = 607
          Top = 24
          Width = 161
          Height = 21
          DataField = 'PRV_CODE'
          DataSource = dtsMaster
          TabOrder = 2
        end
        object dbLongDesc: TDBEdit
          Left = 8
          Top = 62
          Width = 328
          Height = 21
          CharCase = ecUpperCase
          DataField = 'PRV_LONGDESC'
          DataSource = dtsMaster
          TabOrder = 3
        end
        object DBEdit9: TDBEdit
          Left = 348
          Top = 62
          Width = 245
          Height = 21
          CharCase = ecUpperCase
          DataField = 'PRV_CONTACT'
          DataSource = dtsMaster
          TabOrder = 4
        end
        object DBEdit18: TDBEdit
          Left = 516
          Top = 278
          Width = 106
          Height = 21
          DataField = 'PRV_VATNBR'
          DataSource = dtsMaster
          TabOrder = 8
        end
        object DBEdit23: TDBEdit
          Left = 518
          Top = 317
          Width = 105
          Height = 21
          DataField = 'PRV_FEEDBACK'
          DataSource = dtsMaster
          TabOrder = 10
        end
        object dbCardUsersStatus: TRxDBComboBox
          Left = 612
          Top = 62
          Width = 125
          Height = 21
          Style = csDropDownList
          DataField = 'PRV_STATUS'
          DataSource = dtsMaster
          EnableValues = True
          ItemHeight = 13
          Items.Strings = (
            'Ativo'
            'Inativo')
          TabOrder = 5
          Values.Strings = (
            'A'
            'I')
        end
        object DBEdit17: TDBEdit
          Left = 6
          Top = 274
          Width = 494
          Height = 61
          AutoSize = False
          DataField = 'PRV_COMMENT'
          DataSource = dtsMaster
          TabOrder = 7
        end
        object DBEdit6: TDBEdit
          Left = 636
          Top = 278
          Width = 156
          Height = 21
          DataField = 'PRV_CARDUSED'
          DataSource = dtsMaster
          TabOrder = 9
        end
        object DBEdit22: TDBEdit
          Left = 636
          Top = 319
          Width = 157
          Height = 21
          DataField = 'PRV_RAMOATIV'
          DataSource = dtsMaster
          TabOrder = 11
        end
        object pcDetails: TPageControl
          Left = 2
          Top = 88
          Width = 796
          Height = 167
          ActivePage = tsDetailsDocuments
          TabOrder = 6
          object tsDetailsDocuments: TTabSheet
            Caption = 'Documenta'#231#227'o'
            object cbDocuments: TCoolBar
              Left = 0
              Top = 0
              Width = 29
              Height = 139
              Align = alLeft
              AutoSize = True
              Bands = <
                item
                  Control = tbDocuments
                  ImageIndex = -1
                  Width = 135
                end>
              Vertical = True
              object tbDocuments: TToolBar
                Left = 0
                Top = 9
                Width = 25
                Height = 126
                Images = imglstBase
                TabOrder = 0
                object tbtnNewDocument: TToolButton
                  Left = 0
                  Top = 2
                  ImageIndex = 16
                  Wrap = True
                  OnClick = tbtnNewDocumentClick
                end
                object tbtnEditDocument: TToolButton
                  Left = 0
                  Top = 24
                  ImageIndex = 10
                  Wrap = True
                  OnClick = tbtnEditDocumentClick
                end
                object tbtnDelDocument: TToolButton
                  Left = 0
                  Top = 46
                  ImageIndex = 9
                  OnClick = tbtnDelDocumentClick
                end
              end
            end
            object nbDocuments: TNotebook
              Left = 29
              Top = 0
              Width = 759
              Height = 139
              Align = alClient
              TabOrder = 1
              object TPage
                Left = 0
                Top = 0
                Caption = 'Consulta'
                object dbgProviderDocuments: TDBGrid
                  Left = 0
                  Top = 0
                  Width = 759
                  Height = 139
                  Align = alClient
                  DataSource = dmSys1.dtsProviderDocuments
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
                      FieldName = 'DT_DESC'
                      Title.Caption = 'Tipo do Documento'
                      Width = 200
                      Visible = True
                    end
                    item
                      Expanded = False
                      FieldName = 'PRVDOC_NUMBER'
                      Title.Caption = 'N'#186' do Documento'
                      Width = 150
                      Visible = True
                    end
                    item
                      Expanded = False
                      FieldName = 'STATUS_ID'
                      Title.Caption = 'Status'
                      Width = 90
                      Visible = True
                    end
                    item
                      Expanded = False
                      FieldName = 'PRVDOC_REGDATE'
                      Title.Caption = 'Registro'
                      Width = 100
                      Visible = True
                    end
                    item
                      Expanded = False
                      FieldName = 'PRVDOC_REGUSER'
                      Title.Caption = 'Usu'#225'rio'
                      Width = 130
                      Visible = True
                    end>
                end
              end
              object TPage
                Left = 0
                Top = 0
                Caption = 'Cadastro'
                object lblIdentificationTypes: TLabel
                  Left = 9
                  Top = 9
                  Width = 94
                  Height = 13
                  Caption = '&Tipo de Documento'
                  FocusControl = dbIdentificationTypes
                end
                object lblIndentificationNbr: TLabel
                  Left = 229
                  Top = 9
                  Width = 61
                  Height = 13
                  Caption = 'Identifica'#231#227'o'
                  FocusControl = dbIdentificationNbr
                end
                object btnDocOk: TSpeedButton
                  Left = 482
                  Top = 75
                  Width = 95
                  Height = 30
                  Caption = '&Ok'
                  Glyph.Data = {
                    DE010000424DDE01000000000000760000002800000024000000120000000100
                    0400000000006801000000000000000000001000000000000000000000000000
                    80000080000000808000800000008000800080800000C0C0C000808080000000
                    FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00333333333333
                    3333333333333333333333330000333333333333333333333333F33333333333
                    00003333344333333333333333388F3333333333000033334224333333333333
                    338338F3333333330000333422224333333333333833338F3333333300003342
                    222224333333333383333338F3333333000034222A22224333333338F338F333
                    8F33333300003222A3A2224333333338F3838F338F33333300003A2A333A2224
                    33333338F83338F338F33333000033A33333A222433333338333338F338F3333
                    0000333333333A222433333333333338F338F33300003333333333A222433333
                    333333338F338F33000033333333333A222433333333333338F338F300003333
                    33333333A222433333333333338F338F00003333333333333A22433333333333
                    3338F38F000033333333333333A223333333333333338F830000333333333333
                    333A333333333333333338330000333333333333333333333333333333333333
                    0000}
                  NumGlyphs = 2
                  OnClick = btnDocOkClick
                end
                object btnDocCancel: TSpeedButton
                  Left = 594
                  Top = 75
                  Width = 95
                  Height = 30
                  Caption = '&Cancelar'
                  Glyph.Data = {
                    DE010000424DDE01000000000000760000002800000024000000120000000100
                    0400000000006801000000000000000000001000000000000000000000000000
                    80000080000000808000800000008000800080800000C0C0C000808080000000
                    FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00333333333333
                    333333333333333333333333000033338833333333333333333F333333333333
                    0000333911833333983333333388F333333F3333000033391118333911833333
                    38F38F333F88F33300003339111183911118333338F338F3F8338F3300003333
                    911118111118333338F3338F833338F3000033333911111111833333338F3338
                    3333F8330000333333911111183333333338F333333F83330000333333311111
                    8333333333338F3333383333000033333339111183333333333338F333833333
                    00003333339111118333333333333833338F3333000033333911181118333333
                    33338333338F333300003333911183911183333333383338F338F33300003333
                    9118333911183333338F33838F338F33000033333913333391113333338FF833
                    38F338F300003333333333333919333333388333338FFF830000333333333333
                    3333333333333333333888330000333333333333333333333333333333333333
                    0000}
                  NumGlyphs = 2
                  OnClick = btnDocCancelClick
                end
                object dbIdentificationTypes: TDBLookupComboBox
                  Left = 9
                  Top = 25
                  Width = 200
                  Height = 21
                  DataField = 'DT_ID'
                  DataSource = dmSys1.dtsProviderDocuments
                  DropDownWidth = 200
                  KeyField = 'DT_ID'
                  ListField = 'DT_DESC'
                  ListSource = dmSys1.dtsDocumentTypes
                  NullValueKey = 46
                  TabOrder = 0
                end
                object dbIdentificationNbr: TDBEdit
                  Left = 229
                  Top = 25
                  Width = 180
                  Height = 21
                  CharCase = ecUpperCase
                  DataField = 'PRVDOC_NUMBER'
                  DataSource = dmSys1.dtsProviderDocuments
                  TabOrder = 1
                end
              end
            end
          end
          object tsDetailsAddress: TTabSheet
            Caption = 'Endere'#231'os'
            ImageIndex = 1
            object cbAddress: TCoolBar
              Left = 0
              Top = 0
              Width = 29
              Height = 139
              Align = alLeft
              AutoSize = True
              Bands = <
                item
                  Control = tbAddress
                  ImageIndex = -1
                  Width = 135
                end>
              Vertical = True
              object tbAddress: TToolBar
                Left = 0
                Top = 9
                Width = 25
                Height = 126
                Images = imglstBase
                TabOrder = 0
                object tbtnNewAddress: TToolButton
                  Left = 0
                  Top = 2
                  ImageIndex = 16
                  Wrap = True
                  OnClick = tbtnNewAddressClick
                end
                object tbtnEditAddress: TToolButton
                  Left = 0
                  Top = 24
                  ImageIndex = 10
                  Wrap = True
                  OnClick = tbtnEditAddressClick
                end
                object tbtnDelAddress: TToolButton
                  Left = 0
                  Top = 46
                  ImageIndex = 9
                  OnClick = tbtnDelAddressClick
                end
              end
            end
            object nbAddress: TNotebook
              Left = 29
              Top = 0
              Width = 759
              Height = 139
              Align = alClient
              TabOrder = 1
              object TPage
                Left = 0
                Top = 0
                Caption = 'Consulta'
                object grdAddress: TDBGrid
                  Left = 0
                  Top = 0
                  Width = 759
                  Height = 139
                  Align = alClient
                  DataSource = dmSys1.dtsProviderAddresses
                  TabOrder = 0
                  TitleFont.Charset = DEFAULT_CHARSET
                  TitleFont.Color = clWindowText
                  TitleFont.Height = -11
                  TitleFont.Name = 'MS Sans Serif'
                  TitleFont.Style = []
                  Columns = <
                    item
                      Expanded = False
                      FieldName = 'AT_SHORTDESC'
                      Title.Caption = 'Tipo de Endere'#231'o'
                      Width = 130
                      Visible = True
                    end
                    item
                      Expanded = False
                      FieldName = 'LTR_CODE'
                      Title.Caption = 'Tipo de Log.'
                      Width = 80
                      Visible = True
                    end
                    item
                      Expanded = False
                      FieldName = 'PRVADD_ADDRESS'
                      Title.Caption = 'Logradouro'
                      Width = 230
                      Visible = True
                    end
                    item
                      Expanded = False
                      FieldName = 'PRVADD_ADDNBR'
                      Title.Caption = 'N'#250'mero'
                      Width = 80
                      Visible = True
                    end
                    item
                      Expanded = False
                      FieldName = 'PRVADD_ADDCOMP'
                      Title.Caption = 'Complemento'
                      Width = 110
                      Visible = True
                    end
                    item
                      Expanded = False
                      FieldName = 'PRVADD_CITY'
                      Title.Caption = 'Cidade'
                      Width = 120
                      Visible = True
                    end
                    item
                      Expanded = False
                      FieldName = 'PRVADD_DISTRICT'
                      Title.Caption = 'Bairro'
                      Width = 70
                      Visible = True
                    end
                    item
                      Expanded = False
                      FieldName = 'PRVADD_ZIP'
                      Title.Caption = 'Cep'
                      Width = 80
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
                      FieldName = 'PRVADD_REGDATE'
                      Title.Caption = 'Registro'
                      Width = 100
                      Visible = True
                    end
                    item
                      Expanded = False
                      FieldName = 'PRVADD_REGUSER'
                      Title.Caption = 'Usu'#225'rio'
                      Width = 100
                      Visible = True
                    end>
                end
              end
              object TPage
                Left = 0
                Top = 0
                Caption = 'Cadastro'
                object lblAddNum: TLabel
                  Left = 8
                  Top = 45
                  Width = 37
                  Height = 13
                  Caption = 'N'#250'mero'
                  FocusControl = dbAddNum
                end
                object lblAddComp: TLabel
                  Left = 110
                  Top = 43
                  Width = 64
                  Height = 13
                  Caption = 'Complemento'
                  FocusControl = dbAddComp
                end
                object lblStates: TLabel
                  Left = 8
                  Top = 86
                  Width = 14
                  Height = 13
                  Caption = '&UF'
                  FocusControl = dbStates
                end
                object lblCities: TLabel
                  Left = 497
                  Top = 42
                  Width = 33
                  Height = 13
                  Caption = 'Cid&ade'
                  FocusControl = dbCities
                end
                object lblDistricts: TLabel
                  Left = 279
                  Top = 42
                  Width = 27
                  Height = 13
                  Caption = '&Bairro'
                  FocusControl = dbDistrict
                end
                object lblCep: TLabel
                  Left = 108
                  Top = 87
                  Width = 21
                  Height = 13
                  Caption = 'CEP'
                  FocusControl = dbZip
                end
                object btnAddrOk: TSpeedButton
                  Left = 488
                  Top = 96
                  Width = 95
                  Height = 30
                  Caption = '&Ok'
                  Glyph.Data = {
                    DE010000424DDE01000000000000760000002800000024000000120000000100
                    0400000000006801000000000000000000001000000000000000000000000000
                    80000080000000808000800000008000800080800000C0C0C000808080000000
                    FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00333333333333
                    3333333333333333333333330000333333333333333333333333F33333333333
                    00003333344333333333333333388F3333333333000033334224333333333333
                    338338F3333333330000333422224333333333333833338F3333333300003342
                    222224333333333383333338F3333333000034222A22224333333338F338F333
                    8F33333300003222A3A2224333333338F3838F338F33333300003A2A333A2224
                    33333338F83338F338F33333000033A33333A222433333338333338F338F3333
                    0000333333333A222433333333333338F338F33300003333333333A222433333
                    333333338F338F33000033333333333A222433333333333338F338F300003333
                    33333333A222433333333333338F338F00003333333333333A22433333333333
                    3338F38F000033333333333333A223333333333333338F830000333333333333
                    333A333333333333333338330000333333333333333333333333333333333333
                    0000}
                  NumGlyphs = 2
                  OnClick = btnAddrOkClick
                end
                object btnAddrCancel: TSpeedButton
                  Left = 608
                  Top = 96
                  Width = 95
                  Height = 30
                  Caption = '&Cancelar'
                  Glyph.Data = {
                    DE010000424DDE01000000000000760000002800000024000000120000000100
                    0400000000006801000000000000000000001000000000000000000000000000
                    80000080000000808000800000008000800080800000C0C0C000808080000000
                    FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00333333333333
                    333333333333333333333333000033338833333333333333333F333333333333
                    0000333911833333983333333388F333333F3333000033391118333911833333
                    38F38F333F88F33300003339111183911118333338F338F3F8338F3300003333
                    911118111118333338F3338F833338F3000033333911111111833333338F3338
                    3333F8330000333333911111183333333338F333333F83330000333333311111
                    8333333333338F3333383333000033333339111183333333333338F333833333
                    00003333339111118333333333333833338F3333000033333911181118333333
                    33338333338F333300003333911183911183333333383338F338F33300003333
                    9118333911183333338F33838F338F33000033333913333391113333338FF833
                    38F338F300003333333333333919333333388333338FFF830000333333333333
                    3333333333333333333888330000333333333333333333333333333333333333
                    0000}
                  NumGlyphs = 2
                  OnClick = btnAddrCancelClick
                end
                object Label19: TLabel
                  Left = 337
                  Top = 6
                  Width = 46
                  Height = 13
                  Caption = 'Endere'#231'o'
                  FocusControl = dbCities
                end
                object Label20: TLabel
                  Left = 191
                  Top = 6
                  Width = 93
                  Height = 13
                  Caption = 'Tipo do Logradouro'
                end
                object Label21: TLabel
                  Left = 9
                  Top = 6
                  Width = 85
                  Height = 13
                  Caption = 'Tipo de Endere'#231'o'
                end
                object dbLogrType: TDBLookupComboBox
                  Left = 189
                  Top = 21
                  Width = 124
                  Height = 21
                  DataField = 'LTR_CODE'
                  DataSource = dmSys1.dtsProviderAddresses
                  KeyField = 'LTR_CODE'
                  ListField = 'LTR_CODE'
                  ListSource = DmBase.dtsLogrTypes
                  NullValueKey = 46
                  TabOrder = 1
                end
                object dbAddress: TDBEdit
                  Left = 336
                  Top = 21
                  Width = 401
                  Height = 21
                  CharCase = ecUpperCase
                  DataField = 'PRVADD_ADDRESS'
                  DataSource = dmSys1.dtsProviderAddresses
                  TabOrder = 2
                end
                object dbAddNum: TDBEdit
                  Left = 8
                  Top = 61
                  Width = 89
                  Height = 21
                  CharCase = ecUpperCase
                  DataField = 'PRVADD_ADDNBR'
                  DataSource = dmSys1.dtsProviderAddresses
                  TabOrder = 3
                end
                object dbAddComp: TDBEdit
                  Left = 110
                  Top = 61
                  Width = 155
                  Height = 21
                  CharCase = ecUpperCase
                  DataField = 'PRVADD_ADDCOMP'
                  DataSource = dmSys1.dtsProviderAddresses
                  TabOrder = 4
                end
                object dbStates: TDBLookupComboBox
                  Left = 8
                  Top = 103
                  Width = 73
                  Height = 21
                  DataField = 'ST_CODE'
                  DataSource = dmSys1.dtsProviderAddresses
                  DropDownWidth = 130
                  KeyField = 'St_Code'
                  ListField = 'St_code; St_Desc'
                  ListSource = DmBase.dtsStates
                  NullValueKey = 46
                  TabOrder = 7
                end
                object dbCities: TDBEdit
                  Left = 497
                  Top = 61
                  Width = 240
                  Height = 21
                  CharCase = ecUpperCase
                  DataField = 'PRVADD_CITY'
                  DataSource = dmSys1.dtsProviderAddresses
                  TabOrder = 6
                end
                object dbDistrict: TDBEdit
                  Left = 279
                  Top = 61
                  Width = 200
                  Height = 21
                  CharCase = ecUpperCase
                  DataField = 'PRVADD_DISTRICT'
                  DataSource = dmSys1.dtsProviderAddresses
                  TabOrder = 5
                end
                object dbZip: TDBEdit
                  Left = 108
                  Top = 103
                  Width = 125
                  Height = 21
                  CharCase = ecUpperCase
                  DataField = 'PRVADD_ZIP'
                  DataSource = dmSys1.dtsProviderAddresses
                  TabOrder = 8
                end
                object dbAddressTypes: TDBLookupComboBox
                  Left = 8
                  Top = 21
                  Width = 169
                  Height = 21
                  DataField = 'AT_ID'
                  DataSource = dmSys1.dtsProviderAddresses
                  KeyField = 'AT_ID'
                  ListField = 'AT_SHORTDESC'
                  ListSource = dmSys1.dtsAddressTypes
                  NullValueKey = 46
                  TabOrder = 0
                end
              end
            end
          end
          object tsDetailsTelephone: TTabSheet
            Caption = 'Telefones'
            ImageIndex = 2
            object cbTelephones: TCoolBar
              Left = 0
              Top = 0
              Width = 29
              Height = 139
              Align = alLeft
              AutoSize = True
              Bands = <
                item
                  Control = tbTelephones
                  ImageIndex = -1
                  Width = 135
                end>
              Vertical = True
              object tbTelephones: TToolBar
                Left = 0
                Top = 9
                Width = 25
                Height = 126
                Images = imglstBase
                TabOrder = 0
                object tbtnNewTelephone: TToolButton
                  Left = 0
                  Top = 2
                  ImageIndex = 16
                  Wrap = True
                  OnClick = tbtnNewTelephoneClick
                end
                object tbtnEditTelephone: TToolButton
                  Left = 0
                  Top = 24
                  ImageIndex = 10
                  Wrap = True
                  OnClick = tbtnEditTelephoneClick
                end
                object tbtnDelTelephone: TToolButton
                  Left = 0
                  Top = 46
                  ImageIndex = 9
                  OnClick = tbtnDelTelephoneClick
                end
              end
            end
            object nbTelephones: TNotebook
              Left = 29
              Top = 0
              Width = 759
              Height = 139
              Align = alClient
              TabOrder = 1
              object TPage
                Left = 0
                Top = 0
                Caption = 'Consulta'
                object grdTelephones: TDBGrid
                  Left = 0
                  Top = 0
                  Width = 759
                  Height = 139
                  Align = alClient
                  DataSource = dmSys1.dtsProviderTelephones
                  TabOrder = 0
                  TitleFont.Charset = DEFAULT_CHARSET
                  TitleFont.Color = clWindowText
                  TitleFont.Height = -11
                  TitleFont.Name = 'MS Sans Serif'
                  TitleFont.Style = []
                  Columns = <
                    item
                      Expanded = False
                      FieldName = 'TT_DESC'
                      Title.Caption = 'Tipo de Telefone'
                      Width = 128
                      Visible = True
                    end
                    item
                      Expanded = False
                      FieldName = 'PRVTEL_AREACODE'
                      Title.Caption = 'C'#243'digo da Area'
                      Width = 100
                      Visible = True
                    end
                    item
                      Expanded = False
                      FieldName = 'PRVTEL_NUMBER'
                      Title.Caption = 'N'#250'mero'
                      Width = 102
                      Visible = True
                    end
                    item
                      Expanded = False
                      FieldName = 'PRVTEL_COMPLEMENT'
                      Title.Caption = 'Complemento'
                      Width = 133
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
                      FieldName = 'PRVTEL_REGDATE'
                      Title.Caption = 'Registro'
                      Visible = True
                    end
                    item
                      Expanded = False
                      FieldName = 'PRVTEL_REGUSER'
                      Title.Caption = 'Usu'#225'rio'
                      Visible = True
                    end>
                end
              end
              object TPage
                Left = 0
                Top = 0
                Caption = 'Cadastro'
                object lblAreaCode: TLabel
                  Left = 161
                  Top = 16
                  Width = 24
                  Height = 13
                  Caption = 'DDD'
                  FocusControl = dbAreaCode
                end
                object lblTelTypes: TLabel
                  Tag = 1
                  Left = 8
                  Top = 17
                  Width = 81
                  Height = 13
                  Caption = '&Tipo de Telefone'
                  FocusControl = dbTelephoneTypes
                  Font.Charset = DEFAULT_CHARSET
                  Font.Color = clRed
                  Font.Height = -12
                  Font.Name = 'MS Sans Serif'
                  Font.Style = []
                  ParentFont = False
                end
                object lblTelephone: TLabel
                  Left = 268
                  Top = 16
                  Width = 42
                  Height = 13
                  Caption = 'Te&lefone'
                  FocusControl = dbTelephone
                end
                object lblTelComp: TLabel
                  Left = 436
                  Top = 16
                  Width = 64
                  Height = 13
                  Caption = 'Complemento'
                  FocusControl = dbTelComp
                end
                object btnTelOk: TSpeedButton
                  Left = 464
                  Top = 80
                  Width = 95
                  Height = 30
                  Caption = '&Ok'
                  Glyph.Data = {
                    DE010000424DDE01000000000000760000002800000024000000120000000100
                    0400000000006801000000000000000000001000000000000000000000000000
                    80000080000000808000800000008000800080800000C0C0C000808080000000
                    FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00333333333333
                    3333333333333333333333330000333333333333333333333333F33333333333
                    00003333344333333333333333388F3333333333000033334224333333333333
                    338338F3333333330000333422224333333333333833338F3333333300003342
                    222224333333333383333338F3333333000034222A22224333333338F338F333
                    8F33333300003222A3A2224333333338F3838F338F33333300003A2A333A2224
                    33333338F83338F338F33333000033A33333A222433333338333338F338F3333
                    0000333333333A222433333333333338F338F33300003333333333A222433333
                    333333338F338F33000033333333333A222433333333333338F338F300003333
                    33333333A222433333333333338F338F00003333333333333A22433333333333
                    3338F38F000033333333333333A223333333333333338F830000333333333333
                    333A333333333333333338330000333333333333333333333333333333333333
                    0000}
                  NumGlyphs = 2
                  OnClick = btnTelOkClick
                end
                object btnTelCancel: TSpeedButton
                  Left = 576
                  Top = 80
                  Width = 95
                  Height = 30
                  Caption = '&Cancelar'
                  Glyph.Data = {
                    DE010000424DDE01000000000000760000002800000024000000120000000100
                    0400000000006801000000000000000000001000000000000000000000000000
                    80000080000000808000800000008000800080800000C0C0C000808080000000
                    FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00333333333333
                    333333333333333333333333000033338833333333333333333F333333333333
                    0000333911833333983333333388F333333F3333000033391118333911833333
                    38F38F333F88F33300003339111183911118333338F338F3F8338F3300003333
                    911118111118333338F3338F833338F3000033333911111111833333338F3338
                    3333F8330000333333911111183333333338F333333F83330000333333311111
                    8333333333338F3333383333000033333339111183333333333338F333833333
                    00003333339111118333333333333833338F3333000033333911181118333333
                    33338333338F333300003333911183911183333333383338F338F33300003333
                    9118333911183333338F33838F338F33000033333913333391113333338FF833
                    38F338F300003333333333333919333333388333338FFF830000333333333333
                    3333333333333333333888330000333333333333333333333333333333333333
                    0000}
                  NumGlyphs = 2
                  OnClick = btnTelCancelClick
                end
                object dbAreaCode: TDBEdit
                  Left = 161
                  Top = 32
                  Width = 92
                  Height = 21
                  DataField = 'PRVTEL_AREACODE'
                  DataSource = dmSys1.dtsProviderTelephones
                  TabOrder = 1
                end
                object dbTelephoneTypes: TDBLookupComboBox
                  Left = 8
                  Top = 33
                  Width = 137
                  Height = 21
                  DataField = 'TT_ID'
                  DataSource = dmSys1.dtsProviderTelephones
                  KeyField = 'TT_ID'
                  ListField = 'TT_DESC'
                  ListSource = dmSys1.dtsTelephoneTypes
                  NullValueKey = 46
                  TabOrder = 0
                end
                object dbTelephone: TDBEdit
                  Left = 268
                  Top = 32
                  Width = 157
                  Height = 21
                  DataField = 'PRVTEL_NUMBER'
                  DataSource = dmSys1.dtsProviderTelephones
                  TabOrder = 2
                end
                object dbTelComp: TDBEdit
                  Left = 436
                  Top = 32
                  Width = 109
                  Height = 21
                  CharCase = ecUpperCase
                  DataField = 'PRVTEL_COMPLEMENT'
                  DataSource = dmSys1.dtsProviderTelephones
                  TabOrder = 3
                end
              end
            end
          end
          object tsDetailsEmail: TTabSheet
            Caption = 'E-Mails'
            ImageIndex = 3
            object cbEMails: TCoolBar
              Left = 0
              Top = 0
              Width = 29
              Height = 139
              Align = alLeft
              AutoSize = True
              Bands = <
                item
                  Control = tbEMails
                  ImageIndex = -1
                  Width = 135
                end>
              Vertical = True
              object tbEMails: TToolBar
                Left = 0
                Top = 9
                Width = 25
                Height = 126
                Images = imglstBase
                TabOrder = 0
                object tbtnNewEmail: TToolButton
                  Left = 0
                  Top = 2
                  ImageIndex = 16
                  Wrap = True
                  OnClick = tbtnNewEmailClick
                end
                object tbtnEditEMail: TToolButton
                  Left = 0
                  Top = 24
                  ImageIndex = 10
                  Wrap = True
                  OnClick = tbtnEditEMailClick
                end
                object tbtnDelEMail: TToolButton
                  Left = 0
                  Top = 46
                  ImageIndex = 9
                  OnClick = tbtnDelEMailClick
                end
              end
            end
            object nbEmails: TNotebook
              Left = 29
              Top = 0
              Width = 759
              Height = 139
              Align = alClient
              TabOrder = 1
              object TPage
                Left = 0
                Top = 0
                Caption = 'Consulta'
                object grdEMails: TDBGrid
                  Left = 0
                  Top = 0
                  Width = 759
                  Height = 139
                  Align = alClient
                  DataSource = dmSys1.dtsProviderEmails
                  TabOrder = 0
                  TitleFont.Charset = DEFAULT_CHARSET
                  TitleFont.Color = clWindowText
                  TitleFont.Height = -11
                  TitleFont.Name = 'MS Sans Serif'
                  TitleFont.Style = []
                  Columns = <
                    item
                      Expanded = False
                      FieldName = 'EMT_DESC'
                      Title.Caption = 'Tipo de Email'
                      Width = 128
                      Visible = True
                    end
                    item
                      Expanded = False
                      FieldName = 'PRVEM_ACCOUNT'
                      Title.Caption = 'E-Mail'
                      Width = 200
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
                      FieldName = 'PRVEM_REGDATE'
                      Title.Caption = 'Registro'
                      Width = 100
                      Visible = True
                    end
                    item
                      Expanded = False
                      FieldName = 'PRVEM_REGUSER'
                      Title.Caption = 'Usu'#225'rio'
                      Width = 100
                      Visible = True
                    end>
                end
              end
              object TPage
                Left = 0
                Top = 0
                Caption = 'Cadastro'
                object lblAccount: TLabel
                  Left = 147
                  Top = 16
                  Width = 35
                  Height = 13
                  Caption = 'E - Mail'
                  FocusControl = dbAccount
                end
                object lblEmailType: TLabel
                  Tag = 1
                  Left = 8
                  Top = 17
                  Width = 68
                  Height = 13
                  Caption = '&Tipo de E-Mail'
                  FocusControl = dbEmailTypes
                  Font.Charset = DEFAULT_CHARSET
                  Font.Color = clRed
                  Font.Height = -12
                  Font.Name = 'MS Sans Serif'
                  Font.Style = []
                  ParentFont = False
                end
                object btnEmailOk: TSpeedButton
                  Left = 416
                  Top = 88
                  Width = 95
                  Height = 30
                  Caption = '&Ok'
                  Glyph.Data = {
                    DE010000424DDE01000000000000760000002800000024000000120000000100
                    0400000000006801000000000000000000001000000000000000000000000000
                    80000080000000808000800000008000800080800000C0C0C000808080000000
                    FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00333333333333
                    3333333333333333333333330000333333333333333333333333F33333333333
                    00003333344333333333333333388F3333333333000033334224333333333333
                    338338F3333333330000333422224333333333333833338F3333333300003342
                    222224333333333383333338F3333333000034222A22224333333338F338F333
                    8F33333300003222A3A2224333333338F3838F338F33333300003A2A333A2224
                    33333338F83338F338F33333000033A33333A222433333338333338F338F3333
                    0000333333333A222433333333333338F338F33300003333333333A222433333
                    333333338F338F33000033333333333A222433333333333338F338F300003333
                    33333333A222433333333333338F338F00003333333333333A22433333333333
                    3338F38F000033333333333333A223333333333333338F830000333333333333
                    333A333333333333333338330000333333333333333333333333333333333333
                    0000}
                  NumGlyphs = 2
                  OnClick = btnEmailOkClick
                end
                object btnEmailCancel: TSpeedButton
                  Left = 528
                  Top = 88
                  Width = 95
                  Height = 30
                  Caption = '&Cancelar'
                  Glyph.Data = {
                    DE010000424DDE01000000000000760000002800000024000000120000000100
                    0400000000006801000000000000000000001000000000000000000000000000
                    80000080000000808000800000008000800080800000C0C0C000808080000000
                    FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00333333333333
                    333333333333333333333333000033338833333333333333333F333333333333
                    0000333911833333983333333388F333333F3333000033391118333911833333
                    38F38F333F88F33300003339111183911118333338F338F3F8338F3300003333
                    911118111118333338F3338F833338F3000033333911111111833333338F3338
                    3333F8330000333333911111183333333338F333333F83330000333333311111
                    8333333333338F3333383333000033333339111183333333333338F333833333
                    00003333339111118333333333333833338F3333000033333911181118333333
                    33338333338F333300003333911183911183333333383338F338F33300003333
                    9118333911183333338F33838F338F33000033333913333391113333338FF833
                    38F338F300003333333333333919333333388333338FFF830000333333333333
                    3333333333333333333888330000333333333333333333333333333333333333
                    0000}
                  NumGlyphs = 2
                  OnClick = btnEmailCancelClick
                end
                object dbAccount: TDBEdit
                  Left = 147
                  Top = 32
                  Width = 302
                  Height = 21
                  CharCase = ecUpperCase
                  DataField = 'PRVEM_ACCOUNT'
                  DataSource = dmSys1.dtsProviderEmails
                  TabOrder = 1
                end
                object dbEmailTypes: TDBLookupComboBox
                  Left = 8
                  Top = 33
                  Width = 121
                  Height = 21
                  DataField = 'EMT_ID'
                  DataSource = dmSys1.dtsProviderEmails
                  KeyField = 'EMT_ID'
                  ListField = 'EMT_DESC'
                  ListSource = dmSys1.dtsEmailTypes
                  NullValueKey = 46
                  TabOrder = 0
                end
              end
            end
          end
        end
      end
      object pcSubApplications: TPageControl
        Left = 27
        Top = 344
        Width = 773
        Height = 180
        ActivePage = TabSheet1
        Align = alClient
        TabHeight = 13
        TabOrder = 1
        object TabSheet1: TTabSheet
          Caption = 'Tipo de Provedores'
          object lExpperiod: TLabel
            Left = 16
            Top = 56
            Width = 47
            Height = 13
            Caption = 'Expperiod'
            FocusControl = dbExpperiod
          end
          object Label30: TLabel
            Left = 16
            Top = 8
            Width = 82
            Height = 13
            Caption = 'Tipo de Provedor'
          end
          object Label31: TLabel
            Left = 229
            Top = 56
            Width = 30
            Height = 13
            Caption = 'Status'
          end
          object btDisplayCancel: TSpeedButton
            Left = 632
            Top = 79
            Width = 98
            Height = 32
            Caption = 'Cancelar'
            Glyph.Data = {
              DE010000424DDE01000000000000760000002800000024000000120000000100
              0400000000006801000000000000000000001000000000000000000000000000
              80000080000000808000800000008000800080800000C0C0C000808080000000
              FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00333333333333
              333333333333333333333333000033338833333333333333333F333333333333
              0000333911833333983333333388F333333F3333000033391118333911833333
              38F38F333F88F33300003339111183911118333338F338F3F8338F3300003333
              911118111118333338F3338F833338F3000033333911111111833333338F3338
              3333F8330000333333911111183333333338F333333F83330000333333311111
              8333333333338F3333383333000033333339111183333333333338F333833333
              00003333339111118333333333333833338F3333000033333911181118333333
              33338333338F333300003333911183911183333333383338F338F33300003333
              9118333911183333338F33838F338F33000033333913333391113333338FF833
              38F338F300003333333333333919333333388333338FFF830000333333333333
              3333333333333333333888330000333333333333333333333333333333333333
              0000}
            NumGlyphs = 2
            OnClick = btDisplayCancelClick
          end
          object btDisplayOK: TSpeedButton
            Left = 632
            Top = 39
            Width = 98
            Height = 32
            Caption = 'Ok'
            Glyph.Data = {
              DE010000424DDE01000000000000760000002800000024000000120000000100
              0400000000006801000000000000000000001000000000000000000000000000
              80000080000000808000800000008000800080800000C0C0C000808080000000
              FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00333333333333
              3333333333333333333333330000333333333333333333333333F33333333333
              00003333344333333333333333388F3333333333000033334224333333333333
              338338F3333333330000333422224333333333333833338F3333333300003342
              222224333333333383333338F3333333000034222A22224333333338F338F333
              8F33333300003222A3A2224333333338F3838F338F33333300003A2A333A2224
              33333338F83338F338F33333000033A33333A222433333338333338F338F3333
              0000333333333A222433333333333338F338F33300003333333333A222433333
              333333338F338F33000033333333333A222433333333333338F338F300003333
              33333333A222433333333333338F338F00003333333333333A22433333333333
              3338F38F000033333333333333A223333333333333338F830000333333333333
              333A333333333333333338330000333333333333333333333333333333333333
              0000}
            NumGlyphs = 2
            OnClick = btDisplayOKClick
          end
          object Label32: TLabel
            Left = 282
            Top = 8
            Width = 104
            Height = 13
            Caption = 'Sub Tipo de Provedor'
          end
          object dbExpperiod: TDBEdit
            Left = 16
            Top = 72
            Width = 185
            Height = 21
            DataField = 'Prvprvt_Expperiod'
            DataSource = DmSys.dtsProvidersxProviderTypes
            TabOrder = 2
          end
          object dbStatus: TRxDBComboBox
            Left = 228
            Top = 72
            Width = 149
            Height = 21
            Style = csDropDownList
            DataField = 'Prvprvt_Status'
            DataSource = DmSys.dtsProvidersxProviderTypes
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
          object dbProviderTypes: TRxDBLookupCombo
            Left = 17
            Top = 24
            Width = 244
            Height = 21
            DropDownCount = 8
            DataField = 'Prvt_Code'
            DataSource = DmSys.dtsProvidersxProviderTypes
            LookupField = 'Prvt_Code'
            LookupDisplay = 'Prvt_Desc'
            LookupSource = DmSys.dtsProviderTypes
            TabOrder = 0
          end
          object dbProviderSubTypes: TRxDBLookupCombo
            Left = 281
            Top = 24
            Width = 244
            Height = 21
            DropDownCount = 8
            DataField = 'Prvst_Id'
            DataSource = DmSys.dtsProvidersxProviderTypes
            LookupField = 'Prvst_Id'
            LookupDisplay = 'Prvst_Desc'
            LookupSource = DmSys.dtsProviderSubTypes
            TabOrder = 1
          end
          object dbgTipoProvedores: TDBGrid
            Left = 0
            Top = 0
            Width = 765
            Height = 157
            Align = alClient
            DataSource = DmSys.dtsProvidersxProviderTypes
            Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgRowSelect, dgConfirmDelete, dgCancelOnExit]
            TabOrder = 4
            TitleFont.Charset = DEFAULT_CHARSET
            TitleFont.Color = clWindowText
            TitleFont.Height = -11
            TitleFont.Name = 'MS Sans Serif'
            TitleFont.Style = []
            Columns = <
              item
                Expanded = False
                FieldName = 'PRVT_DESC'
                Title.Caption = 'Tipo de Provedores'
                Width = 200
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'PRVST_DESC'
                Title.Caption = 'Sub Tipo de Provedores'
                Width = 180
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'PRVPRVT_EXPPERIOD'
                Title.Caption = 'Expperiod'
                Width = 90
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
                FieldName = 'PRVPRVT_REGDATE'
                Title.Caption = 'Registro'
                Width = 100
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'PRVPRVT_REGUSER'
                Title.Caption = 'Usu'#225'rio'
                Width = 100
                Visible = True
              end>
          end
        end
      end
      object cbCardApps: TCoolBar
        Left = 0
        Top = 344
        Width = 27
        Height = 180
        Align = alLeft
        AutoSize = True
        Bands = <
          item
            Control = tbCardsApps
            ImageIndex = -1
            MinHeight = 23
            Width = 176
          end>
        Vertical = True
        object tbCardsApps: TToolBar
          Left = 0
          Top = 9
          Width = 23
          Height = 167
          Align = alClient
          Caption = 'tbCardsApps'
          Images = imglstBase
          TabOrder = 0
          object tbtnNewCardApp: TToolButton
            Left = 0
            Top = 2
            Hint = 'Incluir Sub Aplica'#231#227'o'
            ImageIndex = 16
            ParentShowHint = False
            Wrap = True
            ShowHint = True
            OnClick = tbtnNewCardAppClick
          end
          object tbtnEditCardApp: TToolButton
            Left = 0
            Top = 24
            Hint = 'Editar Sub Aplica'#231#227'o'
            ImageIndex = 10
            ParentShowHint = False
            Wrap = True
            ShowHint = True
            OnClick = tbtnEditCardAppClick
          end
          object tbtnDeletePeriod: TToolButton
            Left = 0
            Top = 46
            Hint = 'Excluir Sub Aplica'#231#227'o'
            ImageIndex = 9
            ParentShowHint = False
            ShowHint = True
            OnClick = tbtnDeletePeriodClick
          end
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
    DataSet = DmSys.cdsProviders
  end
end
