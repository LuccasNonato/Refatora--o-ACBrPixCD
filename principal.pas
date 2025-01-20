unit principal;
interface
uses
  System.SysUtils, System.Types, System.UITypes, System.Classes, System.Variants,
  FMX.Types, FMX.Controls, FMX.Forms, FMX.Graphics, FMX.Dialogs,
  FMX.Controls.Presentation, FMX.StdCtrls, Main.Controller,
  pixcd.interfaces, enumerados, ACBrPIXCD, pixcd.configuracao,
  ACBrOpenSSLUtils;
type
  TForm2 = class(TForm)
    btn1: TButton;
    procedure btn1Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private
    FController: IController;
  public
    { Public declarations }
  end;
var
  Form2: TForm2;
implementation
{$R *.fmx}
procedure TForm2.btn1Click(Sender: TObject);
begin
//  FController.Pix.ConsultaPix();
//  Consultarpixrecebidos.lines.add(FController.Pix.ConsultaPixRecebidos(parametros).Retorno);


//  Consultarpixrecebidos.lines.add(FController.Pix.Retorno);
end;

procedure TForm2.FormCreate(Sender: TObject);
var
 ConfiguraPix : iConfiguracao;
begin
  FController := TController.New;
  ConfiguraPix := TConfiguracao.New
                               .Nome('Luccas')
                               .Cep('17522-410')
                               .Cidade('Marilia')
                               .Estado('SP')
                               .Ambiente(0)  //ambteste
                               .Timeout(90000)
                               .ArqLog('c:\dev\log.txt')
                               .NivelLog('1')
          //                     .TipoCertificado(0) // Se usa PFX se for 1 usa .PEM E SECRET
        //                       .APIVersion('ver262')
                               //.APIVersao(1) // se for BB apiVersao1 e apiVersao2
                               .ChavePIX('42469202825')
      //                         .ConsumerKey('clientid')  //consumer key
    //                           .ConsumerSecret('clientsecret') //consumer secret
  //                             .ClientID('clientid')
//                               .ClientSecret('ClientSecret')
                          //     .DeveloperApplication('token dev')
                            //   .AccessKey('n')
                            //   .CNPJ('123456789')
                             //  .AccountId('matera') //matera
                            //   .AccessToken('mercado pago') //mercado pago
                             //  .Certificado('ARQUIVO CERTIFICADO ARQUIVOPFX')
                             //  .CertificadoRoot('AILOS')
                          //     .Senha('senhacertificado .pfx')
                         //      .ChavePrivada('.pem')
                               .Token('c1fadde1-8c5c-48dc-b9cd-9329326d28424eed0e3c4df79a2281077c3c2e6e2c24efff-9ae1-4f93-ac3f-04ba91c14879');
//                               .MediatorFee(1) // matera
  //                             .SecretKey('s');

end;

end.
