inherited frmCadProduto: TfrmCadProduto
  Caption = 'Cadastro de Produto'
  StyleElements = [seFont, seClient, seBorder]
  TextHeight = 15
  inherited pnButtons: TPanel
    StyleElements = [seFont, seClient, seBorder]
    ExplicitTop = 615
    ExplicitWidth = 989
    inherited dbnNavigator: TDBNavigator
      Hints.Strings = ()
      StyleElements = [seFont, seClient, seBorder]
    end
    inherited btnFechar: TBitBtn
      ExplicitLeft = 898
    end
  end
  inherited pgcPrincipal: TPageControl
    ActivePage = tabManutencao
    ExplicitLeft = 0
    ExplicitTop = 0
    ExplicitWidth = 989
    ExplicitHeight = 615
    inherited tabListagem: TTabSheet
      inherited pnlListagemTopo: TPanel
        StyleElements = [seFont, seClient, seBorder]
        inherited lblIndice: TLabel
          StyleElements = [seFont, seClient, seBorder]
        end
        inherited mskPesquisar: TMaskEdit
          StyleElements = [seFont, seClient, seBorder]
        end
      end
      inherited grdListagem: TDBGrid
        Columns = <
          item
            Expanded = False
            FieldName = 'ID'
            Title.Caption = 'C'#243'digo'
            Width = 60
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'NOME'
            Title.Caption = 'Nome'
            Width = 500
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'VALOR'
            Title.Caption = 'Valor'
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'QUANTIDADE'
            Title.Caption = 'Quantidade'
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'DESCRICAO_CATEGORIA'
            Title.Caption = 'Descri'#231#227'o Categoria'
            Width = 200
            Visible = True
          end>
      end
    end
    inherited tabManutencao: TTabSheet
      object lbDescricao: TLabel
        Left = 16
        Top = 115
        Width = 51
        Height = 15
        Caption = 'Descri'#231#227'o'
      end
      object lbValor: TLabel
        Left = 16
        Top = 235
        Width = 26
        Height = 15
        Caption = 'Valor'
      end
      object lbQuantidade: TLabel
        Left = 143
        Top = 235
        Width = 62
        Height = 15
        Caption = 'Quantidade'
      end
      object lbCategoria: TLabel
        Left = 452
        Top = 59
        Width = 51
        Height = 15
        Caption = 'Categoria'
      end
      object edtID: TLabeledEdit
        Tag = 1
        Left = 16
        Top = 32
        Width = 121
        Height = 23
        EditLabel.Width = 39
        EditLabel.Height = 15
        EditLabel.Caption = 'C'#243'digo'
        MaxLength = 10
        NumbersOnly = True
        ReadOnly = True
        TabOrder = 0
        Text = ''
      end
      object edtCategoriaDescricao: TLabeledEdit
        Tag = 2
        Left = 16
        Top = 80
        Width = 430
        Height = 23
        EditLabel.Width = 33
        EditLabel.Height = 15
        EditLabel.Caption = 'Nome'
        TabOrder = 1
        Text = ''
      end
      object edtDescricao: TMemo
        Tag = 2
        Left = 16
        Top = 136
        Width = 585
        Height = 89
        Lines.Strings = (
          'edtDescricao')
        MaxLength = 255
        TabOrder = 3
      end
      object edtValor: TCurrencyEdit
        Left = 16
        Top = 256
        Width = 121
        Height = 23
        TabOrder = 4
      end
      object edtQuantidade: TCurrencyEdit
        Left = 143
        Top = 256
        Width = 121
        Height = 23
        DisplayFormat = ' ,0.00;- ,0.00'
        TabOrder = 5
      end
      object lkpCategoria: TDBLookupComboBox
        Left = 452
        Top = 80
        Width = 149
        Height = 23
        KeyField = 'ID'
        ListField = 'DESCRICAO'
        ListSource = dtsCategoria
        TabOrder = 2
      end
    end
  end
  inherited qryListagem: TFDQuery
    Active = True
    SQL.Strings = (
      'SELECT '
      'P.ID, '
      'P.NOME, '
      'P.DESCRICAO, '
      'P.VALOR,'
      'P.QUANTIDADE,'
      'P.CATEGORIA_ID,'
      'C.DESCRICAO AS DESCRICAO_CATEGORIA'
      'FROM PRODUTOS AS P'
      'LEFT JOIN CATEGORIAS AS C'
      'ON C.ID = P.CATEGORIA_ID')
  end
  object qryCategoria: TFDQuery
    Active = True
    Connection = dtmConexao.ConexaoDB
    SQL.Strings = (
      'SELECT ID, DESCRICAO'
      'FROM CATEGORIAS;')
    Left = 644
    Top = 130
    object qryCategoriaID: TLargeintField
      FieldName = 'ID'
      Origin = 'ID'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object qryCategoriaDESCRICAO: TStringField
      FieldName = 'DESCRICAO'
      Origin = 'DESCRICAO'
      Size = 100
    end
  end
  object dtsCategoria: TDataSource
    DataSet = qryCategoria
    Left = 740
    Top = 130
  end
end
