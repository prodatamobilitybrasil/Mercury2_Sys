inherited FrmObjects: TFrmObjects
  Tag = 77
  Left = 184
  Top = 141
  Width = 792
  Height = 514
  Caption = 'Objetos'
  PixelsPerInch = 96
  TextHeight = 13
  inherited cbBase: TCoolBar
    Width = 784
    Bands = <
      item
        Control = tbBase
        ImageIndex = -1
        MinHeight = 24
        Width = 780
      end>
    inherited tbBase: TToolBar
      Width = 767
    end
  end
  inherited pcBaseCadastro: TPageControl
    Width = 784
    Height = 432
    ActivePage = tsBaseCadastroConsulta
    OnChange = pcBaseCadastroChange
    inherited tsBaseCadastroFiltro: TTabSheet
      inherited Splitter_Base1: TSplitter
        Top = 105
        Width = 776
      end
      inherited gbGrid: TGroupBox
        Top = 109
        Width = 776
        Height = 295
        inherited grdResultado: TDBGrid
          Width = 772
          Height = 278
          DataSource = dtsMaster
          Columns = <
            item
              Expanded = False
              FieldName = 'OBJ_ID'
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'OBJ_NAME'
              Width = 227
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'OBJ_DESC'
              Width = 223
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'OBJ_FIELDNAME'
              Width = 136
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'OT_DESC'
              Width = 99
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'DT_DESC'
              Width = 102
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'OTM_DESC'
              Width = 117
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'OBJ_REGDATE'
              Width = 105
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'OBJ_REGUSER'
              Width = 80
              Visible = True
            end>
        end
      end
      inherited pnFiltro: TPanel
        Width = 776
        Height = 105
        inherited pnPesq: TPanel
          Width = 776
          Height = 105
          inherited gbfiltroavansado: TGroupBox
            Width = 772
            Height = 101
            inherited pnVoltar: TPanel
              Top = 86
              Width = 768
              inherited lblBack: TLabel
                Left = 741
              end
            end
          end
          inherited gbFiltro: TGroupBox
            Width = 772
            Height = 101
            object Label7: TLabel [0]
              Tag = 3033
              Left = 128
              Top = 12
              Width = 57
              Height = 13
              Caption = 'OBJ_NAME'
              FocusControl = edName
            end
            object Label8: TLabel [1]
              Tag = 3034
              Left = 8
              Top = 52
              Width = 55
              Height = 13
              Caption = 'OBJ_DESC'
              FocusControl = edDesc
            end
            object Label9: TLabel [2]
              Tag = 3044
              Left = 424
              Top = 53
              Width = 50
              Height = 13
              Caption = 'OT_DESC'
              FocusControl = lkObjectType
            end
            object Label10: TLabel [3]
              Tag = 3043
              Left = 436
              Top = 12
              Width = 87
              Height = 13
              Caption = 'OBJ_FIELDNAME'
              FocusControl = edFieldName
            end
            object Label17: TLabel [4]
              Tag = 2704
              Left = 8
              Top = 12
              Width = 37
              Height = 13
              Caption = 'OBJ_ID'
              FocusControl = edOBJ_ID
            end
            inherited pnPesquiza: TPanel
              Top = 86
              Width = 768
              inherited lblAdvancedSearch: TLabel
                Width = 768
              end
            end
            object edName: TEdit
              Left = 128
              Top = 28
              Width = 300
              Height = 21
              CharCase = ecUpperCase
              MaxLength = 50
              TabOrder = 2
            end
            object edDesc: TEdit
              Left = 8
              Top = 68
              Width = 409
              Height = 21
              CharCase = ecUpperCase
              MaxLength = 50
              TabOrder = 4
            end
            object edFieldName: TEdit
              Left = 436
              Top = 28
              Width = 300
              Height = 21
              CharCase = ecUpperCase
              MaxLength = 50
              TabOrder = 3
            end
            object lkObjectType: TRxDBLookupCombo
              Left = 424
              Top = 68
              Width = 193
              Height = 21
              DropDownCount = 8
              LookupField = 'OT_ID'
              LookupDisplay = 'OT_DESC'
              LookupSource = dmSys1.dtsObjectTypes
              TabOrder = 5
            end
            object edOBJ_ID: TEdit
              Left = 8
              Top = 28
              Width = 110
              Height = 21
              TabOrder = 1
            end
          end
        end
      end
    end
    inherited tsBaseCadastroConsulta: TTabSheet
      object grbObject: TGroupBox
        Left = 0
        Top = 0
        Width = 776
        Height = 102
        Align = alTop
        TabOrder = 0
        object Label1: TLabel
          Left = 8
          Top = 12
          Width = 57
          Height = 13
          Caption = 'OBJ_NAME'
          FocusControl = dbName
        end
        object Label2: TLabel
          Left = 8
          Top = 52
          Width = 55
          Height = 13
          Caption = 'OBJ_DESC'
          FocusControl = dbDesc
        end
        object Label3: TLabel
          Left = 316
          Top = 12
          Width = 87
          Height = 13
          Caption = 'OBJ_FIELDNAME'
          FocusControl = dbFieldName
        end
        object Label4: TLabel
          Tag = 3048
          Left = 472
          Top = 52
          Width = 59
          Height = 13
          Caption = 'OTM_DESC'
          FocusControl = dblkTransType
        end
        object Label5: TLabel
          Tag = 3045
          Left = 624
          Top = 52
          Width = 50
          Height = 13
          Caption = 'DT_DESC'
          FocusControl = dblkDatatype
        end
        object Label6: TLabel
          Tag = 3044
          Left = 624
          Top = 12
          Width = 50
          Height = 13
          Caption = 'OT_DESC'
          FocusControl = dblkType
        end
        object dbName: TDBEdit
          Left = 8
          Top = 28
          Width = 300
          Height = 21
          CharCase = ecUpperCase
          DataField = 'OBJ_NAME'
          DataSource = dtsMaster
          MaxLength = 50
          TabOrder = 0
          OnChange = dbNameChange
        end
        object dbDesc: TDBEdit
          Left = 8
          Top = 68
          Width = 457
          Height = 21
          CharCase = ecUpperCase
          DataField = 'OBJ_DESC'
          DataSource = dtsMaster
          MaxLength = 50
          TabOrder = 3
        end
        object dbFieldName: TDBEdit
          Left = 316
          Top = 28
          Width = 300
          Height = 21
          CharCase = ecUpperCase
          DataField = 'OBJ_FIELDNAME'
          DataSource = dtsMaster
          MaxLength = 50
          TabOrder = 1
        end
        object dblkType: TRxDBLookupCombo
          Left = 624
          Top = 28
          Width = 145
          Height = 21
          DropDownCount = 8
          DataField = 'OT_ID'
          DataSource = dtsMaster
          LookupField = 'OT_ID'
          LookupDisplay = 'OT_DESC'
          LookupSource = dmSys1.dtsObjectTypes
          TabOrder = 2
        end
        object dblkTransType: TRxDBLookupCombo
          Left = 472
          Top = 68
          Width = 145
          Height = 21
          DropDownCount = 8
          DataField = 'OTM_ID'
          DataSource = dtsMaster
          LookupField = 'OTM_ID'
          LookupDisplay = 'OTM_DESC'
          LookupSource = dmSys1.dtsObjectTranslationMT
          TabOrder = 4
        end
        object dblkDatatype: TRxDBLookupCombo
          Left = 624
          Top = 68
          Width = 145
          Height = 21
          DropDownCount = 8
          DataField = 'DT_ID'
          DataSource = dtsMaster
          LookupField = 'DT_ID'
          LookupDisplay = 'DT_DESC'
          LookupSource = dmSys1.dtsDataTypes
          TabOrder = 5
        end
      end
      object pcDetail: TPageControl
        Left = 0
        Top = 102
        Width = 776
        Height = 302
        ActivePage = TabSheet2
        Align = alClient
        TabOrder = 1
        OnChanging = pcDetailChanging
        object TabSheet1: TTabSheet
          Tag = 3049
          Caption = 'OBJECTSxLANGUAGES'
          object cbLanguages: TCoolBar
            Left = 0
            Top = 0
            Width = 27
            Height = 274
            Align = alLeft
            AutoSize = True
            Bands = <
              item
                Control = tbLanguages
                ImageIndex = -1
                MinHeight = 23
                Width = 270
              end>
            Vertical = True
            object tbLanguages: TToolBar
              Left = 0
              Top = 9
              Width = 23
              Height = 261
              Align = alClient
              ButtonHeight = 25
              Images = imglstBase
              TabOrder = 0
              object tbtnNewDetail: TToolButton
                Left = 0
                Top = 2
                Action = actNewLanguage
                ParentShowHint = False
                Wrap = True
                ShowHint = True
              end
              object tbtnEditDetail: TToolButton
                Left = 0
                Top = 27
                Action = actEditLanguage
                ParentShowHint = False
                Wrap = True
                ShowHint = True
              end
              object ToolButton3: TToolButton
                Left = 0
                Top = 52
                Action = actDelLanguage
              end
            end
          end
          object Panel1: TPanel
            Left = 27
            Top = 0
            Width = 741
            Height = 274
            Align = alClient
            BevelInner = bvRaised
            BevelOuter = bvLowered
            TabOrder = 1
            object Label11: TLabel
              Left = 8
              Top = 48
              Width = 77
              Height = 13
              Caption = 'OBJLNG_DESC'
              FocusControl = dbLangDesc
            end
            object Label12: TLabel
              Left = 8
              Top = 88
              Width = 95
              Height = 13
              Caption = 'OBJLNG_CAPTION'
              FocusControl = dbLangCaption
            end
            object Label13: TLabel
              Left = 8
              Top = 128
              Width = 74
              Height = 13
              Caption = 'OBJLNG_HINT'
              FocusControl = dbLangHint
            end
            object Label14: TLabel
              Left = 8
              Top = 8
              Width = 57
              Height = 13
              Caption = 'LNG_DESC'
              FocusControl = dblkLanguage
            end
            object Panel2: TPanel
              Left = 2
              Top = 240
              Width = 737
              Height = 32
              Align = alBottom
              BevelOuter = bvNone
              TabOrder = 4
              object Panel3: TPanel
                Left = 547
                Top = 0
                Width = 190
                Height = 32
                Align = alRight
                BevelOuter = bvNone
                TabOrder = 0
                object BitBtn1: TBitBtn
                  Left = 32
                  Top = 4
                  Width = 75
                  Height = 25
                  Action = actLanguageOk
                  Caption = 'actLanguageOk'
                  Default = True
                  TabOrder = 0
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
                object BitBtn2: TBitBtn
                  Left = 112
                  Top = 4
                  Width = 75
                  Height = 25
                  Action = actLanguageCancel
                  Cancel = True
                  Caption = 'actLanguageCancel'
                  TabOrder = 1
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
            object dblkLanguage: TRxDBLookupCombo
              Left = 8
              Top = 24
              Width = 285
              Height = 21
              DropDownCount = 8
              DataField = 'LNG_ID'
              DataSource = dmSys1.dtsObjectsXLanguages
              LookupField = 'LNG_ID'
              LookupDisplay = 'LNG_DESC'
              LookupSource = dmSys1.dtsLanguages
              TabOrder = 0
            end
            object dbLangDesc: TDBEdit
              Left = 8
              Top = 64
              Width = 724
              Height = 21
              DataField = 'OBJLNG_DESC'
              DataSource = dmSys1.dtsObjectsXLanguages
              TabOrder = 1
              OnChange = dbLangDescChange
            end
            object dbLangCaption: TDBEdit
              Left = 8
              Top = 104
              Width = 724
              Height = 21
              DataField = 'OBJLNG_CAPTION'
              DataSource = dmSys1.dtsObjectsXLanguages
              TabOrder = 2
            end
            object dbLangHint: TDBEdit
              Left = 8
              Top = 144
              Width = 724
              Height = 21
              DataField = 'OBJLNG_HINT'
              DataSource = dmSys1.dtsObjectsXLanguages
              TabOrder = 3
            end
          end
          object grdLanguages: TDBGrid
            Left = 724
            Top = 4
            Width = 37
            Height = 41
            DataSource = dmSys1.dtsObjectsXLanguages
            ReadOnly = True
            TabOrder = 2
            TitleFont.Charset = DEFAULT_CHARSET
            TitleFont.Color = clWindowText
            TitleFont.Height = -11
            TitleFont.Name = 'MS Sans Serif'
            TitleFont.Style = []
            Columns = <
              item
                Expanded = False
                FieldName = 'LNG_DESC'
                Width = 115
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'OBJLNG_DESC'
                Width = 183
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'OBJLNG_CAPTION'
                Width = 171
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'OBJLNG_HINT'
                Width = 195
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'OBJLNG_REGDATE'
                Width = 99
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'OBJLNG_REGUSER'
                Width = 90
                Visible = True
              end>
          end
        end
        object TabSheet2: TTabSheet
          Tag = 3050
          Caption = 'FORMSxOBJECTS'
          ImageIndex = 1
          object cbFroms: TCoolBar
            Left = 0
            Top = 0
            Width = 27
            Height = 274
            Align = alLeft
            AutoSize = True
            Bands = <
              item
                Control = tbForms
                ImageIndex = -1
                MinHeight = 23
                Width = 270
              end>
            Vertical = True
            object tbForms: TToolBar
              Left = 0
              Top = 9
              Width = 23
              Height = 261
              Align = alClient
              ButtonHeight = 25
              Images = imglstBase
              TabOrder = 0
              object ToolButton1: TToolButton
                Left = 0
                Top = 2
                Action = actNewForm
                ParentShowHint = False
                Wrap = True
                ShowHint = True
              end
              object ToolButton2: TToolButton
                Left = 0
                Top = 27
                Action = actEditForm
                ParentShowHint = False
                Wrap = True
                ShowHint = True
              end
            end
          end
          object Panel4: TPanel
            Left = 27
            Top = 0
            Width = 741
            Height = 274
            Align = alClient
            BevelInner = bvRaised
            BevelOuter = bvLowered
            TabOrder = 1
            object Splitter1: TSplitter
              Left = 352
              Top = 2
              Height = 238
              Beveled = True
            end
            object Panel5: TPanel
              Left = 2
              Top = 240
              Width = 737
              Height = 32
              Align = alBottom
              BevelOuter = bvNone
              TabOrder = 0
              object Panel6: TPanel
                Left = 547
                Top = 0
                Width = 190
                Height = 32
                Align = alRight
                BevelOuter = bvNone
                TabOrder = 0
                object BitBtn3: TBitBtn
                  Left = 112
                  Top = 4
                  Width = 75
                  Height = 25
                  Action = actFormOk
                  Caption = 'actFormOk'
                  Default = True
                  TabOrder = 0
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
              end
            end
            object Panel8: TPanel
              Left = 355
              Top = 2
              Width = 34
              Height = 238
              Align = alLeft
              BevelOuter = bvNone
              TabOrder = 1
              object cbForms: TCoolBar
                Left = 4
                Top = 35
                Width = 27
                Height = 134
                Align = alNone
                AutoSize = True
                Bands = <
                  item
                    Control = ToolBar1
                    ImageIndex = -1
                    MinHeight = 23
                    Width = 130
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
                  object btnAddForm: TToolButton
                    Left = 0
                    Top = 2
                    Action = actAddForm
                    Wrap = True
                  end
                  object btnAddAllForms: TToolButton
                    Left = 0
                    Top = 24
                    Action = actAddAllForms
                    Wrap = True
                  end
                  object btnDelForm: TToolButton
                    Left = 0
                    Top = 46
                    Action = actDelForm
                    Wrap = True
                  end
                  object btnDelAllForms: TToolButton
                    Left = 0
                    Top = 68
                    Action = actDelAllForms
                  end
                end
              end
            end
            object Panel9: TPanel
              Left = 2
              Top = 2
              Width = 350
              Height = 238
              Align = alLeft
              BevelOuter = bvLowered
              TabOrder = 2
              object Panel10: TPanel
                Left = 1
                Top = 1
                Width = 348
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
                  Width = 346
                  Height = 13
                  Align = alTop
                  Alignment = taCenter
                  Caption = 'AVAILABLE'
                end
              end
              object lsbFrmDisp: TListBox
                Left = 1
                Top = 19
                Width = 348
                Height = 218
                Align = alClient
                BevelInner = bvNone
                BevelOuter = bvNone
                BorderStyle = bsNone
                DragMode = dmAutomatic
                ItemHeight = 13
                MultiSelect = True
                TabOrder = 1
                OnDragDrop = lsbFrmDispDragDrop
                OnDragOver = lsbFrmDispDragOver
              end
            end
            object Panel11: TPanel
              Left = 389
              Top = 2
              Width = 350
              Height = 238
              Align = alClient
              BevelOuter = bvLowered
              TabOrder = 3
              object Panel12: TPanel
                Left = 1
                Top = 1
                Width = 348
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
                  Width = 346
                  Height = 13
                  Align = alTop
                  Alignment = taCenter
                  Caption = 'SELECTED'
                end
              end
              object lsbFrmSel: TListBox
                Left = 1
                Top = 19
                Width = 348
                Height = 218
                Align = alClient
                BevelInner = bvNone
                BevelOuter = bvNone
                BorderStyle = bsNone
                DragMode = dmAutomatic
                ItemHeight = 13
                MultiSelect = True
                TabOrder = 1
                OnDragDrop = lsbFrmSelDragDrop
                OnDragOver = lsbFrmSelDragOver
              end
            end
          end
          object grdForms: TDBGrid
            Left = 728
            Top = 8
            Width = 36
            Height = 37
            DataSource = dmSys1.dtsFormsXObjects
            ReadOnly = True
            TabOrder = 2
            TitleFont.Charset = DEFAULT_CHARSET
            TitleFont.Color = clWindowText
            TitleFont.Height = -11
            TitleFont.Name = 'MS Sans Serif'
            TitleFont.Style = []
            Columns = <
              item
                Expanded = False
                FieldName = 'FRM_DESC'
                Width = 253
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'FRMOBJ_REGDATE'
                Width = 123
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'FRMOBJ_REGUSER'
                Width = 146
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
    object actNewLanguage: TAction
      Tag = 3058
      Category = 'Languages'
      Caption = 'actNewLanguage'
      ImageIndex = 16
      OnExecute = actNewLanguageExecute
    end
    object actEditLanguage: TAction
      Tag = 3059
      Category = 'Languages'
      Caption = 'actEditLanguage'
      ImageIndex = 10
      OnExecute = actEditLanguageExecute
    end
    object actDelLanguage: TAction
      Tag = 3060
      Category = 'Languages'
      Caption = 'actDelLanguage'
      ImageIndex = 9
      OnExecute = actDelLanguageExecute
    end
    object actLanguageOk: TAction
      Tag = 3061
      Category = 'Languages'
      Caption = 'actLanguageOk'
      ImageIndex = 4
      OnExecute = actLanguageOkExecute
    end
    object actLanguageCancel: TAction
      Tag = 3062
      Category = 'Languages'
      Caption = 'actLanguageCancel'
      ImageIndex = 6
      OnExecute = actLanguageCancelExecute
    end
    object actNewForm: TAction
      Tag = 3067
      Category = 'Forms'
      Caption = 'actNewForm'
      ImageIndex = 16
      OnExecute = actNewFormExecute
    end
    object actEditForm: TAction
      Tag = 3068
      Category = 'Forms'
      Caption = 'actEditForm'
      ImageIndex = 10
      OnExecute = actEditFormExecute
    end
    object actFormOk: TAction
      Tag = 3069
      Category = 'Forms'
      Caption = 'actFormOk'
      ImageIndex = 4
      OnExecute = actFormOkExecute
    end
    object actAddForm: TAction
      Tag = 3070
      Category = 'Forms'
      Caption = 'actAddForm'
      ImageIndex = 22
      OnExecute = actAddFormExecute
    end
    object actAddAllForms: TAction
      Tag = 3071
      Category = 'Forms'
      Caption = 'actAddAllForms'
      ImageIndex = 21
      OnExecute = actAddAllFormsExecute
    end
    object actDelForm: TAction
      Tag = 3072
      Category = 'Forms'
      Caption = 'actDelForm'
      ImageIndex = 24
      OnExecute = actDelFormExecute
    end
    object actDelAllForms: TAction
      Tag = 3073
      Category = 'Forms'
      Caption = 'actDelAllForms'
      ImageIndex = 23
      OnExecute = actDelAllFormsExecute
    end
  end
  inherited dtsMaster: TDataSource
    DataSet = dmSys1.cdsObjects
  end
end
