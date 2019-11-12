#language:pt

Funcionalidade: Editar tarefa
    Para que eu possa finalizar as tarefas já concluídas
    Sendo um usuário que possui tarefas cadastradas
    Posso editar uma tarefa e finalizá-la

    @login
    Cenário: Finalizar uma tarefa através da edição
        Dado que eu tenho uma tarefa já concluída
        Quando eu edito a tarefa
        E a finalizo
        Então devo ver esta tarefa no painel com o status "Finalizado"