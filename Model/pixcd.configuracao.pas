unit pixcd.configuracao;

interface

uses
  pixcd.interfaces,
  enumerados;

type
  TConfiguracao = class(TInterfacedObject, IConfiguracao)
  private
    FPSP: TTipoPSP;
    FAPIVersion: String;
    FChavePIX: String;
    FConsumerKey: String;
    FConsumerSecret: String;
    FClientID: String;
    FClientSecret: String;
    FDeveloperApplication: String;
    FAccessKey: String;
    FCNPJ: String;
    FAccountId: String;
    FAccessToken: String;
    FAmbiente: Integer;
    FArqLog: String;
    FCep: String;
    FCertificado: String;
    FCertificadoRoot: string;
    FChavePrivada: String;
    FCidade: String;
    FEstado: String;
    FHost: String;
    FNivelLog: String;
    FNome: String;
    FPass: String;
    FPort: String;
    FSenha: String;
    FTimeout: Integer;
    FToken: String;
    Fuser: String;
    FAPIVersao: Integer;
    FTipoCertificado: Integer;
    FMediatorFee: Currency;
    FSecretKey: string;
  public
    class function New: IConfiguracao;

//    function PSP(Value: TTipoPSP): IConfiguracao; overload;
//    function PSP: TTipoPSP; overload;
    function Nome(Value: String): IConfiguracao; overload;
    function Nome: String; overload;
    function Cep(Value: String): IConfiguracao; overload;
    function Cep: String; overload;
    function Cidade(Value: String): IConfiguracao; overload;
    function Cidade: String; overload;
    function Estado(Value: String): IConfiguracao; overload;
    function Estado: String; overload;
    function Ambiente(Value: Integer): IConfiguracao; overload;
    function Ambiente: Integer; overload;
    function Timeout(Value: Integer): IConfiguracao; overload;
    function Timeout: Integer; overload;
    function Host(Value: String): IConfiguracao; overload;
    function Host: String; overload;
    function Port(Value: String): IConfiguracao; overload;
    function Port: String; overload;
    function User(Value: String): IConfiguracao; overload;
    function User: String; overload;
    function Pass(Value: String): IConfiguracao; overload;
    function Pass: String; overload;
    function ArqLog(Value: String): IConfiguracao; overload;
    function ArqLog: String; overload;
    function NivelLog(Value: String): IConfiguracao; overload;
    function NivelLog: String; overload;
    function TipoCertificado(Value: Integer): IConfiguracao; overload;
    function TipoCertificado: Integer; overload;
    function APIVersion(Value: String): IConfiguracao; overload;
    function APIVersion: String; overload;
    function APIVersao(Value: Integer): IConfiguracao; overload;
    function APIVersao: Integer; overload;
    function ChavePIX(Value: String): IConfiguracao; overload;
    function ChavePIX: String; overload;
    function ConsumerKey(Value: String): IConfiguracao; overload;
    function ConsumerKey: String; overload;
    function ConsumerSecret(Value: String): IConfiguracao; overload;
    function ConsumerSecret: String; overload;
    function ClientID(Value: String): IConfiguracao; overload;
    function ClientID: String; overload;
    function ClientSecret(Value: String): IConfiguracao; overload;
    function ClientSecret: String; overload;
    function DeveloperApplication(Value: String): IConfiguracao; overload;
    function DeveloperApplication: String; overload;
    function AccessKey(Value: String): IConfiguracao; overload;
    function AccessKey: String; overload;
    function CNPJ(Value: String): IConfiguracao; overload;
    function CNPJ: String; overload;
    function AccountId(Value: String): IConfiguracao; overload;
    function AccountId: String; overload;
    function AccessToken(Value: String): IConfiguracao; overload;
    function AccessToken: String; overload;
    function Certificado(Value: string): IConfiguracao; overload;
    function Certificado: String; overload;
    function CertificadoRoot(Value: string): IConfiguracao; overload;
    function CertificadoRoot: String; overload;
    function Senha(Value: string): IConfiguracao; overload;
    function Senha: String; overload;
    function ChavePrivada(Value: string): IConfiguracao; overload;
    function ChavePrivada: String; overload;
    function Token(Value: string): IConfiguracao; overload;
    function Token: String; overload;
    function MediatorFee(Value: Currency): IConfiguracao; overload;
    function MediatorFee: Currency; overload;
    function SecretKey(Value: String): IConfiguracao; overload;
    function SecretKey: String; overload;
  end;

implementation

{ TConfiguracao }

function TConfiguracao.AccessKey(Value: String): IConfiguracao;
begin
  Result := Self;
  FAccessKey := Value;
end;

function TConfiguracao.AccessKey: String;
begin
  Result := FAccessKey;
end;

function TConfiguracao.AccessToken: String;
begin
  Result := FAccessToken;
end;

function TConfiguracao.AccessToken(Value: String): IConfiguracao;
begin
  Result := Self;
  FAccessToken := Value;
end;

function TConfiguracao.AccountId(Value: String): IConfiguracao;
begin
  Result := Self;
  FAccountId := Value;
end;

function TConfiguracao.AccountId: String;
begin
  Result := FAccountId;
end;

function TConfiguracao.Ambiente(Value: Integer): IConfiguracao;
begin
  Result := Self;
  FAmbiente := Value;
end;

function TConfiguracao.Ambiente: Integer;
begin
  Result := FAmbiente;
end;

function TConfiguracao.APIVersion(Value: String): IConfiguracao;
begin
  Result := Self;
  FAPIVersion := Value;
end;

function TConfiguracao.APIVersao: Integer;
begin
  Result := FAPIVersao;
end;

function TConfiguracao.APIVersao(Value: Integer): IConfiguracao;
begin
  Result := Self;
  FAPIVersao := Value;
end;

function TConfiguracao.APIVersion: String;
begin
  Result := FAPIVersion;
end;

function TConfiguracao.ArqLog: String;
begin
  Result := FArqLog;
end;

function TConfiguracao.ArqLog(Value: String): IConfiguracao;
begin
  Result := Self;
  FArqLog := VAlue;
end;

function TConfiguracao.ChavePIX(Value: String): IConfiguracao;
begin
  Result := Self;
  FChavePIX := Value;
end;

function TConfiguracao.Cep(Value: String): IConfiguracao;
begin
  Result := Self;
  FCep := Value;
end;

function TConfiguracao.Cep: String;
begin
  Result := FCep;
end;

function TConfiguracao.Certificado: String;
begin
  Result := FCertificado;
end;

function TConfiguracao.Certificado(Value: string): IConfiguracao;
begin
  Result := Self;
  FCertificado := Value;
end;

function TConfiguracao.CertificadoRoot(Value: string): IConfiguracao;
begin
  Result := Self;
  FCertificadoRoot := Value;
end;

function TConfiguracao.CertificadoRoot: String;
begin
  Result := FCertificadoRoot;
end;

function TConfiguracao.ChavePIX: String;
begin
  Result := FChavePIX;
end;

function TConfiguracao.ChavePrivada(Value: string): IConfiguracao;
begin
  Result := Self;
  FChavePrivada := Value;
end;

function TConfiguracao.ChavePrivada: String;
begin
  Result := FChavePrivada;
end;

function TConfiguracao.Cidade: String;
begin
  Result := FCidade;
end;

function TConfiguracao.Cidade(Value: String): IConfiguracao;
begin
  Result := Self;
  FCidade := Value;
end;

function TConfiguracao.ClientID(Value: String): IConfiguracao;
begin
  Result := Self;
  FClientID := Value;
end;

function TConfiguracao.ClientID: String;
begin
  Result := FClientID;
end;

function TConfiguracao.ClientSecret: String;
begin
  Result := FClientSecret;
end;

function TConfiguracao.ClientSecret(Value: String): IConfiguracao;
begin
  Result := Self;
  FClientSecret := Value;
end;

function TConfiguracao.CNPJ(Value: String): IConfiguracao;
begin
  Result := Self;
  FCNPJ := Value;
end;

function TConfiguracao.CNPJ: String;
begin
  Result := FCNPJ;
end;

function TConfiguracao.ConsumerKey(Value: String): IConfiguracao;
begin
  Result := Self;
  FConsumerKey := Value;
end;

function TConfiguracao.ConsumerKey: String;
begin
  Result := FConsumerKey;
end;

function TConfiguracao.ConsumerSecret(Value: String): IConfiguracao;
begin
  Result := Self;
  FConsumerSecret := Value;
end;

function TConfiguracao.ConsumerSecret: String;
begin
  Result := FConsumerSecret;
end;

function TConfiguracao.DeveloperApplication(Value: String): IConfiguracao;
begin
  Result := Self;
  FDeveloperApplication := Value;
end;

function TConfiguracao.DeveloperApplication: String;
begin
  Result := FDeveloperApplication;
end;

function TConfiguracao.Estado: String;
begin
  Result := FEstado;
end;

function TConfiguracao.Estado(Value: String): IConfiguracao;
begin
  Result := Self;
  FEstado := Value;
end;

function TConfiguracao.Host(Value: String): IConfiguracao;
begin
  Result := Self;
  FEstado := Value;
end;

function TConfiguracao.Host: String;
begin
  Result := FHost;
end;

function TConfiguracao.MediatorFee: Currency;
begin
  Result := FMediatorFee;
end;

function TConfiguracao.MediatorFee(Value: Currency): IConfiguracao;
begin
  Result := Self;
  FMediatorFee := Value;
end;

class function TConfiguracao.New: IConfiguracao;
begin
  Result := Self.Create;
end;

function TConfiguracao.NivelLog(Value: String): IConfiguracao;
begin
  Result := Self;
  FNivelLog := Value;
end;

function TConfiguracao.NivelLog: String;
begin
  Result := FNivelLog;
end;

function TConfiguracao.Nome: String;
begin
  Result := FNome;
end;

function TConfiguracao.Nome(Value: String): IConfiguracao;
begin
  Result := Self;
  FNome := Value;
end;

//function TConfiguracao.PSP(Value: TTipoPSP): IConfiguracao;
//begin
//  Result := Self;
//  FPSP := Value;
//end;

function TConfiguracao.Pass: String;
begin
  Result := FPass;
end;

function TConfiguracao.Pass(Value: String): IConfiguracao;
begin
  Result := Self;
  FPass := Value;
end;

function TConfiguracao.Port: String;
begin
  Result := FPort;
end;

function TConfiguracao.Port(Value: String): IConfiguracao;
begin
  Result := Self;
  FPort := Value;
end;

//function TConfiguracao.PSP: TTipoPSP;
//begin
//  Result := FPSP;
//end;

function TConfiguracao.SecretKey: String;
begin
  result := FSecretKey;
end;

function TConfiguracao.SecretKey(Value: String): IConfiguracao;
begin
  Result := Self;
  FSecretKey := Value;
end;

function TConfiguracao.Senha: String;
begin
  Result := FSenha;
end;

function TConfiguracao.Senha(Value: string): IConfiguracao;
begin
  Result := Self;
  FSenha := Value;
end;

function TConfiguracao.Timeout: Integer;
begin
  Result := FTimeout;
end;

function TConfiguracao.TipoCertificado: Integer;
begin
  Result := FTipoCertificado;
end;

function TConfiguracao.TipoCertificado(Value: Integer): IConfiguracao;
begin
  Result := Self;
  FTipoCertificado := Value;
end;

function TConfiguracao.Timeout(Value: Integer): IConfiguracao;
begin
  Result := Self;
  FTimeout := Value;
end;

function TConfiguracao.Token: String;
begin
  Result := FToken;
end;

function TConfiguracao.Token(Value: string): IConfiguracao;
begin
  Result := Self;
  FToken := Value;
end;

function TConfiguracao.User: String;
begin
  Result := FUser;
end;

function TConfiguracao.User(Value: String): IConfiguracao;
begin
  Result := Self;
  Fuser := Value;
end;

end.
