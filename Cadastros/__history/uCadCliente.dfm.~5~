inherited frmCadCliente: TfrmCadCliente
  Caption = 'Cadastro de Cliente'
  ClientHeight = 540
  StyleElements = [seFont, seClient, seBorder]
  ExplicitLeft = 3
  ExplicitTop = 3
  ExplicitHeight = 579
  TextHeight = 15
  inherited pnButtons: TPanel
    Top = 499
    StyleElements = [seFont, seClient, seBorder]
    inherited dbnNavigator: TDBNavigator
      Hints.Strings = ()
      StyleElements = [seFont, seClient, seBorder]
    end
  end
  inherited pgcPrincipal: TPageControl
    Height = 499
    inherited tabListagem: TTabSheet
      ExplicitHeight = 469
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
        Height = 372
        Columns = <
          item
            Expanded = False
            FieldName = 'ID'
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'NOME'
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'ENDERECO'
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'CIDADE'
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'BAIRRO'
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'ESTADO'
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'CEP'
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'TELEFONE'
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'EMAIL'
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'DATANASCIMENTO'
            Visible = True
          end>
      end
    end
    inherited tabManutencao: TTabSheet
      ExplicitHeight = 469
      object lbCEP: TLabel
        Left = 452
        Top = 59
        Width = 21
        Height = 15
        Caption = 'CEP'
      end
      object lbTelefone: TLabel
        Left = 453
        Top = 155
        Width = 44
        Height = 15
        Caption = 'Telefone'
      end
      object lbDataNascimento: TLabel
        Left = 16
        Top = 259
        Width = 91
        Height = 15
        Caption = 'Data Nascimento'
      end
      object edtClienteID: TLabeledEdit
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
      object edtNome: TLabeledEdit
        Tag = 2
        Left = 16
        Top = 80
        Width = 430
        Height = 23
        EditLabel.Width = 56
        EditLabel.Height = 15
        EditLabel.Caption = 'Descri'#231#227'o*'
        MaxLength = 100
        TabOrder = 1
        Text = ''
      end
      object edtCEP: TMaskEdit
        Left = 452
        Top = 80
        Width = 120
        Height = 23
        EditMask = '99.999-999;1;_'
        MaxLength = 10
        TabOrder = 2
        Text = '  .   -   '
      end
      object edtEndereco: TLabeledEdit
        Left = 17
        Top = 128
        Width = 430
        Height = 23
        EditLabel.Width = 49
        EditLabel.Height = 15
        EditLabel.Caption = 'Endere'#231'o'
        MaxLength = 100
        TabOrder = 3
        Text = ''
      end
      object edtBairro: TLabeledEdit
        Left = 453
        Top = 126
        Width = 430
        Height = 23
        EditLabel.Width = 31
        EditLabel.Height = 15
        EditLabel.Caption = 'Bairro'
        MaxLength = 100
        TabOrder = 4
        Text = ''
      end
      object edtCidade: TLabeledEdit
        Left = 17
        Top = 176
        Width = 430
        Height = 23
        EditLabel.Width = 37
        EditLabel.Height = 15
        EditLabel.Caption = 'Cidade'
        MaxLength = 100
        TabOrder = 5
        Text = ''
      end
      object edtTelefone: TMaskEdit
        Left = 453
        Top = 176
        Width = 117
        Height = 23
        EditMask = '(99) 99999-9999;1;_'
        MaxLength = 15
        TabOrder = 6
        Text = '(  )      -    '
      end
      object edtEmail: TLabeledEdit
        Left = 16
        Top = 230
        Width = 430
        Height = 23
        EditLabel.Width = 29
        EditLabel.Height = 15
        EditLabel.Caption = 'Email'
        MaxLength = 100
        TabOrder = 7
        Text = ''
      end
      object edtDataNascimento: TDateEdit
        Left = 17
        Top = 280
        Width = 160
        Height = 23
        DialogTitle = 'Selecione a Data'
        NumGlyphs = 2
        CalendarStyle = csDialog
        TabOrder = 8
      end
    end
  end
  inherited qryListagem: TFDQuery
    Active = True
    SQL.Strings = (
      
        'SELECT ID, NOME, ENDERECO, CIDADE, BAIRRO, ESTADO, CEP, TELEFONE' +
        ', EMAIL, DATANASCIMENTO'
      'FROM CLIENTES;')
    Left = 828
    Top = 34
  end
  inherited dtsListagem: TDataSource
    Left = 924
    Top = 34
  end
end
