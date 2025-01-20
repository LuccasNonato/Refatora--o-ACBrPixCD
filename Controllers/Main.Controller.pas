unit Main.Controller;

interface

uses
  pixcd.interfaces, pixcd.contexto, pixcd.configuracao, PIXCD.controller;

Type
  TController = class(TInterfacedObject, IController)
    private
     FConfiguracao: IConfiguracao;
     FContexto: IContexto;
     FPix : IPIXCD;
    public
      constructor Create;
      destructor  Destroy; override;
      class function New : iController;
     function Configuracao: IConfiguracao;
//     function Contexto: IContexto;
     function Pix : IPIXCD;
    end;
implementation

{ TController }

function TController.Configuracao: IConfiguracao;
begin
  Result := FConfiguracao;
end;

function TController.Pix : IPIXCD;
begin
  if not Assigned(FPix) then
    FPix := TPIXCD.New(FContexto);

  Result := FPix;
end;

constructor TController.Create;
begin
   FConfiguracao := TConfiguracao.New;
   FContexto := TContexto.New(FConfiguracao);
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
