module VueFormBuilderHelper
  def wrap_with_label_options(input_options)
    options = {}
    input_options.each do |k, v|
      next unless k == :label_name || k == :no_field
      options[k] = v
      input_options.delete(k)
    end
    options
  end

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

  # Return v-model attributes for current object. Work even for nested objects.
  def v_model_value(object_name)
    matched_attributes = @object_name.match(/^\w+\[(.*)\]$/) { |m| m[1] }
    if matched_attributes.nil?
      object_name
    else
      methods = matched_attributes.split('][')
      "#{methods.join('.')}.#{object_name}"
    end
  end
end
