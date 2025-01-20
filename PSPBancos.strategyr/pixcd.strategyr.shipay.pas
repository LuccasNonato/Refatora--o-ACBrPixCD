unit pixcd.strategyr.shipay;

interface

uses
  ACBrPIXCD,
  ACBrPIXPSPShipay,
  pixcd.interfaces;

type
  TStrategyShipay = class(TInterfacedObject, IStrategy)
  private
    FPSP: TACBrPSPShipay;

    constructor Create(Conf: IConfiguracao);
    destructor Destroy; override;
  public
    class function New(Conf: IConfiguracao): IStrategy;

    function PSP: TACBrPSP;
  end;

implementation

{ TStrategyShipay }

constructor TStrategyShipay.Create(Conf: IConfiguracao);
begin
  FPSP := TACBrPSPShipay.Create(nil);

  FPSP.ClientID := Conf.ClientID;
  FPSP.SecretKey := Conf.ClientSecret;
  FPSP.AccessKey := Conf.AccessKey;
end;

destructor TStrategyShipay.Destroy;
begin
  FPSP.Free;
  inherited;
end;

class function TStrategyShipay.New(Conf: IConfiguracao): IStrategy;
begin
  Result := Self.Create(Conf);
end;

function TStrategyShipay.PSP: TACBrPSP;
begin
  Result := FPSP;
end;

end.
