unit pixcd.strategyr.santander;

interface

uses
  ACBrPIXCD,
  ACBrPIXPSPSantander,
  pixcd.interfaces;

type
  TStrategySantander = class(TInterfacedObject, IStrategy)
  private
    FPSP: TACBrPSPSantander;

    constructor Create(Conf: IConfiguracao);
    destructor Destroy; override;
  public
    class function New(Conf: IConfiguracao): IStrategy;

    function PSP: TACBrPSP;
  end;

implementation

{ TStrategySantander }

constructor TStrategySantander.Create(Conf: IConfiguracao);
begin
  FPSP := TACBrPSPSantander.Create(nil);

  FPSP.ChavePIX := Conf.ChavePIX;
  FPSP.ConsumerKey := Conf.ConsumerKey;
  FPSP.ConsumerSecret := Conf.ConsumerSecret;
  FPSP.SenhaPFX := Conf.Senha;
  FPSP.ArquivoPFX := Conf.Certificado;
end;

destructor TStrategySantander.Destroy;
begin
  FPSP.Free;
  inherited;
end;

class function TStrategySantander.New(Conf: IConfiguracao): IStrategy;
begin
  Result := Self.Create(Conf);
end;

function TStrategySantander.PSP: TACBrPSP;
begin
  Result := FPSP;
end;

end.
