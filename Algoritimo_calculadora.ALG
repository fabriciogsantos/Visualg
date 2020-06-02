Algoritmo "Calduladora"
//   TRABALHO DE LÓGICA DE PROGRAMAÇÃO
//   PROFESSOR : André Augusto de Abreu Rodrigues
//   Alunos: Janine Luiz Pereira Silva Santos
//           Fabrício Gomes Santos

Var
   descricaoOpcao:vetor [1..12] de caracter
   opcao,pausar:inteiro


   // Função Sobre
Procedimento SObre
var
   contar:inteiro

inicio
   escreval("":10,"  ____   _____   ____   _   ____    _____ ")
   escreval("":10," |  __| |  _  | | ___| | | | ___|  |  _  |")
   escreval("":10," | |_   | |_| | | |    | | | |__   | |_| |")
   escreval("":10," |  _|  | | | | | |    | | |__  |  | | | |")
   escreval("":10," | |    | | | | | |__  | |  __| |  | | | |")
   escreval("":10," |_|    |_| |_| |____| |_| |____|  |_| |_|")
   escreval("")
   escreval("":10,"TRABALHO DE LÓGICA DE PROGRAMAÇÃO")
   escreval("":10,"PROFESSOR : André Augusto de Abreu Rodrigues ")
   escreval("":10,"CURSO     : ENGENHARIA DE COMPUTAÇÃO 2020 1º PERIODO ")
   escreval("":30,"ALUNOS ")
   escreval("":20,"JANINE L. P. SILVA SANTOS ")
   escreval("":20,"FABRICIO GOMES SANTOS ")
   escreval("")
   escreval("")
   escreval(" ":10," Pressione Enter para continuar....")
   leia(pausar)
   limpatela
Fimprocedimento

procedimento Sair
inicio
   escreval("":15,"   .---------. | == | ")
   escreval("":15,"   |.-'''''-.| |----| ")
   escreval("":15,"   ||#PARTIU|| | == | ")
   escreval("":15,"   ||       || |----| ")
   escreval("":15,"   |'-.....-'| |::::| ")
   escreval("":15,"   `'')---(''` |___.| ")
   escreval("":15,"  /:::::::::::\' _  ' ")
   escreval("":15," /:::=======:::\`\`\  ")
   escreval("":15," `'''''''''''''`  '-' ")
   escreval("":15," POR HOJE É SÓ PESSOAL !!! ")
   timer 2000
   timer 0
Fimprocedimento

// Inicializa vetor descrição
Procedimento InicilizaDescricaoOpcao
var
inicio
   descricaoOpcao[1]:="1 - Adição               "
   descricaoOpcao[2]:="2 - Subtração            "
   descricaoOpcao[3]:="3 - Divisão              "
   descricaoOpcao[4]:="4 - Multiplicação        "
   descricaoOpcao[5]:="5 - Porcentagem          "
   descricaoOpcao[6]:="6 -Área do Quadrado      "
   descricaoOpcao[7]:="7 - Área do Retângulo    "
   descricaoOpcao[8]:="8 - Progressão Aritmética"
   descricaoOpcao[9]:="9 - Progressão Geométrica"
   descricaoOpcao[10]:="10 - Conversão de Moeda  "
   descricaoOpcao[11]:="11 - Sobre               "
   descricaoOpcao[12]:="12 - Sair                "
Fimprocedimento

// Criação do quadro de opções da tela
Procedimento QuadroTela(numeroLinhas,numeroColunas,numeroCampo,espacamento:inteiro)
var
   contador,contador1,numeroDescricao:inteiro
   linha:caracter

Inicio

   // Inicializa linha com traços
   para contador de 1 ate numeroColunas faca
      linha:=linha+"-"
   FimPara

   // Monta quadros da tela
   para contador de 1 ate numeroLinhas faca
      se contador=1 entao
         escreval (linha)
         escrevaL("|":20,"CALCULADORA VISUALG":42,"|")
         escreval (linha)
      fimse
      para contador1 de 1 ate  numeroCampo faca
         escreva ("|":espacamento)
         numeroDescricao:=numeroDescricao+1
         escreva (descricaoOpcao[numeroDescricao])
      fimpara
      escreval ("|")
      escreval (linha)
   fimpara
FimProcedimento

// Contrução da tela
Procedimento Tela
var

inicio
   InicilizaDescricaoOpcao
   QuadroTela(6,62,2,6)

FimProcedimento

// Exibir notificação
Procedimento Notificacao(mensagemTela:caracter)
inicio
   escreval(" ":25,"ATENÇÃO")
   escreval(" ":15,"(",mensagemTela,")")
   timer 2000
   timer 0
   limpatela
Fimprocedimento

// Exibir resultado
Procedimento ResultadoTela(resultado:caracter)
var
   contador:inteiro
   linha:caracter
inicio
   para contador de 1 ate 62 faca
      linha:=linha+"-"
   FimPara

   limpatela
   Tela
   escreval("|",resultado)
   escreval(linha)
   escreval("| ":10," Pressione Enter para continuar....":52,"|")
   escreval(linha)
   leia(pausar)
   limpatela
Fimprocedimento

//Valida a entrada de dados
Funcao EntradaDados(tipoTermo:caracter):real
var
   numero:real
inicio
   enquanto numero=0 faca
      Tela
      escreva("| Informe ",tipoTermo:40)
      leia(numero)
      se numero =0 entao
         Notificacao(tipoTermo+" não é valido")
      fimse
      limpatela
   fimenquanto
   retorne numero
Fimfuncao

//Valida a entrada de dados
Funcao EntradaDadosComZero(tipoTermo:caracter):real
var
   numero:real
inicio
   Tela
   escreva("| Informe ",tipoTermo:40)
   leia(numero)
   limpatela
   retorne numero
Fimfuncao

// Executa uma funcao conforme a opcao selecionada
Procedimento ExecutarFuncao
var
   resultado:caracter
inicio
   limpatela
   Escolha opcao
   Caso 1
      resultado:=Adicao()
   Caso 2
      resultado:=Subtracao()
   Caso 3
      resultado:=Divisao()
   Caso 4
      resultado:=Multiplicacao()
   Caso 5
      resultado:=Percentual()
   Caso 6
      resultado:=AreaQuadrado()
   Caso 7
      resultado:=AreaRetangulo()
   Caso 8
      resultado:=ProgressaoAritmetica()
   Caso 9
      resultado:= ProgressaoGeometrica()
   Caso 10
      resultado:= ConversaoMoeda()
   Caso 11
      resultado:=""
      Sobre
   Fimescolha

   se resultado<>"" entao
      ResultadoTela(resultado)
   fimse
Fimprocedimento

// Função Adição
Funcao Adicao():caracter
var
   parcela1,parcela2:real
inicio
   parcela1:=EntradaDados("primeira parcela da Adição")
   parcela2:=EntradaDados("segunda parcela da Adição")
   retorne "Soma "+Numpcarac(parcela1)+" + "+Numpcarac(parcela2)+" = "+Numpcarac((parcela1+parcela2))
FimFuncao

// Função Subtracao
Funcao Subtracao():caracter
var
   aditivo,subtrativo:real
inicio
   aditivo:=EntradaDados("o aditivo da Subtração")
   subtrativo:=EntradaDados("o subtrativo da Subtração")
   retorne "Diferença "+Numpcarac(aditivo)+" - "+Numpcarac(subtrativo)+" = "+Numpcarac((aditivo-subtrativo))
FimFuncao

// Função Divisão
Funcao Divisao():caracter
var
   dividendo,divisor:real
inicio
   dividendo:=EntradaDados("o dividendo da Divisão")
   divisor:=EntradaDados("o divisor da Divisão")
   retorne "Quociente "+Numpcarac(dividendo)+" : "+Numpcarac(divisor)+" = "+Numpcarac((dividendo/divisor))
FimFuncao

// Função Multiplicação
Funcao Multiplicacao():caracter
var
   fator1,fator2:real
inicio
   fator1:=EntradaDados("o primeiro fator da Multiplicação")
   fator2:=EntradaDados("o segundo fator da Multiplicação")
   retorne "Produto "+Numpcarac(fator1)+" * "+Numpcarac(fator2)+" = "+Numpcarac((fator1*fator2))
FimFuncao

// Função Percentual
Funcao Percentual():caracter
var
   valorInteiro,valorPercentual,valorResultado:real
inicio
   valorInteiro:=EntradaDados("o Valor Inteiro da Porcentagem")
   valorPercentual:=EntradaDados("o Valor Percentual ")
   valorPercentual:= (valorPercentual/100)
   valorResultado:=(valorInteiro*valorPercentual)
   retorne "Porcentagem "+Numpcarac((valorPercentual*100))+"% de  "+Numpcarac(valorInteiro)+" é "+Numpcarac(valorResultado)
FimFuncao

// Função Área do Quadrad
Funcao AreaQuadrado():caracter
var
   ladoQuadrado:real
inicio
   ladoQuadrado:=EntradaDados("o lado do Quadrado")
   retorne "Área do Quadrado com lado "+Numpcarac(ladoQuadrado)+" é de  "+Numpcarac((ladoQuadrado*ladoQuadrado))
FimFuncao

// Função Área do Retângulo
Funcao AreaRetangulo():caracter
var
   baseRetangulo,alturaRetangulo:real
inicio
   baseRetangulo:=EntradaDados("a base do Retângulo")
   alturaRetangulo:=EntradaDados("a altura do Retângulo")
   retorne "Área do Retângulo com base "+Numpcarac(baseRetangulo)+" e altura de "+Numpcarac(alturaRetangulo)+" é "+Numpcarac((baseRetangulo*alturaRetangulo))
FimFuncao

// Função Progressão Aritmética
Funcao ProgressaoAritmetica():caracter
var
   razao,valorInicial,valorAtual,sentido:real
   contar:inteiro
   resultadoPA:caracter
inicio
   valorInicial:=EntradaDados("Valor Inicial para Progressão Aritmética")
   razao:=EntradaDadosComZero("a razão para a Progressão Aritmética")

   sentido:=2
   enquanto (sentido<>0) e (sentido<>1) faca
      sentido:=EntradaDadosComZero("0 - P.A crescente ou 1 - para decrescente")
   fimenquanto

   valorAtual:=valorInicial
   se sentido=0 entao
      resultadoPA:="crescente "
      para contar de 1 ate 10 faca
         valorAtual:=valorAtual+razao
         resultadoPA:=resultadoPA+Numpcarac(valorAtual)+" "
      fimpara
   senao
      resultadoPA:="decrescente "
      para contar de 1 ate 10 faca
         valorAtual:=valorAtual+(razao*-1)
         resultadoPA:=resultadoPA+Numpcarac(valorAtual)+" "
      fimpara
   fimse

   retorne "Progressão Aritmética de "+Numpcarac(valorInicial)+" com valor de razao "+Numpcarac(razao)+" é "+resultadoPA
FimFuncao

// Função Progressão Geométrica
Funcao ProgressaoGeometrica():caracter
var
   valorInicial,valorAtual:real
   contar:inteiro
   resultadoPA:caracter
inicio
   valorInicial:=EntradaDados("Valor Inicial para Progressão Geométrica")
   valorAtual:=valorInicial
   para contar de 1 ate 10 faca
      valorAtual:=valorAtual*valorInicial
      resultadoPA:=resultadoPA+Numpcarac(valorAtual)+" "
   fimpara

   retorne "Progressão Geométrica de "+Numpcarac(valorInicial)+" é "+resultadoPA
FimFuncao

// Função Conversão de Moeda
Funcao ConversaoMoeda():caracter
var
   quantidadeMoeda,Contacao:real
inicio
   quantidadeMoeda:=EntradaDados("Quantidade de Moeda Estrangeira")
   Contacao:=EntradaDados("Contação da Moeda Estrangeira")

   retorne " "+Numpcarac(quantidadeMoeda*Contacao)+" em moeda local"
FimFuncao


// Programa Principal
Inicio

   enquanto verdadeiro faca
      Tela
      escreva("| Informe a função que deseja realizada a calculadora:":55)
      leia(opcao)

      se opcao=12 entao
         limpatela
         Sair
         Fimalgoritmo
      fimse

      se (opcao > 12) ou (opcao = 0) entao
         Notificacao("Função escolhida não é valida")
      senao
            ExecutarFuncao
            opcao:=0
      fimse
    fimenquanto


Fimalgoritmo

