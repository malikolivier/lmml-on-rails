class PhraseBuilder
  # A class to build phrases. Used across the decorators.
  def initialize(*args)
    @options = args.last.is_a?(Hash) ? args.pop.dup : {}
    @phrase = args.select(&:present?)
    @options[:full_stop] = true if @options[:full_stop].nil?
  end

  def any?
    @phrase.any?
  end

  def empty?
    !any?
  end

  def push(string)
    @phrase.push(string) if string.present?
  end
  alias << push

  def to_sentence
    return '' if @phrase.empty?
    if @options[:full_stop]
      to_sentence_no_dot + I18n.t('support.array.full_stop')
    else
      to_sentence_no_dot
    end
  end
  alias to_s to_sentence

  def to_sentence_no_dot
    if @options[:only_comma] || @options[:only_space]
      @phrase.join(connector)
    else
      @phrase.to_sentence
    end
  end

  private

  def connector
    if @options[:only_comma].equal?(true)
      I18n.t('support.array.comma_connector')
    elsif @options[:only_space].equal?(true)
      I18n.t('support.array.space')
    else
      @options[:only_comma]
    end
  end
end
