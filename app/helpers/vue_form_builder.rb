# Extend FormBuilder to build Vue-friendly forms
class VueFormBuilder < ActionView::Helpers::FormBuilder
  def text_field(object_name, label_name = nil, options = {})
    options[:'v-model'] ||= v_model_value(object_name)
    add_form_control(options)
    wrap_with_label(object_name, super(object_name, options), label_name)
  end

  def select(method, choices = nil, options = {}, html_options = {}, &block)
    html_options[:'v-model'] ||= v_model_value(method)
    add_form_control(html_options)
    input_html = super(method, choices, options, html_options, &block)
    wrap_with_label(method, input_html)
  end

  # rubocop:disable ParameterLists
  def collection_select(method, collection, value_method, text_method,
                        options = {}, html_options = {})
    html_options[:'v-model'] ||= v_model_value(method)
    add_form_control(html_options)
    input_html = super(method, collection, value_method, text_method,
                       options, html_options)
    wrap_with_label(method, input_html)
  end

  def number_field(object_name, options = {})
    options[:'v-model.number'] ||= v_model_value(object_name)
    super(object_name, options)
  end

  def time_field_v(object_name, options = {})
    options[:'v-model'] ||= v_model_value(object_name)
    if object.send(object_name).present?
      options[:value] ||= object.send(object_name).strftime('%H:%M')
    end
    time_field(object_name, options)
  end

  def date_field_v(object_name, options = {})
    options[:'v-model'] ||= v_model_value(object_name)
    date_field(object_name, options)
  end

  private

  def wrap_with_label(object_name, input_html, label_name = nil)
    if label_name.nil?
      form_content = label(object_name) + input_html
    elsif label_name == false
      form_content = input_html
    else
      label_content = label(object_name, label_name)
      form_content = label_content + input_html
    end
    @template.content_tag(:div, form_content, class: 'field')
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
