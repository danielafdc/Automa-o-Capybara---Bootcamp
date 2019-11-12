class TarefasPage

    include Capybara::DSL

    def cadastro_tarefas(nome_tarefa, data_finalizacao, tags)
        find("#insert-button").click

        within('#add-task') do
        fill_in "title", with: nome_tarefa
        fill_in "dueDate", with: data_finalizacao

        tag_field = find(".bootstrap-tagsinput").find("input[type=text]")

        if !tags.is_a?NilClass
            tags.each do |tag_nome|
            tag_field.fill_in with: tag_nome[:tag]
            tag_field.native.send_keys(:return)
            end
        end

        click_button "Cadastrar"
        end
    end

    def botao_voltar
        click_on "Voltar" if page.has_css?('#add-task')
    end

    def buscar_tr(nome)
        find("#tasks tbody tr", text: nome)
    end

    def buscar_trs(nome)
        all("#tasks tbody tr", text: nome)
    end

    def mensagem_alerta
        find(".panel-body")
    end

    def excluir_tarefa(nome)
        buscar_tr(nome).find('#delete-button').click
    end

    def confirma_modal
        within('.modal-content') do
            click_button 'Sim'
        end
    end

    def nao_confirma_modal
        within('.modal-content') do
            click_button 'Não, deixa queto'
        end
    end

    def editar_tarefa(nome)
        buscar_tr(nome).find('#edit-button').click
        sleep 3
    end

    def finalizar_tarefa
        within('#edit-task') do
            sleep 3
             done_field = find(".pretty", text: "Finalizada")
             done_field.click
            click_button 'Atualizar'
        end
    end
end