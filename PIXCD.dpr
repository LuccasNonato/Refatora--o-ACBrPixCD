program PIXCD;
uses
  System.StartUpCopy,
  FMX.Forms,
  principal in 'principal.pas' {Form2},
  enumerados in 'Controllers\enumerados.pas',
  pixcd.contexto in 'Controllers\pixcd.contexto.pas',
  pixcd.interfaces in 'Controllers\pixcd.interfaces.pas',
  pixcd.configuracao in 'Model\pixcd.configuracao.pas',
  pixcd.strategyr.alios in 'PSPBancos.strategyr\pixcd.strategyr.alios.pas',
  pixcd.strategyr.bancodobrasil in 'PSPBancos.strategyr\pixcd.strategyr.bancodobrasil.pas',
  pixcd.strategyr.bradesco in 'PSPBancos.strategyr\pixcd.strategyr.bradesco.pas',
  pixcd.strategyr.cielo in 'PSPBancos.strategyr\pixcd.strategyr.cielo.pas',
  pixcd.strategyr.gerencianet in 'PSPBancos.strategyr\pixcd.strategyr.gerencianet.pas',
  pixcd.strategyr.inter in 'PSPBancos.strategyr\pixcd.strategyr.inter.pas',
  pixcd.strategyr.itau in 'PSPBancos.strategyr\pixcd.strategyr.itau.pas',
  pixcd.strategyr.matera in 'PSPBancos.strategyr\pixcd.strategyr.matera.pas',
  pixcd.strategyr.mercadopago in 'PSPBancos.strategyr\pixcd.strategyr.mercadopago.pas',
  pixcd.strategyr.pagseguro in 'PSPBancos.strategyr\pixcd.strategyr.pagseguro.pas',
  pixcd.strategyr.pixpdv in 'PSPBancos.strategyr\pixcd.strategyr.pixpdv.pas',
  pixcd.strategyr.santander in 'PSPBancos.strategyr\pixcd.strategyr.santander.pas',
  pixcd.strategyr.shipay in 'PSPBancos.strategyr\pixcd.strategyr.shipay.pas',
  pixcd.strategyr.sicoob in 'PSPBancos.strategyr\pixcd.strategyr.sicoob.pas',
  pixcd.strategyr.sicredi in 'PSPBancos.strategyr\pixcd.strategyr.sicredi.pas',
  Main.Controller in 'Controllers\Main.Controller.pas',
  PIXCD.controller in 'Controllers\PIXCD.controller.pas';

{$R *.res}
begin
  Application.Initialize;
  Application.CreateForm(TForm2, Form2);
  Application.Run;
end.
