class ApplicationRecord < ActiveRecord::Base
  self.abstract_class = true

  # Return the translated text value of an attribute defined with an enumeration
  def translated_enum_value(attribute)
    translated_enum_value!(attribute)
  rescue LmmlOnRails::MissingTranslationData => e
    e.message
  end

  def translated_enum_value!(attribute)
    s = "activerecord.enums.#{self.class.model_name.singular}.#{attribute}"
    attribute_value = send(attribute)
    I18n.translate!(attribute_value, scope: s)
  rescue I18n::MissingTranslationData
    begin
      I18n.translate!(attribute_value, scope: attribute)
    rescue I18n::MissingTranslationData
      message = "translation missing: #{I18n.locale}.#{s}.#{attribute_value} " \
                "or #{I18n.locale}.#{attribute}.#{attribute_value}"
      raise LmmlOnRails::MissingTranslationData, message
    end
  end

  class << self
    def translated_enum_value(attribute, value)
      return nil if value.blank?
      new(attribute => value).translated_enum_value(attribute)
    end

    def translated_enum_value!(attribute, value)
      new(attribute => value).translated_enum_value!(attribute)
    end

    def translated_enum(attribute)
      attribute = attribute.to_s if attribute.is_a? Symbol
      send(attribute.pluralize).map do |value, _|
        [translated_enum_value(attribute, value), value]
      end
    end

    def translated_enum!(attribute)
      attribute = attribute.to_s if attribute.is_a? Symbol
      send(attribute.pluralize).map do |value, _|
        [translated_enum_value!(attribute, value), value]
      end
    end

    # Create a public method json_includes indicating the children than should
    # be included in JSON input. Children can be added using this method:
    #     includes_in_json :method
    #     includes_in_json :method1, :method2
    #     includes_in_json method1: { include: :innermethod }, method2: {}}
    # See rails documentation for 'as_json' as it use the same argument format.
    def includes_in_json(*objects)
      @json_includes ||= {}
      objects.each do |object|
        case object
        when Hash
          @json_includes.merge!(object)
        when Array
          object.map { |o| @json_includes[o] = {} }
        else
          @json_includes[object] = {}
        end
      end
    end

    def included_in_json
      @json_includes || {}
    end

    def json_includes
      # Go up until the parent class
      current_child = self
      includes = {}
      while current_child != ApplicationRecord
        includes.merge!(current_child.included_in_json)
        current_child = current_child.superclass
      end
      includes
    end
  end

  def as_lmml_json
    as_json(include: self.class.json_includes)
  end
end
