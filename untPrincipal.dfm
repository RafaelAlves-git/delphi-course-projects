object frmPrincipal: TfrmPrincipal
  Left = 0
  Top = 0
  BorderStyle = bsSingle
  Caption = 'Projeto Vendas'
  ClientHeight = 534
  ClientWidth = 873
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -12
  Font.Name = 'Segoe UI'
  Font.Style = []
  Menu = MenuPrincipal
  OnClose = FormClose
  OnCreate = FormCreate
  TextHeight = 15
  object pnBot: TPanel
    Left = 0
    Top = 493
    Width = 873
    Height = 41
    Align = alBottom
    BevelOuter = bvNone
    Caption = 'Rafael Alves'
    Color = 3355443
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWhite
    Font.Height = -12
    Font.Name = 'Segoe UI'
    Font.Style = [fsBold]
    ParentBackground = False
    ParentFont = False
    TabOrder = 0
    ExplicitTop = 485
    ExplicitWidth = 871
  end
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 873
    Height = 493
    Align = alClient
    BevelOuter = bvNone
    Color = 3816514
    ParentBackground = False
    TabOrder = 1
    ExplicitWidth = 871
    ExplicitHeight = 485
  end
  object MenuPrincipal: TMainMenu
    Left = 648
    Top = 16
    object Cadastro1: TMenuItem
      Caption = 'Cadastro'
      object Cliente: TMenuItem
        Caption = 'Cliente'
        OnClick = ClienteClick
      end
      object Categoria: TMenuItem
        Caption = 'Categoria'
        OnClick = CategoriaClick
      end
      object Produtos: TMenuItem
        Caption = 'Produtos'
        OnClick = ProdutosClick
      end
    end
    object Movimentao1: TMenuItem
      Caption = 'Movimenta'#231#227'o'
      object Vendas: TMenuItem
        Caption = 'Vendas'
      end
    end
    object Relatrios1: TMenuItem
      Caption = 'Relat'#243'rios'
      object RelatorioCliente: TMenuItem
        Caption = 'Cliente'
      end
      object RelatorioProduto: TMenuItem
        Caption = 'Produto'
      end
      object RelatorioVendas: TMenuItem
        Caption = 'Vendas'
      end
    end
    object Sair1: TMenuItem
      Caption = 'Sair'
      OnClick = Sair1Click
    end
  end
end
