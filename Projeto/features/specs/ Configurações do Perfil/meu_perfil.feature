#language:pt

Funcionalidade: Meu perfil
    Para que eu possa manter meus dados atualizados
    Sendo um usuário
    Posso completar o meu cadastro do perfil

    Esquema do Cenário: Atualizar perfil
      Dado que estou autenticado com "<email>" e "<senha>"
      E acesso o meu perfil
      Quando completo o meu cadastro com "<empresa>" e "<cargo>"
      Então devo ver a mensagem de atualização cadastral:
      """"
      Perfil atualizado com sucesso.
      """"
      Exemplos:
      | email                            | senha    | empresa  | cargo      |
      | adrian.almeida@venturus.org.br   | 123456   | Venturus | Developer  |
      | rogerio.oliveira@venturus.org.br | asdfgh   | Facebook | QA         |
      | dimna.garcia@venturus.org.br     | 987654   | Google   | CTO        |