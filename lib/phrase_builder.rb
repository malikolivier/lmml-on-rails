class PhraseBuilder
  def initialize(*args)
    @options = args.last.is_a?(Hash) ? args.pop.dup : {}
    @phrase = args
    @options[:full_stop] = true if @options[:full_stop].nil?
  end

  def push(string)
    @phrase.push(string)
  end

  def to_sentence
    return '' if @phrase.empty?
    if @options[:full_stop]
      to_sentence_no_full_stop + I18n.t('support.array.full_stop')
    else
      to_sentence_no_full_stop
    end
  end
  alias to_s to_sentence

  private

  def to_sentence_no_full_stop
    if @options[:only_comma]
      connector = if @options[:only_comma].equal?(true)
                    I18n.t('support.array.comma_connector')
                  else
                    @options[:only_comma]
                  end
      @phrase.join(connector)
    else
      @phrase.to_sentence
    end
  end
end
