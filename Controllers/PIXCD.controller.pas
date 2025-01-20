unit PIXCD.controller;

interface

uses
  system.JSON,
  pixcd.interfaces,
  ACBrPIXCD,
  ACBrPIXBase,
  system.Classes,
  ACBrJSON,
  System.SysUtils,
  System.AnsiStrings,
  ACBrUtil.Strings;

Type
  TPIXCD = class(TInterfacedObject, IPIXCD)
    private
      FACBrPIXCD : TACBrPixCD;
      FContexto: IContexto;
      FRetorno: string;
      FJSON: TJSONObject;
      FJSONArray: TJSONArray;
    public
      constructor Create(Contexto: IContexto);
      destructor  Destroy; override;
      class function New(Contexto: IContexto) : IPIXCD;

      function ConsultaPix(Value : string) : IPIXCD;
      function ConsultaPixRecebidos(DataInicio, DataFinal : TDateTime; Pagina, ItensPagina: Integer; TxID, CPFCNPJ: String) : IPIXCD;
      function ConsultarCobrancaImediata(TxID: string) : IPIXCD;
      function ConsultarCobrancas(DataInicio, DataFinal : TDateTime; Pagina, ItensPagina: Integer; CPFCNPJ: String; Status: Integer; ComLocalizacao: Boolean = False) : IPIXCD;
      function ConsultarDevolucao(IDPix, IDDevolucao: string) : IPIXCD;
      function ConsultarCobrancaVencimento(TxID: string; Revisao: Integer) : IPIXCD;

      function SolicitarDevolucao(IDPix, IDDevolucao, Descricao: string; Natureza: Integer; Valor: Currency) : IPIXCD;
      function CriarCobrancaImediata(Devedor, CPFCNPJ, Pagador, TxID: string;Valor: Currency; Podealterarvalor: Boolean = False) : IPIXCD;
      function CancelarCobrancas(TxID: string) : IPIXCD;
      function CriarCobrancaVencimento(Nome, CPFCNPJ: string;
                                     DescontoModalidade: Integer; DescontoValor: Currency;
                                     JurosModalidade: Integer; JurosValor: Currency;
                                     MultaModalidade: Integer; MultaValor: Currency;
                                     Vencimento: TDateTime; DiasPagar: Integer; Valor : Currency) : IPIXCD;
      function SimularPagamentoPIX(CopiaCola: string; Codigo: Integer): string;
      function Retorno: string;
      function JSON: TJSONObject;
      function Jsonarray: TJSONArray;

    end;
implementation

uses
  system.DateUtils,
  ACBrUtil;

{ TPIXCD }

function TPIXCD.CancelarCobrancas(TxID: string): IPIXCD;
begin

end;

function TPIXCD.ConsultaPix(Value: string): IPIXCD;
begin
  Result := Self;
  if FACBrPixCD.PSP.epPix.ConsultarPix(Value) then
  begin
    FRetorno := FACBrPixCD.PSP.epPix.Pix.AsJSON;
//    MostrarPixEmLinhas('  Pix', FACBrPixCD.PSP.epPix.Pix, mConsultarPix.Lines);
  end
  else
    FRetorno := FACBrPixCD.PSP.epPix.Problema.AsJSON;
end;

function TPIXCD.ConsultaPixRecebidos(DataInicio, DataFinal: TDateTime; Pagina,
  ItensPagina: Integer; TxID, CPFCNPJ: String): IPIXCD;
var
  Ok: Boolean;
begin
  Result := Self;
  Ok := FACBrPixCD.PSP.epPix.ConsultarPixRecebidos(
          StartOfTheDay(DataInicio),
          EndOfTheDay(DataFinal),
          TxID,
          OnlyNumber(CPFCNPJ),
          Pagina,
          ItensPagina);

  if Ok then
  begin
    FRetorno := FACBrPixCD.PSP.epPix.PixConsultados.AsJSON;
  end
  else
    FRetorno := FACBrPixCD.PSP.epPix.Problema.AsJSON;
end;

function TPIXCD.ConsultarCobrancaImediata(TxID: string): IPIXCD;
begin

end;

function TPIXCD.ConsultarCobrancas(DataInicio, DataFinal: TDateTime; Pagina,
  ItensPagina: Integer; CPFCNPJ: String; Status: Integer;
  ComLocalizacao: Boolean): IPIXCD;
begin

end;

function TPIXCD.ConsultarCobrancaVencimento(TxID: string;
  Revisao: Integer): IPIXCD;
begin

end;

function TPIXCD.ConsultarDevolucao(IDPix, IDDevolucao: string): IPIXCD;
begin

end;

constructor TPIXCD.Create(Contexto: IContexto);
begin
  FContexto := Contexto;
  FACBrPIXCD := TACBrPixCD.Create(nil);
end;

function TPIXCD.CriarCobrancaImediata(Devedor, CPFCNPJ, Pagador, TxID: string;
  Valor: Currency; Podealterarvalor: Boolean): IPIXCD;
begin

end;

function TPIXCD.CriarCobrancaVencimento(Nome, CPFCNPJ: string;
  DescontoModalidade: Integer; DescontoValor: Currency;
  JurosModalidade: Integer; JurosValor: Currency; MultaModalidade: Integer;
  MultaValor: Currency; Vencimento: TDateTime; DiasPagar: Integer;
  Valor: Currency): IPIXCD;
begin

end;

destructor TPIXCD.Destroy;
begin
  FACBrPIXCD.Free;
  inherited;
end;

function TPIXCD.JSON: TJSONObject;
begin
  Result := FJSON;
end;

function TPIXCD.Jsonarray: TJSONArray;
begin
  Result := FJSONArray;
end;

class function TPIXCD.New(Contexto: IContexto): IPIXCD;
begin
  Result := Self.Create(Contexto);
end;

function TPIXCD.SolicitarDevolucao(IDPix, IDDevolucao, Descricao: string;
  Natureza: Integer; Valor: Currency): IPIXCD;
var
 FValor: Currency;
 FNatureza: TACBrPIXNaturezaDevolucao;
 FDescricao: string;  
begin
  Result := Self;

  with FACBrPixCD.PSP.epPix.DevolucaoSolicitada do
  begin
    Clear;
    FValor := Valor;
    FNatureza := TACBrPIXNaturezaDevolucao(Natureza);
    FDescricao := Descricao;
  end;

  if FACBrPixCD.PSP.epPix.SolicitarDevolucaoPix( IDPix,
                                                 IDDevolucao) then
  begin
    FRetorno := FACBrPixCD.PSP.epPix.Devolucao.AsJSON;
  end
  else
    FRetorno := FACBrPixCD.PSP.epPix.Problema.AsJSON;
end;

function TPIXCD.SimularPagamentoPIX(CopiaCola: string; Codigo: Integer): string;
//var
//  Body, AURL: String;
//  RespostaHttp: AnsiString;
//  ResultCode: Integer;
//  js: TACBrJSONObject;
begin
//  if (Trim(pixCopiaECola) = '') then
//    raise EACBrPixException.CreateFmt(ACBrStr(sErroParametroInvalido), ['pixCopiaECola']);
//
//  js := TACBrJSONObject.Create;
//  try
//    js.AddPair('pix', pixCopiaECola);
//    Body := js.ToJSON;
//  finally
//    js.Free;
//  end;
//
//  PrepararHTTP;
//  WriteStrToStream(Http.Document, Body);
//  Http.MimeType := CContentTypeApplicationJSon;
//  ConfigurarAutenticacao(ChttpMethodPOST, cBBEndPointPagarPix);
//  AURL := cBBURLSandboxPagarPix + '?' + cBBParamAppKey + '=' + cBBKeySandboxPagarPix;
//
//  TransmitirHttp(ChttpMethodPOST, AURL, ResultCode, RespostaHttp);
//  if (ResultCode = HTTP_OK) then
//  begin
//    js := TACBrJSONObject.Parse(RespostaHttp);
//    try
//      code := js.AsInteger['code'];
//      texto := js.AsString['texto'];
//    finally
//      js.Free;
//    end;
//
//    if (code <> 0) then
//      DispararExcecao(EACBrPixHttpException.Create('Code: '+
//        IntToStr(code) +' - '+ UTF8ToNativeString(texto)));
//  end
//  else
//    DispararExcecao(EACBrPixHttpException.CreateFmt( sErroHttp,
//       [Http.ResultCode, ChttpMethodPOST, AURL]));
end;

end.

end.
