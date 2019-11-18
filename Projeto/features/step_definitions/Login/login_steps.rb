Dado("que eu acesso o sistema") do
    visit("/")
  end
  
  Quando("faço login com {string} e {string}") do |email, senha|
    @login_page.login(email, senha)
  end
  
  Então("vejo a mensagem de boas vindas {string}") do |mensagem_boas_vindas|
    expect(find("#task-board")).to have_content mensagem_boas_vindas
  end
  
  Então("vejo a seguinte mensagem de alerta {string}") do |mensagem_alerta|
    expect(@login_page.alerta).to have_content mensagem_alerta
  end