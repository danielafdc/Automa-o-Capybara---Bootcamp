class LoginPage

    include Capybara::DSL

    def login(email, senha)
        find("#login_email").set email
        find("#login_password").set senha
        find("button[id*=btnLogin]").click
    end

    def alerta
        find(".alert-login")
    end

    def acessa_pagina
        visit "/login"
    end
end