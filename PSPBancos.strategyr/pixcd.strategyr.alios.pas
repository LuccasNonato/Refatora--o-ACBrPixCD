unit pixcd.strategyr.alios;

interface

uses
  ACBrPIXCD,
  ACBrPIXPSPAilos,
  pixcd.interfaces;

type
  TStrategyAlios = class(TInterfacedObject, IStrategy)
  private
    FPSP: TACBrPSPAilos;

    constructor Create(Conf: IConfiguracao);
    destructor Destroy; override;
  public
    class function New(Conf: IConfiguracao): IStrategy;

    function PSP: TACBrPSP;
  end;

implementation

{ TStrategyAlios }

constructor TStrategyAlios.Create(Conf: IConfiguracao);
begin
  FPSP := TACBrPSPAilos.Create(nil);

  FPSP.ChavePIX := Conf.ChavePIX;
  FPSP.ClientID := Conf.ClientID;
  FPSP.ClientSecret := Conf.ClientSecret;
  FPSP.ArquivoChavePrivada := Conf.ChavePrivada;
  FPSP.ArquivoCertificado := Conf.Certificado;
  FPSP.RootCrt := Conf.CertificadoRoot;
end;

destructor TStrategyAlios.Destroy;
begin
  FPSP.Free;
  inherited;
end;

class function TStrategyAlios.New(Conf: IConfiguracao): IStrategy;
begin
  Result := Self.Create(Conf);
end;

function TStrategyAlios.PSP: TACBrPSP;
begin
  Result := FPSP;
end;

end.

