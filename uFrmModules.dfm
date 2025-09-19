inherited FrmModules: TFrmModules
  Tag = 66
  Left = 221
  Top = 143
  Width = 799
  Height = 469
  Caption = 'M'#243'dulos'
  PixelsPerInch = 96
  TextHeight = 13
  inherited cbBase: TCoolBar
    Width = 791
    Bands = <
      item
        Control = tbBase
        ImageIndex = -1
        MinHeight = 24
        Width = 787
      end>
    inherited tbBase: TToolBar
      Width = 774
    end
  end
  inherited pcBaseCadastro: TPageControl
    Width = 791
    Height = 387
    OnChange = pcBaseCadastroChange
    inherited tsBaseCadastroFiltro: TTabSheet
      inherited Splitter_Base1: TSplitter
        Top = 117
        Width = 783
      end
      inherited gbGrid: TGroupBox
        Top = 121
        Width = 783
        Height = 238
        inherited grdResultado: TDBGrid
          Width = 779
          Height = 221
          DataSource = dtsMaster
          Columns = <
            item
              Expanded = False
              FieldName = 'MOD_CODE'
              Title.Caption = 'Sigla'
              Width = 160
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'MOD_DESC'
              Title.Caption = 'Descri'#231#227'o'
              Width = 372
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'MOD_REGDATE'
              Title.Caption = 'Registro'
              Width = 80
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'MOD_REGUSER'
              Title.Caption = 'Usu'#225'rio'
              Width = 120
              Visible = True
            end>
        end
      end
      inherited pnFiltro: TPanel
        Width = 783
        Height = 117
        inherited pnPesq: TPanel
          Width = 783
          Height = 117
          inherited gbfiltroavansado: TGroupBox
            Width = 779
            Height = 113
            inherited pnVoltar: TPanel
              Top = 98
              Width = 775
              inherited lblBack: TLabel
                Left = 748
              end
            end
          end
          inherited gbFiltro: TGroupBox
            Width = 779
            Height = 113
            object Label1: TLabel [0]
              Tag = 2688
              Left = 16
              Top = 12
              Width = 23
              Height = 13
              Caption = 'Sigla'
              FocusControl = edCode
            end
            object Label2: TLabel [1]
              Tag = 2689
              Left = 16
              Top = 56
              Width = 48
              Height = 13
              Caption = 'Descri'#231#227'o'
              FocusControl = edDesc
            end
            inherited pnPesquiza: TPanel
              Top = 98
              Width = 775
              inherited lblAdvancedSearch: TLabel
                Width = 775
              end
            end
            object edCode: TEdit
              Left = 16
              Top = 28
              Width = 160
              Height = 21
              CharCase = ecUpperCase
              MaxLength = 20
              TabOrder = 1
            end
            object edDesc: TEdit
              Left = 16
              Top = 72
              Width = 372
              Height = 21
              CharCase = ecUpperCase
              MaxLength = 50
              TabOrder = 2
            end
          end
        end
      end
    end
    inherited tsBaseCadastroConsulta: TTabSheet
      object grpModule: TGroupBox
        Left = 0
        Top = 0
        Width = 783
        Height = 114
        Align = alTop
        TabOrder = 0
        object Label3: TLabel
          Left = 16
          Top = 12
          Width = 23
          Height = 13
          Caption = 'Sigla'
        end
        object Label4: TLabel
          Left = 16
          Top = 56
          Width = 48
          Height = 13
          Caption = 'Descri'#231#227'o'
        end
        object dbCode: TDBEdit
          Left = 16
          Top = 28
          Width = 160
          Height = 21
          CharCase = ecUpperCase
          DataField = 'MOD_CODE'
          DataSource = dtsMaster
          TabOrder = 0
        end
        object dbDesc: TDBEdit
          Left = 16
          Top = 72
          Width = 372
          Height = 21
          CharCase = ecUpperCase
          DataField = 'MOD_DESC'
          DataSource = dtsMaster
          TabOrder = 1
        end
      end
      object cbDetail: TCoolBar
        Left = 0
        Top = 114
        Width = 27
        Height = 245
        Align = alLeft
        AutoSize = True
        Bands = <
          item
            Control = tbDetail
            ImageIndex = -1
            MinHeight = 23
            Width = 241
          end>
        Vertical = True
        object tbDetail: TToolBar
          Left = 0
          Top = 9
          Width = 23
          Height = 232
          Align = alClient
          Images = imglstBase
          TabOrder = 0
          object tbtnNewDetail: TToolButton
            Left = 0
            Top = 2
            Hint = 'Incluir'
            ImageIndex = 16
            ParentShowHint = False
            Wrap = True
            ShowHint = True
            OnClick = actNewDetailExecute
          end
          object tbtnEditDetail: TToolButton
            Left = 0
            Top = 24
            Hint = 'Editar'
            ImageIndex = 10
            ParentShowHint = False
            Wrap = True
            ShowHint = True
            OnClick = actEditDetailExecute
          end
          object tbtnDeleteDetail: TToolButton
            Left = 0
            Top = 46
            Hint = 'Excluir'
            Enabled = False
            ImageIndex = 9
            ParentShowHint = False
            ShowHint = True
          end
        end
      end
      object pgcDetail: TPageControl
        Left = 27
        Top = 114
        Width = 756
        Height = 245
        ActivePage = TabSheet1
        Align = alClient
        TabOrder = 2
        OnChange = pgcDetailChange
        OnChanging = pgcDetailChanging
        object TabSheet1: TTabSheet
          Tag = 2692
          Caption = 'Softwares'
          object Label9: TLabel
            Left = 8
            Top = 4
            Width = 56
            Height = 13
            Caption = 'Dispon'#237'veis'
          end
          object Label10: TLabel
            Left = 349
            Top = 4
            Width = 64
            Height = 13
            Caption = 'Selecionados'
          end
          object btnOkSoftwares: TSpeedButton
            Left = 652
            Top = 139
            Width = 78
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
            OnClick = actOKSoftwaresExecute
          end
          object btnCancelSoftwares: TSpeedButton
            Left = 652
            Top = 179
            Width = 78
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
            OnClick = actCancelSoftwaresExecute
          end
          object cbSoftware: TCoolBar
            Left = 312
            Top = 60
            Width = 27
            Height = 105
            Align = alNone
            AutoSize = True
            Bands = <
              item
                Control = tbSoftware
                ImageIndex = -1
                MinHeight = 23
                Width = 101
              end>
            Vertical = True
            object tbSoftware: TToolBar
              Left = 0
              Top = 9
              Width = 23
              Height = 90
              Align = alNone
              AutoSize = True
              Caption = 'tbSoftware'
              EdgeBorders = []
              Images = imglstBase
              TabOrder = 0
              object btnAddSoftware: TToolButton
                Left = 0
                Top = 2
                ImageIndex = 22
                Wrap = True
                OnClick = actAddSoftwareExecute
              end
              object tbtnAddAllSoftware: TToolButton
                Left = 0
                Top = 24
                ImageIndex = 21
                Wrap = True
                OnClick = actAddAllSoftwareExecute
              end
              object btnDelSoftware: TToolButton
                Left = 0
                Top = 46
                ImageIndex = 24
                Wrap = True
                OnClick = actDelSoftwareExecute
              end
              object tbtnDelAllSoftware: TToolButton
                Left = 0
                Top = 68
                ImageIndex = 23
                OnClick = actDelAllSoftwareExecute
              end
            end
          end
          object lbSoftwaresDisp: TListBox
            Left = 8
            Top = 20
            Width = 295
            Height = 192
            DragMode = dmAutomatic
            ItemHeight = 13
            MultiSelect = True
            Sorted = True
            TabOrder = 2
            OnDragDrop = lbSoftwaresDispDragDrop
            OnDragOver = lbSoftwaresDispDragOver
          end
          object lbSoftwaresSelec: TListBox
            Left = 348
            Top = 20
            Width = 295
            Height = 192
            DragMode = dmAutomatic
            ItemHeight = 13
            MultiSelect = True
            Sorted = True
            TabOrder = 3
            OnDragDrop = lbSoftwaresSelecDragDrop
            OnDragOver = lbSoftwaresSelecDragOver
          end
          object dbgSoftwares: TDBGrid
            Left = 0
            Top = 0
            Width = 748
            Height = 217
            Align = alClient
            DataSource = dmSys1.dtsModulesXSoftwares
            TabOrder = 0
            TitleFont.Charset = DEFAULT_CHARSET
            TitleFont.Color = clWindowText
            TitleFont.Height = -11
            TitleFont.Name = 'MS Sans Serif'
            TitleFont.Style = []
            Columns = <
              item
                Expanded = False
                FieldName = 'SF_COD'
                Title.Caption = 'Sigla'
                Width = 100
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'SF_DESC'
                Title.Caption = 'Descri'#231#227'o'
                Width = 340
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'SFT_DESC'
                Title.Caption = 'Tipo'
                Width = 100
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'MODSF_REGDATE'
                Title.Caption = 'Registro'
                Width = 80
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'MODSF_REGUSER'
                Title.Caption = 'Usu'#225'rio'
                Width = 100
                Visible = True
              end>
          end
        end
        object TabSheet2: TTabSheet
          Tag = 2693
          Caption = 'Formul'#225'rios'
          ImageIndex = 1
          object btnOkForms: TSpeedButton
            Left = 652
            Top = 139
            Width = 78
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
            OnClick = actOKFormsExecute
          end
          object btnCancelForms: TSpeedButton
            Left = 652
            Top = 179
            Width = 78
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
            OnClick = actCancelFormsExecute
          end
          object Label5: TLabel
            Left = 8
            Top = 4
            Width = 56
            Height = 13
            Caption = 'Dispon'#237'veis'
          end
          object Label6: TLabel
            Left = 349
            Top = 4
            Width = 64
            Height = 13
            Caption = 'Selecionados'
          end
          object cbForms: TCoolBar
            Left = 312
            Top = 60
            Width = 27
            Height = 105
            Align = alNone
            AutoSize = True
            Bands = <
              item
                Control = tbForms
                ImageIndex = -1
                MinHeight = 23
                Width = 101
              end>
            Vertical = True
            object tbForms: TToolBar
              Left = 0
              Top = 9
              Width = 23
              Height = 90
              Align = alNone
              AutoSize = True
              Caption = 'tbSoftware'
              EdgeBorders = []
              Images = imglstBase
              TabOrder = 0
              object btnAddForm: TToolButton
                Left = 0
                Top = 2
                ImageIndex = 22
                Wrap = True
                OnClick = actAddFormExecute
              end
              object btnAddAllForms: TToolButton
                Left = 0
                Top = 24
                ImageIndex = 21
                Wrap = True
                OnClick = actAddAllFormsExecute
              end
              object btnDelForm: TToolButton
                Left = 0
                Top = 46
                ImageIndex = 24
                Wrap = True
                OnClick = actDelFormExecute
              end
              object btnDelAllForms: TToolButton
                Left = 0
                Top = 68
                ImageIndex = 23
                OnClick = actDelAllFormsExecute
              end
            end
          end
          object lbFormsDisp: TListBox
            Left = 8
            Top = 20
            Width = 295
            Height = 192
            DragMode = dmAutomatic
            ItemHeight = 13
            MultiSelect = True
            Sorted = True
            TabOrder = 2
            OnDragDrop = lbFormsDispDragDrop
            OnDragOver = lbFormsDispDragOver
          end
          object lbFormsSel: TListBox
            Left = 348
            Top = 20
            Width = 295
            Height = 192
            DragMode = dmAutomatic
            ItemHeight = 13
            MultiSelect = True
            Sorted = True
            TabOrder = 3
            OnDragDrop = lbFormsSelDragDrop
            OnDragOver = lbFormsSelDragOver
          end
          object dbgForms: TDBGrid
            Left = 0
            Top = 0
            Width = 748
            Height = 217
            Align = alClient
            DataSource = dmSys1.dtsModulesXForms
            TabOrder = 0
            TitleFont.Charset = DEFAULT_CHARSET
            TitleFont.Color = clWindowText
            TitleFont.Height = -11
            TitleFont.Name = 'MS Sans Serif'
            TitleFont.Style = []
            Columns = <
              item
                Expanded = False
                FieldName = 'FRM_DESC'
                Title.Caption = 'Descri'#231#227'o'
                Width = 360
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'MODFRM_REGDATE'
                Title.Caption = 'Registro'
                Width = 80
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'MODFRM_REGUSER'
                Title.Caption = 'Usu'#225'rio'
                Width = 160
                Visible = True
              end>
          end
        end
      end
    end
  end
  inherited actlstBase: TActionList
    inherited actFilter: TAction
      OnExecute = actFilterExecute
    end
    object actNewDetail: TAction
      Category = 'Detail'
      Caption = 'actNewDetail'
      OnExecute = actNewDetailExecute
    end
    object actEditDetail: TAction
      Category = 'Detail'
      Caption = 'actEditDetail'
      OnExecute = actEditDetailExecute
    end
    object actAddSoftware: TAction
      Category = 'Softwares'
      Caption = 'actAddSoftware'
      OnExecute = actAddSoftwareExecute
    end
    object actAddAllSoftware: TAction
      Category = 'Softwares'
      Caption = 'actAddAllSoftware'
      OnExecute = actAddAllSoftwareExecute
    end
    object actDelSoftware: TAction
      Category = 'Softwares'
      Caption = 'actDelSoftware'
      OnExecute = actDelSoftwareExecute
    end
    object actDelAllSoftware: TAction
      Category = 'Softwares'
      Caption = 'actDelAllSoftware'
      OnExecute = actDelAllSoftwareExecute
    end
    object actOKSoftwares: TAction
      Category = 'Ok-Cancel'
      Caption = 'actOKSoftwares'
      OnExecute = actOKSoftwaresExecute
    end
    object actCancelSoftwares: TAction
      Category = 'Ok-Cancel'
      Caption = 'actCancelSoftwares'
      OnExecute = actCancelSoftwaresExecute
    end
    object actAddForm: TAction
      Category = 'Forms'
      Caption = 'actAddForm'
      OnExecute = actAddFormExecute
    end
    object actAddAllForms: TAction
      Category = 'Forms'
      Caption = 'actAddAllForms'
      OnExecute = actAddAllFormsExecute
    end
    object actDelForm: TAction
      Category = 'Forms'
      Caption = 'actDelForm'
      OnExecute = actDelFormExecute
    end
    object actDelAllForms: TAction
      Category = 'Forms'
      Caption = 'actDelAllForms'
      OnExecute = actDelAllFormsExecute
    end
    object actOKForms: TAction
      Category = 'Ok-Cancel'
      Caption = 'actOKForms'
      OnExecute = actOKFormsExecute
    end
    object actCancelForms: TAction
      Category = 'Ok-Cancel'
      Caption = 'actCancelForms'
      OnExecute = actCancelFormsExecute
    end
  end
  inherited dtsMaster: TDataSource
    DataSet = dmSys1.cdsModules
  end
end
