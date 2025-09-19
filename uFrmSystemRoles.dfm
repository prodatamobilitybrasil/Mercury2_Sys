inherited FrmSystemRoles: TFrmSystemRoles
  Tag = 75
  Left = 217
  Top = 125
  Width = 793
  Height = 586
  Caption = 'Privil'#233'gios de Acesso'
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
    Height = 504
    inherited tsBaseCadastroFiltro: TTabSheet
      inherited Splitter_Base1: TSplitter
        Top = 81
        Width = 777
      end
      inherited gbGrid: TGroupBox
        Top = 85
        Width = 777
        Height = 391
        inherited grdResultado: TDBGrid
          Width = 773
          Height = 374
          DataSource = dtsMaster
          Columns = <
            item
              Expanded = False
              FieldName = 'SR_DESC'
              Title.Caption = 'Descri'#231#227'o'
              Width = 360
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'SR_REGDATE'
              Title.Caption = 'Registro'
              Width = 122
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'SR_REGUSER'
              Title.Caption = 'Usu'#225'rio'
              Width = 178
              Visible = True
            end>
        end
      end
      inherited pnFiltro: TPanel
        Width = 777
        Height = 81
        inherited pnPesq: TPanel
          Width = 777
          Height = 81
          inherited gbfiltroavansado: TGroupBox
            Width = 773
            Height = 77
            inherited pnVoltar: TPanel
              Top = 62
              Width = 769
              inherited lblBack: TLabel
                Left = 742
              end
            end
          end
          inherited gbFiltro: TGroupBox
            Width = 773
            Height = 77
            object Label1: TLabel [0]
              Tag = 3008
              Left = 12
              Top = 16
              Width = 48
              Height = 13
              Caption = 'Descri'#231#227'o'
              FocusControl = edDesc
            end
            inherited pnPesquiza: TPanel
              Top = 62
              Width = 769
              inherited lblAdvancedSearch: TLabel
                Width = 769
              end
            end
            object edDesc: TEdit
              Left = 12
              Top = 32
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
        Width = 777
        Height = 80
        Align = alTop
        TabOrder = 0
        object Label2: TLabel
          Tag = 3008
          Left = 14
          Top = 18
          Width = 48
          Height = 13
          Caption = 'Descri'#231#227'o'
          FocusControl = dbDesc
        end
        object dbDesc: TDBEdit
          Left = 14
          Top = 34
          Width = 360
          Height = 21
          CharCase = ecUpperCase
          DataField = 'SR_DESC'
          DataSource = dtsMaster
          MaxLength = 50
          TabOrder = 0
        end
      end
      object pcDetail: TPageControl
        Left = 27
        Top = 80
        Width = 750
        Height = 396
        ActivePage = TabSheet1
        Align = alClient
        TabOrder = 1
        object TabSheet1: TTabSheet
          Tag = 3011
          Caption = 'Objetos'
          object GroupBox3: TGroupBox
            Left = 0
            Top = 49
            Width = 742
            Height = 319
            Align = alClient
            TabOrder = 2
            object Splitter1: TSplitter
              Left = 383
              Top = 15
              Height = 268
              Beveled = True
            end
            object Panel1: TPanel
              Left = 2
              Top = 283
              Width = 738
              Height = 34
              Align = alBottom
              BevelOuter = bvNone
              TabOrder = 0
              object Panel2: TPanel
                Left = 570
                Top = 0
                Width = 168
                Height = 34
                Align = alRight
                BevelOuter = bvNone
                TabOrder = 0
                object BitBtn1: TBitBtn
                  Left = 85
                  Top = 6
                  Width = 75
                  Height = 25
                  Action = actObjOk
                  Caption = 'Ok'
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
            object Panel3: TPanel
              Left = 732
              Top = 15
              Width = 8
              Height = 268
              Align = alRight
              BevelOuter = bvNone
              TabOrder = 1
            end
            object Panel4: TPanel
              Left = 2
              Top = 15
              Width = 8
              Height = 268
              Align = alLeft
              BevelOuter = bvNone
              TabOrder = 2
            end
            object Panel5: TPanel
              Left = 349
              Top = 15
              Width = 34
              Height = 268
              Align = alLeft
              BevelOuter = bvNone
              TabOrder = 3
              object cbForms: TCoolBar
                Left = 4
                Top = 64
                Width = 27
                Height = 113
                Align = alNone
                AutoSize = True
                Bands = <
                  item
                    Control = tbForms
                    ImageIndex = -1
                    MinHeight = 23
                    Width = 109
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
                    Action = actAddObject
                    Wrap = True
                  end
                  object btnAddAllForms: TToolButton
                    Left = 0
                    Top = 24
                    Action = actAddAllObjects
                    Wrap = True
                  end
                  object btnDelAllForms: TToolButton
                    Left = 0
                    Top = 46
                    Action = actDelAllObjects
                    Wrap = True
                  end
                  object btnDelForm: TToolButton
                    Left = 0
                    Top = 68
                    Action = actDelObject
                  end
                end
              end
            end
            object Panel6: TPanel
              Left = 10
              Top = 15
              Width = 339
              Height = 268
              Align = alLeft
              BevelOuter = bvLowered
              TabOrder = 4
              object Panel8: TPanel
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
                object Label4: TLabel
                  Tag = 3013
                  Left = 1
                  Top = 1
                  Width = 335
                  Height = 13
                  Align = alTop
                  Alignment = taCenter
                  Caption = 'Dispon'#237'veis'
                end
              end
              object lsbObjDisp: TListBox
                Left = 1
                Top = 19
                Width = 337
                Height = 248
                Align = alClient
                BevelInner = bvNone
                BevelOuter = bvNone
                BorderStyle = bsNone
                DragMode = dmAutomatic
                ItemHeight = 13
                MultiSelect = True
                TabOrder = 1
                OnDragDrop = lsbObjDispDragDrop
                OnDragOver = lsbObjDispDragOver
              end
            end
            object Panel7: TPanel
              Left = 386
              Top = 15
              Width = 346
              Height = 268
              Align = alClient
              BevelOuter = bvLowered
              TabOrder = 5
              object Panel9: TPanel
                Left = 1
                Top = 1
                Width = 344
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
                  Tag = 3014
                  Left = 1
                  Top = 1
                  Width = 342
                  Height = 13
                  Align = alTop
                  Alignment = taCenter
                  Caption = 'Selecionados'
                end
              end
              object lsbObjSel: TListBox
                Left = 1
                Top = 19
                Width = 344
                Height = 248
                Align = alClient
                BevelInner = bvNone
                BevelOuter = bvNone
                BorderStyle = bsNone
                DragMode = dmAutomatic
                ItemHeight = 13
                MultiSelect = True
                TabOrder = 1
                OnDragDrop = lsbObjSelDragDrop
                OnDragOver = lsbObjSelDragOver
              end
            end
          end
          object grbChooseForm: TGroupBox
            Left = 0
            Top = 0
            Width = 742
            Height = 49
            Align = alTop
            TabOrder = 0
            object Label3: TLabel
              Tag = 3012
              Left = 16
              Top = 20
              Width = 51
              Height = 13
              Caption = 'Formul'#225'rio:'
              FocusControl = dbLkpForm
            end
            object dbLkpForm: TRxDBLookupCombo
              Left = 76
              Top = 16
              Width = 349
              Height = 21
              DropDownCount = 8
              LookupField = 'FRM_ID'
              LookupDisplay = 'FRM_DESC'
              LookupSource = dmSys1.dtsForms
              TabOrder = 0
              OnChange = dbLkpFormChange
            end
          end
          object grdObjects: TDBGrid
            Left = 0
            Top = 49
            Width = 742
            Height = 319
            Align = alClient
            DataSource = dmSys1.dtsFormObjectsXSystemRoles
            TabOrder = 1
            TitleFont.Charset = DEFAULT_CHARSET
            TitleFont.Color = clWindowText
            TitleFont.Height = -11
            TitleFont.Name = 'MS Sans Serif'
            TitleFont.Style = []
            Columns = <
              item
                Expanded = False
                FieldName = 'OBJLNG_DESC'
                Title.Caption = 'Descri'#231#227'o'
                Width = 341
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'OBJ_NAME'
                Title.Caption = 'Objeto'
                Width = 140
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'OT_DESC'
                Title.Caption = 'Tipo'
                Width = 149
                Visible = True
              end>
          end
        end
      end
      object cbDetail: TCoolBar
        Left = 0
        Top = 80
        Width = 27
        Height = 396
        Align = alLeft
        AutoSize = True
        Bands = <
          item
            Control = tbDetail
            ImageIndex = -1
            MinHeight = 23
            Width = 392
          end>
        Vertical = True
        object tbDetail: TToolBar
          Left = 0
          Top = 9
          Width = 23
          Height = 383
          Align = alClient
          ButtonHeight = 25
          Images = imglstBase
          TabOrder = 0
          object tbtnEditDetail: TToolButton
            Left = 0
            Top = 2
            Action = actNewDetail
            ParentShowHint = False
            Wrap = True
            ShowHint = True
          end
          object tbtnNewDetail: TToolButton
            Left = 0
            Top = 27
            Action = acteditDetail
            ParentShowHint = False
            Wrap = True
            ShowHint = True
          end
        end
      end
    end
  end
  inherited actlstBase: TActionList
    inherited actFilter: TAction
      OnExecute = actFilterExecute
    end
    object actObjOk: TAction
      Tag = 2984
      Category = 'Objects'
      Caption = 'Ok'
      ImageIndex = 4
      OnExecute = actObjOkExecute
    end
    object actObjCancel: TAction
      Tag = 2985
      Category = 'Objects'
      Caption = 'Cancelar'
      ImageIndex = 6
      OnExecute = actObjCancelExecute
    end
    object actNewDetail: TAction
      Tag = 2986
      Category = 'Detail'
      Caption = 'Novo'
      Enabled = False
      Hint = 'Novo'
      ImageIndex = 16
      OnExecute = actNewDetailExecute
    end
    object acteditDetail: TAction
      Tag = 2987
      Category = 'Detail'
      Caption = 'Editar'
      Enabled = False
      ImageIndex = 10
      OnExecute = acteditDetailExecute
    end
    object actAddObject: TAction
      Tag = 2988
      Category = 'Objects'
      ImageIndex = 22
      OnExecute = actAddObjectExecute
    end
    object actDelObject: TAction
      Tag = 2989
      Category = 'Objects'
      ImageIndex = 24
      OnExecute = actDelObjectExecute
    end
    object actAddAllObjects: TAction
      Tag = 2990
      Category = 'Objects'
      Caption = 'actAddAllObjects'
      ImageIndex = 21
      OnExecute = actAddAllObjectsExecute
    end
    object actDelAllObjects: TAction
      Tag = 2991
      Category = 'Objects'
      Caption = 'actDelAllObjects'
      ImageIndex = 23
      OnExecute = actDelAllObjectsExecute
    end
  end
  inherited dtsMaster: TDataSource
    DataSet = dmSys1.cdsSystemRoles
  end
end
