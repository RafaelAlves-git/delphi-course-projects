unit uClassControleEstoque;

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
  TControleEstoque = Class
    private
      ConexaoDB: TFDConnection;
      F_ProdutoID: Integer;
      F_Quantidade: Double;

    public
      constructor Create(aConexaoDB: TFDConnection);
      destructor  Destroy; override;
      function BaixarEstoque: Boolean;
      function RetornarEstoque: Boolean;
    published
      property ProdutoID: Integer read F_ProdutoID  write F_ProdutoID;
      property Quantidade: Double read F_Quantidade write F_Quantidade;
  end;

implementation
{ TCliente }

{$region 'Constructor and Destructor'}
constructor TControleEstoque.Create(aConexaoDB: TFDConnection);
begin
  ConexaoDB := aConexaoDB;
end;

destructor TControleEstoque.Destroy;
begin

  inherited;
end;

{$endregion}

function TControleEstoque.BaixarEstoque: Boolean;
var
  qry: TFDQuery;
begin
  qry := TFDQuery.Create(nil);
  try
    ConexaoDB.StartTransaction;
    qry.Connection := ConexaoDB;

    qry.SQL.Clear;
    qry.SQL.Add('UPDATE PRODUTOS');
    qry.SQL.Add('    SET QUANTIDADE = QUANTIDADE - :pQtdBaixa');
    qry.SQL.Add('    WHERE ID = :pProdutoID');

    qry.ParamByName('pQtdBaixa').Value := Quantidade;
    qry.ParamByName('pProdutoID').Value := ProdutoID;

    try
      qry.ExecSQL();

      ConexaoDB.Commit;
      Result := True;
    except
      ConexaoDB.Rollback;
      Result := False;
    end;
  finally
    if Assigned(qry) then
      FreeAndNil(qry);
  end;
end;

function TControleEstoque.RetornarEstoque: Boolean;
var
  qry: TFDQuery;
begin
  qry := TFDQuery.Create(nil);
  try
    ConexaoDB.StartTransaction;
    qry.Connection := ConexaoDB;

    qry.SQL.Clear;
    qry.SQL.Add('UPDATE PRODUTOS');
    qry.SQL.Add('    SET QUANTIDADE = QUANTIDADE + :pQtdRetorno');
    qry.SQL.Add('    WHERE ID = :pProdutoID');

    qry.ParamByName('pQtdRetorno').Value := Quantidade;
    qry.ParamByName('pProdutoID').Value := ProdutoID;

    try
      qry.ExecSQL();

      ConexaoDB.Commit;
      Result := True;
    except
      ConexaoDB.Rollback;
      Result := False;
    end;
  finally
    if Assigned(qry) then
      FreeAndNil(qry);
  end;
end;


end.
