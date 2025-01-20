unit pixcd.interfaces;
interface
uses
  ACBrPIXCD,
  enumerados,
  system.JSON,
  system.Classes;
type
  IPIXCD = interface;

  IConfiguracao = interface
    ['{C076A76B-C830-4F01-A167-AA4DB10A246E}']
    //tipo do psp
//    function PSP(Value: TTipoPSP): IConfiguracao; overload;
//    function PSP: TTipoPSP; overload;
    //configuracao recebedor
    function Nome(Value: String): IConfiguracao; overload;
    function Nome: String; overload;
    function Cep(Value: String): IConfiguracao; overload;
    function Cep: String; overload;
    function Cidade(Value: String): IConfiguracao; overload;
    function Cidade: String; overload;
    function Estado(Value: String): IConfiguracao; overload;
    function Estado: String; overload;

    //configuracao do psp
    function Ambiente(Value: Integer): IConfiguracao; overload;
    function Ambiente: Integer; overload;
    function Timeout(Value: Integer): IConfiguracao; overload;
    function Timeout: Integer; overload;

    //configuracao proxy
    function Host(Value: String): IConfiguracao; overload;
    function Host: String; overload;
    function Port(Value: String): IConfiguracao; overload;
    function Port: String; overload;
    function User(Value: String): IConfiguracao; overload;
    function User: String; overload;
    function Pass(Value: String): IConfiguracao; overload;
    function Pass: String; overload;

    //configuracao log
    function ArqLog(Value: String): IConfiguracao; overload;
    function ArqLog: String; overload;
    function NivelLog(Value: String): IConfiguracao; overload;
    function NivelLog: String; overload;

    //psps
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

  IStrategy = interface
    ['{0BCFCFDB-265A-4E9F-AF2E-5F578FEE2D14}']
    function PSP: TACBrPSP;
  end;

  IContexto = interface
    ['{54A59CDD-0E43-4E01-9F00-A9DB5254703F}']
    function Execute(Value: TTipoPSP): IStrategy;
  end;

  IController = interface
    ['{1A42FB34-02ED-4C85-841B-4446B12FD306}']
    function Configuracao: IConfiguracao;
    function Pix : iPIXCD;
  end;

  IBancoDoBrasil = interface
    ['{3A7CBF4A-DB68-4B70-8987-3BCABF024A1A}']
    procedure QuandoReceberRespostaHttp(const AURL: String; const AMethod: String; RespHeaders: TStrings; var AResultCode: Integer; var RespostaHttp: AnsiString);
  end;

 IPIXCD = interface
    ['{9ABBC76B-EE4D-45A8-A937-54EC592AA1B9}']
    function ConsultaPix(Value : string) : IPIXCD;
    function ConsultaPixRecebidos(DataInicio, DataFinal : TDateTime; Pagina, ItensPagina: Integer; TxID, CPFCNPJ: String) : IPIXCD;
    function ConsultarCobrancaImediata(TxID: string) : IPIXCD;
    function ConsultarCobrancas(DataInicio, DataFinal : TDateTime; Pagina, ItensPagina: Integer; CPFCNPJ: String; Status: Integer; ComLocalizacao: Boolean = False) : IPIXCD;
    function ConsultarDevolucao(IDPix, IDDevolucao: string) : IPIXCD;
    function ConsultarCobrancaVencimento(TxID: string; Revisao: Integer) : IPIXCD;
    function SolicitarDevolucao(IDPix, IDDevolucao, Descricao: string; Natureza: Integer; Valor: Currency) : IPIXCD;
    function CriarCobrancaImediata(Devedor, CPFCNPJ, Pagador, TxID: string;Valor: Currency; Podealterarvalor: Boolean = False) : IPIXCD;
    function CancelarCobrancas(TxID: string) : IPIXCD;
    function CriarCobrancaVencimento(Nome, CPFCNPJ: string;
                                     DescontoModalidade: Integer; DescontoValor: Currency;
                                     JurosModalidade: Integer; JurosValor: Currency;
                                     MultaModalidade: Integer; MultaValor: Currency;
                                     Vencimento: TDateTime; DiasPagar: Integer; Valor : Currency) : IPIXCD;
    function SimularPagamentoPIX(CopiaCola: string; Codigo: Integer): string;
    function Retorno: string;
    function JSON: TJSONObject;
    function Jsonarray: TJSONArray;
  end;




implementation
end.
