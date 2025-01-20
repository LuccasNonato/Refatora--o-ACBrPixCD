unit pixcd.strategyr.cielo;

interface

uses
  ACBrPIXCD,
  ACBrPIXPSPCielo,
  pixcd.interfaces;

type
  TStrategyCielo = class(TInterfacedObject, IStrategy)
  private
    FPSP: TACBrPSPCielo;

    constructor Create(Conf: IConfiguracao);
    destructor Destroy; override;
  public
    class function New(Conf: IConfiguracao): IStrategy;

    function PSP: TACBrPSP;
  end;

implementation

{ TStrategyCielo }

constructor TStrategyCielo.Create(Conf: IConfiguracao);
begin
  FPSP := TACBrPSPCielo.Create(nil);

  FPSP.ChavePIX := Conf.ChavePIX;
  FPSP.ClientID := Conf.ClientID;
  FPSP.ClientSecret := Conf.ClientSecret;
end;

destructor TStrategyCielo.Destroy;
begin
  FPSP.Free;
  inherited;
end;

class function TStrategyCielo.New(Conf: IConfiguracao): IStrategy;
begin
  Result := Self.Create(Conf);
end;

function TStrategyCielo.PSP: TACBrPSP;
begin
  Result := FPSP;
end;

end.
