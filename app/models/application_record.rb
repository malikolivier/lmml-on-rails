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
    def includes_in_json(*methods)
      @json_includes ||= {}
      methods.each do |method|
        case method
        when Hash
          @json_includes.merge!(method)
        when Array
          method.map { |m| @json_includes[m] = {} }
        else
          @json_includes[method] = {}
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

    # How to use:
    #     excludes_in_json :method1, :method2, ...
    # (where "methodX" are methods defined by active record returning relations)
    def excludes_in_json(*methods)
      @json_excludes ||= []
      @json_excludes.concat(methods)
    end

    def json_excludes
      @json_excludes || []
    end

    # How to use:
    #     includes_method_in_json :method1, :method2, ...
    # (where "methodX" are methods defined by yourself that returns a
    # serializable obejct)
    def includes_method_in_json(*methods)
      @json_method_includes ||= []
      @json_method_includes.concat(methods)
    end

    def json_method_includes
      @json_method_includes || []
    end

    def as_lmml_params
      { include: json_includes, except: json_excludes,
        methods: json_method_includes }
    end
  end

  def as_lmml_json
    as_json(self.class.as_lmml_params)
  end

  def to_lmml_xml
    as_lmml_json.to_xml(root: model_name.singular, dasherize: false)
  end
end
