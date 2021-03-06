require_relative 'boot'

require 'rails/all'

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)

module LmmlOnRails
  class Application < Rails::Application
    # Settings in config/environments/* take precedence over those specified
    # here.
    # Application configuration should go into files in config/initializers
    # -- all .rb files in that directory are automatically loaded.
    config.autoload_paths << Rails.root.join('app', 'decorators')
    config.autoload_paths << Rails.root.join('lib')
    config.autoload_paths << Rails.root.join('doc', 'swagger_schemas')
    config.time_zone = 'Asia/Tokyo'
  end
end
