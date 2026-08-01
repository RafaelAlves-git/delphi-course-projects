unit uTelaHeranca;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Data.DB, Vcl.Buttons, Vcl.DBCtrls,
  Vcl.Grids, Vcl.DBGrids, Vcl.StdCtrls, Vcl.Mask, Vcl.ComCtrls, Vcl.ExtCtrls,
  FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Param,
  FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf, FireDAC.DApt.Intf,
  FireDAC.Stan.Async, FireDAC.DApt, FireDAC.Comp.DataSet, FireDAC.Comp.Client;

type
  TfrmTelaHeranca = class(TForm)
    Panel1: TPanel;
    pgcPrincipal: TPageControl;
    tabManutencao: TTabSheet;
    tabListagem: TTabSheet;
    pnlListagemTopo: TPanel;
    mskPesquisar: TMaskEdit;
    btnPesquisar: TBitBtn;
    grdListagem: TDBGrid;
    btnNovo: TBitBtn;
    dbnNavigator: TDBNavigator;
    btnFechar: TBitBtn;
    btnExcluir: TBitBtn;
    btnGravar: TBitBtn;
    btnCancelar: TBitBtn;
    btnAlterar: TBitBtn;
    qryListagem: TFDQuery;
    dtsListagem: TDataSource;
    procedure FormCreate(Sender: TObject);
    procedure btnFecharClick(Sender: TObject);
    procedure ControlarBotoes(Novo, Alterar, Cancelar, Gravar, Apagar: TBitBtn;
      Navigator: TDBNavigator; pgcPrincipal: TPageControl; Flag:Boolean);
    procedure btnNovoClick(Sender: TObject);
    procedure btnCancelarClick(Sender: TObject);
    procedure btnGravarClick(Sender: TObject);
    procedure btnExcluirClick(Sender: TObject);
    procedure btnAlterarClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmTelaHeranca: TfrmTelaHeranca;

implementation

{$R *.dfm}

uses uConexao;

procedure TfrmTelaHeranca.btnAlterarClick(Sender: TObject);
begin
  ControlarBotoes(btnNovo, btnAlterar, btnCancelar, btnGravar, btnExcluir, dbnNavigator, pgcPrincipal, False);
end;

procedure TfrmTelaHeranca.btnCancelarClick(Sender: TObject);
begin
  ControlarBotoes(btnNovo, btnAlterar, btnCancelar, btnGravar, btnExcluir, dbnNavigator, pgcPrincipal, True);
end;

procedure TfrmTelaHeranca.btnExcluirClick(Sender: TObject);
begin
  ControlarBotoes(btnNovo, btnAlterar, btnCancelar, btnGravar, btnExcluir, dbnNavigator, pgcPrincipal, True);
end;

procedure TfrmTelaHeranca.btnFecharClick(Sender: TObject);
begin
  Close;
end;

procedure TfrmTelaHeranca.btnGravarClick(Sender: TObject);
begin
  ControlarBotoes(btnNovo, btnAlterar, btnCancelar, btnGravar, btnExcluir, dbnNavigator, pgcPrincipal, True);
end;

procedure TfrmTelaHeranca.btnNovoClick(Sender: TObject);
begin
  ControlarBotoes(btnNovo, btnAlterar, btnCancelar, btnGravar, btnExcluir, dbnNavigator, pgcPrincipal, False);
end;

procedure TfrmTelaHeranca.ControlarBotoes(Novo, Alterar, Cancelar, Gravar,
  Apagar: TBitBtn; Navigator: TDBNavigator; pgcPrincipal: TPageControl;
  Flag: Boolean);
begin
  Novo.Enabled := Flag;
  Alterar.Enabled := Flag;
  Cancelar.Enabled := not Flag;
  Gravar.Enabled := not Flag;
  Apagar.Enabled := Flag;

  Navigator.Enabled := Flag;
  pgcPrincipal.Pages[0].TabVisible := Flag;
end;

procedure TfrmTelaHeranca.FormCreate(Sender: TObject);
begin
  qryListagem.Connection := dtmConexao.ConexaoDB;
  dtsListagem.DataSet := qryListagem;
  grdListagem.DataSource := dtsListagem;
  dbnNavigator.DataSource := dtsListagem;
end;

end.
