#language:pt

Funcionalidade: Login
    Para que eu possa cadastrar e gerenciar minhas tarefas
    Sendo um usuário
    Posso acessar o sistema com email e senha previamente cadastrados.

    Contexto: Home
        Dado que eu acesso o sistema

    Cenario: Usuário autenticado
        Quando faço login com "daniela.ferreira@venturus.org.br" e "123456"
        Então vejo a mensagem de boas vindas "Olá, Dani"

    Esquema do Cenario: Tentativa de login
        Quando faço login com "<email>" e "<senha>"
        Então vejo a seguinte mensagem de alerta "<saida>"

        Exemplos:
      | email                            | senha    | saida                       |
      | daniela.ferreira@venturus.org.br | Abcd1234 | Senha inválida.             |
      | teste@teste.com.br               | 123456   | Usuário não cadastrado.     |
      |                                  | 123456   | Email incorreto ou ausente. |
      | daniela.ferreira@venturus.org.br |          | Senha ausente.              |
      | daniela.ferreira#venturus.org.br | abcd1234 | Email incorreto ou ausente. |