unit uFrmAtualizaDB;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.Imaging.pngimage,
  Vcl.ExtCtrls, uConexao;

type
  TfrmAtualizaDB = class(TForm)
    pnPrincipal: TPanel;
    pnBot: TPanel;
    imgSQL: TImage;
    pnBancoDados: TPanel;
    Label1: TLabel;
    chkConexaoDB: TCheckBox;
    chkCategoria: TCheckBox;
    chkProduto: TCheckBox;
    chkCliente: TCheckBox;
    chkVendas: TCheckBox;
    chkItensVenda: TCheckBox;
    Panel1: TPanel;
    procedure AtualizacaoDB(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmAtualizaDB: TfrmAtualizaDB;

implementation

{$R *.dfm}

procedure TfrmAtualizaDB.AtualizacaoDB(Sender: TObject);
  procedure MarcaPasso(CheckBox: TCheckBox);
  begin
    CheckBox.Checked := True;
    Application.ProcessMessages;
    Sleep(300);
  end;
begin
  MarcaPasso(chkConexaoDB);

  uConexao.dtmConexao.ConexaoDB.StartTransaction;
  try
    uConexao.dtmConexao.qryScriptCategorias.ExecSQL;
    MarcaPasso(chkCategoria);

    uConexao.dtmConexao.qryScriptProdutos.ExecSQL;
    MarcaPasso(chkProduto);

    uConexao.dtmConexao.qryScriptClientes.ExecSQL;
    MarcaPasso(chkCliente);

    uConexao.dtmConexao.qryScriptVendas.ExecSQL;
    MarcaPasso(chkVendas);

    uConexao.dtmConexao.qryScriptVendasItens.ExecSQL;
    MarcaPasso(chkItensVenda);

    uConexao.dtmConexao.ConexaoDB.Commit;
    pnBot.Caption := ('Atualização do banco de dados concluída com sucesso!');
    Application.ProcessMessages;
    Sleep(500);
  except
    on E: Exception do
    begin
      if uConexao.dtmConexao.ConexaoDB.InTransaction then
        uConexao.dtmConexao.ConexaoDB.Rollback;

      MessageDlg('Erro ao atualizar o banco de dados: ' + sLineBreak + E.Message,
                 mtError, [mbOK], 0);
    end;
  end;
end;

end.
