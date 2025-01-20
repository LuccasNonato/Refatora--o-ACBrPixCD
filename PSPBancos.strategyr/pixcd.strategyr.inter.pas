unit pixcd.strategyr.inter;

interface

uses
  ACBrPIXCD,
  ACBrPIXPSPInter,
  pixcd.interfaces;

type
  TStrategyInter = class(TInterfacedObject, IStrategy)
  private
    FPSP: TACBrPSPInter;

    constructor Create(Conf: IConfiguracao);
    destructor Destroy; override;
  public
    class function New(Conf: IConfiguracao): IStrategy;

    function PSP: TACBrPSP;
  end;

implementation

{ TStrategyInter }

constructor TStrategyInter.Create(Conf: IConfiguracao);
begin
  FPSP := TACBrPSPInter.Create(nil);

  FPSP.ChavePIX := Conf.ChavePIX;
  FPSP.ClientID := Conf.ClientID;
  FPSP.ClientSecret := Conf.ClientSecret;
  FPSP.ArquivoChavePrivada := Conf.ChavePrivada;
  FPSP.ArquivoCertificado := Conf.Certificado;
end;

destructor TStrategyInter.Destroy;
begin
  FPSP.Free;
  inherited;
end;

class function TStrategyInter.New(Conf: IConfiguracao): IStrategy;
begin
  Result := Self.Create(Conf);
end;

function TStrategyInter.PSP: TACBrPSP;
begin
  Result := FPSP;
end;

end.
