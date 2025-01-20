unit Principal.Controller;

interface

uses
  pixcd.interfaces, pixcd.contexto, pixcd.configuracao;

Type
  TController = class(TInterfacedObject, IController)
    private
     FConfiguracao: IConfiguracao;
     FContexto: IContexto;
    public
      constructor Create;
      destructor  Destroy; override;
      class function New : iController;
     function Configuracao: IConfiguracao;
     function Contexto: IContexto;
    end;
implementation

{ TController }

function TController.Configuracao: IConfiguracao;
begin
  Result := FConfiguracao;
end;

function TController.Contexto: IContexto;
begin
  if not Assigned(FContexto) then
    FContexto := TContexto.New(FConfiguracao);

  Result := FContexto;
end;

constructor TController.Create;
begin
   FConfiguracao := TConfiguracao.New;
end;

destructor TController.Destroy;
begin

  inherited;
end;

class function TController.New: iController;
begin
  Result := Self.Create;
end;

end.
