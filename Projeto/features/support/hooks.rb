Before do
    @cadastro_usuario_page = CadastroDeUsuarioPage.new
    @login_page = LoginPage.new
    @perfil_page = PerfilPage.new
    @aside = MenuLateral.new
    @tarefas_page = TarefasPage.new

    #page.current_window.resize_to(1280, 800)
end

Before("@login") do
    @usuario = { email: "daniela.ferreira@venturus.org.br", senha: "123456" }
    @login_page.acessa_pagina
    @login_page.login(@usuario[:email], @usuario[:senha])
end

After do |scenario|
    nome = scenario.name.gsub(/([_@#!%()\-=;><,{}\~\[\]\.\/\?\"\*\^\$\+\-]+)/, '')
    nome = nome.tr(" ","_").downcase!
    screenshot = "log/screenshots/#{nome}.png"

    #if scenario.failed?
    page.save_screenshot(screenshot)
    #end
end
Capybara.default_max_wait_time = 5