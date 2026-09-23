unit uProVenda;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, uTelaHeranca, Data.DB,
  FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Param,
  FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf, FireDAC.DApt.Intf,
  FireDAC.Stan.Async, FireDAC.DApt, FireDAC.Comp.DataSet, FireDAC.Comp.Client,
  Vcl.Grids, Vcl.DBGrids, Vcl.StdCtrls, Vcl.Mask, Vcl.ComCtrls, Vcl.Buttons,
  Vcl.DBCtrls, Vcl.ExtCtrls, dmVenda, uConexao, RxCurrEdit, RxToolEdit,
  uClassProVenda, uEnum;

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
    DBGrid1: TDBGrid;
    lbProduto: TLabel;
    lkpProduto: TDBLookupComboBox;
    edtValorUnitario: TCurrencyEdit;
    edtQuantidade: TCurrencyEdit;
    edtTotalProduto: TCurrencyEdit;
    btnAdicionar: TBitBtn;
    btnRemover: TBitBtn;
    lbValorUnitario: TLabel;
    lbQuantidade: TLabel;
    lbValorProduto: TLabel;
    qryListagemVALOR_TOTAL: TFMTBCDField;
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure DBGrid1KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure btnAlterarClick(Sender: TObject);
    procedure btnNovoClick(Sender: TObject);
  private
    { Private declarations }
    dtmVenda: TdmVendas;
    oVenda: TVenda;
    function Gravar(EstadoCadastro: TEstadoDoCadastro): Boolean; override;
    function Excluir: Boolean; override;

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
    Result := oVenda.Inserir
  else
    if (EstadoDoCadastro = ecAlterar) then
      Result := oVenda.Atualizar;
end;

function TfrmProVenda.Excluir: Boolean;
begin
  Result := oVenda.Excluir(qryListagem.FieldByName('ID').AsInteger)
end;
{$endRegion}

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

procedure TfrmProVenda.btnNovoClick(Sender: TObject);
begin
  inherited;
  edtDataVenda.Date := Date;
  lkpCliente.SetFocus;
end;

procedure TfrmProVenda.DBGrid1KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  inherited;
  BloqueiaCTRL_DEL_DBGrid(Key, Shift);
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



end.
