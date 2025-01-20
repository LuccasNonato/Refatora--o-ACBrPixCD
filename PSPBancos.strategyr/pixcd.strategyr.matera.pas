unit pixcd.strategyr.matera;

interface

uses
  ACBrPIXCD,
  ACBrPIXPSPMatera,
  pixcd.interfaces;

type
  TStrategyMatera = class(TInterfacedObject, IStrategy)
  private
    FPSP: TACBrPSPMatera;

    constructor Create(Conf: IConfiguracao);
    destructor Destroy; override;
  public
    class function New(Conf: IConfiguracao): IStrategy;

    function PSP: TACBrPSP;
  end;

implementation

uses
  System.SysUtils;

constructor TStrategyMatera.Create(Conf: IConfiguracao);
begin
  FPSP := TACBrPSPMatera.Create(nil);

  FPSP.ChavePIX := Conf.ChavePIX;
  FPSP.ClientID := Conf.ClientID;
  FPSP.AccountId := Conf.AccountId;
  FPSP.SecretKey := Conf.SecretKey;
  FPSP.MediatorFee := Conf.MediatorFee;
  FPSP.ClientSecret := Conf.ClientSecret;
  FPSP.ArquivoCertificado := Conf.Certificado;
  FPSP.ArquivoChavePrivada := Conf.ChavePrivada;
end;

destructor TStrategyMatera.Destroy;
begin
  FPSP.Free;
  inherited;
end;

class function TStrategyMatera.New(Conf: IConfiguracao): IStrategy;
begin
  Result := Self.Create(Conf);
end;

function TStrategyMatera.PSP: TACBrPSP;
begin
  Result := FPSP;
end;

end.
