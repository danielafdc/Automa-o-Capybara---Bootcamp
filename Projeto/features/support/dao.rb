require "mongo"

class DAO

    attr_accessor :client
    
    Mongo::Logger.logger = Logger.new("log/mongo.log")
    def initialize
        str_con = "mongodb://127.0.0.1:27017/markdb"
        @client = Mongo::Client.new(str_con)
    end

    def obter_usuario(email)
        users = @client[:users]
        users.find("profile.email" => email).first
    end

    def remover_tarefas(nome_tarefa, email)
        user = obter_usuario(email)
        tasks = @client[:tasks]
        tasks.delete_many("title" => nome_tarefa, "createdBy" => user[:_id])
    end
end