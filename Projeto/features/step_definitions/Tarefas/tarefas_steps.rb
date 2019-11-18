Dado("que o nome da minha tarefa é {string}") do |nome_tarefa|
    @nome_tarefa = nome_tarefa
    DAO.new.remover_tarefas(@nome_tarefa, @usuario[:email])
  end
  
  Dado("a data de finalização será {string}") do |data_finalizacao|
    @data_finalizacao = data_finalizacao
  end
  
  Dado("quero taguear esta tarefa com:") do |tags|
    @tags = tags.hashes
  end
  
  Quando("faço o cadastro desta tarefa") do
    @tarefas_page.cadastro_tarefas(@nome_tarefa, @data_finalizacao, @tags)
  end
  
  Então("devo ver esta tarefa no painel com o status {string}") do |status_tarefa|
    expect(@tarefas_page.buscar_tr(@nome_tarefa)).to have_content status_tarefa
  end
  
  Então("devo ver somente {int} tarefa com o nome cadastrado") do |quantidade|
    @tarefas_page.botao_voltar
    expect(@tarefas_page.buscar_trs(@nome_tarefa).size).to eql quantidade
  end
  
  Então("devo ver a seguinte mensagem: {string}") do |mensagem_alerta|
    expect(@tarefas_page.mensagem_alerta).to have_content mensagem_alerta
  end
  
  Dado("eu já cadastrei esta tarefa e me esqueci") do
    steps %(
            Quando faço o cadastro desta tarefa
            )
  end

  Dado("que eu tenho uma tarefa indesejada") do
    @nome_tarefa = 'Tarefa indesejada'
    @data_tarefa = '20/08/2019'
    DAO.new.remover_tarefas(@nome_tarefa, @usuario[:email])
    @tarefas_page.cadastro_tarefas(@nome_tarefa, @data_tarefa, @tags)
  end
  
  Quando("eu solicito a exclusão desta tarefa") do
    @tarefas_page.excluir_tarefa(@nome_tarefa)
  end
  
  Quando("confirmo a ação de exclusão") do
    @tarefas_page.confirma_modal
  end
  
  Então("esta tarefa não deve mais ser exibida na lista") do
    expect(@tarefas_page.buscar_trs(@nome_tarefa)). to have_no_content @nome_tarefa
  end
  
  Quando("eu desisto da exclusão") do
    @tarefas_page.nao_confirma_modal
  end
  
  Então("esta tarefa deve permanecer na lista") do
    expect(@tarefas_page.buscar_trs(@nome_tarefa).size). to eql 1
  end

  Dado("que eu tenho uma tarefa já concluída") do
    @nome_tarefa = 'Viagem para o Caribe'
    @data_tarefa = '01/01/2019'
    DAO.new.remover_tarefas(@nome_tarefa, @usuario[:email])
    @tarefas_page.cadastro_tarefas(@nome_tarefa, @data_tarefa, @tags)
  end
  
  Quando("eu edito a tarefa") do
    @tarefas_page.editar_tarefa(@nome_tarefa)
  end
  
  Quando("a finalizo") do
    @tarefas_page.finalizar_tarefa
  end
