class VueFormBuilder
  class Prefixed < VueFormBuilder
    def v_model_value(object_name)
      "#{@object_name.to_s.split('[').first}.#{super}"
    end
  end
end
