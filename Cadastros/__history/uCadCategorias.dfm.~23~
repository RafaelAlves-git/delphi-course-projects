inherited frmCadCategoria: TfrmCadCategoria
  Caption = 'Cadastro de Categorias'
  ClientHeight = 505
  ClientWidth = 935
  StyleElements = [seFont, seClient, seBorder]
  ExplicitWidth = 951
  ExplicitHeight = 544
  TextHeight = 15
  inherited pnButtons: TPanel
    Top = 464
    Width = 935
    StyleElements = [seFont, seClient, seBorder]
    ExplicitTop = 456
    ExplicitWidth = 933
    inherited dbnNavigator: TDBNavigator
      Hints.Strings = ()
      StyleElements = [seFont, seClient, seBorder]
    end
    inherited btnFechar: TBitBtn
      Left = 844
      ExplicitLeft = 842
    end
  end
  inherited pgcPrincipal: TPageControl
    Width = 935
    Height = 464
    ActivePage = tabManutencao
    ExplicitWidth = 933
    ExplicitHeight = 456
    inherited tabListagem: TTabSheet
      ExplicitWidth = 927
      ExplicitHeight = 434
      inherited pnlListagemTopo: TPanel
        Width = 927
        StyleElements = [seFont, seClient, seBorder]
        ExplicitWidth = 927
        inherited lblIndice: TLabel
          StyleElements = [seFont, seClient, seBorder]
        end
        inherited mskPesquisar: TMaskEdit
          StyleElements = [seFont, seClient, seBorder]
        end
      end
      inherited grdListagem: TDBGrid
        Width = 927
        Height = 337
        Columns = <
          item
            Expanded = False
            FieldName = 'ID'
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'DESCRICAO'
            Visible = True
          end>
      end
    end
    inherited tabManutencao: TTabSheet
      ExplicitWidth = 927
      ExplicitHeight = 434
      object edtCategoriaID: TLabeledEdit
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
        EditLabel.Width = 56
        EditLabel.Height = 15
        EditLabel.Caption = 'Descri'#231#227'o*'
        TabOrder = 1
        Text = ''
      end
    end
  end
  inherited qryListagem: TFDQuery
    Active = True
    DetailFields = 'ID;DESCRICAO'
    SQL.Strings = (
      'SELECT ID, DESCRICAO'
      'FROM CATEGORIAS;')
    object qryListagemID: TLargeintField
      DisplayLabel = 'C'#243'digo'
      FieldName = 'ID'
      Origin = 'ID'
      Required = True
    end
    object qryListagemDESCRICAO: TStringField
      DisplayLabel = 'Descri'#231#227'o'
      FieldName = 'DESCRICAO'
      Origin = 'DESCRICAO'
      Size = 100
    end
  end
end
