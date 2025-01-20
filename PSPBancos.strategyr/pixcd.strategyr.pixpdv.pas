unit pixcd.strategyr.pixpdv;

interface

uses
  ACBrPIXCD,
  ACBrPIXPSPPixPDV,
  pixcd.interfaces;

type
  TStrategyPixPDV = class(TInterfacedObject, IStrategy)
  private
    FPSP: TACBrPSPPixPDV;

    constructor Create(Conf: IConfiguracao);
    destructor Destroy; override;
  public
    class function New(Conf: IConfiguracao): IStrategy;

    function PSP: TACBrPSP;
  end;

implementation

{ TStrategyPixPDV }

constructor TStrategyPixPDV.Create(Conf: IConfiguracao);
begin
  FPSP := TACBrPSPPixPDV.Create(nil);

  FPSP.CNPJ := Conf.CNPJ;
  FPSP.Token := Conf.Token;
  FPSP.ClientSecret := Conf.ClientSecret;
end;

destructor TStrategyPixPDV.Destroy;
begin
  FPSP.Free;
  inherited;
end;

class function TStrategyPixPDV.New(Conf: IConfiguracao): IStrategy;
begin
  Result := Self.Create(Conf);
end;

function TStrategyPixPDV.PSP: TACBrPSP;
begin
  Result := FPSP;
end;

end.
