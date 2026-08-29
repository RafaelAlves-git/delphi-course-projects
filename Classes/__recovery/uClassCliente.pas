unit uClassCliente;

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
  TCliente = Class
    private
      ConexaoDB: TFDConnection;
      F_ID: Integer;
      F_Nome: String;
      F_Endereco: String;
      F_Cidade: String;
      F_Bairro: String;
      F_Estado: String;
      F_CEP: String;
      F_Telefone: String;
      F_Email: String;
      F_DataNascimento: TDateTime;

    public
      constructor Create(aConexaoDB: TFDConnection);
      destructor  Destroy; override;
      function Inserir: Boolean;
      function Atualizar: Boolean;
      function Excluir: Boolean;
      function Selecionar(ID: Integer): Boolean;
    published
      property Codigo: Integer            read F_ID write F_ID;
      property Nome: String               read F_Nome write F_Nome;
      property Endereco: String           read F_Endereco write F_Endereco;
      property Cidade: String             read F_Cidade write F_Cidade;
      property Bairro: String             read F_Bairro write F_Bairro;
      property Estado: String             read F_Estado write F_Estado;
      property CEP: String                read F_CEP write F_CEP;
      property Telefone: String           read F_Telefone write F_Telefone;
      property Email: String              read F_Email write F_Email;
      property DataNascimento: TDateTime  read F_DataNascimento write F_DataNascimento;
  end;

implementation

{$region 'Constructor and Destructor'}
{$endregion}

{ TCliente }

function TCliente.Atualizar: Boolean;
begin

end;

constructor TCliente.Create(aConexaoDB: TFDConnection);
begin

end;

destructor TCliente.Destroy;
begin

  inherited;
end;

function TCliente.Excluir: Boolean;
begin

end;

function TCliente.Inserir: Boolean;
begin

end;

function TCliente.Selecionar(ID: Integer): Boolean;
begin

end;

end.
