#language:pt

Funcionalidade: Cadastro de tarefas
    Para que eu possa organizar meus deveres e compromissos
    Sendo um usuário cadastrado
    Posso criars novas tarefas no meu Painel

    @login
    Cenário: Nova tarefa
        Dado que o nome da minha tarefa é "Fazer Compras"
        E a data de finalização será "15/12/2019"
        E quero taguear esta tarefa com:
        |tag         |
        |Compras     |
        |Supermercado|
        |Legumes     |
        Quando faço o cadastro desta tarefa
        Então devo ver esta tarefa no painel com o status "Em andamento"
        E devo ver somente 1 tarefa com o nome cadastrado

    @login
    Esquema do Cenário: Tentar cadastrar uma tarefa
        Dado que o nome da minha tarefa é "<nome_tarefa>"
        E a data de finalização será "<data_finalizacao>"
        Quando faço o cadastro desta tarefa
        Então devo ver a seguinte mensagem: "<mensagem>"

        Exemplos:
      | nome_tarefa| data_finalizacao | mensagem                            |
      | Ler        | 21/08/2018       | 10 caracteres é o mínimo permitido. |
      |            | 23/10/2019       | Nome é obrigatório.                 |

    @login
    Cenário: Tarefa não pode ser duplicada
        Dado que o nome da minha tarefa é "Ler um livro de BDD"
        E a data de finalização será "21/01/2019"
        Mas eu já cadastrei esta tarefa e me esqueci
        Quando faço o cadastro desta tarefa
        Então devo ver a seguinte mensagem: "Tarefa duplicada."
        E devo ver somente 1 tarefa com o nome cadastrado