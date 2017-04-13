# rubocop:disable ClassLength
# TODO; split and simplify this class
# Base class for all active record. Defines a few handy helper methods
class ApplicationRecord < ActiveRecord::Base
  self.abstract_class = true
  # i18n_keys is used to contain the key leading to the translation of a value
  # of an attribute defined in locale/*.yml
  class_attribute :i18n_keys
  self.i18n_keys = {}

  # Return the translated text value of an attribute defined with an enumeration
  def translated_enum_value(attribute)
    translated_enum_value!(attribute)
  rescue LmmlOnRails::MissingTranslationData => e
    e.message
  end

  def translated_enum_value!(attribute)
    i18n_key = self.class.i18n_keys[attribute.to_sym]
    s = "activerecord.enums.#{self.class.model_name.singular}.#{i18n_key}"
    attribute_value = send(attribute)
    I18n.translate!(attribute_value, scope: s)
  rescue I18n::MissingTranslationData
    begin
      I18n.translate!(attribute_value, scope: i18n_key)
    rescue I18n::MissingTranslationData
      message = "translation missing: #{I18n.locale}.#{s}.#{attribute_value} " \
                "or #{I18n.locale}.#{i18n_key}.#{attribute_value}"
      raise LmmlOnRails::MissingTranslationData, message
    end
  end

  class << self
    # Extends enum with a i18n_key options. This options allows to set the
    # i18n translation key used for this attribute.
    def enum(definitions)
      i18n_key = definitions.delete(:i18n_key)
      definitions.each do |name, _values|
        next if %i[_prefix _suffix].include?(name)
        i18n_key = i18n_key.present? ? i18n_key : name
        self.i18n_keys = i18n_keys.merge(name => i18n_key)
      end
      super(definitions)
    end

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
