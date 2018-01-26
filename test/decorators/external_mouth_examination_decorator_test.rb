class ExternalMouthExaminationDecoratorTest < ActiveSupport::TestCase
  test 'Open mouth description is properly generated' do
    open_mouth = ExternalMouthExamination.new(closed: :open, aperture: 3)
                                         .decorate
    assert_equal(open_mouth.send(:aperture_chunk), '3.0cm')
  end
end
