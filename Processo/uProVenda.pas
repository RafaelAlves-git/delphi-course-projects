unit uProVenda;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, uTelaHeranca, Data.DB,
  FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Param,
  FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf, FireDAC.DApt.Intf,
  FireDAC.Stan.Async, FireDAC.DApt, FireDAC.Comp.DataSet, FireDAC.Comp.Client,
  Vcl.Grids, Vcl.DBGrids, Vcl.StdCtrls, Vcl.Mask, Vcl.ComCtrls, Vcl.Buttons,
  Vcl.DBCtrls, Vcl.ExtCtrls, uVendas, uConexao, RxCurrEdit, RxToolEdit,
  uClassProVenda, uEnum, Datasnap.DBClient;

type
  TfrmProVenda = class(TfrmTelaHeranca)
    qryListagemID: TIntegerField;
    qryListagemDATA: TSQLTimeStampField;
    qryListagemCLIENTE_ID: TIntegerField;
    qryListagemNOME: TStringField;
    edtVendaID: TLabeledEdit;
    lkpCliente: TDBLookupComboBox;
    lbCliente: TLabel;
    lbDataVenda: TLabel;
    edtDataVenda: TDateEdit;
    pnItensVenda: TPanel;
    Panel2: TPanel;
    Panel3: TPanel;
    pnTotalizador: TPanel;
    Label1: TLabel;
    edtValorTotal: TCurrencyEdit;
    gridItensVenda: TDBGrid;
    lbProduto: TLabel;
    lkpProduto: TDBLookupComboBox;
    edtValorUnitario: TCurrencyEdit;
    edtQuantidade: TCurrencyEdit;
    edtTotalProduto: TCurrencyEdit;
    btnAdicionarItem: TBitBtn;
    btnRemoverItem: TBitBtn;
    lbValorUnitario: TLabel;
    lbQuantidade: TLabel;
    lbValorProduto: TLabel;
    qryListagemVALOR_TOTAL: TFMTBCDField;
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure gridItensVendaKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure btnAlterarClick(Sender: TObject);
    procedure btnNovoClick(Sender: TObject);
    procedure btnAdicionarItemClick(Sender: TObject);
    procedure lkpProdutoExit(Sender: TObject);
    procedure edtQuantidadeExit(Sender: TObject);
    procedure edtQuantidadeEnter(Sender: TObject);
    procedure btnCancelarClick(Sender: TObject);
    procedure btnGravarClick(Sender: TObject);
    procedure btnRemoverItemClick(Sender: TObject);
    procedure gridItensVendaDblClick(Sender: TObject);
  private
    { Private declarations }
    dtmVenda: TdmVendas;
    oVenda: TVenda;
    function Gravar(EstadoCadastro: TEstadoDoCadastro): Boolean; override;
    function Excluir: Boolean; override;
    function TotalizarProduto(ValorUnitario, Quantidade: Double): Double;
    procedure LimparComponenteItem;
    procedure LimparClientDataSet;
    procedure CarregaRegistroSelecionado;
    function TotalizarVenda: Double;
  public
    { Public declarations }
  end;

var
  frmProVenda: TfrmProVenda;
  dmVendas: TdmVendas;

implementation

{$R *.dfm}
{$region 'override'}

function TfrmProVenda.Gravar(EstadoCadastro: TEstadoDoCadastro): Boolean;
begin
  if edtVendaID.Text <> EmptyStr then
    oVenda.VendaID := StrToInt(edtVendaID.Text)
  else
    oVenda.VendaID := 0;

  oVenda.ClienteID := lkpCliente.KeyValue;
  oVenda.DataVenda := edtDataVenda.Date;
  oVenda.TotalVenda := edtValorTotal.Value;

  if (EstadoDoCadastro = ecInserir) then
    Result := oVenda.Inserir(dmVendas.cdsItensVenda)
  else
    if (EstadoDoCadastro = ecAlterar) then
      Result := oVenda.Atualizar;
end;

procedure TfrmProVenda.lkpProdutoExit(Sender: TObject);
begin
  inherited;

  if TDBLookupComboBox(Sender).KeyValue <> Null then
  begin
    edtValorUnitario.Value := dmVendas.qryProdutos.FieldByName('VALOR').AsFloat;
    edtQuantidade.Value := 1;

    edtTotalProduto.Value := TotalizarProduto(edtValorUnitario.Value, edtQuantidade.Value);
  end;
end;

function TfrmProVenda.Excluir: Boolean;
begin
  if oVenda.Selecionar(qryListagem.FieldByName('ID').AsInteger) then
    Result := oVenda.Excluir()
end;
{$endRegion}

procedure TfrmProVenda.btnAdicionarItemClick(Sender: TObject);
begin
  inherited;
  if lkpProduto.KeyValue = Null then
  begin
    MessageDlg('Produto é um campo obrigatório', TMsgDlgType.mtInformation, [mbOK], 0);
    lkpProduto.SetFocus;
    Abort;
  end;

  if edtValorUnitario.Value <= 0 then
  begin
    MessageDlg('Valor Unitário não pode ser Zero', TMsgDlgType.mtInformation, [mbOK], 0);
    edtValorUnitario.SetFocus;
    Abort;
  end;

  if edtQuantidade.Value <= 0 then
  begin
    MessageDlg('Quantidade não pode ser Zero', TMsgDlgType.mtInformation, [mbOK], 0);
    edtQuantidade.SetFocus;
    Abort;
  end;

  if dmVendas.cdsItensVenda.Locate('ProdutoID', lkpProduto.KeyValue, []) then
  begin
    MessageDlg('Este Produto já foi Selecionado', TMsgDlgType.mtInformation, [mbOK], 0);
    lkpProduto.SetFocus;
    Abort;
  end;

  edtTotalProduto.Value := TotalizarProduto(edtValorUnitario.Value, edtQuantidade.Value);

  with dmVendas.cdsItensVenda do
  begin
    Append;
    FieldByName('ProdutoID').AsString := lkpProduto.KeyValue;
    FieldByName('NomeProduto').AsString := dmVendas.qryProdutos.FieldByName('NOME').AsString;;
    FieldByName('Quantidade').AsFloat := edtQuantidade.Value;
    FieldByName('ValorUnitario').AsFloat := edtValorUnitario.Value;
    FieldByName('ValorTotalProduto').AsFloat := edtTotalProduto.Value;
    Post;

    LimparComponenteItem;

    lkpProduto.SetFocus;
  end;

  edtValorTotal.Value := TotalizarVenda;
end;

function TfrmProVenda.TotalizarProduto(ValorUnitario,
  Quantidade: Double): Double;
begin
  Result := ValorUnitario * Quantidade;
end;

procedure TfrmProVenda.LimparClientDataSet;
begin
  while not dmVendas.cdsItensVenda.Eof do
    dmVendas.cdsItensVenda.Delete;
end;

procedure TfrmProVenda.LimparComponenteItem;
begin
  lkpProduto.KeyValue := null;
  edtQuantidade.Value := 0;
  edtValorUnitario.Value := 0;
  edtTotalProduto.Value := 0;
end;

procedure TfrmProVenda.btnAlterarClick(Sender: TObject);
begin
  if oVenda.Selecionar(qryListagem.FieldByName('ID').AsInteger) then
    begin
      edtVendaID.Text := IntToStr(oVenda.VendaID);
      lkpCliente.KeyValue := oVenda.ClienteID;
      edtDataVenda.Date := oVenda.DataVenda;
      edtValorTotal.Value := oVenda.TotalVenda;
    end
  else
    begin
      btnCancelar.Click;
      Abort;
    end;

  inherited;
end;

procedure TfrmProVenda.btnCancelarClick(Sender: TObject);
begin
  inherited;
  LimparClientDataSet();
end;

procedure TfrmProVenda.btnGravarClick(Sender: TObject);
begin
  inherited;
  LimparClientDataSet();
end;

procedure TfrmProVenda.btnNovoClick(Sender: TObject);
begin
  inherited;
  edtDataVenda.Date := Date;
  lkpCliente.SetFocus;
  LimparClientDataSet();
end;

procedure TfrmProVenda.btnRemoverItemClick(Sender: TObject);
begin
  inherited;
  if lkpProduto.KeyValue = null then
  begin
    MessageDlg('Selecione o Produto a ser Excluido', TMsgDlgType.mtInformation, [mbOK], 0);
    gridItensVenda.SetFocus;
    Abort;
  end;

  if dmVendas.cdsItensVenda.Locate('ProdutoID', lkpProduto.KeyValue, []) then
  begin
     dmVendas.cdsItensVenda.Delete;
     edtValorTotal.Value := TotalizarVenda;
     LimparComponenteItem;
  end;
end;

procedure TfrmProVenda.gridItensVendaDblClick(Sender: TObject);
begin
  inherited;
  CarregaRegistroSelecionado;
end;

procedure TfrmProVenda.gridItensVendaKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  inherited;
  BloqueiaCTRL_DEL_DBGrid(Key, Shift);
end;

procedure TfrmProVenda.edtQuantidadeEnter(Sender: TObject);
begin
  inherited;
  edtTotalProduto.Value := TotalizarProduto(edtValorUnitario.Value, edtQuantidade.Value);
end;

procedure TfrmProVenda.edtQuantidadeExit(Sender: TObject);
begin
  inherited;
  edtTotalProduto.Value := TotalizarProduto(edtValorUnitario.Value, edtQuantidade.Value);
end;

procedure TfrmProVenda.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  inherited;

  FreeAndNil(dmVendas);
  FreeAndNil(oVenda);
end;

procedure TfrmProVenda.FormCreate(Sender: TObject);
begin
  inherited;
  dmVendas := TdmVendas.Create(Self);
  oVenda := TVenda.Create(dtmConexao.ConexaoDB);

  IndiceAtual := 'CLIENTE_ID';
end;

procedure TfrmProVenda.CarregaRegistroSelecionado();
begin
  with dmVendas.cdsItensVenda do
  begin
    lkpProduto.KeyValue := FieldByName('ProdutoID').AsString ;
    edtQuantidade.Value := FieldByName('Quantidade').AsFloat ;
    edtValorUnitario.Value := FieldByName('ValorUnitario').AsFloat;
    edtTotalProduto.Value := FieldByName('ValorTotalProduto').AsFloat;
  end;
end;

function TfrmProVenda.TotalizarVenda():Double;
begin
  Result := 0;

  dmVendas.cdsItensVenda.First;
  while not dmVendas.cdsItensVenda.Eof do
  begin
    Result := Result + dmVendas.cdsItensVenda.FieldByName('valorTotalProduto').AsFloat;
    dmVendas.cdsItensVenda.Next;
  end;
end;


end.
