unit pixcd.strategyr.mercadopago;

interface

uses
  ACBrPIXCD,
  ACBrPIXPSPMercadoPago,
  pixcd.interfaces;

type
  TStrategyMercadoPago = class(TInterfacedObject, IStrategy)
  private
    FPSP: TACBrPSPMercadoPago;

    constructor Create(Conf: IConfiguracao);
    destructor Destroy; override;
  public
    class function New(Conf: IConfiguracao): IStrategy;

    function PSP: TACBrPSP;
  end;

implementation

{ TStrategyMercadoPago }

constructor TStrategyMercadoPago.Create(Conf: IConfiguracao);
begin
  FPSP := TACBrPSPMercadoPago.Create(nil);

  FPSP.AccessToken := Conf.Token;
end;

destructor TStrategyMercadoPago.Destroy;
begin
  FPSP.Free;
  inherited;
end;

class function TStrategyMercadoPago.New(Conf: IConfiguracao): IStrategy;
begin
  Result := Self.Create(Conf);
end;

function TStrategyMercadoPago.PSP: TACBrPSP;
begin
  Result := FPSP;
end;

end.
