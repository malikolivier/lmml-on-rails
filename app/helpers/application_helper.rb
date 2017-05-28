module ApplicationHelper
  def form_to_vue(object_name, method)
    match = object_name.match(/^\w*\[(.*)\]$/)
    if match
      "#{match.captures.join('.')}.#{method}_attributes"
    else
      "#{method}_attributes"
    end
  end

  def vue_form_for(object, params = {})
    params[:builder] ||= VueFormBuilder
    params[:html] ||= {}
    params[:html][:id] ||= if object.is_a?(ActiveRecord::Base)
                             object.class.model_name.singular
                           else
                             object
                           end
    params[:url] ||= ''
    form_for(object, params) { |f| yield f }
  end

  def delete_button(action, event_type = '@click.prevent', html_options = {})
    html_options[:class] = '' if html_options[:class].blank?
    html_options[:class] = "btn btn-danger btn-xs #{html_options[:class]}"
    html_options[event_type] = action
    content_tag(:button, 'X', html_options)
  end

  def join_sentences(*sentences)
    delimiter = I18n.translate!('punctuation.sentence_joiner')
    sentences.join(delimiter)
  end

  def join_words(*words)
    delimiter = I18n.translate!('punctuation.word_joiner')
    words.join(delimiter)
  end
end
