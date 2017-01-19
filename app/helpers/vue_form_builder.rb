# Extend FormBuilder to build Vue-friendly forms
class VueFormBuilder < ActionView::Helpers::FormBuilder
  def text_field(method, options = {})
    options[:'v-model'] ||= v_model_value(method)
    add_form_control(options)
    label_options = wrap_with_label_options(options)
    wrap_with_label(method, super(method, options), label_options)
  end

  def select(method, choices = nil, options = {}, html_options = {}, &block)
    html_options[:'v-model'] ||= v_model_value(method)
    add_form_control(html_options)
    options[:prompt] = true unless options[:prompt].present?
    label_options = wrap_with_label_options(options)
    input_html = super(method, choices, options, html_options, &block)
    wrap_with_label(method, input_html, label_options)
  end

  # rubocop:disable ParameterLists
  def collection_select(method, collection, value_method, text_method,
                        options = {}, html_options = {})
    html_options[:'v-model'] ||= v_model_value(method)
    options[:prompt] = true unless options[:prompt].present?
    add_form_control(html_options)
    label_options = wrap_with_label_options(options)
    input_html = super(method, collection, value_method, text_method,
                       options, html_options)
    wrap_with_label(method, input_html, label_options)
  end

  def number_field(method, options = {})
    options[:'v-model.number'] ||= v_model_value(method)
    add_form_control(options)
    label_options = wrap_with_label_options(options)
    wrap_with_label(method, super(method, options), label_options)
  end

  def time_field(method, options = {})
    options[:'v-model'] ||= v_model_value(method)
    add_form_control(options)
    if object.send(method).present?
      options[:value] ||= object.send(method).strftime('%H:%M')
    end
    label_options = wrap_with_label_options(options)
    wrap_with_label(method, super(method, options), label_options)
  end

  def date_field(method, options = {})
    options[:'v-model'] ||= v_model_value(method)
    add_form_control(options)
    label_options = wrap_with_label_options(options)
    wrap_with_label(method, super(method, options), label_options)
  end

  def check_box(method, options = {}, checked_value = '1',
                unchecked_value = '0')
    options[:'v-model'] ||= v_model_value(method)
    add_form_control(options)
    label_options = wrap_with_label_options(options)
    input_html = super(method, options, checked_value, unchecked_value)
    wrap_with_label(method, input_html, label_options)
  end

  def submit(value = nil, options = {})
    class_def = 'btn btn-default'
    class_def << " #{options[:class]}" if options[:class].present?
    options[:class] = class_def
    super(value, options)
  end

  private

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
