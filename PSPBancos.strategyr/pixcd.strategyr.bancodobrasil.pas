unit pixcd.strategyr.bancodobrasil;

interface

uses
  ACBrPIXCD,
  ACBrPIXPSPBancoDoBrasil,
  pixcd.interfaces, ACBrJSON, System.Classes, ACBrPIXBase, System.AnsiStrings,
  System.SysUtils;

type
  TStrategyBancoDoBrasil = class(TInterfacedObject, IStrategy, IBancoDoBrasil)
  private
    FPSP: TACBrPSPBancoDoBrasil;

    constructor Create(Conf: IConfiguracao);
    destructor Destroy; override;
  public
    class function New(Conf: IConfiguracao): IStrategy;

    procedure QuandoReceberRespostaHttp(const AURL: String; const AMethod: String; RespHeaders: TStrings; var AResultCode: Integer; var RespostaHttp: AnsiString);

    function PSP: TACBrPSP;
  end;

implementation

{ TStrategyBancoDoBrasil }

constructor TStrategyBancoDoBrasil.Create(Conf: IConfiguracao);
begin
  FPSP := TACBrPSPBancoDoBrasil.Create(nil);

  FPSP.ChavePIX := Conf.ChavePIX;
  FPSP.ClientID := COnf.ClientID;
  FPSP.ClientSecret := COnf.ClientSecret;
  FPSP.DeveloperApplicationKey := Conf.DeveloperApplication;
  FPSP.BBAPIVersao := TACBrBBAPIVersao(Conf.APIVersao);
  FPSP.QuandoReceberRespostaHttp := QuandoReceberRespostaHttp;

  if Conf.TipoCertificado = 0 then
  begin
    FPSP.ArquivoPFX := Conf.Certificado;
    FPSP.SenhaPFX := Conf.Senha;
  end
  else
  begin
    FPSP.ArquivoChavePrivada := Conf.ChavePrivada;
    FPSP.ArquivoCertificado := Conf.Certificado;
  end;
end;

destructor TStrategyBancoDoBrasil.Destroy;
begin
  FPSP.Free;
  inherited;
end;

class function TStrategyBancoDoBrasil.New(Conf: IConfiguracao): IStrategy;
begin
  Result := Self.Create(Conf);
end;

function TStrategyBancoDoBrasil.PSP: TACBrPSP;
begin
  Result := FPSP;
end;

procedure TStrategyBancoDoBrasil.QuandoReceberRespostaHttp(const AURL,
  AMethod: String; RespHeaders: TStrings; var AResultCode: Integer;
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
