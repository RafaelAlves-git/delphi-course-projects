unit dmVenda;

interface

uses
  System.SysUtils, System.Classes, uConexao, FireDAC.Stan.Intf,
  FireDAC.Stan.Option, FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS,
  FireDAC.Phys.Intf, FireDAC.DApt.Intf, FireDAC.Stan.Async, FireDAC.DApt,
  Datasnap.DBClient, Data.DB, FireDAC.Comp.DataSet, FireDAC.Comp.Client;

type
  TdmVendas = class(TDataModule)
    qryCliente: TFDQuery;
    qryClienteID: TIntegerField;
    qryClienteNOME: TStringField;
    qryProdutos: TFDQuery;
    IntegerField1: TIntegerField;
    StringField1: TStringField;
    qryProdutosVALOR: TFMTBCDField;
    qryProdutosQUANTIDADE: TFMTBCDField;
    cdsItensVenda: TClientDataSet;
    dsCliente: TDataSource;
    dsProdutos: TDataSource;
    dsItensVenda: TDataSource;
    cdsItensVendaProdutoID: TIntegerField;
    cdsItensVendaNomeProduto: TStringField;
    cdsItensVendaQuantidade: TFloatField;
    cdsItensVendaValorUnitario: TFloatField;
    cdsItensVendaValorTotalProdutos: TFloatField;
    cdsItensVendaValorTotalVenda: TAggregateField;
    procedure DataModuleCreate(Sender: TObject);
    procedure DataModuleDestroy(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  dmVendas: TdmVendas;

implementation

{%CLASSGROUP 'Vcl.Controls.TControl'}

{$R *.dfm}

procedure TdmVendas.DataModuleCreate(Sender: TObject);
begin
  cdsItensVenda.CreateDataSet;

  qryCliente.Open();
  qryProdutos.Open();
end;

procedure TdmVendas.DataModuleDestroy(Sender: TObject);
begin
  cdsItensVenda.Close;

  qryCliente.Close();
  qryProdutos.Close();
end;

end.
