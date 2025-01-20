unit pixcd.propriedades.BancoDoBrasil;

interface

uses
  pixcd.interfaces,
  ACBrJSON,
  system.Classes, ACBrPIXCD;

Type
  TBancoDoBrasil = class(TInterfacedObject, iBancoDoBrasil)
    private
    public
      constructor Create;
      destructor  Destroy; override;
      class function New : iBancoDoBrasil;
      procedure QuandoReceberRespostaHttp(const AURL: String; const AMethod: String; RespHeaders: TStrings; var AResultCode: Integer; var RespostaHttp: AnsiString);

    end;
implementation

{ TBancoDoBrasil }

constructor TBancoDoBrasil.Create;
begin

end;

destructor TBancoDoBrasil.Destroy;
begin

  inherited;
end;

class function TBancoDoBrasil.New: iBancoDoBrasil;
begin
  Result := Self.Create;
end;

procedure TBancoDoBrasil.QuandoReceberRespostaHttp(const AURL, AMethod: String;
  RespHeaders: TStrings; var AResultCode: Integer;
  var RespostaHttp: AnsiString);
var
  jsRet, js: TACBrJSONObject;
  ja, jsArr: TACBrJSONArray;
  I: Integer;

  function GetDetalhesPagador(aJson: TACBrJSONObject): String;
  var
    jPag: TACBrJSONObject;
  begin
    jPag := aJson.AsJSONObject['pagador'];
    if Assigned(jPag) then
      Result := aJson.AsString['infoPagador'] + ' ' + jPag.AsString['cpf'] +
        jPag.AsString['cnpj'] + ' - ' + jPag.AsString['nome'];
  end;

begin
  if (AMethod = ChttpMethodGET) and (AResultCode = HTTP_OK) and (Pos(cEndPointPix, AURL) > 0) then
  begin
    jsRet := TACBrJSONObject.Parse(String(RespostaHttp));
    jsArr :=  jsRet.AsJSONArray['pix'];
    try
      if Assigned(jsArr) and (jsArr.Count > 0) then
      begin
        ja := TACBrJSONArray.Create;

        for i := 0 to jsArr.Count - 1 do
        begin
          js := jsArr.ItemAsJSONObject[i];
          js.AddPair('infoPagador', GetDetalhesPagador(js));
          ja.AddElementJSONString(js.ToJSON);
        end;
        jsRet.AddPair('pix', ja);
      end
      else
        jsRet.AddPair('infoPagador', GetDetalhesPagador(jsRet));

      RespostaHttp := jsRet.ToJSON;
    finally
      jsRet.Free;
    end;
  end;
end;


end.
