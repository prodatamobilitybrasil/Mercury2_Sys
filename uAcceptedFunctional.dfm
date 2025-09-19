inherited FrmAcceptedFunctional: TFrmAcceptedFunctional
  Width = 630
  Height = 464
  Caption = 'AcceptedFunctional'
  PixelsPerInch = 96
  TextHeight = 13
  inherited cbBase: TCoolBar
    Width = 622
    Bands = <
      item
        Control = tbBase
        ImageIndex = -1
        MinHeight = 24
        Width = 618
      end>
    inherited tbBase: TToolBar
      Width = 605
    end
  end
  inherited pcBaseCadastro: TPageControl
    Width = 622
    Height = 402
    ActivePage = tsBaseCadastroConsulta
    inherited tsBaseCadastroFiltro: TTabSheet
      inherited Splitter_Base1: TSplitter
        Width = 614
      end
      inherited gbGrid: TGroupBox
        Width = 614
        Height = 242
        inherited grdResultado: TDBGrid
          Width = 610
          Height = 225
        end
      end
      inherited pnFiltro: TPanel
        Width = 614
        inherited pnPesq: TPanel
          Width = 614
          inherited gbfiltroavansado: TGroupBox
            Width = 610
            inherited pnVoltar: TPanel
              Width = 606
              inherited lblBack: TLabel
                Left = 579
              end
            end
          end
          inherited gbFiltro: TGroupBox
            Width = 610
            inherited pnPesquiza: TPanel
              Width = 606
              inherited lblAdvancedSearch: TLabel
                Width = 606
              end
            end
          end
        end
      end
    end
  end
end
