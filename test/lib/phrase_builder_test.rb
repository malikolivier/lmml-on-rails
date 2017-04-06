require 'test_helper'

class PhraseBuilderTest < ActiveSupport::TestCase
  setup do
    @full_stop = I18n.t('support.array.full_stop')
  end

  # Deleting nil or empty strings is convenient
  test 'return empty string for empty phrase' do
    assert_equal(PhraseBuilder.new.to_sentence, '')
  end

  test 'return empty string for empty phrase initialized with nil' do
    assert_equal(PhraseBuilder.new(nil).to_sentence, '')
  end

  test 'return empty string for empty phrase initialized with ""' do
    assert_equal(PhraseBuilder.new('').to_sentence, '')
  end

  test 'return empty string when add empty string' do
    pb = PhraseBuilder.new
    pb << ''
    assert_equal(pb.to_sentence, '')
  end

  test 'Only use comma defined in I18n files as delimiter when asked to' do
    pb = PhraseBuilder.new('I', 'am', 'a', 'cat', only_comma: true)
    connector = I18n.t('support.array.comma_connector')
    expected = %w[I am a cat].join(connector) + @full_stop
    assert_equal(pb.to_sentence, expected)
  end

  test 'Only use specified comma as delimiter when asked to' do
    pb = PhraseBuilder.new('I', 'am', 'a', 'cat', only_comma: ',')
    assert_equal(pb.to_sentence, %w[I am a cat].join(',') + @full_stop)
  end
end
