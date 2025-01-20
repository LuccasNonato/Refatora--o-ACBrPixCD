unit pixcd.strategyr.pagseguro;

interface

uses
  ACBrPIXCD,
  ACBrPIXPSPPagSeguro,
  pixcd.interfaces;

type
  TStrategyPagSeguro = class(TInterfacedObject, IStrategy)
  private
    FPSP: TACBrPSPPagSeguro;

    constructor Create(Conf: IConfiguracao);
    destructor Destroy; override;
  public
    class function New(Conf: IConfiguracao): IStrategy;

    function PSP: TACBrPSP;
  end;

implementation

{ TStrategyPagSeguro }

constructor TStrategyPagSeguro.Create(Conf: IConfiguracao);
begin
  FPSP := TACBrPSPPagSeguro.Create(nil);

  FPSP.ChavePIX := Conf.ChavePIX;
  FPSP.ClientID := Conf.ClientID;
  FPSP.ClientSecret := Conf.ClientSecret;
  FPSP.ArquivoChavePrivada := Conf.ChavePrivada;
  FPSP.ArquivoCertificado := Conf.Certificado;
end;

destructor TStrategyPagSeguro.Destroy;
begin
  FPSP.Free;
  inherited;
end;

class function TStrategyPagSeguro.New(Conf: IConfiguracao): IStrategy;
begin
  Result := Self.Create(Conf);
end;

function TStrategyPagSeguro.PSP: TACBrPSP;
begin
  Result := FPSP;
end;

end.
