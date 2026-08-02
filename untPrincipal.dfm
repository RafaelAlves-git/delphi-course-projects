object frmPrincipal: TfrmPrincipal
  Left = 0
  Top = 0
  BorderStyle = bsSingle
  Caption = 'Projeto Vendas'
  ClientHeight = 524
  ClientWidth = 739
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
    Top = 483
    Width = 739
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
    ExplicitTop = 480
    ExplicitWidth = 737
  end
  object MenuPrincipal: TMainMenu
    Left = 648
    Top = 16
    object Cadastro1: TMenuItem
      Caption = 'Cadastro'
      object Cliente1: TMenuItem
        Caption = 'Cliente'
      end
      object Cliente2: TMenuItem
        Caption = 'Categoria'
        OnClick = Cliente2Click
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
