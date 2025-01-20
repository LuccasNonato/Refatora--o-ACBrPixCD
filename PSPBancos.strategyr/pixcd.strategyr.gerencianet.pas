unit pixcd.strategyr.gerencianet;

interface

uses
  ACBrPIXCD,
  ACBrPIXPSPGerenciaNet,
  pixcd.interfaces;

type
  TStrategyGerenciaNet = class(TInterfacedObject, IStrategy)
  private
    FPSP: TACBrPSPGerenciaNet;

    constructor Create(Conf: IConfiguracao);
    destructor Destroy; override;
  public
    class function New(Conf: IConfiguracao): IStrategy;

    function PSP: TACBrPSP;
  end;

implementation

{ TStrategyGerenciaNet }

constructor TStrategyGerenciaNet.Create(Conf: IConfiguracao);
begin
  FPSP := TACBrPSPGerenciaNet.Create(nil);

  FPSP.ChavePIX := Conf.ChavePIX;
  FPSP.ClientID := Conf.ClientID;
  FPSP.ClientSecret := Conf.ClientSecret;
  FPSP.ArquivoPFX := Conf.Certificado;
end;

destructor TStrategyGerenciaNet.Destroy;
begin
  FPSP.Free;
  inherited;
end;

class function TStrategyGerenciaNet.New(Conf: IConfiguracao): IStrategy;
begin
  Result := Self.Create(Conf);
end;

function TStrategyGerenciaNet.PSP: TACBrPSP;
begin
  Result := FPSP;
end;

end.
