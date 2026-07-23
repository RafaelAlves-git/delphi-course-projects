object Form1: TForm1
  Left = 0
  Top = 0
  Caption = 'Projeto Vendas'
  ClientHeight = 441
  ClientWidth = 624
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -12
  Font.Name = 'Segoe UI'
  Font.Style = []
  Menu = MenuPrincipal
  TextHeight = 15
  object MenuPrincipal: TMainMenu
    Left = 552
    Top = 216
    object Cadastro1: TMenuItem
      Caption = 'Cadastro'
      object Cliente1: TMenuItem
        Caption = 'Cliente'
      end
      object Cliente2: TMenuItem
        Caption = 'Categoria'
      end
      object Produtos1: TMenuItem
        Caption = 'Produtos'
      end
    end
    object Movimentao1: TMenuItem
      Caption = 'Movimenta'#231#227'o'
      object Vendas1: TMenuItem
        Caption = 'Vendas'
      end
    end
    object Relatrios1: TMenuItem
      Caption = 'Relat'#243'rios'
      object Cliente3: TMenuItem
        Caption = 'Cliente'
      end
      object Produto1: TMenuItem
        Caption = 'Produto'
      end
      object Vendas2: TMenuItem
        Caption = 'Vendas'
      end
    end
    object Sair1: TMenuItem
      Caption = 'Sair'
      OnClick = Sair1Click
    end
  end
end
