unit untPrincipal;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.Menus, Vcl.ExtCtrls, Enter,
  Vcl.Imaging.jpeg, uCadProduto;

type
  TfrmPrincipal = class(TForm)
    MenuPrincipal: TMainMenu;
    Cadastro1: TMenuItem;
    Movimentao1: TMenuItem;
    Relatrios1: TMenuItem;
    Sair1: TMenuItem;
    Cliente: TMenuItem;
    Categoria: TMenuItem;
    Produtos: TMenuItem;
    Vendas: TMenuItem;
    RelatorioCliente: TMenuItem;
    RelatorioProduto: TMenuItem;
    RelatorioVendas: TMenuItem;
    pnBot: TPanel;
    Panel1: TPanel;
    procedure Sair1Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure CategoriaClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure ClienteClick(Sender: TObject);
    procedure ProdutosClick(Sender: TObject);

  private
    { Private declarations }
    TeclaEnter: TMREnter;
  public
    { Public declarations }
  end;

var
  frmPrincipal: TfrmPrincipal;

implementation

{$R *.dfm}

uses uConexao, uCadCategorias, uCadCliente, uFrmAtualizaDB;

{@region 'Menu Principal'}
procedure TfrmPrincipal.ClienteClick(Sender: TObject);
begin
  frmCadCliente := TfrmCadCliente.Create(Self);
  frmCadCliente.ShowModal;
  frmCadCliente.Release;
end;

procedure TfrmPrincipal.CategoriaClick(Sender: TObject);
begin
  frmCadCategoria := TfrmCadCategoria.Create(Self);
  frmCadCategoria.ShowModal;
  frmCadCategoria.Release;
end;

procedure TfrmPrincipal.ProdutosClick(Sender: TObject);
begin
  frmCadProduto := TfrmCadProduto.Create(Self);
  frmCadProduto.ShowModal;
  frmCadProduto.Release;
end;
{@endRegion}

procedure TfrmPrincipal.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  FreeAndNil(dtmConexao);
  FreeAndNil(TeclaEnter);
end;

procedure TfrmPrincipal.FormCreate(Sender: TObject);
begin
  try
    frmAtualizaDB := TfrmAtualizaDB.Create(Self);
    frmAtualizaDB.Show;
    frmAtualizaDB.Refresh;

    dtmConexao := TdtmConexao.Create(Self);

    TeclaEnter := TMREnter.Create(Self);
    TeclaEnter.FocusEnabled := True;
    TeclaEnter.FocusColor := clInfoBk;

    frmAtualizaDB.AtualizacaoDB(Self);
  finally
    frmAtualizaDB.Free;
  end;
end;

procedure TfrmPrincipal.Sair1Click(Sender: TObject);
begin
  Application.Terminate;
end;

end.
