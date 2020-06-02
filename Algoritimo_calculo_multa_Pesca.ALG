Algoritmo "Pescador"
// Descrição   : Algoritimo de calculo de multa de pesca
// Autor(a)    : Fabricio
// Data atual  : 02/06/2020
Var
   descricaoOpcao:vetor [1..4] de caracter
   historicoPesca:vetor [1..6,1..3] de caracter
   opcao,pausar,indiceHistorico:inteiro
   messes:vetor[1..12] de inteiro

   // Procedimento Sobre
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
   escreval("":30,"ALUNO ")
   escreval("":20,"FABRICIO GOMES SANTOS ")
   escreval("")
   escreval("")
   escreval(" ":10," Pressione Enter para continuar....")
   leia(pausar)
   limpatela
Fimprocedimento

// Tela de logout
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
   descricaoOpcao[1]:="1 - Informar peso pesca  "
   descricaoOpcao[2]:="2 - Relatório peso pesca "
   descricaoOpcao[3]:="3 - Sobre                "
   descricaoOpcao[4]:="4 - Sair                 "
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
         escrevaL("|":20,"CACULO DE PESO DE PESCA":42,"|")
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
   QuadroTela(2,62,2,6)

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

Procedimento RelatorioPesa
var
   contador,contador1,indice:inteiro
   linha:caracter
inicio

   / Inicializa linha com traços
   para contador de 1 ate 62 faca
      linha:=linha+"-"
   FimPara

   // Monta quadros da tela
   para contador de 1 ate 5 faca
      se contador=1 entao
         escreval (linha)
         escrevaL("|":20,"RELATORIO DE PESCA":42,"|")
         escreval (linha)
         escrevaL("|":10,"Data":10,"|":10,"Peso Kg":10,"|":10,"Multa R$":10,"|")
         escreval (linha)
      fimse
      indice:=indice+1
      para contador1 de 1 ate  3 faca
         escreva ("|":10)
         escreva (historicoPesca[indice,contador1]:10)
      fimpara
      escreval ("|")
      escreval (linha)
   fimpara
   escreval(linha)
   escreval("| ":10," Pressione Enter para continuar....":52,"|")
   escreval(linha)
   leia(pausar)
   limpatela

FimProcedimento

// Inicio Funções
//Valida a entrada de dados  Numerico
Funcao EntradaDadosNumerico(tipoTermo:caracter;espacamento:inteiro):real
var
   numero:real
inicio
   enquanto numero=0 faca
      Tela
      escreva("| Informe ",tipoTermo:espacamento)
      leia(numero)
      se numero =0 entao
         Notificacao(tipoTermo+" não é valido")
      fimse
      limpatela
   fimenquanto
   retorne numero
Fimfuncao

//Valida a entrada de dados  Data
Funcao EntradaDadosData(tipoTermo:caracter;espacamento:inteiro):caracter
var
   data:caracter
inicio
   enquanto data="" faca
      Tela
      escreva("| Informe ",tipoTermo:espacamento)
      leia(data)
      se ValidarData(data) = falso entao
         Notificacao(tipoTermo+" não é valido")
         data:=""
      fimse
      limpatela
   fimenquanto
   retorne copia(data;1,10)
Fimfuncao

// Verifica se a data está valida
Funcao ValidarData(data:caracter):logico
var
   dataValida:logico
   dia,mes,ano,contador:inteiro
   barra1,barra2,dadoData:caracter
   messes:vetor[1..12] de inteiro
inicio
   messes[1]:=31
   messes[2]:=28
   messes[3]:=31
   messes[4]:=30
   messes[5]:=31
   messes[6]:=30
   messes[7]:=31
   messes[8]:=31
   messes[9]:=30
   messes[10]:=31
   messes[11]:=30
   messes[12]:=31
   dataValida:=verdadeiro

   Para contador de 1 ate 10 faca
      dadoData:=copia(data:contador,1)
      se (dadoData="") entao
         dataValida:=falso
         interrompa
      fimse
      se (Asc(dadoData)<47) ou (Asc(dadoData)>57) entao
         dataValida:=falso
      fimse
   Fimpara

   se dataValida=verdadeiro entao
      dia:=Caracpnum(copia(data:1,2))
      barra1:=copia(data:3,1)
      mes:=Caracpnum(copia(data:4,2))
      barra2:=copia(data:6,1)
      ano:=Caracpnum(copia(data:7,4))
   fimse

   se dia <= 0 entao
      dataValida:=falso
   fimse

   se (mes <= 0) ou (mes > 12) entao
      dataValida:=falso
   fimse

   se ano <= 0 entao
      dataValida:=falso
   fimse

   se ano mod 4 =0 entao
      messes[2]:=29
   fimse

   se dataValida=verdadeiro entao
      se dia>messes[mes] entao
         dataValida:=falso
      fimse
   fimse

   se (barra1 <> "/") ou (barra2 <> "/") entao
      dataValida:=falso
   fimse

   retorne dataValida

Fimfuncao

// Executa uma funcao conforme a opcao selecionada
Procedimento ExecutarFuncao
var
   resultado:caracter
inicio
   limpatela
   Escolha opcao
   Caso 1
      resultado:=CalculoPesoPesca()
      ResultadoTela(resultado)
   Caso 2
      RelatorioPesa
   Caso 3
      Sobre
   Fimescolha

Fimprocedimento

// Função Adição
Funcao CalculoPesoPesca():caracter
var
   data,retorno:caracter
   peso,multa,pesoExcedente,cota,taxa:real
   contador:inteiro

inicio
   cota:=50
   taxa:=4
   data:=EntradaDadosData("a Data da Pesca",20)
   peso:=EntradaDadosNumerico("o Peso da Pesca",20)
   indiceHistorico:=indiceHistorico+1

   se indiceHistorico=7 entao
      para contador de 1 ate 5 faca
         indiceHistorico[contador]:=indiceHistorico[(contador+1)]
      fimpara
      indiceHistorico=6
   fimse

   retorno:="Em "+data+" pesca de "+Numpcarac(peso)+" Kilos"

   se peso > cota entao
      pesoExcedente:=peso-cota
      multa:=pesoExcedente*taxa
      retorno:=retorno+", Multa de R$ "+Numpcarac(multa)
   fimse

   historicoPesca[indiceHistorico,1]:=data
   historicoPesca[indiceHistorico,2]:=Numpcarac(peso)
   historicoPesca[indiceHistorico,3]:=Numpcarac(multa)

   retorne retorno

FimFuncao

// Programa Principal
Inicio
   enquanto verdadeiro faca
      Tela
      escreva("| Informe a função que deseja realizada :":45)
      leia(opcao)

      se opcao=4 entao
         limpatela
         Sair
Fimalgoritmo
fimse

se (opcao > 4) ou (opcao = 0) entao
   Notificacao("Função escolhida não é valida")
senao
   ExecutarFuncao
   opcao:=0
fimse
fimenquanto

Fimalgoritmo
