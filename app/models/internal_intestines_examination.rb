# == Schema Information
#
# Table name: internal_intestines_examinations
#
#  id             :integer          not null, primary key
#  examination_id :integer
#  appendix       :integer
#  created_at     :datetime         not null
#  updated_at     :datetime         not null
#

class InternalIntestinesExamination < ApplicationRecord
  belongs_to :examination, required: true

  enum appendix: Settings.enums.existence, _prefix: true

  has_many :intestine_sections, -> { order(:category) }

  def description
    description = ''
    intestine_sections.each do |section|
      description += section.description
    end
    description += '諸腸の粘膜に出血等の異常なし。' if examination.injuries.none?
    description += '虫垂あり。' if appendix_exists?
    description += '虫垂なし。' if appendix_does_not_exist?
    description
  end
end
