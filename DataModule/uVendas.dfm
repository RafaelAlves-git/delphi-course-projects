object dmVendas: TdmVendas
  OnCreate = DataModuleCreate
  OnDestroy = DataModuleDestroy
  Height = 303
  Width = 637
  PixelsPerInch = 120
  object qryCliente: TFDQuery
    Connection = dtmConexao.ConexaoDB
    SQL.Strings = (
      'SELECT ID, NOME'
      'FROM CLIENTES;')
    Left = 54
    Top = 40
    object qryClienteID: TIntegerField
      FieldName = 'ID'
      Origin = 'ID'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object qryClienteNOME: TStringField
      FieldName = 'NOME'
      Origin = 'NOME'
      Size = 100
    end
  end
  object qryProdutos: TFDQuery
    Connection = dtmConexao.ConexaoDB
    SQL.Strings = (
      'SELECT ID, NOME, VALOR, QUANTIDADE'
      'FROM PRODUTOS;')
    Left = 54
    Top = 120
    object IntegerField1: TIntegerField
      DisplayLabel = 'C'#243'digo'
      FieldName = 'ID'
      Origin = 'ID'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object StringField1: TStringField
      DisplayLabel = 'Nome'
      FieldName = 'NOME'
      Origin = 'NOME'
      Size = 100
    end
    object qryProdutosVALOR: TFMTBCDField
      DisplayLabel = 'Valor'
      FieldName = 'VALOR'
      Origin = 'VALOR'
      Precision = 18
      Size = 2
    end
    object qryProdutosQUANTIDADE: TFMTBCDField
      DisplayLabel = 'Quantidade'
      FieldName = 'QUANTIDADE'
      Origin = 'QUANTIDADE'
      Precision = 18
      Size = 2
    end
  end
  object cdsItensVenda: TClientDataSet
    Aggregates = <>
    Params = <>
    Left = 56
    Top = 200
    object cdsItensVendaProdutoID: TIntegerField
      FieldName = 'ProdutoID'
    end
    object cdsItensVendaNomeProduto: TStringField
      FieldName = 'NomeProduto'
      Size = 100
    end
    object cdsItensVendaQuantidade: TFloatField
      FieldName = 'Quantidade'
    end
    object cdsItensVendaValorUnitario: TFloatField
      FieldName = 'ValorUnitario'
    end
    object cdsItensVendaValorTotalProdutos: TFloatField
      FieldName = 'ValorTotalProduto'
    end
    object cdsItensVendaValorTotalVenda: TAggregateField
      FieldName = 'ValorTotalVenda'
      DisplayName = ''
      Expression = 'SUM(ValorTotalProduto)'
    end
  end
  object dsCliente: TDataSource
    DataSet = qryCliente
    Left = 176
    Top = 40
  end
  object dsProdutos: TDataSource
    DataSet = qryProdutos
    Left = 176
    Top = 120
  end
  object dsItensVenda: TDataSource
    DataSet = cdsItensVenda
    Left = 176
    Top = 200
  end
end
