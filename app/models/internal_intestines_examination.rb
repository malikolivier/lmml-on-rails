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

class InternalIntestinesExamination < ExaminationBase
  enum appendix: Settings.enums.existence, _prefix: true, i18n_key: :existence

  has_many :intestine_sections, -> { order(:category) },
           inverse_of: :internal_intestines_examination

  accepts_nested_attributes_for :intestine_sections,
                                reject_if: :all_blank

  includes_in_json :intestine_sections
end
