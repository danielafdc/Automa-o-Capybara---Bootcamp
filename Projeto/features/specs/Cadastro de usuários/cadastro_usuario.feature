#language:pt

Funcionalidade: Cadastro de usuário
    Para que eu possa acessar o sistema e cadastrar minhas tarefas
    Sendo um usuário
    Quero criar o meu perfil com um email e senha

    Contexto: Página de cadastro de usuário
        Dado que eu acesso a página de cadastro

    Cenário: Cadastro com sucesso
        Quando faço meu cadastro com meu nome, email e senha
        Então meu perfil é criado com sucesso

    Esquema do Cenário: Tentativa de cadastro do usuário
        Quando faço meu cadastro com "<nome>", "<email>" e "<senha>"
        Então vejo a seguinte "<mensagem>"

        Exemplos:
        | nome    | email                | senha  | mensagem                                    |
        | Daniela |                      | 123456 | Email é obrigatório.                        |
        |         | daniela@teste.com.br | 123456 | Nome é obrigatório.                         |
        | Daniela | daniela@teste.com.br |        | Informe uma senha.                          |
        | Daniela | daniela#teste.com.br | 123456 | Informe um email válido.                    |
        | Daniela | daniela@teste.com.br | 12345  | Sua senha deve ter pelo menos 6 caracteres. |