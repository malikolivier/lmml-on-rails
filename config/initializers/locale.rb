I18n.enforce_available_locales = false
I18n.config.default_locale = :ja
Rails.application.routes.default_url_options = { locale: I18n.locale }
