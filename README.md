Continuação Projeto de refatoração ACBrPixCD apresentado por academia do codigo e ministrado por Alessandro Medeiros aonde todo o codigo, ideias e caminhos dados foi por ele. O projeto em si em suas aulas acabou ficando incompleto aonde ele deixou para os alunos ou utilizadores continuassem a refatoração.



 - 28/07/2025
 - Explicação geral

 -  O projeto em sí é algo bem complexo aonde é preciso um tempinho ali de atenção até entender aonde está cada coisa e cada funcionalidade

 -  apesar da divisão não ser exatamente cada parte em seu devido lugar aonde pegamos primeira mente o nosso MODEL e informamos cada valor
   e após isso criamos nosso controller pegando nossas informacoes do model com cada regra de negocio temos uma interface padrão aonde englobamos
   o model sendo nossa IConfiguracao(MODEL), podemos facilmente pegar essa parte toda e mover para uma pasta especifica caso queira algo bem dividido
   e bem bonito.

   Se olharmos bem estou pegando todos os dados para passar para meu controller, vou dividir dessa forma para criar uma maneira fácil de entender a lógia de quando foi criado.

   UNIT pixcd.interfaces
   <img width="698" height="634" alt="image" src="https://github.com/user-attachments/assets/319da2cc-5ded-4741-be19-a3516bc3952d" />



  Tá, legal mas e o restante desse codigo aqui cara??? 
  <img width="1095" height="762" alt="image" src="https://github.com/user-attachments/assets/65041318-2512-4f5f-86e4-ab63f692141a" />


  Nesses ultimos dias tenho pegado bem firme nos padrões de projetos (Design patterns - Criacionais, Estruturais e Comportamentais) e
  se demos uma olhadinha tenho um IStrategy que é o meu padrão de projeto comportamental.

  Tá mas pra que isso?
  Meu Strategy ele é executado de acordo com o que eu preciso e quando temos o ACBr PIXCD trabalhamos com muitos bancos e variações
  temos o Banco do Brasil, Sicoob, Sicredi e assim por diante.
  Continuando em baixo temos nosso IContexto entao vamos guardar aqui (IStrategy e IContexto), beleza.
  Vamos abrir nossa unit pixcd.Contexto.pas 
  <img width="759" height="854" alt="image" src="https://github.com/user-attachments/assets/ee66296a-a6b8-4166-9c6e-85b2af4f3ad7" />

  Legal, temos o nosso New já recebendo minhas configuracoes aonde Conf = IConfigurações(MODEL) então tenho todas minhas informações
  para funcionar esse cara preciso fazer a configuração do meu PSP então executou o new ele fez o meu create já com minhas confs de model
  e guardou em meu FConf agora ele fez um Tdictionary para que? para receber meu Strategy sendo o TipoPSP e meu IStrategy que já tem todos
  meus modelos de stratégias.

  Foi criado dentro dele um Map para mapear todos os meus PSPs possiveis e quais são eles? Pasta PSPBancos.Strategyr
  e temos todas as nossas estrategias lá dentro.
  lá recebemos as configurações do PSP baseado em o que nosso ACBrPixCD necessita para funcionamento

  Colocando como Exemplo tudo o que precisamos baseado em nosso ACBr PIXCD

  <img width="1252" height="722" alt="image" src="https://github.com/user-attachments/assets/ebc47e23-4310-4eff-a0c3-643e602d809d" />

  Então é as mesmas informacoes que passarei para meu Strategy, como cada PSP cada Banco vai ter suas propriedades podemos tratar isso tudo dentro
  de nosso strategy, basicamente ele vai servir aqui para manipular esse procedimento em modo de execução, deixando algo bem agradavel, não precisamos 
  encher a tela de componente até porque chegar dar arrepios né? 

  Configurações de PSP e propriedades do banco geralmente são tratados diretamente com a area de developers de cada banco, sim é necessário entender antes
  o que toda API pede e depois fazer todas implementações.

  Sicoob - https://developers.sicoob.com.br/portal/

  Continuando 

  Fiz a remoção e alteração de uma controller minha isso exclusiva para funcionamento desse codigo em sí mas em seu codigo o molde de como voce quer fazer
  criar o seu controller junto com uma strategia uma fabrica (Factory) fica de acordo com o sua criatividade. 
  e Temos o nosso IPIXCD que é o nosso Controller principal das execuções de cada coisa de nosso ACBrPIXCD.

  Entrando na unit PIXCD.Controller.pas temos nossas execuções que são as mesmas do ACBR, no codigo do ACBR podemos abrir o modelo de exemplo.

  <img width="983" height="649" alt="image" src="https://github.com/user-attachments/assets/40719e2d-7c3c-458b-8c3c-8d7613903b57" />


 Fiz a abertura de meu projeto e agora?
 Agora chegamos na explicação geral

 Temos todos nossos end-points e cada um vai executar uma tarefa certo? Então porque nao pegar cada coisa dessa cada end-points 
 cada execução de teste cobrança, recebimento, consulta e assim por diante e não jogar na nossa refatoração?

 <img width="1532" height="1040" alt="image" src="https://github.com/user-attachments/assets/cb7d2136-778a-468b-a54f-377e767027ce" />



<img width="1162" height="433" alt="image" src="https://github.com/user-attachments/assets/762d3251-6781-420b-bfe1-477eaa17cd11" />


Bom, então entendendo esse codigo de nosso exemplo, nao vou colocar todos o codigo do ACBr até para nao ficar muito extenso mas deixo
o link para poder baixar e entender o que o ACBr Faz em cada operação
https://www.projetoacbr.com.br/forum/files/file/501-acbrlibpixcd-demo/

Bom Primeiramente ele entra em Verificação de algumas regras do ACBr validando se cep é visivel/válido, se PSP também está valido
e o nome se essas informação não forem validas o meu if força entrar nelas e configurar os campos sinalizados, o codigo deles apresenta
o msgdlg e faz um abort do procedimento para fazer a configuração.
Beleza após tudo isso o meu fonte do ACBRPix ele faz uma validação recebendo do meu componente de o consultarPixRecebidos é verdadeiro ou falso
então minha variavel OK é booleana, caso ocorra todo procedimento correto o ele valida o meu ok em um if e fazendo o if dessa forma 
(if Ok then) já estamos validando assim olha se for verdadeiro execute isso e logo abaixo ele adiciona em meu MEMO do exemplo do ACBR
as informações da consulta os nossos results do JSON, faz o tratamento de toda nossa info e mostra pro cliente, se o ok for false
também recebemos o mesmo JSON porém com o problema que ocorreu sendo também uma resposta do JSON


Bom o nosso codigo dividido ele recebe nosso result de toda configuração ja passada recebendo nosso PSP e configurações demais
e faz a mesma validação dessa forma

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


mas olha que legal, estou recebendo ja todos esses procedimentos mas na hora de passar eu ja tenho meu model todo preenchido, então
indepentende da tela que eu precisar fazer esse procedimento só preciso ter minhas declarações do controller, meu model e em um caso 
mais BONITO minha factory, entity.

Adicinei o máximo de execuções possiveis dos fontes do ACBr mas isso pode ser continuado e passado a frente, deixo em aberto o projeto
ele não se encontra LINDO mas é uma ideia de ambiente bem legal! Um desacoplamento aonde não precisamos fazer varias vezes não é necessario
fazer isso para cada tela, apenas uma em meu MODEL, CONTROLLER. e a minha View requisita o resto sendo 10 ~ 20 e assim por diante.
  
  

  

  

  
