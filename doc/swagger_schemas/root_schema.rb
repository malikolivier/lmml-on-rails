require 'rails/commands/server'

class RootSchema
  include Swagger::Blocks

  PORT = Rails::Server.new.options[:Port]
  HOST = Rails::Server.new.options[:Host]

  swagger_root do
    key :swagger, '2.0'
    info do
      key :version, LmmlFile::VERSION
      key :title, 'LMML on Rails API'
      key :description, 'API to retrieve LMML data'
      # key :termsOfService, 'http://your-term-of-service.com/terms/'
      contact do
        key :name, 'Malik Olivier Boussejra'
      end
      license do
        key :name, 'BSD'
      end
    end
    key :host, "#{HOST}:#{PORT}"
    key :basePath, ''
    key :consumes, ['application/json']
    key :produces, ['application/json']
  end
end
