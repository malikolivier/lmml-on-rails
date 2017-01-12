# Extend FormBuilder to build Vue-friendly forms
class VueFormBuilder < ActionView::Helpers::FormBuilder
  def text_field(object_name, options = {})
    options[:'v-model'] ||= object_name
    class_def = 'form-control'
    class_def << " #{options[:class]}" if options[:class].present?
    options[:class] = class_def
    wrap_with_label(object_name, super(object_name, options))
  end

  # rubocop:disable ParameterLists
  def collection_select(method, collection, value_method, text_method,
                        options = {}, html_options = {})
    html_options[:'v-model'] ||= method
    class_def = 'form-control'
    class_def << " #{options[:class]}" if options[:class].present?
    html_options[:class] = class_def
    input_html = super(method, collection, value_method, text_method,
                       options, html_options)
    wrap_with_label(method, input_html)
  end

  def number_field(object_name, options = {})
    options[:'v-model.number'] ||= object_name
    super(object_name, options)
  end

  def time_field_v(object_name, options = {})
    options[:'v-model'] ||= object_name
    if object.send(object_name).present?
      options[:value] ||= object.send(object_name).strftime('%H:%M')
    end
    time_field(object_name, options)
  end

  def date_field_v(object_name, options = {})
    options[:'v-model'] ||= object_name
    date_field(object_name, options)
  end

  private

  def wrap_with_label(object_name, input_html)
    form_content = label(object_name) + input_html
    @template.content_tag(:div, form_content, class: 'field')
  end
end
