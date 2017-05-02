module LmmlOnRails
  module LmmlSpec
    def lmml_spec(formatting = :json)
      builder = SpecBuilder.new(self)
      case formatting
      when :json, :swagger
        builder.to_json
      when :xml, :xsd
        builder.to_xsd
      else
        raise "Unknown format: #{formatting}"
      end
    end

    class SpecBuilder
      include Swagger::Blocks

      def initialize(model_class)
        @klass = model_class
        @properties = {}
        @schema = {
          type: :object,
          title: model_class.to_s,
          properties: @properties
        }
        included_columns = @klass.column_names - @klass.json_excludes.map(&:to_s)
        included_columns.each do |included_column|
          @properties[included_column] = {
            title: included_column,
            type: @klass.columns_hash[included_column].type
          }
        end
        @klass.json_includes.each do |relation, _|
          reflection = @klass.reflections[relation.to_s]
          relation_class_name = reflection.klass
          type = if reflection.is_a?(ActiveRecord::Reflection::HasManyReflection) ||
                     reflection.is_a?(ActiveRecord::Reflection::ThroughReflection)
                   :array
                 else
                   :object
                 end
          @properties[relation] = {
            title: relation,
            type: type,
            '$ref': "#/definitions/#{relation_class_name}"
          }
        end
        @klass.json_method_includes.each do |method|
          next # TODO
          returned_class_name = @klass.send("#{method}_out")
          @properties[method] = {
            title: method,
            type: :object,
            '$ref': "#/definitions/#{returned_class_name}"
          }
        end
      end

      def to_json
        @schema.to_json
      end
    end
  end
end
