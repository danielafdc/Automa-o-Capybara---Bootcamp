require "faker"

Dado("que eu acesso a página de cadastro") do
    visit ("/")
    click_link "Clique aqui"
  end
  
  Quando("faço meu cadastro com {string}, {string} e {string}") do |nome, email, senha|
    @cadastro_usuario_page.cadastro_de_usuario(nome, email, senha)
  end
  
  Então("vejo a seguinte {string}") do |mensagem_alerta|
    expect(@cadastro_usuario_page.mensagem_alerta_cadastro).to have_content mensagem_alerta
  end
  
  Quando("faço meu cadastro com meu {string}, {string} e {string}") do |nome, email, senha|
    @nome = Faker::FunnyName.name
    @cadastro_usuario_page.cadastro_de_usuario(@nome, "#{Faker::Lorem.characters(number:8)}@gmail.com", "123456")
    sleep 10
  end
  
  Então("meu perfil é criado com sucesso") do
    expect(find("#task-board")).to have_content @nome
  end