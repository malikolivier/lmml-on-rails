class ApplicationDecorator < Draper::Decorator
  # Super class from which all the decorators inherit
  def initialize(*args)
    super
    @model_plural_name = model.class.name.underscore.pluralize
  end

  private

  # Defines a conveniant t to call translate from I18n
  def t(key, hash = {})
    if key.start_with?('.')
      I18n.t("#{@model_plural_name}.#{key}", hash)
    else
      I18n.t(key, hash)
    end
  end
end
