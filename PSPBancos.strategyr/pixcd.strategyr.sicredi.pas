unit pixcd.strategyr.sicredi;

interface

uses
  ACBrPIXCD,
  ACBrPIXPSPSicredi,
  pixcd.interfaces;

type
  TStrategySicredi = class(TInterfacedObject, IStrategy)
  private
    FPSP: TACBrPSPSicredi;

    constructor Create(Conf: IConfiguracao);
    destructor Destroy; override;
  public
    class function New(Conf: IConfiguracao): IStrategy;

    function PSP: TACBrPSP;
  end;

implementation

{ TStrategySicredi }

constructor TStrategySicredi.Create(Conf: IConfiguracao);
begin
  FPSP := TACBrPSPSicredi.Create(nil);

  FPSP.ChavePIX := Conf.ChavePIX;
  FPSP.ClientID := Conf.ClientID;
  FPSP.ClientSecret := Conf.ClientSecret;
  FPSP.ArquivoChavePrivada := Conf.ChavePrivada;
  FPSP.ArquivoCertificado := Conf.Certificado;
end;

destructor TStrategySicredi.Destroy;
begin
  FPSP.Free;
  inherited;
end;

class function TStrategySicredi.New(Conf: IConfiguracao): IStrategy;
begin
  Result := Self.Create(Conf);
end;

function TStrategySicredi.PSP: TACBrPSP;
begin
  Result := FPSP;
end;

end.
