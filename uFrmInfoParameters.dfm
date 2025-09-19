inherited FrmInfoParameters: TFrmInfoParameters
  Tag = 135
  Caption = 'RDO Informa'#231#245'es de Par'#226'metros'
  PixelsPerInch = 96
  TextHeight = 13
  inherited pcBaseCadastro: TPageControl
    OnChange = pcBaseCadastroChange
    inherited tsBaseCadastroFiltro: TTabSheet
      inherited gbGrid: TGroupBox
        inherited grdResultado: TDBGrid
          DataSource = dtsMaster
          Columns = <
            item
              Expanded = False
              FieldName = 'IP_ID'
              Title.Caption = 'C'#243'digo'
              Width = 50
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'IP_DESC'
              Title.Caption = 'Descri'#231#227'o'
              Width = 200
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'IP_BINID'
              Title.Caption = 'C'#243'digo Bin'#225'rio'
              Width = 80
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'IP_COMMENT'
              Title.Caption = 'Coment'#225'rio'
              Width = 300
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'IP_STATUS'
              Title.Caption = 'Status'
              Width = 40
              Visible = True
            end>
        end
      end
      inherited pnFiltro: TPanel
        inherited pnPesq: TPanel
          inherited gbFiltro: TGroupBox
            object lbl1: TLabel [0]
              Left = 8
              Top = 8
              Width = 33
              Height = 13
              Caption = 'C'#243'digo'
            end
            object lbl2: TLabel [1]
              Left = 95
              Top = 8
              Width = 48
              Height = 13
              Caption = 'Descri'#231#227'o'
            end
            object lbl3: TLabel [2]
              Left = 8
              Top = 46
              Width = 68
              Height = 13
              Caption = 'C'#243'digo Bin'#225'rio'
            end
            object lbl4: TLabel [3]
              Left = 95
              Top = 46
              Width = 53
              Height = 13
              Caption = 'Coment'#225'rio'
            end
            object lbl5: TLabel [4]
              Left = 10
              Top = 82
              Width = 30
              Height = 13
              Caption = 'Status'
            end
            object edtConCodigo: TEdit
              Left = 8
              Top = 24
              Width = 80
              Height = 21
              TabOrder = 1
            end
            object edtConBinary: TEdit
              Left = 8
              Top = 61
              Width = 80
              Height = 21
              TabOrder = 3
            end
            object edtConDescricao: TEdit
              Left = 95
              Top = 24
              Width = 552
              Height = 21
              TabOrder = 2
            end
            object edtConComment: TEdit
              Left = 95
              Top = 61
              Width = 552
              Height = 21
              TabOrder = 4
            end
            object edtConStatus: TEdit
              Left = 8
              Top = 97
              Width = 80
              Height = 21
              TabOrder = 5
            end
          end
        end
      end
    end
    inherited tsBaseCadastroConsulta: TTabSheet
      object gbManutencao: TGroupBox
        Left = 0
        Top = 0
        Width = 660
        Height = 145
        Align = alTop
        TabOrder = 0
        object lbl6: TLabel
          Left = 10
          Top = 9
          Width = 33
          Height = 13
          Caption = 'C'#243'digo'
        end
        object lbl7: TLabel
          Left = 98
          Top = 9
          Width = 48
          Height = 13
          Caption = 'Descri'#231#227'o'
        end
        object lbl8: TLabel
          Left = 10
          Top = 49
          Width = 68
          Height = 13
          Caption = 'C'#243'digo Bin'#225'rio'
        end
        object lbl9: TLabel
          Left = 98
          Top = 49
          Width = 53
          Height = 13
          Caption = 'Coment'#225'rio'
        end
        object lbl10: TLabel
          Left = 10
          Top = 89
          Width = 30
          Height = 13
          Caption = 'Status'
        end
        object dbEdCodigo: TDBEdit
          Left = 8
          Top = 25
          Width = 80
          Height = 21
          DataField = 'IP_ID'
          DataSource = dtsMaster
          TabOrder = 0
        end
        object dbEdCodigoBin: TDBEdit
          Left = 8
          Top = 65
          Width = 80
          Height = 21
          DataField = 'IP_BINID'
          DataSource = dtsMaster
          TabOrder = 2
        end
        object dbEdDesc: TDBEdit
          Left = 96
          Top = 25
          Width = 552
          Height = 21
          DataField = 'IP_DESC'
          DataSource = dtsMaster
          TabOrder = 1
        end
        object dbEdComent: TDBEdit
          Left = 96
          Top = 65
          Width = 552
          Height = 21
          DataField = 'IP_COMMENT'
          DataSource = dtsMaster
          TabOrder = 3
        end
        object cbbStatus: TRxDBComboBox
          Left = 8
          Top = 105
          Width = 80
          Height = 21
          Style = csDropDownList
          DataField = 'IP_STATUS'
          DataSource = dtsMaster
          EnableValues = True
          ItemHeight = 13
          Items.Strings = (
            'Ativo'
            'Inativo')
          TabOrder = 4
          Values.Strings = (
            'A'
            'I')
        end
      end
      object gbGridManutencao: TGroupBox
        Left = 0
        Top = 144
        Width = 660
        Height = 147
        Align = alBottom
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
