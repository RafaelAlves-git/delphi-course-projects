inherited frmProVenda: TfrmProVenda
  Caption = 'Vendas'
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
    inherited btnGravar: TBitBtn
      ExplicitLeft = 271
    end
  end
  inherited pgcPrincipal: TPageControl
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
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'DATA_VENDA'
            Width = 115
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'CLIENTE_ID'
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'NOME'
            Width = 300
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'VALOR_TOTAL'
            Width = 100
            Visible = True
          end>
      end
    end
    inherited tabManutencao: TTabSheet
      object lbCliente: TLabel
        Left = 143
        Top = 11
        Width = 37
        Height = 15
        Caption = 'Cliente'
      end
      object lbDataVenda: TLabel
        Left = 382
        Top = 11
        Width = 59
        Height = 15
        Caption = 'Data Venda'
      end
      object edtVendaID: TLabeledEdit
        Tag = 1
        Left = 16
        Top = 32
        Width = 121
        Height = 23
        EditLabel.Width = 74
        EditLabel.Height = 15
        EditLabel.Caption = 'C'#243'digo Venda'
        MaxLength = 10
        NumbersOnly = True
        ReadOnly = True
        TabOrder = 0
        Text = ''
      end
      object lkpCliente: TDBLookupComboBox
        Left = 143
        Top = 32
        Width = 234
        Height = 23
        KeyField = 'ID'
        ListField = 'NOME'
        ListSource = dmVendas.dsCliente
        TabOrder = 1
      end
      object edtDataVenda: TDateEdit
        Left = 383
        Top = 32
        Width = 160
        Height = 23
        DialogTitle = 'Selecione a Data'
        NumGlyphs = 2
        CalendarStyle = csDialog
        TabOrder = 2
      end
      object pnItensVenda: TPanel
        Left = 0
        Top = 72
        Width = 983
        Height = 521
        Align = alBottom
        TabOrder = 3
        ExplicitTop = 64
        ExplicitWidth = 981
        object Panel2: TPanel
          Left = 1
          Top = 1
          Width = 981
          Height = 74
          Align = alTop
          TabOrder = 0
          ExplicitWidth = 979
          object lbProduto: TLabel
            Left = 15
            Top = 14
            Width = 43
            Height = 15
            Caption = 'Produto'
          end
          object lbValorUnitario: TLabel
            Left = 382
            Top = 14
            Width = 71
            Height = 15
            Caption = 'Valor Unit'#225'rio'
          end
          object lbQuantidade: TLabel
            Left = 509
            Top = 14
            Width = 62
            Height = 15
            Caption = 'Quantidade'
          end
          object lbValorProduto: TLabel
            Left = 636
            Top = 14
            Width = 88
            Height = 15
            Caption = 'Total do Produto'
          end
          object lkpProduto: TDBLookupComboBox
            Left = 15
            Top = 35
            Width = 361
            Height = 23
            KeyField = 'ID'
            ListField = 'NOME'
            ListSource = dmVendas.dsProdutos
            TabOrder = 0
            OnExit = lkpProdutoExit
          end
          object edtValorUnitario: TCurrencyEdit
            Left = 382
            Top = 35
            Width = 121
            Height = 23
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -12
            Font.Name = 'Segoe UI'
            Font.Style = [fsBold]
            ParentColor = True
            ParentFont = False
            TabOrder = 1
          end
          object edtQuantidade: TCurrencyEdit
            Left = 509
            Top = 35
            Width = 121
            Height = 23
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -12
            Font.Name = 'Segoe UI'
            Font.Style = [fsBold]
            ParentColor = True
            ParentFont = False
            TabOrder = 2
            OnEnter = edtQuantidadeEnter
            OnExit = edtQuantidadeExit
          end
          object edtTotalProduto: TCurrencyEdit
            Left = 636
            Top = 35
            Width = 121
            Height = 23
            TabStop = False
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -12
            Font.Name = 'Segoe UI'
            Font.Style = [fsBold]
            ParentColor = True
            ParentFont = False
            ReadOnly = True
            TabOrder = 4
          end
          object btnAdicionarItem: TBitBtn
            AlignWithMargins = True
            Left = 771
            Top = 4
            Width = 100
            Height = 66
            Align = alRight
            Caption = 'Adicionar'
            Glyph.Data = {
              36030000424D3603000000000000360000002800000010000000100000000100
              18000000000000030000120B0000120B00000000000000000000FF00FFFF00FF
              FF00FF0A6B0A0A6B0A0A6B0A0A6B0AFF00FFFF00FFFF00FFFF00FFFF00FFFF00
              FFFF00FFFF00FFFF00FFFF00FFFF00FFB25D130A6B0A42D37331B85A0A6B0AA8
              4E0FA54A0EA4480DA1440DA0420C9F3F0C9D3E0BFF00FFFF00FFFF00FFFF00FF
              B561140A6B0A78F3A440D1710A6B0AFBF0DEFBEFDAFBEDD5FBEBD1FBE9CDFBE7
              C89E400BFF00FFFF00FF0A6B0A0A6B0A0A6B0A0A6B0A78F3A444D5740A6B0A0A
              6B0A0A6B0A0A6B0AFCEDD6FBEBD1FBEACEA1430CFF00FFFF00FF0A6B0A78F3A4
              53E4844FE1804CDD7C48D97845D67541D27231B85A0A6B0AFBEFDBFCEDD6FBEB
              D1A3470DFF00FFFF00FF0A6B0A78F3A478F3A478F3A478F3A44DDE7D78F3A478
              F3A442D3730A6B0AFCF1E0FBEFDBFBEDD7A64B0EFF00FFFF00FF0A6B0A0A6B0A
              0A6B0A0A6B0A78F3A450E2810A6B0A0A6B0A0A6B0A0A6B0AFCF4E4FBF1E1FCEF
              DCA94F0FFF00FFFF00FFFF00FFFF00FFC375190A6B0A78F3A454E5850A6B0AFC
              F9F5FCF7F1FCF7EEFCF5E9FBF3E4FCF2E2AC5110FF00FFFF00FFFF00FFFF00FF
              C579190A6B0A78F3A478F3A40A6B0AFCFAF7FCF9F5FCF7F2FCF7EEFBF6E9FBF3
              E5AD5611FF00FFFF00FFFF00FFFF00FFC77C1A0A6B0A0A6B0A0A6B0A0A6B0AFC
              FBFBFCFAF8FCF9F5FBF8F2FCF7EEFBF6EAB05A12FF00FFFF00FFFF00FFFF00FF
              C97F1CFCFCFCFCFCFCFCFCFCFCFCFCFCFCFCFCFCFAFCFBF8FCF9F6FCF8F2FCF7
              EFB35E13FF00FFFF00FFFF00FFFF00FFCC821CFCFCFCFCFCFCFCFCFCFCFCFCFC
              FCFCFCFCFCFCFCFAFCFBF9FCFAF6FCF8F3B66214FF00FFFF00FFFF00FFFF00FF
              CE851DFCFCFCFCFCFCFCFCFCFCFCFCFCFCFCFCFCFCFCFCFCFCFBFBFCFBF9FCFA
              F7B96615FF00FFFF00FFFF00FFFF00FFCF861DFCFCFCFCFCFCFCFCFCFCFCFCFC
              FCFCFCFCFCFCFCFCFCFCFCFCFCFBFCFBF8BC6A16FF00FFFF00FFFF00FFFF00FF
              CF871DCF871DCE861DCC831CCC821CCA801BC87D1BC67A1AC47719C37419C172
              17BF6F17FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
              00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF}
            TabOrder = 3
            OnClick = btnAdicionarItemClick
            ExplicitLeft = 769
          end
          object btnRemoverItem: TBitBtn
            AlignWithMargins = True
            Left = 877
            Top = 4
            Width = 100
            Height = 66
            Align = alRight
            Caption = 'Remover'
            Glyph.Data = {
              36030000424D3603000000000000360000002800000010000000100000000100
              18000000000000030000C30E0000C30E00000000000000000000FF00FFFF00FF
              FF00FFBDA79BB17B5BA95C2FA44B199B3B0A9B3B0A9D400FA8592DB17B5EBEA8
              9EFF00FFFF00FFFF00FFFF00FFFF00FFAB6945A44A12BF6E21D89D5AE6BF8BEE
              CC97EFCB91EDC486E1AE71C6844AA65020AF7556FF00FFFF00FFFF00FFFF00FF
              A14818E9BA7CF6DCBBF7E4CCF7ECDBF7E6CBF8E0BAF9DAAAF9D9A9F9D7A8F0C8
              95A44E22FF00FFFF00FFFF00FFFF00FFA3491AF4D1A6F5DAB6F6E3C7F7E9D4F7
              E4C6F7DEB5F8D9A7F8D8A7F9D6A7F9D4A5A34818FF00FFFF00FFFF00FFC3B8B2
              AE5E2DF3D0A1F4D8B1F5E1C2F6E6CFF7E2C0F7DCB0F7D7A5F8D7A5F8D6A6F9D4
              A5B36132C3BBB6FF00FFFF00FFBEA89EBB723EF2CE9DF3D6AEF4DEBFF5E4C8F6
              DFBBF7D9ACF7D6A3F7D5A3F8D5A4F8D4A4C27B4DBEAAA0FF00FFFF00FFB89787
              C7824BF1CC99F2D4AAF3DCBAF4E1C2F5DCB6F6D8A9F7D4A0F7D4A2F7D4A3F8D4
              A4CF9163B99A89FF00FFFF00FFB48973CF9054F0CA96F2D2A6F2DAB6F3DEBDF4
              DAB1F5D6A6F6D39EF7D3A0F7D3A1F7D2A2DDA877B58A73FF00FFFF00FFAF7658
              D89C5DEFC891F1D0A2F2D8B1F3DBB8F4D8ADF5D4A2F6D29CF6D29EF7D2A0F7D2
              A2E6B485B1795BFF00FFFF00FFAA643CE0A768EFC68EF0CE9EF1D6AEF2D9B3F3
              D6A9F4D29FF5D19AF6D19DF7D29FF7D2A1EDC091AC6844FF00FFFF00FFA55426
              E5B172F0D0A2F2D8B3F5E3C7F5E4CBF6E5CBF6E5CBF7E6CDF7E7D0F7E1C0F8DD
              B9F3CA9AAA5A2FFF00FFFF00FFBE805FEBCB9CE4B162E1A64ADD9A34DFA141E1
              A84FE3AE5CE5B569E7BB76ECCA95F1D8B2F4E3CDC79073FF00FFFF00FF9E4211
              B45D0FC57315CF8322D79431DFA242E1A84FE4AE5DE5B56AE1B16FDAA76CCF97
              62B97344A24B1FFF00FFFF00FFC3B8B2B2836AAB6238A653239F44139B3B0A9B
              3B0A9B3B0A9B3B0AA14415A7562AAE6C48B48A75C5BEBBFF00FFFF00FFFF00FF
              FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
              FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
              00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF}
            TabOrder = 5
            TabStop = False
            OnClick = btnRemoverItemClick
            ExplicitLeft = 875
          end
        end
        object Panel3: TPanel
          Left = 1
          Top = 75
          Width = 981
          Height = 397
          Align = alClient
          TabOrder = 1
          ExplicitWidth = 979
          object gridItensVenda: TDBGrid
            Left = 1
            Top = 1
            Width = 979
            Height = 395
            Align = alClient
            DataSource = dmVendas.dsItensVenda
            Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgAlwaysShowSelection, dgCancelOnExit]
            TabOrder = 0
            TitleFont.Charset = DEFAULT_CHARSET
            TitleFont.Color = clWindowText
            TitleFont.Height = -12
            TitleFont.Name = 'Segoe UI'
            TitleFont.Style = []
            OnDblClick = gridItensVendaDblClick
            OnKeyDown = gridItensVendaKeyDown
            Columns = <
              item
                Expanded = False
                FieldName = 'ProdutoID'
                Title.Caption = 'C'#243'd. Produto'
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'NomeProduto'
                Title.Caption = 'Nome do Produto'
                Width = 500
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'Quantidade'
                Width = 100
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'ValorUnitario'
                Title.Caption = 'Valor Unit'#225'rio'
                Width = 100
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'ValorTotalProduto'
                Title.Caption = 'Total do Produto'
                Width = 100
                Visible = True
              end>
          end
        end
        object pnTotalizador: TPanel
          Left = 1
          Top = 472
          Width = 981
          Height = 48
          Align = alBottom
          TabOrder = 2
          ExplicitWidth = 979
          object Label1: TLabel
            Left = 755
            Top = 16
            Width = 87
            Height = 15
            Caption = 'Valor da Venda: '
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -12
            Font.Name = 'Segoe UI'
            Font.Style = [fsBold]
            ParentFont = False
          end
          object edtValorTotal: TCurrencyEdit
            Left = 848
            Top = 13
            Width = 121
            Height = 23
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -12
            Font.Name = 'Segoe UI'
            Font.Style = [fsBold]
            ParentColor = True
            ParentFont = False
            ReadOnly = True
            TabOrder = 0
          end
        end
      end
    end
  end
  inherited qryListagem: TFDQuery
    SQL.Strings = (
      'SELECT '
      #9'V.ID, '
      #9'V.DATA_venda, '
      #9'V.CLIENTE_ID,'
      #9'C.NOME,'
      #9'V.VALOR_TOTAL'
      'FROM VENDAS AS V'
      'INNER JOIN CLIENTES AS C ON C.ID = V.CLIENTE_ID ')
    Left = 836
    Top = 34
    object qryListagemID: TIntegerField
      DisplayLabel = 'C'#243'd. Venda'
      FieldName = 'ID'
      Origin = 'ID'
      Required = True
    end
    object qryListagemDATA: TSQLTimeStampField
      DisplayLabel = 'Data'
      FieldName = 'DATA_VENDA'
      Origin = '"DATA"'
    end
    object qryListagemCLIENTE_ID: TIntegerField
      DisplayLabel = 'C'#243'd. Cliente'
      FieldName = 'CLIENTE_ID'
      Origin = 'CLIENTE_ID'
    end
    object qryListagemNOME: TStringField
      AutoGenerateValue = arDefault
      DisplayLabel = 'Nome Cliente'
      FieldName = 'NOME'
      Origin = 'NOME'
      ProviderFlags = []
      ReadOnly = True
      Size = 100
    end
    object qryListagemVALOR_TOTAL: TFMTBCDField
      FieldName = 'VALOR_TOTAL'
      Origin = 'VALOR_TOTAL'
      Precision = 18
      Size = 2
    end
  end
  inherited dtsListagem: TDataSource
    Left = 932
    Top = 34
  end
end
