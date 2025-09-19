inherited FrmAddressTypes: TFrmAddressTypes
  Tag = 86
  Left = 288
  Top = 306
  Caption = 'Tipos de Endere'#231'os'
  PixelsPerInch = 96
  TextHeight = 13
  inherited pcBaseCadastro: TPageControl
    ActivePage = tsBaseCadastroConsulta
    inherited tsBaseCadastroFiltro: TTabSheet
      inherited gbGrid: TGroupBox
        inherited grdResultado: TDBGrid
          DataSource = dtsMaster
          Columns = <
            item
              Expanded = False
              FieldName = 'AT_SHORTDESC'
              Title.Caption = 'Abrevia'#231#227'o'
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'AT_LONGDESC'
              Title.Caption = 'Tipo de Endere'#231'o'
              Width = 150
              Visible = True
            end>
        end
      end
      inherited pnFiltro: TPanel
        inherited pnPesq: TPanel
          inherited gbFiltro: TGroupBox
            object Label1: TLabel [0]
              Tag = 3127
              Left = 15
              Top = 21
              Width = 54
              Height = 13
              Caption = 'Abrevia'#231#227'o'
              FocusControl = edtShortDesc
            end
            object Label2: TLabel [1]
              Tag = 3126
              Left = 105
              Top = 22
              Width = 48
              Height = 13
              Caption = 'Descri'#231#227'o'
              FocusControl = edtLongDesc
            end
            object edtShortDesc: TEdit
              Left = 13
              Top = 37
              Width = 68
              Height = 21
              CharCase = ecUpperCase
              TabOrder = 1
            end
            object edtLongDesc: TEdit
              Left = 104
              Top = 37
              Width = 249
              Height = 21
              CharCase = ecUpperCase
              TabOrder = 2
            end
          end
        end
      end
    end
    inherited tsBaseCadastroConsulta: TTabSheet
      object Label3: TLabel
        Left = 17
        Top = 24
        Width = 54
        Height = 13
        Caption = 'Abrevia'#231#227'o'
        FocusControl = dbShortDesc
      end
      object Label4: TLabel
        Left = 104
        Top = 25
        Width = 48
        Height = 13
        Caption = 'Descri'#231#227'o'
        FocusControl = dbLongDesc
      end
      object dbShortDesc: TDBEdit
        Left = 16
        Top = 40
        Width = 68
        Height = 21
        CharCase = ecUpperCase
        DataField = 'AT_SHORTDESC'
        DataSource = dtsMaster
        TabOrder = 0
      end
      object dbLongDesc: TDBEdit
        Left = 104
        Top = 40
        Width = 249
        Height = 21
        CharCase = ecUpperCase
        DataField = 'AT_LONGDESC'
        DataSource = dtsMaster
        TabOrder = 1
      end
    end
  end
  inherited actlstBase: TActionList
    inherited actFilter: TAction
      OnExecute = actFilterExecute
    end
  end
end
