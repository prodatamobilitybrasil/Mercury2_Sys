inherited FrmLineIntegTimeGroups: TFrmLineIntegTimeGroups
  Tag = 131
  Left = 316
  Top = 175
  Width = 686
  Height = 469
  Caption = 'Grupos de Tempo de Integra'#231#227'o'
  PixelsPerInch = 96
  TextHeight = 13
  inherited cbBase: TCoolBar
    Width = 678
    Bands = <
      item
        Control = tbBase
        ImageIndex = -1
        MinHeight = 24
        Width = 674
      end>
    inherited tbBase: TToolBar
      Width = 661
    end
  end
  inherited pcBaseCadastro: TPageControl
    Width = 678
    Height = 387
    ActivePage = tsBaseCadastroConsulta
    OnChange = pcBaseCadastroChange
    inherited tsBaseCadastroFiltro: TTabSheet
      inherited Splitter_Base1: TSplitter
        Width = 670
      end
      inherited gbGrid: TGroupBox
        Width = 670
        Height = 227
        inherited grdResultado: TDBGrid
          Width = 666
          Height = 210
          DataSource = dtsMaster
          Columns = <
            item
              Expanded = False
              FieldName = 'LITG_ID'
              Visible = False
            end
            item
              Expanded = False
              FieldName = 'LITG_DESC'
              Width = 318
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'LIP_STATUS'
              Visible = False
            end
            item
              Expanded = False
              FieldName = 'LIP_REGDATE'
              Visible = False
            end
            item
              Expanded = False
              FieldName = 'LIP_REGUSER'
              Visible = False
            end>
        end
      end
      inherited pnFiltro: TPanel
        Width = 670
        inherited pnPesq: TPanel
          Width = 670
          inherited gbfiltroavansado: TGroupBox
            Width = 666
            inherited pnVoltar: TPanel
              Width = 662
              inherited lblBack: TLabel
                Left = 635
              end
            end
          end
          inherited gbFiltro: TGroupBox
            Width = 666
            object Label1: TLabel [0]
              Left = 16
              Top = 28
              Width = 48
              Height = 13
              Caption = 'Descri'#231#227'o'
            end
            object lblFilterStatus: TLabel [1]
              Left = 432
              Top = 28
              Width = 30
              Height = 13
              Caption = 'Status'
            end
            inherited pnPesquiza: TPanel
              Width = 662
              inherited lblAdvancedSearch: TLabel
                Width = 662
              end
            end
            object edtFilterDescricao: TEdit
              Left = 16
              Top = 44
              Width = 389
              Height = 21
              TabOrder = 1
            end
            object cboFilterStatus: TComboBox
              Left = 432
              Top = 44
              Width = 145
              Height = 21
              Style = csDropDownList
              ItemHeight = 13
              ItemIndex = 2
              TabOrder = 2
              Text = 'Todos'
              Items.Strings = (
                'Ativo'
                'Inativo'
                'Todos')
            end
          end
        end
      end
    end
    inherited tsBaseCadastroConsulta: TTabSheet
      object lblDescricao: TLabel
        Left = 20
        Top = 20
        Width = 48
        Height = 13
        Caption = 'Descri'#231#227'o'
        FocusControl = edtDescricao
      end
      object lblStatus: TLabel
        Left = 424
        Top = 20
        Width = 30
        Height = 13
        Caption = 'Status'
        FocusControl = cboStatus
      end
      object edtDescricao: TDBEdit
        Left = 20
        Top = 36
        Width = 373
        Height = 21
        DataField = 'LITG_DESC'
        DataSource = dtsMaster
        TabOrder = 0
      end
      object GroupBox1: TGroupBox
        Left = 0
        Top = 72
        Width = 670
        Height = 287
        Align = alBottom
        Anchors = [akLeft, akTop, akRight, akBottom]
        Caption = ' Per'#237'odos '
        TabOrder = 1
        object cbPeriods: TCoolBar
          Left = 2
          Top = 15
          Width = 27
          Height = 270
          Align = alLeft
          AutoSize = True
          Bands = <
            item
              Control = tbPeriods
              ImageIndex = -1
              MinHeight = 23
              Width = 266
            end>
          Vertical = True
          object tbPeriods: TToolBar
            Left = 0
            Top = 9
            Width = 23
            Height = 257
            Align = alClient
            ButtonHeight = 24
            Images = imglstBase
            TabOrder = 0
            object tbPeriodsEdit: TToolButton
              Left = 0
              Top = 2
              Enabled = False
              ImageIndex = 10
              ParentShowHint = False
              Wrap = True
              ShowHint = True
              OnClick = actTimeLimitEditExecute
            end
          end
        end
        object Panel4: TPanel
          Left = 29
          Top = 15
          Width = 639
          Height = 270
          Align = alClient
          BevelInner = bvRaised
          BevelOuter = bvLowered
          TabOrder = 1
          object Splitter1: TSplitter
            Left = 293
            Top = 2
            Height = 234
            Beveled = True
          end
          object Panel5: TPanel
            Left = 2
            Top = 236
            Width = 635
            Height = 32
            Align = alBottom
            BevelOuter = bvNone
            TabOrder = 0
            object Panel6: TPanel
              Left = 445
              Top = 0
              Width = 190
              Height = 32
              Align = alRight
              BevelOuter = bvNone
              TabOrder = 0
              object btnPeriodsOk: TBitBtn
                Tag = 3470
                Left = 38
                Top = 4
                Width = 74
                Height = 25
                Caption = 'Ok'
                Default = True
                TabOrder = 0
                Visible = False
                OnClick = ButtonTimeLimitsOkCancelClick
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
              end
              object btnPeriodsCancel: TBitBtn
                Tag = 3471
                Left = 112
                Top = 4
                Width = 74
                Height = 25
                Caption = 'Cancelar'
                TabOrder = 1
                Visible = False
                OnClick = ButtonTimeLimitsOkCancelClick
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
              end
            end
          end
          object Panel8: TPanel
            Left = 296
            Top = 2
            Width = 34
            Height = 234
            Align = alLeft
            BevelOuter = bvNone
            TabOrder = 1
            object cbAddDel: TCoolBar
              Left = 4
              Top = 67
              Width = 27
              Height = 110
              Align = alNone
              AutoSize = True
              Bands = <
                item
                  Control = ToolBar1
                  ImageIndex = -1
                  MinHeight = 23
                  Width = 106
                end>
              Vertical = True
              object ToolBar1: TToolBar
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
                object btnAdd: TToolButton
                  Tag = 3466
                  Left = 0
                  Top = 2
                  Caption = 'actTimeLimitAdd'
                  Enabled = False
                  ImageIndex = 22
                  Wrap = True
                  OnClick = ButtonAddDelClick
                end
                object btnAddAll: TToolButton
                  Tag = 3467
                  Left = 0
                  Top = 24
                  Caption = 'actTimeLimitAddAll'
                  Enabled = False
                  ImageIndex = 21
                  Wrap = True
                  OnClick = ButtonAddDelClick
                end
                object btnDel: TToolButton
                  Tag = 3468
                  Left = 0
                  Top = 46
                  Caption = 'actTimeLimitDel'
                  Enabled = False
                  ImageIndex = 24
                  Wrap = True
                  OnClick = ButtonAddDelClick
                end
                object btnDelAll: TToolButton
                  Tag = 3469
                  Left = 0
                  Top = 68
                  Caption = 'actTimeLimitDelAll'
                  Enabled = False
                  ImageIndex = 23
                  OnClick = ButtonAddDelClick
                end
              end
            end
          end
          object Panel9: TPanel
            Left = 2
            Top = 2
            Width = 291
            Height = 234
            Align = alLeft
            BevelOuter = bvLowered
            TabOrder = 2
            object Panel10: TPanel
              Left = 1
              Top = 1
              Width = 289
              Height = 18
              Align = alTop
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'MS Sans Serif'
              Font.Style = [fsBold]
              ParentFont = False
              TabOrder = 0
              object Label15: TLabel
                Tag = 3065
                Left = 1
                Top = 1
                Width = 287
                Height = 13
                Align = alTop
                Alignment = taCenter
                Caption = 'AVAILABLE'
              end
            end
            object lsbDisp: TListBox
              Left = 1
              Top = 19
              Width = 289
              Height = 214
              Align = alClient
              BevelInner = bvNone
              BevelOuter = bvNone
              BorderStyle = bsNone
              DragMode = dmAutomatic
              ItemHeight = 13
              MultiSelect = True
              Sorted = True
              TabOrder = 1
            end
          end
          object Panel11: TPanel
            Left = 330
            Top = 2
            Width = 307
            Height = 234
            Align = alClient
            BevelOuter = bvLowered
            TabOrder = 3
            object Panel12: TPanel
              Left = 1
              Top = 1
              Width = 305
              Height = 18
              Align = alTop
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'MS Sans Serif'
              Font.Style = [fsBold]
              ParentFont = False
              TabOrder = 0
              object Label16: TLabel
                Tag = 3066
                Left = 1
                Top = 1
                Width = 303
                Height = 13
                Align = alTop
                Alignment = taCenter
                Caption = 'SELECTED'
              end
            end
            object lsbSel: TListBox
              Left = 1
              Top = 19
              Width = 305
              Height = 214
              Align = alClient
              BevelInner = bvNone
              BevelOuter = bvNone
              BorderStyle = bsNone
              DragMode = dmAutomatic
              ItemHeight = 13
              MultiSelect = True
              Sorted = True
              TabOrder = 1
            end
          end
        end
      end
      object cboStatus: TRxDBComboBox
        Left = 424
        Top = 36
        Width = 145
        Height = 21
        Style = csDropDownList
        DataField = 'LITG_STATUS'
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
    end
  end
  inherited actlstBase: TActionList
    inherited actFilter: TAction
      OnExecute = actFilterExecute
    end
  end
end
