unit pixcd.strategyr.bradesco;

interface

uses
  ACBrPIXCD,
  ACBrPIXPSPBradesco,
  pixcd.interfaces;

type
  TStrategyBradesco = class(TInterfacedObject, IStrategy)
  private
    FPSP: TACBrPSPBradesco;

    constructor Create(Conf: IConfiguracao);
    destructor Destroy; override;
  public
    class function New(Conf: IConfiguracao): IStrategy;

    function PSP: TACBrPSP;
  end;

implementation

{ TStrategyBradesco }

constructor TStrategyBradesco.Create(Conf: IConfiguracao);
begin
  FPSP := TACBrPSPBradesco.Create(nil);

  FPSP.ChavePIX := Conf.ChavePIX;
  FPSP.ClientID := Conf.ClientID;
  FPSP.ClientSecret := Conf.ClientSecret;
  FPSP.ArquivoPFX := Conf.Certificado;
  FPSP.SenhaPFX := Conf.Senha;
end;

destructor TStrategyBradesco.Destroy;
begin
  FPSP.Free;
  inherited;
end;

class function TStrategyBradesco.New(Conf: IConfiguracao): IStrategy;
begin
  Result := Self.Create(Conf);
end;

function TStrategyBradesco.PSP: TACBrPSP;
begin
  Result := FPSP;
end;

end.
