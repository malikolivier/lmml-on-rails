class ApplicationRecord < ActiveRecord::Base
  self.abstract_class = true

  class << self
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

  def to_lmml_xml
    as_lmml_json.to_xml(root: model_name.singular)
  end
end
