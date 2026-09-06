unit uClassProduto;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.Menus, Vcl.ExtCtrls,
  System.IniFiles, Data.DB,
  FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Error, FireDAC.UI.Intf,
  FireDAC.Phys.Intf, FireDAC.Stan.Def, FireDAC.Stan.Pool, FireDAC.Stan.Async,
  FireDAC.Phys, FireDAC.Phys.FB, FireDAC.Phys.FBDef, FireDAC.VCLUI.Wait,
  FireDAC.Comp.Client, FireDAC.Comp.UI, FireDAC.Phys.IBBase;

  type
  TProduto = Class
    private
      ConexaoDB: TFDConnection;
      F_ID: Integer;
      F_Nome: String;
      F_Descricao: String;
      F_Valor: Double;
      F_Quantidade: Double;
      F_CategoriaID: Integer;

    public
      constructor Create(aConexaoDB: TFDConnection);
      destructor  Destroy; override;
      function Inserir: Boolean;
      function Atualizar: Boolean;
      function Excluir: Boolean;
      function Selecionar(ID: Integer): Boolean;
    published
      property Codigo: Integer read F_ID write F_ID;
      property Nome: String read F_Nome write F_Nome;
      property Descricao: String read F_Descricao write F_Descricao;
      property Valor: Double read F_Valor write F_Valor;
      property Quantidade: Double read F_Quantidade write F_Quantidade;
      property CategoriaID: Integer read F_CategoriaID write F_CategoriaID;
  end;
implementation

{ TProduto }

{$region 'Constructor and Destructor'}
constructor TProduto.Create(aConexaoDB: TFDConnection);
begin
  ConexaoDB := aConexaoDB;
end;

destructor TProduto.Destroy;
begin

  inherited;
end;
{$endregion}

{$region 'CRUD'}
function TProduto.Atualizar: Boolean;
var
  qry: TFDQuery;
begin
  qry := TFDQuery.Create(nil);
  try
    qry.Connection := ConexaoDB;
    qry.SQL.Clear;
    qry.SQL.Add('UPDATE PRODUTOS');
    qry.SQL.Add('    SET NOME = (:pNome)');
    qry.SQL.Add('    SET DESCRICAO = (:pDescricao)');
    qry.SQL.Add('    SET VALOR = (:pValor)');
    qry.SQL.Add('    SET QUANTIDADE = (:pQuantidade)');
    qry.SQL.Add('    SET CATEGORIA_ID = (:pCategoriaID)');
    qry.SQL.Add('    WHERE ID = (:pProdutoID)');

    qry.ParamByName('pNome').Value := Self.F_Nome;
    qry.ParamByName('pDescricao').Value := Self.F_Descricao;
    qry.ParamByName('pValor').Value := Self.F_Valor;
    qry.ParamByName('pQuantidade').Value := Self.F_Quantidade;
    qry.ParamByName('pCategoriaID').Value := Self.F_CategoriaID;

    qry.ParamByName('pProdutoID').Value := Self.F_ID;
    try
      qry.ExecSQL();

      Result := True;
    except
      Result := False;
    end;
  finally
    if Assigned(qry) then
      FreeAndNil(qry);
  end;
end;

function TProduto.Excluir: Boolean;
var
  qry: TFDQuery;
begin
  if MessageDlg('Apagar o Registro: '+ #13+
                'Código: '+IntToStr(Self.F_ID) + #13+
                'Nome: '+Self.F_Nome, mtConfirmation,[mbYes,mbNo], 0) = mrNo then
    begin
      Result := False;
      Abort;
    end;

  qry := TFDQuery.Create(nil);
  try
    qry.Connection := ConexaoDB;
    qry.SQL.Clear;
    qry.SQL.Add('DELETE FROM PRODUTOS');
    qry.SQL.Add('    WHERE ID = (:pProdutoID)');
    qry.ParamByName('pProdutoID').Value := Self.F_ID;
    try
      qry.ExecSQL();

      Result := True;
    except
      Result := False;
    end;
  finally
    if Assigned(qry) then
      FreeAndNil(qry);
  end;
end;

function TProduto.Inserir: Boolean;
var
  qry: TFDQuery;
begin
  qry := TFDQuery.Create(nil);
  try
    qry.Connection := ConexaoDB;
    qry.SQL.Clear;
    qry.SQL.Add('INSERT INTO PRODUTOS (NOME, DESCRICAO, VALOR, QUANTIDADE, CATEGORIA_ID)');
    qry.SQL.Add('              VALUES (:pNome, :pDescricao, :pValor, :pQuantidade, :pCategoriaID)');
    qry.ParamByName('pNome').Value := Self.F_Nome;
    qry.ParamByName('pDescricao').Value := Self.F_Descricao;
    qry.ParamByName('pValor').Value := Self.F_Valor;
    qry.ParamByName('pQuantidade').Value := Self.F_Quantidade;
    qry.ParamByName('pCategoriaID').Value := Self.F_CategoriaID;

    try
      qry.ExecSQL;
      Result := True;
    except
      Result := False;
    end;
  finally
    if Assigned(qry) then
      FreeAndNil(qry);
  end;
end;

function TProduto.Selecionar(ID: Integer): Boolean;
var
  qry: TFDQuery;
begin
  qry := TFDQuery.Create(nil);
  try
    qry.Connection := ConexaoDB;
    qry.SQL.Clear;
    qry.SQL.Add('SELECT ID, NOME, DESCRICAO, VALOR, QUANTIDADE, CATEGORIA_ID');
    qry.SQL.Add('    WHERE ID = (:pProdutoID)');
    qry.ParamByName('pProdutoID').Value := ID;
    try
      qry.Open();

      Self.F_ID := qry.FieldByName('ID').AsInteger;
      Self.F_Nome := qry.FieldByName('NOME').AsString;
      Self.F_Descricao := qry.FieldByName('DESCRICAO').AsString;
      Self.F_Valor := qry.FieldByName('VALOR').AsFloat;
      Self.F_Quantidade := qry.FieldByName('QUANTIDADE').AsFloat;
      Self.F_CategoriaID := qry.FieldByName('CATEGORIA_ID').AsInteger;
      Result := True;
    except
      Result := False;
    end;
  finally
    if Assigned(qry) then
      FreeAndNil(qry);
  end;
end;
{$endregion}

end.
