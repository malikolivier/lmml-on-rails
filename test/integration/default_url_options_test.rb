require 'test_helper'

class DefaultUrlOptionsTest < ActionDispatch::IntegrationTest
  test 'get locale in root_path' do
    assert_equal root_path, "/?locale=#{I18n.locale}"
  end

  test 'set right locale after setting locale via request' do
    get root_path(locale: :en)
    assert_equal I18n.locale, :en
  end

  test 'get right locale in root_path after setting locale via request' do
    get root_path(locale: :en)
    assert_equal root_path, '/?locale=en'
  end

  test 'get right external autopsy path after setting locale via request' do
    complete_autopsy = autopsies(:completed_autopsy)
    get root_path(locale: :en)
    assert_equal edit_external_autopsy_path(complete_autopsy),
                 "/autopsies/#{complete_autopsy.id}/edit_external?locale=en"
  end
end
