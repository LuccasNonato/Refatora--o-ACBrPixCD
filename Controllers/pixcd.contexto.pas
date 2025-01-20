unit pixcd.contexto;

interface

uses
  System.SysUtils,
  System.Generics.Collections,
  pixcd.interfaces,
  enumerados;

type
  TContexto = class(TInterfacedObject, IContexto)
  private
    FConf: IConfiguracao;
    FMap: TDictionary<TTipoPSP, IStrategy>;

    procedure CreateMap;

    constructor Create(Conf: IConfiguracao);
    destructor Destroy; override;
  public
    class function New(Conf: IConfiguracao): IContexto;

    function Execute(Value: TTipoPSP): IStrategy;
  end;

implementation

uses
  pixcd.strategyr.shipay,
  pixcd.strategyr.alios,
  pixcd.strategyr.bancodobrasil,
  pixcd.strategyr.bradesco,
  pixcd.strategyr.cielo,
  pixcd.strategyr.inter,
  pixcd.strategyr.itau,
  pixcd.strategyr.matera,
  pixcd.strategyr.mercadopago,
  pixcd.strategyr.pagseguro,
  pixcd.strategyr.pixpdv,
  pixcd.strategyr.santander,
  pixcd.strategyr.sicoob,
  pixcd.strategyr.sicredi;

{ TContexto }

constructor TContexto.Create(Conf: IConfiguracao);
begin
  FConf := Conf;
  FMap := TDictionary<TTipoPSP, IStrategy>.Create;
end;

procedure TContexto.CreateMap;
begin
  FMap.Add(shipay, TStrategyShipay.New(FConf));
  FMap.Add(alios, TStrategyAlios.New(FConf));
  FMap.Add(bancodobrasil, TStrategyBancoDoBrasil.New(FConf));
  FMap.Add(bradesco, TStrategyBradesco.New(FConf));
  FMap.Add(cielo, TStrategyCielo.New(FConf));
  FMap.Add(inter, TStrategyInter.New(FConf));
  FMap.Add(itau, TStrategyItau.New(FConf));
  FMap.Add(matera, TStrategyMatera.New(FConf));
  FMap.Add(mercadopago, TStrategyMercadoPago.New(FConf));
  FMap.Add(pagseguro, TStrategyPagSeguro.New(FConf));
  FMap.Add(pixpdv, TStrategyPixPDV.New(FConf));
  FMap.Add(santander, TStrategySantander.New(FConf));
  FMap.Add(sicoob, TStrategySicoob.New(FConf));
  FMap.Add(sicredi, TStrategySicredi.New(FConf));
end;

destructor TContexto.Destroy;
begin
  FMap.Free;
  inherited;
end;

function TContexto.Execute(Value: TTipoPSP): IStrategy;
begin
  if not FMap.TryGetValue(Value, Result) then
    raise Exception.Create('Não existe o PSP informado');
end;

class function TContexto.New(Conf: IConfiguracao): IContexto;
begin
  Result := Self.Create(Conf);
end;

end.
