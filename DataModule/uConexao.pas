unit uConexao;

interface

uses
  System.SysUtils, System.Classes, System.IniFiles, Data.DB,
  FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Error, FireDAC.UI.Intf,
  FireDAC.Phys.Intf, FireDAC.Stan.Def, FireDAC.Stan.Pool, FireDAC.Stan.Async,
  FireDAC.Phys, FireDAC.Phys.FB, FireDAC.Phys.FBDef, FireDAC.VCLUI.Wait,
  FireDAC.Comp.Client, FireDAC.Comp.UI, FireDAC.Phys.IBBase;

type
  TdtmConexao = class(TDataModule)
    ConexaoDB: TFDConnection;
    FDPhysFBDriverLink1: TFDPhysFBDriverLink;
    FDGUIxWaitCursor1: TFDGUIxWaitCursor;
    procedure DataModuleCreate(Sender: TObject);
  private
    procedure CarregarConfiguracoes;
  public
    { Public declarations }
  end;

var
  dtmConexao: TdtmConexao;

implementation

{%CLASSGROUP 'Vcl.Controls.TControl'}

uses untPrincipal;

{$R *.dfm}

procedure TdtmConexao.DataModuleCreate(Sender: TObject);
begin
  CarregarConfiguracoes;
end;

procedure TdtmConexao.CarregarConfiguracoes;
var
  vArquivoINI: TIniFile;
  vCaminhoINI: string;
  vCaminhoBanco: string;
  vServidor: string;
  vPorta: string;
  vUsuario: string;
  vSenha: string;
  vDriver: string;
  vCharSet: string;
  vVendorLib: string;
begin
  vCaminhoINI := ExtractFilePath(ParamStr(0)) + 'Config.ini';
  vArquivoINI := TIniFile.Create(vCaminhoINI);
  try
    vServidor     := vArquivoINI.ReadString('BancoDeDados', 'Servidor', '127.0.0.1');
    vPorta        := vArquivoINI.ReadString('BancoDeDados', 'Porta', '3050');
    vCaminhoBanco := vArquivoINI.ReadString('BancoDeDados', 'Caminho', 'BANCO.FDB');
    vUsuario      := vArquivoINI.ReadString('BancoDeDados', 'Usuario', 'SYSDBA');
    vSenha        := vArquivoINI.ReadString('BancoDeDados', 'Senha', 'masterkey');
    vDriver       := vArquivoINI.ReadString('BancoDeDados', 'Driver', 'FB');
    vCharSet      := vArquivoINI.ReadString('BancoDeDados', 'CharacterSet', 'UTF8');
    vVendorLib    := vArquivoINI.ReadString('BancoDeDados', 'VendorLib', '');

    // Se o caminho do banco for relativo, combina com a pasta do executavel
    if ExtractFilePath(vCaminhoBanco) = '' then
      vCaminhoBanco := 'C:\Git\delphi-course-projects\' + vCaminhoBanco;

    // Se o INI nao existia, escreve os padroes para facilitar uso futuro
    if not FileExists(vCaminhoINI) then
    begin
      vArquivoINI.WriteString('BancoDeDados', 'Servidor', vServidor);
      vArquivoINI.WriteString('BancoDeDados', 'Porta', vPorta);
      vArquivoINI.WriteString('BancoDeDados', 'Caminho', 'BANCO.FDB');
      vArquivoINI.WriteString('BancoDeDados', 'Usuario', vUsuario);
      vArquivoINI.WriteString('BancoDeDados', 'Senha', vSenha);
      vArquivoINI.WriteString('BancoDeDados', 'Driver', vDriver);
      vArquivoINI.WriteString('BancoDeDados', 'CharacterSet', vCharSet);
      vArquivoINI.WriteString('BancoDeDados', 'VendorLib', vVendorLib);
    end;
  finally
    vArquivoINI.Free;
  end;

  // Configura a biblioteca cliente do driver se especificada
  if vVendorLib <> '' then
    FDPhysFBDriverLink1.VendorLib := vVendorLib;

  // Configura a conexao FireDAC
  ConexaoDB.Close;
  ConexaoDB.Params.Clear;
  ConexaoDB.Params.Add('DriverID=' + vDriver);
  ConexaoDB.Params.Add('Server=' + vServidor);
  ConexaoDB.Params.Add('Port=' + vPorta);
  ConexaoDB.Params.Add('Database=' + vCaminhoBanco);
  ConexaoDB.Params.Add('User_Name=' + vUsuario);
  ConexaoDB.Params.Add('Password=' + vSenha);
  ConexaoDB.Params.Add('CharacterSet=' + vCharSet);
  ConexaoDB.LoginPrompt := False;

  try
    ConexaoDB.Connected := True;
    frmPrincipal.pnBot.Caption := 'Rafael Alves - Conectado no Banco ' + vCaminhoBanco;
  except
    on E: Exception do
      raise Exception.Create('Erro ao conectar ao banco de dados Firebird:' + sLineBreak + E.Message);
  end;
end;

end.
