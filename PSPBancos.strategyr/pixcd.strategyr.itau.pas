unit pixcd.strategyr.itau;

interface

uses
  ACBrPIXCD,
  ACBrPIXPSPItau,
  pixcd.interfaces;

type
  TStrategyItau = class(TInterfacedObject, IStrategy)
  private
    FPSP: TACBrPSPItau;

    constructor Create(Conf: IConfiguracao);
    destructor Destroy; override;
  public
    class function New(Conf: IConfiguracao): IStrategy;

    function PSP: TACBrPSP;
  end;

implementation

{ TStrategyItau }

constructor TStrategyItau.Create(Conf: IConfiguracao);
begin
  FPSP := TACBrPSPItau.Create(nil);

  FPSP.ChavePIX := Conf.ChavePIX;
  FPSP.ClientID := COnf.ClientID;
  FPSP.ClientSecret := Conf.ClientSecret;
  FPSP.ChavePrivada := Conf.ChavePrivada;
  FPSP.ArquivoCertificado := Conf.Certificado;
end;

destructor TStrategyItau.Destroy;
begin
  FPSP.Free;
  inherited;
end;

class function TStrategyItau.New(Conf: IConfiguracao): IStrategy;
begin
  Result := Self.Create(Conf);
end;

function TStrategyItau.PSP: TACBrPSP;
begin
  Result := FPSP;
end;

end.
