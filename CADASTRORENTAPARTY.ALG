Algoritmo "CadastroRentAParty"
tipo
   funcionario = registro
      nome, cpf, mail, senha, servico, descricao: caractere
      saldo, preco: real
      block:logico
      alerta:inteiro
   fimregistro
   cliente = registro
      nome, cpf, mail, senha : caractere
      saldo: real
      block:logico
   fimregistro
var
   fun:vetor[1..5] de funcionario
   cli:vetor [1..5] de cliente
   num,numlog,idlogin:inteiro
   sair: logico
   mailadm,senhaadm:caractere
   saldoadm:real
procedimento admin
var
   exit,saida:logico
   auxiliar:inteiro
inicio
   exit<-falso
   enquanto exit=falso faca
      escreval("Selecione uma opção")
      escreval("1 - Desbloquear contas")
      escreval("2 - Consultar saldo")
      escreval("3 - SAIR")
      leia(auxiliar)
      limpatela
      escolha auxiliar
      caso 1
         saida<-falso
         enquanto saida<>verdadeiro faca
            saida<-verdadeiro
            escreval("ESCOLHA UMA OPÇÃO (qualquer outro número para sair)")
            escreval("1 - Contas clientes")
            escreval("2 - Contas funcionários")
            leia(auxiliar)
            escolha auxiliar
            caso 1
               para auxiliar de 1 ate 5 faca
                  se cli[auxiliar].block=verdadeiro entao
                     escreval(auxiliar," CLIENTE- ",cli[auxiliar].mail)
                     escreval("CPF: ",cli[auxiliar].cpf)
                     saida<-falso
                  fimse
               fimpara
               se saida=falso entao
                  escreval("Selecione uma das opções acima")
                  leia(auxiliar)
                  se (auxiliar>0) e (auxiliar<6) entao
                     se cli[auxiliar].block=verdadeiro entao
                        cli[auxiliar].block<-falso
                        LIMPATELA
                        escreval("CONTA DE ",cli[auxiliar].nome," FOI DESBLOQUEADA")
                     fimse
                  senao
                     limpatela
                     escreval("OPÇÃO INVÁLIDA")
                  fimse
               senao
                  limpatela
                  escreval("Nenhuma conta cliente bloqueada.")
               fimse
            caso 2
               para auxiliar de 1 ate 5 faca
                  se fun[auxiliar].block=verdadeiro entao
                     escreval(auxiliar," FUNCIONÁRIO- ",fun[auxiliar].nome)
                     escreval("CPF: ",fun[auxiliar].cpf)
                     saida<-falso
                  fimse
               fimpara
               se saida=falso entao
                  escreval("Selecione uma das opções acima")
                  leia(auxiliar)
                  se (auxiliar>0) e (auxiliar<6) entao
                     se fun[auxiliar].block=verdadeiro entao
                        fun[auxiliar].block<-falso
                        LIMPATELA
                        escreval("CONTA DE ",fun[auxiliar].nome," FOI DESBLOQUEADA")
                     fimse
                  senao
                     limpatela
                     escreval("OPÇÃO INVÁLIDA")
                  fimse
               senao
                  limpatela
                  escreval("Nenhuma conta funcionário bloqueada.")
               fimse
            outrocaso
               limpatela
               escreval("VOLTANDO A TELA PRINCIPAL!")
            fimescolha
         fimenquanto
      caso 2
         limpatela
         escreval("O SEU SALDO: R$",(saldoadm):2:2)
      caso 3
         pausa
         exit<-verdadeiro
         idlogin<-0
         limpatela
      outrocaso
         limpatela
         escreval("OPÇÃO INVÁLIDA")
      fimescolha
   fimenquanto
fimprocedimento
procedimento cliente
var
   exit,saida,XIZ:logico
   ajudatxt,copiar:caractere
   auxiliar,opcao,dig,y:inteiro
   dinheiro:real
inicio
   exit<-falso
   enquanto exit=falso faca
      escreval("|          TELA DO CLIENTE")
      ESCREVAL("|NOME:",cli[numlog].nome)
      escreval("|     SELECIONE UMA OPÇÃO")
      escreval("| 1 - CONTRATAR SERVIÇO | 2 - EDITAR INFORMAÇÕES")
      escreval("| 3 - CONSULTAR SALDO   | 4 - ADICIONAR SALDO")
      escreval("| 5 - LOGOUT")
      leia(auxiliar)
      escolha auxiliar
      caso 1
         saida<-falso
         enquanto saida=falso faca
            repita
               repita
                  limpatela
                  escreval("| SELECIONE UM SERVIÇO PARA MAIS INFORMAÇÕES")
                  saida<-verdadeiro
                  para auxiliar de 1 ate 5 faca
                     se fun[auxiliar].servico<>"" entao
                        saida<-falso
                        escreval("| ",auxiliar," - ",fun[auxiliar].servico," - PREÇO: R$",(fun[auxiliar].preco):2:2)
                     senao
                        se (auxiliar=5) e (saida=verdadeiro) entao
                           timer(500)
                           escreval("| NENHUM SERVIÇO DISPONÍVEL")
                           timer(0)
                        fimse
                     fimse
                  fimpara
                  se (auxiliar=5) e (saida=verdadeiro) entao
                     limpatela
                     interrompa
                  fimse
                  escreval("| 105 - SAIR")
                  leia(auxiliar)
                  se auxiliar=105 entao
                     saida<-verdadeiro
                     limpatela
                     interrompa
                  senao
                     se (auxiliar>5) ou (auxiliar<=0) entao
                        opcao<-0
                        escreval("OPÇÃO INVÁLIDA")
                     senao
                        se fun[auxiliar].servico="" entao
                           opcao<-0
                           escreval("OPÇÃO INVÁLIDA")
                        senao
                           opcao<-1
                        fimse
                     fimse
                  fimse
               ate (auxiliar<>0) e (opcao<>0)
               se saida=verdadeiro entao
                  ajudatxt<-""
                  auxiliar<-0
                  opcao<-0
                  interrompa
               fimse
               limpatela
               escreval("|        DETALHES DO SERVIÇO        |")
               ESCREVAL("|NOME:",fun[auxiliar].nome)
               ESCREVAL("|SERVIÇO:",fun[auxiliar].servico," | PREÇO: R$",(fun[auxiliar].preco):2:2)
               escreval("|DESCRIÇÃO DO SERVIÇO:")
               escreval("|",fun[auxiliar].descricao)
               escreval("Seu saldo é de: R$",(cli[numlog].saldo):2:2)
               se fun[auxiliar].preco>cli[numlog].saldo entao
                  opcao<-0
                  auxiliar<-0
                  ajudatxt<-""
                  escreval("Você não tem dinheiro o suficiente para contratar esse serviço")
                  interrompa
               SENAO
                  repita
                     escreval("Você deseja contratar este serviço?")
                     escreval("1 - sim")
                     escreval("2 - não")
                     leia(opcao)
                     escolha opcao
                     caso 1
                        timer(200)
                        fun[auxiliar].saldo<-((fun[auxiliar].saldo)+((fun[auxiliar].preco)-((fun[auxiliar].preco)*0.1)))
                        cli[numlog].saldo<-(cli[numlog].saldo)-(fun[auxiliar].preco)
                        saldoadm<-(saldoadm+(fun[auxiliar].preco*0.1))
                        fun[auxiliar].alerta<-((fun[auxiliar].alerta)+1)
                        limpatela
                        auxiliar<-0
                        timer(1000)
                        escreval("COMPRA EFETUADA COM SUCESSO!")
                        escreval("O SEU SALDO É DE: R$",(cli[numlog].saldo):2:2)
                        timer(0)
                     caso 2
                        auxiliar<-0
                        limpatela
                     outrocaso
                        escreval("OPÇÃO INVÁLIDA")
                     fimescolha
                  ate (opcao=1) ou (opcao=2)
               fimse
            ate saida=verdadeiro
         fimenquanto
      caso 2
         limpatela
         escreval("| QUAL INFORMAÇÃO GOSTARIA DE EDITAR?")
         ESCREVAL("| (Digite qualquer outro número para cancelar)")
         escreval("| 1 - Nome: ",cli[numlog].nome)
         escreval("| 2 - Email: ",cli[numlog].mail)
         escreval("| 3 - Senha: ",cli[numlog].senha)
         escreval("| 4 - DELETAR CONTA")
         leia (opcao)
         escolha opcao
         caso 1
            ajudatxt<-cli[numlog].nome
            repita
               escreval("Digite o seu novo nome: (max: 30 caracteres)")
               escreval("(caso queira cancelar, digite 9)")
               leia(cli[numlog].nome)
               se compr(cli[numlog].nome)>30 entao
                  escreval("Limite de caracteres atingido!")
                  cli[numlog].nome<-""
               senao
                  se cli[numlog].nome="9" entao
                     cli[numlog].nome<-ajudatxt
                     escreval("MUDANÇA CANCELADA")
                     interrompa
                  senao
                     se cli[numlog].nome="" entao
                        escreval("Por favor, insira um nome diferente de vazio.")
                     fimse
                  fimse
               fimse
            ate cli[numlog].nome<>""
         caso 2
            repita
               opcao<-0
               ajudatxt<-cli[numlog].mail
               escreval("Digite o seu novo endereço de email:")
               escreval("(caso queira cancelar, digite 9)")
               leia(cli[numlog].mail)
               se cli[numlog].mail="9" entao
                  cli[numlog].mail<-ajudatxt
                  escreval("MUDANÇA CANCELADA")
                  interrompa
               senao
                  xiz<-verdadeiro
                  se cli[numlog].mail ="" entao
                     xiz<-falso
                     escreval("Por favor, digite algum endereço de email")
                  senao
                     para auxiliar de 1 ate 5 faca
                        se numlog <> auxiliar entao
                           se cli[numlog].mail=cli[auxiliar].mail entao
                              escreval("Endereço de email já cadastrado.")
                              escreval("Por favor, utilize um email diferente.")
                              xiz<-falso
                              interrompa
                           fimse
                        fimse
                     fimpara
                     se xiz=verdadeiro entao
                        dig <- compr(cli[numlog].mail)
                        para auxiliar de 1 ate dig faca
                           copiar <-copia(cli[numlog].mail,auxiliar,1)
                           escolha copiar
                           caso "@"
                              se (auxiliar = 1) ou (auxiliar = dig) ou (auxiliar = dig-1) ou (auxiliar = dig-2) entao
                                 escreval("Email inválido")
                                 xiz<-falso
                                 interrompa
                              senao
                                 dinheiro<-dinheiro+1
                                 se dinheiro<>1 entao
                                    escreval("Email inválido")
                                    xiz<-falso
                                    interrompa
                                 fimse
                              fimse
                           outrocaso
                              se (auxiliar=dig) e (dinheiro<>1) entao
                                 escreval("Email inválido")
                                 xiz<-falso
                              fimse
                           fimescolha
                        fimpara
                     fimse
                  fimse
               fimse
            ate xiz<-verdadeiro
            se xiz=verdadeiro entao
               Escreval("Email editado com sucesso!")
               escreval("O seu novo email:")
               escreval(cli[numlog].mail)
            fimse
         caso 3
            ajudatxt<-cli[numlog].senha
            repita
               escreval("Digite a sua nova senha")
               escreval("(caso queira cancelar, digite 9)")
               repita
                  xiz<-verdadeiro
                  leia(cli[numlog].senha)
                  se cli[numlog].senha="9" entao
                     interrompa
                  senao
                     dig<-compr(cli[numlog].senha)
                     Se (dig<8) ou (dig>16) entao
                        escreval("senha inválida, verifique se a senha possui")
                        escreval("de 8 até 16 digitos")
                        xiz<-falso
                     senao
                        para auxiliar de 1 ate dig faca
                           copiar <- copia(cli[numlog].senha,auxiliar,1)
                           escolha copiar
                           caso " "
                              escreval("senha inválida, por favor não coloque espaços nela!")
                              xiz<-falso
                              interrompa
                           fimescolha
                        fimpara
                     fimse
                  fimse
               ate xiz<-verdadeiro
               se cli[numlog].senha="9" entao
                  cli[numlog].senha<-ajudatxt
                  limpatela
                  escreval("|      CANCELAR      |")
                  interrompa
               fimse
               escreval("Repita sua senha")
               leia(copiar)
               se copiar <> cli[numlog].senha entao
                  escreval("Senha informada diferente da senha repetida")
               fimse
            ate copiar=cli[numlog].senha
            se (xiz=verdadeiro) e (copiar=cli[numlog].senha) entao
               Escreval("Nova senha cadastrada com sucesso!")
               escreval("A sua nova senha: ",cli[numlog].senha)
            fimse
         caso 4
            escreval("Tem certeza que deseja apagar a sua conta?")
            escreval("Digite a sua senha caso deseja apagar.")
            escreval("Isso removera o seu acesso a plataforma.")
            leia(copiar)
            se copiar <> cli[numlog].senha entao
               escreval("|      CANCELAR      |")
            senao
               IDLOGIN<-9
               exit<-verdadeiro
            fimse
            escreval("CONTA APAGADA COM SUCESSO")
         outrocaso
         fimescolha
         limpatela
         opcao<-0
         ajudatxt<-""
         auxiliar<-0
         copiar<-""
         dig<-0
      caso 3
         limpatela
         escreval("O SEU SALDO: R$",(cli[numlog].saldo):2:2)
         opcao<-0
         ajudatxt<-""
         auxiliar<-0
      caso 4
         limpatela
         se cli[numlog].saldo>=10000 entao
            timer(1000)
            escreval("VOCÊ JÁ ESTÁ NO LIMITE DE SALDO PERMITIDO")
            timer(0)
         senao
            escreval("ADICIONAR SALDO:")
            escreval("VALOR MÁXIMO PERMITIDO: R$",(10000-cli[numlog].saldo):2:2)
            leia(dinheiro)
            cli[numlog].saldo<-(cli[numlog].saldo)+dinheiro
         fimse
         limpatela
         escreval("O SEU SALDO: R$",(cli[numlog].saldo):2:2)
         opcao<-0
         ajudatxt<-""
         auxiliar<-0
         dinheiro<-0
      caso 5
         limpatela
         escreval("Até mais, ", cli[numlog].nome)
         exit<-verdadeiro
         IDLOGIN<-0
         numlog<-0
      outrocaso
         opcao<-0
         ajudatxt<-""
         auxiliar<-0
         limpatela
         escreval("OPÇÃO INVÁLIDA")
      fimescolha
   fimenquanto
fimprocedimento
procedimento funcionario
var
   exit,saida,XIZ:logico
   ajudatxt,copiar:caractere
   auxiliar,opcao,dig,teste:inteiro
   dinheiro:real
inicio
   exit<-falso
   se fun[numlog].alerta>0 entao
   escreval(fun[numlog].alerta," VENDAS REALIZADA!")
   fun[numlog].alerta<-0
   fimse
   enquanto exit=falso faca
      escreval("|          TELA DO FUNCIONÁRIO")
      ESCREVAL("|NOME:",fun[numlog].nome)
      escreval("|     SELECIONE UMA OPÇÃO")
      escreval("| 1 - CONTRATAR SERVIÇO")
      escreval("| 2 - EDITAR INFORMAÇÕES")
      ESCREVAL("| 3 - CONSULTAR SALDO")
      escreval("| 4 - ADICIONAR SALDO")
      escreval("| 5 - LOGOUT")
      leia(auxiliar)
      escolha auxiliar
      caso 1
         saida<-falso
         enquanto saida=falso faca
            repita
               repita
                  limpatela
                  escreval("| SELECIONE UM SERVIÇO PARA MAIS INFORMAÇÕES")
                  teste<-0
                  para auxiliar de 1 ate 5 faca
                     se (fun[auxiliar].servico<>"") e (fun[auxiliar].mail<>fun[numlog].mail) entao
                        escreval("| ",auxiliar," - ",fun[auxiliar].servico," - PREÇO: R$",(fun[auxiliar].preco):2:2)
                        teste<-1
                     senao
                        se (auxiliar=5) e (fun[auxiliar].servico="") e (teste=0) entao
                           timer(500)
                           escreval("| NENHUM SERVIÇO DISPONÍVEL")
                           timer(0)
                        fimse
                     fimse
                  fimpara
                  se (auxiliar=5) e (fun[auxiliar].servico="") e (teste=0) entao
                     saida<-verdadeiro
                     limpatela
                     interrompa
                  fimse
                  escreval("| 105 - SAIR")
                  leia(auxiliar)
                  se auxiliar=105 entao
                     saida<-verdadeiro
                     limpatela
                     interrompa
                  senao
                     se (auxiliar>5) ou (auxiliar<=0) entao
                        opcao<-0
                        escreval("OPÇÃO INVÁLIDA")
                     senao
                        se (fun[auxiliar].servico="") ou (fun[auxiliar].mail=fun[numlog].mail) entao
                           opcao<-0
                           escreval("OPÇÃO INVÁLIDA")
                        senao
                           opcao<-1
                        fimse
                     fimse
                  fimse
               ate (auxiliar<>0) e (opcao<>0)
               se saida=verdadeiro entao
                  ajudatxt<-""
                  auxiliar<-0
                  opcao<-0
                  interrompa
               fimse
               limpatela
               escreval("|        DETALHES DO SERVIÇO        |")
               ESCREVAL("|NOME:",fun[auxiliar].nome)
               ESCREVAL("|SERVIÇO:",fun[auxiliar].servico)
               escreval("|PREÇO: R$",(fun[auxiliar].preco):2:2)
               escreval("|DESCRIÇÃO DO SERVIÇO:")
               escreval("|",fun[auxiliar].descricao)
               escreval("Seu saldo é de: R$",(fun[numlog].saldo):2:2)
               se fun[auxiliar].preco>fun[numlog].saldo entao
                  opcao<-0
                  auxiliar<-0
                  ajudatxt<-""
                  escreval("Você não tem dinheiro o suficiente para contratar esse serviço")
                  interrompa
               SENAO
                  repita
                     escreval("Você deseja contratar este serviço?")
                     escreval("1 - sim")
                     escreval("2 - não")
                     leia(opcao)
                     escolha opcao
                     caso 1
                        timer(200)
                        fun[auxiliar].saldo <- ((fun[auxiliar].saldo)+((fun[auxiliar].preco)-((fun[auxiliar].preco)*0.1)))
                        fun[numlog].saldo <- ((fun[numlog].saldo)-(fun[auxiliar].preco))
                        saldoadm <- (saldoadm+(fun[auxiliar].preco*0.1))
                        fun[auxiliar].alerta<-(fun[auxiliar].alerta)+1
                        limpatela
                        timer(1000)
                        escreval("COMPRA EFETUADA COM SUCESSO!")
                        escreval("O SEU SALDO É DE: R$",(fun[numlog].saldo):2:2)
                        auxiliar<-0
                        timer(0)
                     caso 2
                        auxiliar<-0
                        limpatela
                     outrocaso
                        escreval("OPÇÃO INVÁLIDA")
                     fimescolha
                  ate (opcao=1) ou (opcao=2)
                  opcao<-0
                  ajudatxt<-""
               fimse
            ate saida=verdadeiro
         fimenquanto
      caso 2
         limpatela
         escreval("| QUAL INFORMAÇÃO GOSTARIA DE EDITAR?")
         ESCREVAL("| (Digite qualquer outro número para cancelar)")
         escreval("| 1 - Nome: ",fun[numlog].nome)
         escreval("| 2 - Email: ",fun[numlog].mail)
         escreval("| 3 - Senha: ",fun[numlog].senha)
         escreval("| 4 - Servico: ",fun[numlog].servico)
         escreval("| 5 - Descrição: ",fun[numlog].descricao)
         escreval("| 6 - Preço: ",fun[numlog].preco)
         escreval("| 7 - DELETAR CONTA")
         leia (opcao)
         escolha opcao
         caso 1
            ajudatxt<-fun[numlog].nome
            repita
               escreval("Digite o seu novo nome: (max: 30 caracteres)")
               escreval("(caso queira cancelar, digite 9)")
               leia(fun[numlog].nome)
               se compr(fun[numlog].nome)>30 entao
                  escreval("Limite de caracteres atingido!")
                  fun[numlog].nome<-""
               senao
                  se fun[numlog].nome="9" entao
                     fun[numlog].nome<-ajudatxt
                     escreval("MUDANÇA CANCELADA")
                     interrompa
                  senao
                     se fun[numlog].nome="" entao
                        escreval("Por favor, insira um nome diferente de vazio.")
                     fimse
                  fimse
               fimse
            ate fun[numlog].nome<>""
         caso 2
            repita
               opcao<-0
               ajudatxt<-fun[numlog].mail
               escreval("Digite o seu novo endereço de email:")
               escreval("(caso queira cancelar, digite 9)")
               leia(fun[numlog].mail)
               se fun[numlog].mail="9" entao
                  fun[numlog].mail<-ajudatxt
                  escreval("MUDANÇA CANCELADA")
                  interrompa
               senao
                  xiz<-verdadeiro
                  se fun[numlog].mail ="" entao
                     xiz<-falso
                     escreval("Por favor, digite algum endereço de email")
                  senao
                     para auxiliar de 1 ate 5 faca
                        se numlog <> auxiliar entao
                           se fun[numlog].mail=fun[auxiliar].mail entao
                              escreval("Endereço de email já cadastrado.")
                              escreval("Por favor, utilize um email diferente.")
                              xiz<-falso
                              interrompa
                           fimse
                        fimse
                     fimpara
                     se xiz=verdadeiro entao
                        dig <- compr(fun[numlog].mail)
                        para auxiliar de 1 ate dig faca
                           copiar <-copia(fun[numlog].mail,auxiliar,1)
                           escolha copiar
                           caso "@"
                              se (auxiliar = 1) ou (auxiliar = dig) ou (auxiliar = dig-1) ou (auxiliar = dig-2) entao
                                 escreval("Email inválido")
                                 xiz<-falso
                                 interrompa
                              senao
                                 dinheiro<-dinheiro+1
                                 se dinheiro<>1 entao
                                    escreval("Email inválido")
                                    xiz<-falso
                                    interrompa
                                 fimse
                              fimse
                           outrocaso
                              se (auxiliar=dig) e (dinheiro<>1) entao
                                 escreval("Email inválido")
                                 xiz<-falso
                              fimse
                           fimescolha
                        fimpara
                     fimse
                  fimse
               fimse
            ate xiz<-verdadeiro
            se xiz=verdadeiro entao
               Escreval("Email editado com sucesso!")
               escreval("O seu novo email:")
               escreval(fun[numlog].mail)
            fimse
         caso 3
            ajudatxt<-fun[numlog].senha
            repita
               escreval("Digite a sua nova senha")
               escreval("(caso queira cancelar, digite 9)")
               repita
                  xiz<-verdadeiro
                  leia(fun[numlog].senha)
                  se fun[numlog].senha="9" entao
                  senao
                     dig<-compr(fun[numlog].senha)
                     Se (dig<8) ou (dig>16) entao
                        escreval("senha inválida, verifique se a senha possui")
                        escreval("de 8 até 16 digitos")
                        xiz<-falso
                     senao
                        para auxiliar de 1 ate dig faca
                           copiar <- copia(fun[numlog].senha,auxiliar,1)
                           escolha copiar
                           caso " "
                              escreval("senha inválida, por favor não coloque espaços nela!")
                              xiz<-falso
                              interrompa
                           fimescolha
                        fimpara
                     fimse
                  fimse
               ate xiz<-verdadeiro
               se fun[numlog].senha="9" entao
                  fun[numlog].senha<-ajudatxt
                  limpatela
                  escreval("|      CANCELAR      |")
                  interrompa
               fimse
               escreval("Repita sua senha")
               leia(copiar)
               se copiar <> fun[numlog].senha entao
                  escreval("Senha informada diferente da senha repetida")
               fimse
            ate copiar=fun[numlog].senha
            se (xiz=verdadeiro) e (copiar=fun[numlog].senha) entao
               Escreval("Nova senha cadastrada com sucesso!")
               escreval("A sua nova senha: ",fun[numlog].senha)
            fimse
         caso 4
            opcao<-0
            ajudatxt<-fun[numlog].servico
            repita
               escreval("Escolha um serviço da lista:")
               escreval("A - Churrasqueiro")
               escreval("B - DJ")
               escreval("C - Palhaço")
               escreval("D - Barman")
               escreval("E - Confeiteiro")
               xiz<-verdadeiro
               leia(fun[numlog].servico)
               escolha fun[numlog].servico
               caso "A"
                  fun[numlog].servico<-"Churrasqueiro"
               caso "B"
                  fun[numlog].servico<-"DJ"
               caso "C"
                  fun[numlog].servico<-"Palhaço"
               caso "D"
                  fun[numlog].servico<-"Barman"
               caso "E"
                  fun[numlog].servico<-"Confeiteiro"
               caso "9"
                  escreval("MUDANÇA CANCELADA")
               outrocaso
                  escreval("Opção inválida, por favor, selecione um")
                  escreval("item da lista disponível.")
                  xiz<-falso
               fimescolha
            ate xiz=verdadeiro

            se fun[numlog].servico="9" entao
               fun[numlog].servico<-ajudatxt
               limpatela
               interrompa
            fimse
         caso 5
            ajudatxt<-fun[numlog].descricao
            escreval("Serviço: ",fun[numlog].servico)
            escreval("Descreva brevemente o serviço (max: 50 caracteres)")
            repita
               xiz<-verdadeiro
               leia(fun[numlog].descricao)
               se fun[numlog].descricao="9" entao
               senao
                  dig <- compr(fun[numlog].descricao)
                  se dig=0 entao
                     fun[numlog].descricao<-"Sem descrição."
                  senao
                     se dig>50 entao
                        escreval("Limite de caracteres ultrapassado.")
                        xiz<-falso
                     fimse
                  fimse
               fimse
            ate xiz=verdadeiro
            se fun[numlog].descricao="9" entao
               fun[numlog].descricao<-ajudatxt
               interrompa
            fimse
         caso 6
            escreval("Informe o novo custo de seu serviço : (min: 10, max: 10000)")
            escreval("(Lembre-se, será retirado 10% por causa das taxas)" )
            repita
               xiz<-verdadeiro
               dinheiro<-fun[numlog].preco
               leia(fun[numlog].preco)
               se fun[numlog].preco=9 entao
                  interrompa
               senao
                  se (fun[numlog].preco <10) ou (fun[numlog].preco>10000) entao
                     escreval("Custo inválido")
                     xiz<-falso
                  senao
                     timer(300)
                     escreval("O custo do seu serviço é de:")
                     escreval("R$",(fun[numlog].preco):2:2)
                     escreval("Por venda, você receberá:")
                     escreval("R$",(fun[numlog].preco-fun[numlog].preco*0.1):2:2)
                     timer(0)
                  fimse
               fimse
            ate xiz=verdadeiro
            se fun[numlog].preco=9 entao
               fun[numlog].preco<-dinheiro
               limpatela
               escreval("| MUDANÇA CANCELADO |")
            fimse
         caso 7
            escreval("Tem certeza que deseja apagar a sua conta?")
            escreval("Digite a sua senha caso deseja apagar.")
            escreval("Isso removera o seu acesso a plataforma.")
            leia(copiar)
            se copiar <> fun[numlog].senha entao
               escreval("|      CANCELAR      |")
            senao
               IDLOGIN<-10
               exit<-verdadeiro
            fimse
            escreval("CONTA APAGADA COM SUCESSO")
         outrocaso
         fimescolha
         limpatela
         opcao<-0
         ajudatxt<-""
         auxiliar<-0
         copiar<-""
         dig<-0
         dinheiro<-0
      caso 3
         limpatela
         escreval("O SEU SALDO: R$",(fun[numlog].saldo):2:2)
         opcao<-0
         ajudatxt<-""
         auxiliar<-0
      caso 4
         limpatela
         se fun[numlog].saldo>=10000 entao
            timer(1000)
            escreval("VOCÊ JÁ ESTÁ NO LIMITE DE SALDO PERMITIDO")
            timer(0)
         senao
            escreval("ADICIONAR SALDO:")
            escreval("VALOR MÁXIMO PERMITIDO: R$",(10000-fun[numlog].saldo):2:2)
            leia(dinheiro)
            fun[numlog].saldo<-(fun[numlog].saldo)+dinheiro
         fimse
         limpatela
         escreval("O SEU SALDO: R$",(fun[numlog].saldo):2:2)
         opcao<-0
         ajudatxt<-""
         auxiliar<-0
         dinheiro<-0
      caso 5
         limpatela
         escreval("Até mais, ", fun[numlog].nome)
         exit<-verdadeiro
         IDLOGIN<-0
         numlog<-0
      outrocaso
         opcao<-0
         ajudatxt<-""
         auxiliar<-0
         limpatela
         escreval("OPÇÃO INVÁLIDA")
      fimescolha
   fimenquanto
fimprocedimento
procedimento cadastro
var
   i,dig,verificar,y:inteiro
   copiar,checar:caractere
   x:logico
inicio
   escreval("Digite 1 para se cadastrar como funcionário")
   escreval("Digite 2 para se cadastrar como cliente")
   escreval("Digite qualquer outro número para cancelar")
   escreval("Caso desista do cadastro, use o número 9 a qualquer momento")
   leia(dig)
   escolha dig
   caso 1
      para i de 1 ate 5 faca
         se (i = 5) e (fun[i].nome<>"")  entao
            limpatela
            timer(300)
            escreval("limite de cadastros de funcionários atingido")
            timer(0)
            limpatela
         senao
            se fun[i].nome="" entao
               repita
                  escreval("Digite o seu nome: (max: 30 caracteres)")
                  leia(fun[i].nome)
                  se compr(fun[i].nome)>30 entao
                     escreval("Limite de caracteres atingido!")
                     fun[i].nome<-""
                  senao
                     se fun[i].nome="9" entao
                        fun[i].nome<-""
                        interrompa
                     senao
                        se fun[i].nome="" entao
                           escreval("Por favor, insira um nome diferente de vazio.")
                        fimse
                     fimse
                  fimse
               ate fun[i].nome<>""
               se fun[i].nome="" entao
                  limpatela
                  escreval("| CADASTRO CANCELADO |")
                  interrompa
               fimse
               escreval("Digite o seu cpf (somente números)")
               repita
                  leia(fun[i].cpf)
                  se fun[i].cpf="9" entao
                     fun[i].cpf<-""
                     fun[i].nome<-""
                     interrompa
                  senao
                     x<-verdadeiro
                     se compr(fun[i].cpf) <>11 entao
                        escreval("CPF INVáLIDO, INSIRA UM CPF VÁLIDO, Formato aceito: 00000000000")
                        x<-falso
                     senao
                        para verificar de 1 ate 5 faca
                           se i <> verificar entao
                              se fun[i].cpf=fun[verificar].cpf entao
                                 escreval("CPF já cadastrado.")
                                 escreval("Por favor, utilize um CPF diferente.")
                                 x<-falso
                                 interrompa
                              fimse
                           fimse
                        fimpara
                        se x=verdadeiro entao
                           para verificar de 1 ate 11 faca
                              copiar<-copia(fun[i].cpf,verificar,1)
                              escolha copiar
                              caso "1"
                              caso "2"
                              caso "3"
                              caso "4"
                              caso "5"
                              caso "6"
                              caso "7"
                              caso "8"
                              caso "9"
                              caso "0"
                              outrocaso
                                 escreval("CPF INVáLIDO, INSIRA UM CPF VÁLIDO, Formato aceito: 00000000000")
                                 x<-falso
                                 interrompa
                              fimescolha
                           fimpara
                        fimse
                     fimse
                  fimse
               ate x=verdadeiro
               se fun[i].cpf="" entao
                  limpatela
                  escreval("| CADASTRO CANCELADO |")
                  interrompa
               fimse
               escreval("Digite o seu email")
               repita
                  y<-0
                  leia(fun[i].mail)
                  x<-verdadeiro
                  se fun[i].mail="9" entao
                     fun[i].mail<-""
                     fun[i].cpf<-""
                     fun[i].nome<-""
                     interrompa
                  senao
                     se fun[i].mail ="" entao
                        x<-falso
                        escreval("Por favor, digite algum endereço de email")
                     senao
                        para verificar de 1 ate 5 faca
                           se i <> verificar entao
                              se fun[i].mail=fun[verificar].mail entao
                                 escreval("Endereço de email já cadastrado.")
                                 escreval("Por favor, utilize um email diferente.")
                                 x<-falso
                                 interrompa
                              fimse
                           fimse
                        fimpara
                        se x=verdadeiro entao
                           dig <- compr(fun[i].mail)
                           para verificar de 1 ate dig faca
                              copiar<-copia(fun[i].mail,verificar,1)
                              escolha copiar
                              caso "@"
                                 se (verificar = 1) ou (verificar = dig) ou (verificar = dig-1) ou (verificar = dig-2) entao
                                    escreval("email inválido")
                                    x<-falso
                                    interrompa
                                 senao
                                    y<-y+1
                                    se y<>1 entao
                                       escreval("Email inválido")
                                       x<-falso
                                       interrompa
                                    fimse
                                 fimse
                              outrocaso
                                 se (verificar=dig) e (y<>1) entao
                                    escreval("Email inválido")
                                    x<-falso
                                 fimse
                              fimescolha
                           fimpara
                        fimse
                     fimse
                  fimse
               ate x<-verdadeiro
               se fun[i].mail="" entao
                  limpatela
                  escreval("| CADASTRO CANCELADO |")
                  interrompa
               fimse
               repita
                  escreval("Digite a sua senha")
                  repita
                     x<-verdadeiro
                     leia(fun[i].senha)
                     se fun[i].senha="9" entao
                        fun[i].mail<-""
                        fun[i].cpf<-""
                        fun[i].nome<-""
                        fun[i].senha<-""
                        interrompa
                     senao
                        dig<-compr(fun[i].senha)
                        Se (dig<8) ou (dig>16) entao
                           escreval("senha inválida, verifique se a senha possui")
                           escreval("de 8 até 16 digitos")
                           x<-falso
                        senao
                           para verificar de 1 ate dig faca
                              copiar <- copia(fun[i].senha,verificar,1)
                              escolha copiar
                              caso " "
                                 escreval("senha inválida, por favor não coloque espaços nela!")
                                 x<-falso
                                 interrompa
                              fimescolha
                           fimpara
                        fimse
                     fimse
                  ate x<-verdadeiro
                  se fun[i].senha="" entao
                     limpatela
                     escreval("| CADASTRO CANCELADO |")
                     interrompa
                  fimse
                  escreval("Repita sua senha")
                  leia(checar)
                  se checar <> fun[i].senha entao
                     escreval("Senha informada diferente da senha repetida")
                  fimse
               ate checar=fun[i].senha
               se fun[i].senha="" entao
                  interrompa
               fimse
               repita
                  escreval("Escolha um serviço da lista:")
                  escreval("A - Churrasqueiro")
                  escreval("B - DJ")
                  escreval("C - Palhaço")
                  escreval("D - Barman")
                  escreval("E - Confeiteiro")
                  repita
                     x<-verdadeiro
                     leia(fun[i].servico)
                     escolha fun[i].servico
                     caso "A"
                        fun[i].servico<-"Churrasqueiro"
                     caso "B"
                        fun[i].servico<-"DJ"
                     caso "C"
                        fun[i].servico<-"Palhaço"
                     caso "D"
                        fun[i].servico<-"Barman"
                     caso "E"
                        fun[i].servico<-"Confeiteiro"
                     caso "9"
                        fun[i].servico<-""
                        fun[i].mail<-""
                        fun[i].cpf<-""
                        fun[i].nome<-""
                        fun[i].senha<-""
                     outrocaso
                        escreval("Opção inválida, por favor, selecione um")
                        escreval("item da lista disponível.")
                        x<-falso
                     fimescolha
                  ate x=verdadeiro
                  se fun[i].servico="" entao
                     interrompa
                  fimse
                  escreval("Serviço selecionado: ",fun[i].servico)
                  escreval("Gostaria de trocar?")
                  escreval("1 - sim")
                  escreval("2 - não")
                  repita
                     leia(y)
                     se y=9 entao
                        fun[i].servico<-""
                        fun[i].mail<-""
                        fun[i].cpf<-""
                        fun[i].nome<-""
                        fun[i].senha<-""
                        interrompa
                     senao
                        se (y<>1) e (y<>2) entao
                           escreval("Opção inválida, selecione 1 para sim ou 2 para não.")
                        fimse
                     fimse
                  ate (y=1) ou (y=2)
                  se y = 9 entao
                     interrompa
                  fimse
               ate y=2
               se y=9 entao
                  limpatela
                  escreval("| CADASTRO CANCELADO |")
                  interrompa
               fimse
               escreval("Descreva brevemente o serviço (max: 50 caracteres)")
               repita
                  x<-verdadeiro
                  leia(fun[i].descricao)
                  se fun[i].descricao="9" entao
                     fun[i].servico<-""
                     fun[i].mail<-""
                     fun[i].cpf<-""
                     fun[i].nome<-""
                     fun[i].senha<-""
                     fun[i].descricao<-""
                     interrompa
                  senao
                     dig <- compr(fun[i].descricao)
                     se dig=0 entao
                        fun[i].descricao<-"Sem descrição."
                     senao
                        se dig>50 entao
                           escreval("Limite de caracteres ultrapassado.")
                           escreval("Você utilizou ",dig," caracteres.")
                           x<-falso
                        fimse
                     fimse
                  fimse
               ate x=verdadeiro
               se fun[i].descricao="" entao
                  limpatela
                  escreval("| CADASTRO CANCELADO |")
                  interrompa
               fimse
               escreval("Informe o custo de seu serviço : (min: 10, max: 10000)")
               escreval("(Lembre-se, será retirado 10% por causa das taxas)" )
               repita
                  x<-verdadeiro
                  leia(fun[i].preco)
                  se fun[i].preco=9 entao
                     fun[i].servico<-""
                     fun[i].mail<-""
                     fun[i].cpf<-""
                     fun[i].nome<-""
                     fun[i].senha<-""
                     fun[i].descricao<-""
                     fun[i].preco<-""
                     interrompa
                  senao
                     se (fun[i].preco <10) ou (fun[i].preco>10000) entao
                        escreval("Custo inválido")
                        x<-falso
                     senao
                        escreval("O custo do seu serviço é de:")
                        escreval("R$",(fun[i].preco):2:2)
                        escreval("Por venda, você receberá:")
                        escreval("R$",(fun[i].preco-fun[i].preco*0.1):2:2)
                        escreval("Tem certeza que deseja usar esse valor?")
                        escreval("(lembrete: caso queira CANCELAR O CADASTRO, digite 2 e depois 9)")
                        escreval("1 - Sim")
                        escreval("2 - Não, gostaria de mudar")
                        repita
                           leia (y)
                           se (y<>1) e (y<>2) entao
                              escreval("Opção inválida, selecione 1 para sim ou 2 para não")
                           senao
                              se y=2 entao
                                 x<-falso
                                 Escreval("Informe o novo custo:")
                              fimse
                           fimse
                        ate (y=1) ou (y=2)
                     fimse
                  fimse
               ate x=verdadeiro
               se fun[i].preco="" entao
                  limpatela
                  escreval("| CADASTRO CANCELADO |")
                  interrompa
               fimse
               escreval("Informe o seu saldo inicial limitado de 100 até 10000.")
               repita
                  x<-verdadeiro
                  leia(fun[i].saldo)
                  se fun[i].saldo=9 entao
                     fun[i].servico<-""
                     fun[i].mail<-""
                     fun[i].cpf<-""
                     fun[i].nome<-""
                     fun[i].senha<-""
                     fun[i].descricao<-""
                     fun[i].preco<-""
                     fun[i].saldo<-""
                     interrompa
                  senao
                     se(fun[i].saldo<100) ou (fun[i].saldo>10000) entao
                        escreval("Por favor, insira um valor entre 100 a 10000!")
                        x<-falso
                     fimse
                  fimse
               ate x=verdadeiro
               se fun[i].saldo="" entao
                  limpatela
                  escreval("| CADASTRO CANCELADO |")
                  interrompa
               fimse
               limpatela
               TIMER(300)
               escreval("O seu saldo é de: R$",(fun[i].saldo):2:2)
               fun[i].block<-falso
               escreval("Cadastro efetuado com sucesso,")
               escreval("Seja bem vindo ao RAP, ",fun[i].nome)
               timer(0)
               limpatela
               interrompa
            fimse
         fimse
      fimpara
   caso 2
      para i de 1 ate 10 faca
         se (i = 5) e (cli[i].nome<>"")  entao
            limpatela
            escreval("limite de cadastros de clientes atingido")
         senao
            se cli[i].nome="" entao
               escreval("Digite o seu nome: (max: 30 caracteres)")
               repita
                  leia(cli[i].nome)
                  se cli[i].nome="9" entao
                     cli[i].nome<-""
                     limpatela
                     escreval("| CADASTRO CANCELADO |")
                     interrompa
                  senao
                     se compr(cli[i].nome)>30 entao
                        escreval("Limite de caracteres atingido!")
                        cli[i].nome<-""
                     senao
                        se cli[i].nome="" entao
                           escreval("Por favor, insira um nome diferente de vazio.")
                        fimse
                     fimse
                  fimse
               ate cli[i].nome<>""
               se cli[i].nome="" entao
                  interrompa
               fimse
               escreval("Digite o seu cpf (somente números)")
               repita
                  leia(cli[i].cpf)
                  se cli[i].cpf="9" entao
                     cli[i].cpf<-""
                     cli[i].nome<-""
                     interrompa
                  senao
                     x<-verdadeiro
                     se compr(cli[i].cpf) <>11 entao
                        escreval("CPF INVáLIDO, INSIRA UM CPF VÁLIDO, Formato aceito: 00000000000")
                        x<-falso
                     senao
                        para verificar de 1 ate 5 faca
                           se i <> verificar entao
                              se cli[i].cpf=cli[verificar].cpf entao
                                 escreval("CPF já cadastrado.")
                                 escreval("Por favor, utilize um CPF diferente.")
                                 x<-falso
                                 interrompa
                              fimse
                           fimse
                        fimpara

                        se x=verdadeiro entao

                           para verificar de 1 ate 11 faca
                              copiar<-copia(cli[i].cpf,verificar,1)
                              escolha copiar
                              caso "1"
                              caso "2"
                              caso "3"
                              caso "4"
                              caso "5"
                              caso "6"
                              caso "7"
                              caso "8"
                              caso "9"
                              caso "0"
                              outrocaso
                                 escreval("CPF INVáLIDO, INSIRA UM CPF VÁLIDO, Formato aceito: 00000000000")
                                 x<-falso
                                 interrompa
                              fimescolha
                           fimpara
                        fimse
                     fimse
                  fimse
               ate x=verdadeiro
               se cli[i].cpf="" entao
                  limpatela
                  escreval("| CADASTRO CANCELADO |")
                  interrompa
               fimse
               escreval("Digite o seu email")
               repita
                  y<-0
                  leia(cli[i].mail)
                  se cli[i].mail=9 entao
                     cli[i].cpf<-""
                     cli[i].nome<-""
                     cli[i].mail<-""
                     interrompa
                  senao
                     x<-verdadeiro
                     se cli[i].mail ="" entao
                        x<-falso
                        escreval("Por favor, digite algum endereço de email")
                     senao
                        para verificar de 1 ate 5 faca
                           se i <> verificar entao
                              se cli[i].mail=cli[verificar].mail entao
                                 escreval("Endereço de email já cadastrado.")
                                 escreval("Por favor, utilize um email diferente.")
                                 x<-falso
                                 interrompa
                              fimse
                           fimse
                        fimpara
                        se x=verdadeiro entao
                           dig <- compr(cli[i].mail)
                           para verificar de 1 ate dig faca
                              copiar<-copia(cli[i].mail,verificar,1)
                              escolha copiar
                              caso "@"
                                 se (verificar = 1) ou (verificar = dig) ou (verificar = dig-1) ou (verificar = dig-2) entao
                                    escreval("Email inválido")
                                    x<-falso
                                    interrompa
                                 senao
                                    y<-y+1
                                    se y<>1 entao
                                       escreval("Email inválido")
                                       x<-falso
                                       interrompa
                                    fimse
                                 fimse
                              outrocaso
                                 se (verificar=dig) e (y<>1) entao
                                    escreval("Email inválido")
                                    x<-falso
                                 fimse

                              fimescolha
                           fimpara
                        fimse
                     fimse
                  fimse
               ate x<-verdadeiro
               se cli[i].mail="" entao
                  limpatela
                  escreval("| CADASTRO CANCELADO |")
                  interrompa
               fimse
               repita
                  escreval("Digite a sua senha")
                  repita
                     x<-verdadeiro
                     leia(cli[i].senha)
                     se cli[i].senha="9" entao
                        cli[i].senha<-""
                        cli[i].cpf<-""
                        cli[i].nome<-""
                        cli[i].mail<-""
                        interrompa
                     senao
                        dig<-compr(cli[i].senha)
                        Se (dig<8) ou (dig>16) entao
                           escreval("senha inválida, verifique se a senha possui")
                           escreval("de 8 até 16 digitos")
                           x<-falso
                        senao
                           para verificar de 1 ate dig faca
                              copiar <- copia(cli[i].senha,verificar,1)
                              escolha copiar
                              caso " "
                                 escreval("senha inválida, por favor não coloque espaços nela!")
                                 x<-falso
                                 interrompa
                              fimescolha
                           fimpara
                        fimse
                     fimse
                  ate x<-verdadeiro
                  se cli[i].senha="" entao
                     limpatela
                     escreval("| CADASTRO CANCELADO |")
                     interrompa
                  fimse
                  escreval("Repita sua senha")
                  leia(checar)
                  se checar <> cli[i].senha entao
                     escreval("Senha informada diferente da senha repetida")
                  fimse
               ate checar=cli[i].senha
               se cli[i].senha="" entao
                  interrompa
               fimse
               escreval("Informe o seu saldo inicial limitado de 100 até 10000.")
               repita
                  x<-verdadeiro
                  leia(cli[i].saldo)
                  se cli[i].saldo=9 entao
                     cli[i].saldo<-""
                     cli[i].senha<-""
                     cli[i].cpf<-""
                     cli[i].nome<-""
                     cli[i].mail<-""
                     interrompa
                  senao
                     se(cli[i].saldo<100) ou (cli[i].saldo>10000) entao
                        escreval("Por favor, insira um valor entre 100 a 10000!")
                        x<-falso
                     fimse
                  fimse
               ate x=verdadeiro
               se cli[i].saldo="" entao
                  limpatela
                  escreval("| CADASTRO CANCELADO |")
                  interrompa
               fimse
               cli[i].block<-falso
               timer(250)
               limpatela
               escreval("O seu saldo é de: R$",(cli[i].saldo):2:2)
               escreval("Cadastro efetuado com sucesso,")
               escreval("Seja bem vindo ao RAP, ",cli[i].nome)
               timer(0)
               limpatela
               interrompa
            fimse
         fimse
      fimpara
   caso 9
      limpatela
      escreval("| CADASTRO CANCELADO |")
   outrocaso
      limpatela
      escreval("| CADASTRO CANCELADO |")
   fimescolha
fimprocedimento
procedimento login
var
   dig,i,y:inteiro
   maillogin,senhalogin:caractere
   x:logico
inicio
   x<-falso
   enquanto x=falso faca
      escreval("Tela de login")
      escreval("escolha uma opção:")
      escreval("1 - Login como cliente")
      escreval("2 - Login como funcionário")
      escreval("3 - Login como admin")
      escreval("4 - Menu principal")
      leia(dig)
      escolha dig
      caso 1
         y<-0
         escreval("Digite o seu email:")
         leia(maillogin)
         para i de 1 ate 5 faca
            se (maillogin=cli[i].mail) e (maillogin<>"") entao
               se cli[i].block=verdadeiro entao
                  limpatela
                  escreval("Sua conta está bloqueada, contate o suporte para desbloquear.")
                  y<-1
               senao
                  escreval("Digite a sua senha:")
                  para dig de 1 ate 5 faca
                     leia(senhalogin)
                     se senhalogin=cli[i].senha entao
                        numlog<-i
                        IDLOGIN<-2
                        limpatela
                        escreval("LOGIN FEITO COM SUCESSO!")
                        escreval("Seja bem vindo, ",cli[i].nome)
                        x<-verdadeiro
                        interrompa
                     senao
                        escreval("Senha incorreta")
                        se dig=5 entao
                           cli[i].block<-verdadeiro
                           limpatela
                           escreval("Sua conta foi bloqueada, contate o suporte para desbloquear.")
                           interrompa
                        fimse
                     fimse
                  fimpara
               fimse
            senao
               se (i=5) e (maillogin<>cli[i].mail) e (senhalogin="") e (y<>1) ou (maillogin="") e (i=5) entao
                  limpatela
                  escreval("Este endereço de email não está cadastrado!")
               fimse
            fimse
         fimpara
      caso 2
         y<-0
         escreval("Digite o seu email:")
         leia(maillogin)
         para i de 1 ate 5 faca
            se (maillogin=fun[i].mail) e (maillogin<>"") entao
               se fun[i].block=verdadeiro entao
                  limpatela
                  escreval("Sua conta está bloqueada, contate o suporte para desbloquear.")
                  y<-1
               senao
                  escreval("Digite a sua senha:")
                  para dig de 1 ate 5 faca
                     leia(senhalogin)
                     se senhalogin=fun[i].senha entao
                        numlog<-i
                        IDLOGIN<-1
                        limpatela
                        escreval("LOGIN FEITO COM SUCESSO!")
                        escreval("Seja bem vindo, ",fun[i].nome)
                        x<-verdadeiro
                        interrompa
                     senao
                        escreval("Senha incorreta")
                        se dig=5 entao
                           fun[i].block<-verdadeiro
                           limpatela
                           escreval("Sua conta foi bloqueada, contate o suporte para desbloquear.")
                           interrompa
                        fimse
                     fimse
                  fimpara
               fimse
            senao
               se (i=5) e (maillogin<>fun[i].mail) e (senhalogin="") e (y<>1) ou (maillogin="") e (i=5) entao
                  limpatela
                  escreval("Este endereço de email não está cadastrado!")
               fimse
            fimse
         fimpara
      caso 3
         y<-0
         escreval("Digite o seu email:")
         leia(maillogin)
         se maillogin=mailadm entao
            escreval("Digite a sua senha:")
            leia(senhalogin)
            se senhalogin=senhaadm entao
               limpatela
               escreval("Login como ADMIN feito com sucesso!")
               IDLOGIN<-3
               x<-verdadeiro
            senao
               limpatela
               escreval("SENHA INCORRETA")
            fimse
         senao
            limpatela
            escreval("EMAIL INCORRETO!")
         fimse
      caso 4
         limpatela
         x<-verdadeiro
      outrocaso
         limpatela
         escreval("OPÇÃO INVÁLIDA!")
      fimescolha
   fimenquanto
fimprocedimento
inicio
   sair<-falso
   enquanto sair=falso faca
      escolha IDLOGIN
      caso 1
         funcionario
      caso 2
         cliente
      caso 3
         senhaadm<-"Teste12345"
         mailadm<-"Teste@gmail.com
         admin
      caso 9
         escreval("CONTA EXCLUIDA COM SUCESSO")
         cli[numlog].cpf<-""
         cli[numlog].mail<-""
         cli[numlog].senha<-""
         cli[numlog].saldo<-0
         cli[numlog].nome<-""
         idlogin<-0
         numlog<-0
      caso 10
         escreval("CONTA EXCLUIDA COM SUCESSO")
         fun[numlog].cpf<-""
         fun[numlog].mail<-""
         fun[numlog].senha<-""
         fun[numlog].saldo<-0
         fun[numlog].nome<-""
         fun[numlog].servico <- ""
         fun[numlog].descricao <- ""
         fun[numlog].preco<-0
         idlogin<-0
         numlog<-0
      outrocaso
         escreval("|      PRINCIPAL      |")
         ESCREVAL("|  DIGITE UMA OPÇÃO:  |")
         escreval("| 1 - CADASTRO        |")
         escreval("| 2 - LOGIN           |")
         escreval("| 3 - SAIR            |")
         leia(num)
         limpatela
         escolha num
         caso 1
            cadastro
         caso 2
            login
         caso 3
            sair <- verdadeiro
         caso 4
            cli[1].nome<-"testecli"
            cli[1].cpf<-"12345678901"
            cli[1].saldo<-10000
            cli[1].mail<-"testecli@gmail"
            cli[1].senha<-"12345678"
            cli[1].block<-falso
            fun[1].nome<-"testefun"
            fun[1].cpf<-"12345678902"
            fun[1].saldo<-10000
            fun[1].mail<-"testefun@gmail"
            fun[1].senha<-"12345678"
            fun[1].block<-falso
            fun[1].servico<-"Churrasqueiro"
            fun[1].descricao<-"Essa é a descrição"
            fun[1].preco<-500
            fun[2].nome<-"testefun2"
            fun[2].cpf<-"12345678902"
            fun[2].saldo<-10000
            fun[2].mail<-"testefun2@gmail"
            fun[2].senha<-"12345678"
            fun[2].block<-falso
            fun[2].servico<-"Palhaço"
            fun[2].descricao<-"Essa é a descrição 2"
            fun[2].preco<-1000
         outrocaso
            escreval("|   Opção Inválida   |")
         fimescolha
      fimescolha
   fimenquanto
Fimalgoritmo