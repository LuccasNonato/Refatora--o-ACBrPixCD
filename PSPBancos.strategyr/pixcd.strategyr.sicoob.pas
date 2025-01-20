unit pixcd.strategyr.sicoob;

interface

uses
  ACBrPIXCD,
  ACBrPIXPSPSicoob,
  pixcd.interfaces;

type
  TStrategySicoob = class(TInterfacedObject, IStrategy)
  private
    FPSP: TACBrPSPSicoob;

    constructor Create(Conf: IConfiguracao);
    destructor Destroy; override;
  public
    class function New(Conf: IConfiguracao): IStrategy;

    function PSP: TACBrPSP;
  end;

implementation

{ TStrategySicoob }

constructor TStrategySicoob.Create(Conf: IConfiguracao);
begin
  FPSP := TACBrPSPSicoob.Create(nil);

  FPSP.ChavePIX := Conf.ChavePIX;
  FPSP.ClientID := Conf.ClientID;
  FPSP.TokenSandbox := Conf.Token;
  FPSP.ArquivoChavePrivada := Conf.ChavePrivada;
  FPSP.ArquivoCertificado := Conf.Certificado;
end;

destructor TStrategySicoob.Destroy;
begin
  FPSP.Free;
  inherited;
end;

class function TStrategySicoob.New(Conf: IConfiguracao): IStrategy;
begin
  Result := Self.Create(Conf);
end;

function TStrategySicoob.PSP: TACBrPSP;
begin
  Result := FPSP;
end;

end.
