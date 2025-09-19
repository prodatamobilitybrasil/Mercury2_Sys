inherited FrmSystemUserGroups: TFrmSystemUserGroups
  Tag = 76
  Left = 129
  Top = 100
  Width = 790
  Height = 586
  Caption = 'Grupos de Usu'#225'rios do Sistema'
  PixelsPerInch = 96
  TextHeight = 13
  inherited cbBase: TCoolBar
    Width = 782
    Bands = <
      item
        Control = tbBase
        ImageIndex = -1
        MinHeight = 24
        Width = 778
      end>
    inherited tbBase: TToolBar
      Width = 765
    end
  end
  inherited pcBaseCadastro: TPageControl
    Width = 782
    Height = 504
    MultiLine = True
    inherited tsBaseCadastroFiltro: TTabSheet
      inherited Splitter_Base1: TSplitter
        Top = 60
        Width = 774
      end
      inherited gbGrid: TGroupBox
        Top = 64
        Width = 774
        Height = 412
        inherited grdResultado: TDBGrid
          Width = 770
          Height = 395
          DataSource = dtsMaster
          Columns = <
            item
              Expanded = False
              FieldName = 'SUG_DESC'
              Title.Caption = 'Descri'#231#227'o'
              Width = 360
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'SUG_REGDATE'
              Title.Caption = 'Registro'
              Width = 132
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'SUG_REGUSER'
              Title.Caption = 'Usu'#225'rio'
              Width = 188
              Visible = True
            end>
        end
      end
      inherited pnFiltro: TPanel
        Width = 774
        Height = 60
        inherited pnPesq: TPanel
          Width = 774
          Height = 60
          inherited gbfiltroavansado: TGroupBox
            Width = 770
            Height = 56
            inherited pnVoltar: TPanel
              Top = 41
              Width = 766
              inherited lblBack: TLabel
                Left = 739
              end
            end
          end
          inherited gbFiltro: TGroupBox
            Width = 770
            Height = 56
            object Label1: TLabel [0]
              Tag = 3018
              Left = 16
              Top = 10
              Width = 48
              Height = 13
              Caption = 'Descri'#231#227'o'
              FocusControl = edDesc
            end
            inherited pnPesquiza: TPanel
              Top = 41
              Width = 766
              inherited lblAdvancedSearch: TLabel
                Width = 766
              end
            end
            object edDesc: TEdit
              Left = 16
              Top = 26
              Width = 360
              Height = 21
              CharCase = ecUpperCase
              MaxLength = 50
              TabOrder = 1
            end
          end
        end
      end
    end
    inherited tsBaseCadastroConsulta: TTabSheet
      object GroupBox1: TGroupBox
        Left = 0
        Top = 0
        Width = 774
        Height = 57
        Align = alTop
        TabOrder = 0
        object Label2: TLabel
          Tag = 3018
          Left = 18
          Top = 12
          Width = 48
          Height = 13
          Caption = 'Descri'#231#227'o'
          FocusControl = edDesc
        end
        object dbDesc: TDBEdit
          Left = 18
          Top = 28
          Width = 360
          Height = 21
          CharCase = ecUpperCase
          DataField = 'SUG_DESC'
          DataSource = dtsMaster
          MaxLength = 50
          TabOrder = 0
        end
      end
      object pcDetail: TPageControl
        Left = 0
        Top = 57
        Width = 774
        Height = 419
        ActivePage = TabSheet1
        Align = alClient
        MultiLine = True
        TabOrder = 1
        object TabSheet1: TTabSheet
          Tag = 3021
          Caption = 'M'#243'dulos'
          object Panel1: TPanel
            Left = 27
            Top = 0
            Width = 739
            Height = 391
            Align = alClient
            BevelOuter = bvNone
            TabOrder = 0
            object GroupBox2: TGroupBox
              Left = 0
              Top = 0
              Width = 739
              Height = 391
              Align = alClient
              TabOrder = 1
              object Panel2: TPanel
                Left = 2
                Top = 361
                Width = 735
                Height = 28
                Align = alBottom
                BevelOuter = bvNone
                TabOrder = 0
                object Panel3: TPanel
                  Left = 574
                  Top = 0
                  Width = 161
                  Height = 28
                  Align = alRight
                  BevelOuter = bvNone
                  TabOrder = 0
                  object BitBtn1: TBitBtn
                    Left = 4
                    Top = 2
                    Width = 75
                    Height = 25
                    Action = actModuleOk
                    Caption = 'Ok'
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
                    Left = 84
                    Top = 2
                    Width = 75
                    Height = 25
                    Action = actModuleCancel
                    Caption = 'Cancelar'
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
              object Panel15: TPanel
                Left = 2
                Top = 15
                Width = 735
                Height = 346
                Align = alClient
                BevelOuter = bvNone
                TabOrder = 1
                object Label3: TLabel
                  Tag = 3021
                  Left = 16
                  Top = 24
                  Width = 32
                  Height = 13
                  Caption = 'Label3'
                end
                object dbLkModulo: TRxDBLookupCombo
                  Left = 16
                  Top = 40
                  Width = 361
                  Height = 21
                  DropDownCount = 8
                  LookupField = 'MOD_ID'
                  LookupDisplay = 'MOD_DESC'
                  LookupSource = dmSys1.dtsModules
                  TabOrder = 0
                end
              end
            end
            object grdModules: TDBGrid
              Left = 0
              Top = 0
              Width = 739
              Height = 391
              Align = alClient
              DataSource = dmSys1.dtsModulesXSystemUserGroups
              ReadOnly = True
              TabOrder = 0
              TitleFont.Charset = DEFAULT_CHARSET
              TitleFont.Color = clWindowText
              TitleFont.Height = -11
              TitleFont.Name = 'MS Sans Serif'
              TitleFont.Style = []
              Columns = <
                item
                  Expanded = False
                  FieldName = 'MOD_DESC'
                  Title.Caption = 'Descri'#231#227'o'
                  Width = 358
                  Visible = True
                end
                item
                  Expanded = False
                  FieldName = 'MODSUG_REGDATE'
                  Title.Caption = 'Registro'
                  Width = 149
                  Visible = True
                end
                item
                  Expanded = False
                  FieldName = 'MODSUG_REGUSER'
                  Title.Caption = 'Usu'#225'rio'
                  Width = 167
                  Visible = True
                end>
            end
          end
          object cbDetail: TCoolBar
            Left = 0
            Top = 0
            Width = 27
            Height = 391
            Align = alLeft
            AutoSize = True
            Bands = <
              item
                Control = tbDetail
                ImageIndex = -1
                MinHeight = 23
                Width = 387
              end>
            Vertical = True
            object tbDetail: TToolBar
              Left = 0
              Top = 9
              Width = 23
              Height = 378
              Align = alClient
              ButtonHeight = 25
              Images = imglstBase
              TabOrder = 0
              object tbtnEditDetail: TToolButton
                Left = 0
                Top = 2
                Action = actNewMod
                ParentShowHint = False
                Wrap = True
                ShowHint = True
              end
              object tbtnNewDetail: TToolButton
                Left = 0
                Top = 27
                Action = actEditMod
                ParentShowHint = False
                Wrap = True
                ShowHint = True
              end
              object ToolButton3: TToolButton
                Left = 0
                Top = 52
                Action = actDeleteMod
              end
            end
          end
        end
        object TabSheet3: TTabSheet
          Tag = 3022
          Caption = 'Privil'#233'gios de Acesso'
          ImageIndex = 1
          object GroupBox3: TGroupBox
            Left = 27
            Top = 0
            Width = 739
            Height = 391
            Align = alClient
            TabOrder = 0
            object Splitter2: TSplitter
              Left = 348
              Top = 15
              Height = 340
              Beveled = True
            end
            object Panel4: TPanel
              Left = 2
              Top = 355
              Width = 735
              Height = 34
              Align = alBottom
              BevelOuter = bvNone
              TabOrder = 0
              object Panel5: TPanel
                Left = 567
                Top = 0
                Width = 168
                Height = 34
                Align = alRight
                BevelOuter = bvNone
                TabOrder = 0
                object BitBtn3: TBitBtn
                  Left = 88
                  Top = 6
                  Width = 75
                  Height = 25
                  Action = actRoleOk
                  Caption = 'Ok'
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
            object Panel6: TPanel
              Left = 730
              Top = 15
              Width = 7
              Height = 340
              Align = alRight
              BevelOuter = bvNone
              TabOrder = 1
            end
            object Panel7: TPanel
              Left = 2
              Top = 15
              Width = 7
              Height = 340
              Align = alLeft
              BevelOuter = bvNone
              TabOrder = 2
            end
            object Panel8: TPanel
              Left = 351
              Top = 15
              Width = 34
              Height = 340
              Align = alLeft
              BevelOuter = bvNone
              TabOrder = 3
              object cbForms: TCoolBar
                Left = 4
                Top = 56
                Width = 27
                Height = 109
                Align = alNone
                AutoSize = True
                Bands = <
                  item
                    Control = tbForms
                    ImageIndex = -1
                    MinHeight = 23
                    Width = 105
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
                  object btnAddRole: TToolButton
                    Left = 0
                    Top = 2
                    Action = actRolesAdd
                    Wrap = True
                  end
                  object btnAddAllRoles: TToolButton
                    Left = 0
                    Top = 24
                    Action = actRolesAddAll
                    Wrap = True
                  end
                  object btnDelRole: TToolButton
                    Left = 0
                    Top = 46
                    Action = actRolesDel
                    Wrap = True
                  end
                  object btnDelAllRoles: TToolButton
                    Left = 0
                    Top = 68
                    Action = actRolesDelAll
                  end
                end
              end
            end
            object Panel9: TPanel
              Left = 9
              Top = 15
              Width = 339
              Height = 340
              Align = alLeft
              BevelOuter = bvLowered
              TabOrder = 4
              object Panel10: TPanel
                Left = 1
                Top = 1
                Width = 337
                Height = 18
                Align = alTop
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clWindowText
                Font.Height = -11
                Font.Name = 'MS Sans Serif'
                Font.Style = [fsBold]
                ParentFont = False
                TabOrder = 0
                object Label5: TLabel
                  Tag = 3027
                  Left = 1
                  Top = 1
                  Width = 335
                  Height = 13
                  Align = alTop
                  Caption = 'Dispon'#237'veis'
                end
              end
              object lsbRoleDisp: TListBox
                Left = 1
                Top = 19
                Width = 337
                Height = 320
                Align = alClient
                BevelInner = bvNone
                BevelOuter = bvNone
                BorderStyle = bsNone
                DragMode = dmAutomatic
                ItemHeight = 13
                MultiSelect = True
                TabOrder = 1
                OnDragDrop = lsbRoleDispDragDrop
                OnDragOver = lsbRoleDispDragOver
              end
            end
            object Panel11: TPanel
              Left = 385
              Top = 15
              Width = 345
              Height = 340
              Align = alClient
              BevelOuter = bvLowered
              TabOrder = 5
              object Panel12: TPanel
                Left = 1
                Top = 1
                Width = 343
                Height = 18
                Align = alTop
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clWindowText
                Font.Height = -11
                Font.Name = 'MS Sans Serif'
                Font.Style = [fsBold]
                ParentFont = False
                TabOrder = 0
                object Label6: TLabel
                  Tag = 3028
                  Left = 1
                  Top = 1
                  Width = 341
                  Height = 13
                  Align = alTop
                  Caption = 'Selecionados'
                end
              end
              object lsbRoleSel: TListBox
                Left = 1
                Top = 19
                Width = 343
                Height = 320
                Align = alClient
                BevelInner = bvNone
                BevelOuter = bvNone
                BorderStyle = bsNone
                DragMode = dmAutomatic
                ItemHeight = 13
                MultiSelect = True
                TabOrder = 1
                OnDragDrop = lsbRoleSelDragDrop
                OnDragOver = lsbRoleSelDragOver
              end
            end
          end
          object pnlRoles: TPanel
            Left = 455
            Top = 42
            Width = 186
            Height = 153
            BevelOuter = bvNone
            TabOrder = 1
            object DBGrid1: TDBGrid
              Left = 0
              Top = 0
              Width = 186
              Height = 153
              Align = alClient
              DataSource = dmSys1.dtsSystemUserGroupsXSystemRoles
              ReadOnly = True
              TabOrder = 0
              TitleFont.Charset = DEFAULT_CHARSET
              TitleFont.Color = clWindowText
              TitleFont.Height = -11
              TitleFont.Name = 'MS Sans Serif'
              TitleFont.Style = []
              Columns = <
                item
                  Expanded = False
                  FieldName = 'SR_DESC'
                  Title.Caption = 'Descri'#231#227'o'
                  Width = 330
                  Visible = True
                end
                item
                  Expanded = False
                  FieldName = 'SUGSR_REGDATE'
                  Title.Caption = 'Registro'
                  Width = 168
                  Visible = True
                end
                item
                  Expanded = False
                  FieldName = 'SUGSR_REGUSER'
                  Title.Caption = 'Usu'#225'rio'
                  Width = 162
                  Visible = True
                end>
            end
          end
          object CoolBar1: TCoolBar
            Left = 0
            Top = 0
            Width = 27
            Height = 391
            Align = alLeft
            AutoSize = True
            Bands = <
              item
                Control = ToolBar1
                ImageIndex = -1
                MinHeight = 23
                Width = 387
              end>
            Vertical = True
            object ToolBar1: TToolBar
              Left = 0
              Top = 9
              Width = 23
              Height = 378
              Align = alClient
              ButtonHeight = 25
              Images = imglstBase
              TabOrder = 0
              object ToolButton1: TToolButton
                Left = 0
                Top = 2
                Action = actNewRole
                ParentShowHint = False
                Wrap = True
                ShowHint = True
              end
              object ToolButton2: TToolButton
                Left = 0
                Top = 27
                Action = actEditRole
                ParentShowHint = False
                Wrap = True
                ShowHint = True
              end
            end
          end
        end
      end
    end
  end
  inherited actlstBase: TActionList
    inherited actFilter: TAction
      OnExecute = actFilterExecute
    end
    object actDeleteMod: TAction
      Tag = 2992
      Category = 'Modules'
      Caption = 'actDeleteDetail'
      Enabled = False
      ImageIndex = 9
      OnExecute = actDeleteModExecute
    end
    object actDeleteRole: TAction
      Tag = 2993
      Category = 'Roles'
      Caption = 'actDeleteDetail'
      Enabled = False
      ImageIndex = 9
    end
    object actEditMod: TAction
      Tag = 2994
      Category = 'Modules'
      Caption = 'actEditDetail'
      Enabled = False
      ImageIndex = 10
      OnExecute = actEditModExecute
    end
    object actEditRole: TAction
      Tag = 2995
      Category = 'Roles'
      Caption = 'actEditDetail'
      Enabled = False
      ImageIndex = 10
      OnExecute = actEditRoleExecute
    end
    object actModuleCancel: TAction
      Tag = 2996
      Category = 'Modules'
      Caption = 'Cancelar'
      ImageIndex = 6
      OnExecute = actModuleCancelExecute
    end
    object actModuleOk: TAction
      Tag = 2997
      Category = 'Modules'
      Caption = 'Ok'
      ImageIndex = 4
      OnExecute = actModuleOkExecute
    end
    object actNewMod: TAction
      Tag = 2998
      Category = 'Modules'
      Caption = 'actNewDetail'
      Enabled = False
      ImageIndex = 16
      OnExecute = actNewModExecute
    end
    object actNewRole: TAction
      Tag = 2999
      Category = 'Roles'
      Caption = 'actNewDetail'
      Enabled = False
      ImageIndex = 16
      OnExecute = actNewRoleExecute
    end
    object actRolesAdd: TAction
      Tag = 3000
      Category = 'Roles'
      Caption = 'actObjectsAdd'
      ImageIndex = 22
      OnExecute = actRolesAddExecute
    end
    object actRolesAddAll: TAction
      Tag = 3001
      Category = 'Roles'
      Caption = 'actObjectsAddAll'
      ImageIndex = 21
      OnExecute = actRolesAddAllExecute
    end
    object actRolesDel: TAction
      Tag = 3002
      Category = 'Roles'
      Caption = 'actObjectsDel'
      ImageIndex = 24
      OnExecute = actRolesDelExecute
    end
    object actRolesDelAll: TAction
      Tag = 3003
      Category = 'Roles'
      Caption = 'actObjectsDelAll'
      ImageIndex = 23
      OnExecute = actRolesDelAllExecute
    end
    object actRoleOk: TAction
      Tag = 3004
      Category = 'Roles'
      Caption = 'Ok'
      ImageIndex = 4
      OnExecute = actRoleOkExecute
    end
    object actRoleCancel: TAction
      Tag = 3005
      Category = 'Roles'
      Caption = 'Cancelar'
      ImageIndex = 6
    end
  end
  inherited dtsMaster: TDataSource
    DataSet = dmSys1.cdsSystemUserGroups
  end
end
