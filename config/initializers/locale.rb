I18n.enforce_available_locales = false
I18n.config.default_locale = :ja

# Set default_url_options
# Ensure that the locale choice is persistent across requests
# What was written in the docs does not work for rails 5
# https://apidock.com/rails/ActionController/Base/default_url_options
# Created an issue: https://github.com/rails/rails/issues/28714
module ActionDispatch
  module Routing
    module UrlFor
      def default_url_options
        { locale: I18n.locale }
      end
    end
  end
end
