# == Schema Information
#
# Table name: external_outline_examinations
#
#  id                 :integer          not null, primary key
#  examination_id     :integer
#  sex                :integer
#  height             :float
#  weight             :float
#  partial_body       :boolean          default(FALSE)
#  constitution       :integer
#  livor_mortis_note  :text
#  rigor_mortis_note  :text
#  rectal_temperature :float
#  room_temperature   :float
#  created_at         :datetime         not null
#  updated_at         :datetime         not null
#

require 'test_helper'

class ExternalOutlineExaminationTest < ActiveSupport::TestCase
  test 'Get sex description of a decorated model' do
    outline = ExternalOutlineExamination.new(sex: 'M').decorate
    assert_equal(outline.sex_description, '男性屍。')
  end
end
