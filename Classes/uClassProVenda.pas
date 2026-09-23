unit uClassProVenda;

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
  TVenda = Class
    private
      ConexaoDB: TFDConnection;
      F_VendaID: Integer;
      F_ClienteID: Integer;
      F_DataVenda: TDateTime;
      F_TotalVenda: Double;
    public
      constructor Create(aConexaoDB: TFDConnection);
      destructor  Destroy; override;
      function Inserir: Boolean;
      function Atualizar: Boolean;
      function Excluir(ID: Integer): Boolean;
      function Selecionar(ID: Integer): Boolean;
    published
      property VendaID: Integer read F_VendaID write F_VendaID;
      property ClienteID: Integer read F_ClienteID write F_ClienteID;
      property DataVenda: TDateTime read F_DataVenda write F_DataVenda;
      property TotalVenda: Double read F_TotalVenda write F_TotalVenda;
  end;

implementation

{ TVenda }

{$region 'Constructor and Destructor'}
constructor TVenda.Create(aConexaoDB: TFDConnection);
begin
  ConexaoDB := aConexaoDB;
end;

destructor TVenda.Destroy;
begin

  inherited;
end;
{$endRegion}

{$region 'CRUD'}
function TVenda.Atualizar: Boolean;
var
  qry: TFDQuery;
begin
  qry := TFDQuery.Create(nil);
  try
    qry.Connection := ConexaoDB;
    qry.SQL.Clear;
    qry.SQL.Add('UPDATE VENDAS');
    qry.SQL.Add('    SET CLIENTE_ID = :pClienteID,');
    qry.SQL.Add('        DATA_VENDA = :pData,');
    qry.SQL.Add('        VALOR_TOTAL = :pValorTotal');
    qry.SQL.Add('    WHERE ID = (:pVendaID)');

    qry.ParamByName('pClienteID').Value := Self.F_ClienteID;
    qry.ParamByName('pData').Value := Self.F_DataVenda;
    qry.ParamByName('pValorTotal').Value := Self.F_TotalVenda;

    qry.ParamByName('pVendaID').Value := Self.F_VendaID;
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

function TVenda.Excluir(ID: Integer): Boolean;
var
  qry: TFDQuery;
begin
  if MessageDlg('Apagar o Registro: '+ #13+
                'Venda Nro: '+IntToStr(F_VendaID),mtConfirmation,[mbYes,mbNo], 0) = mrNo then
    begin
      Result := False;
      Abort;
    end;

  qry := TFDQuery.Create(nil);
  try
    ConexaoDB.StartTransaction;
    qry.Connection := ConexaoDB;
    qry.SQL.Clear;
    qry.SQL.Add('DELETE FROM VENDAS_ITENS');
    qry.SQL.Add('    WHERE VENDA_ID = (:pVendaID)');
    qry.ParamByName('pVendaID').Value := ID;
    try
      qry.ExecSQL();

      qry.SQL.Clear;
      qry.SQL.Add('DELETE FROM VENDAS');
      qry.SQL.Add('    WHERE ID = (:pVendaID)');
      qry.ParamByName('pVendaID').Value := ID;
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

function TVenda.Inserir: Boolean;
var
  qry: TFDQuery;
  IdVendaGerado: Integer;
begin
  qry := TFDQuery.Create(nil);
  try
    ConexaoDB.StartTransaction;
    qry.Connection := ConexaoDB;

    qry.SQL.Clear;
    qry.SQL.Add('INSERT INTO VENDAS (DATA_VENDA, CLIENTE_ID, VALOR_TOTAL)');
    qry.SQL.Add('            VALUES (:pData, :pClienteID, :pValorTotal)');
    qry.ParamByName('pData').Value := Self.F_DataVenda;
    qry.ParamByName('pClienteID').Value := Self.F_ClienteID;
    qry.ParamByName('pValorTotal').Value := Self.F_TotalVenda;

    try
      qry.ExecSQL;

      qry.SQL.Clear;
      qry.SQL.Add('SELECT SCOPE_IDENTITY() AS ID');
      qry.Open();

      IdVendaGerado := qry.FieldByName('ID').AsInteger;

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

function TVenda.Selecionar(ID: Integer): Boolean;
var
  qry: TFDQuery;
begin
  qry := TFDQuery.Create(nil);
  try
    qry.Connection := ConexaoDB;
    qry.SQL.Clear;
    qry.SQL.Add('SELECT ID, DATA_VENDA, CLIENTE_ID, VALOR_TOTAL');
    qry.SQL.Add('   FROM VENDAS');
    qry.SQL.Add('   WHERE ID = (:pVendaID)');
    qry.ParamByName('pVendaID').Value := ID;
    try
      qry.Open();

      Self.F_VendaID := qry.FieldByName('ID').AsInteger;
      Self.F_DataVenda := qry.FieldByName('DATA_VENDA').AsDateTime;
      Self.F_ClienteID := qry.FieldByName('CLIENTE_ID').AsInteger;
      Self.F_TotalVenda := qry.FieldByName('CLIENTE_ID').AsFloat;

      Result := True;
    except
      Result := False;
    end;
  finally
    if Assigned(qry) then
      FreeAndNil(qry);
  end;
end;
{$endRegion}
end.
