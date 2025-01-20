unit pixcd.consultar.controller;

interface

uses
  pixcd.interfaces, ACBrPixCD, ACBrUtil, ACBrCEP, ACBrOpenSSLUtils,
  ACBrPIXBase, ACBrPIXBRCode, ACBrSocket, ACBrBase, system.JSON, system.SysUtils;

Type
  TConsultarPix = class(TInterfacedObject, iPixCD)
    private
     ACBrPixCD : TACBrPixCD;
     function  FormatarJSON(const AJSON: String): String;

    public
      constructor Create;
      destructor  Destroy; override;
      class function New : iPixCD;
      function ConsultarPix(Value: String): String;

    end;
implementation

 uses
  {$IfDef FPC}
   fpjson, jsonparser, jsonscanner,
  {$EndIf}
  TypInfo, IniFiles, DateUtils, synacode, synautil, pcnConversao,
  ACBrDelphiZXingQRCode, ACBrImage, ACBrValidador, ACBrPIXUtil, ACBrConsts,
  ACBrPIXSchemasCobV, OpenSSLExt,
  ACBrJSON,
  ACBrUtil.Base,
  ACBrUtil.FilesIO,
  ACBrUtil.Strings,
  ACBrUtil.DateTime,
  ACBrUtil.Compatibilidade,
  Jsons;

{$R *.dfm}


{ TConsultarPix }

function TConsultarPix.ConsultarPix(Value: String): String;
begin
  if ACBrPixCD.PSP.epPix.ConsultarPix(Value) then
  begin
    Result := FormatarJSON(ACBrPixCD.PSP.epPix.Pix.AsJSON);
    MostrarPixEmLinhas('  Pix', ACBrPixCD.PSP.epPix.Pix, mConsultarPix.Lines);
  end
  else
    mConsultarPix.Lines.Text := FormatarJSON(ACBrPixCD.PSP.epPix.Problema.AsJSON);
end;

constructor TConsultarPix.Create;
begin

end;

destructor TConsultarPix.Destroy;
begin

  inherited;
end;

function TConsultarPix.FormatarJSON(const AJSON: String): String;
var
  JSONValue: TJSONValue;
begin
  Result := AJSON; // Retorna o JSON original por padrão
  try
    // Tenta interpretar a string JSON
    JSONValue := System.JSON.TJSONObject.ParseJSONValue(AJSON);
    try
      if Assigned(JSONValue) then
      begin
        // Retorna o JSON formatado (com indentação)
        Result := JSONValue.ToJSON;
      end;
    finally
      JSONValue.Free; // Libera a memória alocada
    end;
  except
    on E: Exception do
    begin
      // Em caso de erro, mantém o JSON original
      Result := AJSON;
    end;
  end;
end;


class function TConsultarPix.New: iPixCD;
begin
  Result := Self.Create;
end;

end.
