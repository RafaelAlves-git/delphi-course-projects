program Vendas;

uses
  Vcl.Forms,
  untPrincipal in 'untPrincipal.pas' {frmPrincipal},
  uConexao in 'DataModule\uConexao.pas' {dtmConexao: TDataModule},
  uTelaHeranca in 'Heranca\uTelaHeranca.pas' {frmTelaHeranca},
  uCadCategorias in 'Cadastros\uCadCategorias.pas' {frmCadCategoria},
  Enter in 'Terceiros\Enter.pas',
  uEnum in 'Heranca\uEnum.pas',
  uClassCategoria in 'Classes\uClassCategoria.pas',
  uCadCliente in 'Cadastros\uCadCliente.pas' {frmCadCliente},
  uClassCliente in 'Classes\uClassCliente.pas',
  uCadProduto in 'Cadastros\uCadProduto.pas' {frmCadProduto},
  uClassProduto in 'Classes\uClassProduto.pas',
  uFrmAtualizaDB in 'DataModule\uFrmAtualizaDB.pas' {frmAtualizaDB},
  dmVenda in 'DataModule\dmVenda.pas' {dmVendas: TDataModule};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TfrmPrincipal, frmPrincipal);
  Application.CreateForm(TdmVendas, dmVendas);
  Application.Run;
end.
