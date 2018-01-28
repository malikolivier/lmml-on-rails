class ExternalEyeExaminationsDecoratorTest < ActiveSupport::TestCase
  test 'Open mouth description is properly generated' do
    left_eye = ExternalEyeExamination.new(deixis: :left, closed: :closed)
    right_eye = ExternalEyeExamination.new(deixis: :right, closed: :closed)
    eyes = ExternalEyeExaminationsDecorator.decorate([left_eye, right_eye])
    assert_equal(eyes.closedness_description, '両眼は閉じる。')
  end
end
