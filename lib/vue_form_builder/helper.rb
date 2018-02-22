class VueFormBuilder
  module Helper
    def wrap_with_label_options(input_options)
      options = {}
      input_options.each do |k, v|
        next unless %i[label_name no_field].include?(k)
        options[k] = v
        input_options.delete(k)
      end
      options
    end

    # rubocop:disable Metrics/MethodLength # TODO
    def wrap_with_label(object_name, input_html, options = {})
      label_name = options[:label_name]
      if label_name.nil?
        form_content = label(object_name) + input_html
      elsif label_name == false
        form_content = input_html
      else
        label_content = label(object_name, label_name)
        form_content = label_content + input_html
      end
      if options[:no_field]
        form_content
      else
        @template.content_tag(:div, form_content, class: 'field')
      end
    end

    def add_form_control(html_options)
      class_def = 'form-control'
      class_def << " #{html_options[:class]}" if html_options[:class].present?
      html_options[:class] = class_def
      html_options
    end

    # Return v-model attributes for current object.
    # Work even for arrays and nested objects.
    def v_model_value(object_name)
      matched_attributes = @object_name.match(/^\w+\[(.*)\]$/) { |m| m[1] }
      if matched_attributes.nil?
        object_name
      else
        accumulator = ''
        matched_attributes.split('][').each_with_index do |key, i|
          accumulator += if i.zero?
                           key
                         elsif key.to_i.to_s == key
                           "[#{key}]"
                         else
                           ".#{key}"
                         end
        end
        "#{accumulator}.#{object_name}"
      end
    end
    # rubocop:enable Metrics/MethodLength

    # Get the class of the target object for this form
    # (I guess there is a more straightforward way to do this)
    def klass
      match = object_name.to_s.match(/\[(\w+)\]$/)
      if match
        attribute_match = match[1].match(/^(\w+)_attributes$/)
        match = attribute_match if attribute_match
        match[1].classify.constantize
      else
        object_name.to_s.classify.constantize
      end
    end
  end
end
