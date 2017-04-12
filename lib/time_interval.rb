module TimeInterval
  # A language-independent time interval formatter
  class TimeIntervalFormatter
    def initialize(starting_time, ending_time)
      @starting_time = starting_time
      @ending_time = ending_time
    end

    def format
      pb = PhraseBuilder.new(from_text, to_text, only_space: true,
                                                 full_stop: false)
      pb.to_sentence
    end

    private

    def start_on_am?
      @starting_time.present? && @starting_time.hour < 12
    end

    def end_on_am?
      @ending_time.present? && @ending_time.hour < 12
    end

    def from_text
      return '' if @starting_time.blank?
      meridian = if start_on_am?
                   I18n.t('time.am')
                 else
                   I18n.t('time.pm')
                 end
      time_format = I18n.t('time.formats.interval_from', meridian: meridian)
      @starting_time.to_era(time_format)
    end

    def to_text
      return '' if @ending_time.blank?
      meridian = if start_on_am? == end_on_am?
                   '' # No need to specify meridian
                 elsif end_on_am?
                   I18n.t('time.am')
                 else
                   I18n.t('time.pm')
                 end
      time_format = I18n.t('time.formats.interval_to', meridian: meridian)
      @ending_time.to_era(time_format)
    end
  end

  # Call this method to format a time interval in human language
  def self.format(starting_time, ending_time)
    tf = TimeIntervalFormatter.new(starting_time, ending_time)
    tf.format
  end
end
