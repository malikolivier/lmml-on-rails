# Extend FormBuilder to build Vue-friendly forms
class VueFormBuilder < ActionView::Helpers::FormBuilder
  include VueFormBuilderHelper
  def text_field(method, options = {})
    options[:'v-model'] ||= v_model_value(method)
    add_form_control(options)
    label_options = wrap_with_label_options(options)
    wrap_with_label(method, super(method, options), label_options)
  end

  def smart_select(method, html_options = {})
    select(method, klass.translated_enum!(method), {}, html_options)
  end

  def select(method, choices = nil, options = {}, html_options = {}, &block)
    html_options[:'v-model'] ||= v_model_value(method)
    add_form_control(html_options)
    options[:prompt] = true if options[:prompt].blank?
    label_options = wrap_with_label_options(options)
    input_html = super(method, choices, options, html_options, &block)
    wrap_with_label(method, input_html, label_options)
  end

  # rubocop:disable ParameterLists
  def collection_select(method, collection, value_method, text_method,
                        options = {}, html_options = {})
    html_options[:'v-model'] ||= v_model_value(method)
    options[:prompt] = true if options[:prompt].blank?
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
    if object && object.send(method).present?
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

  # rubocop:disable Metrics/MethodLength # TODO
  def range_field(method, options = {}, unknown_value = -1)
    options[:'v-model'] ||= v_model_value(method)
    add_form_control(options)
    label_options = wrap_with_label_options(options)
    range_html = super(method, options)
    addon_html = @template.content_tag(
      :span, "{{ #{options[:'v-model']} }}",
      class: 'input-group-addon',
      'v-if': "#{options[:'v-model']} != #{unknown_value}"
    )
    addon_html += @template.content_tag(
      :span, I18n.t('unknown'),
      class: 'input-group-addon',
      'v-if': "#{options[:'v-model']} == #{unknown_value}"
    )
    inner_html = @template.content_tag(:div, range_html + addon_html,
                                       class: 'input-group')
    wrap_with_label(method, inner_html, label_options)
  end

  def submit(value = nil, options = {})
    class_def = 'btn btn-default'
    class_def << " #{options[:class]}" if options[:class].present?
    options[:class] = class_def
    super(value, options)
  end
end
