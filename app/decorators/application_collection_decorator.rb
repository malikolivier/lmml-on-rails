class ApplicationCollectionDecorator < Draper::CollectionDecorator
  # Super class from which all the collection decorators inherit
  def initialize(*args)
    super
    @model_plural_name = object.class.to_s.split('::')[0].underscore.pluralize
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
