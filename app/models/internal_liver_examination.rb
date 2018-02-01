# == Schema Information
#
# Table name: internal_liver_examinations
#
#  id             :integer          not null, primary key
#  examination_id :integer
#  weight         :float
#  hardness       :integer
#  congestion     :integer
#  steatosis      :integer
#  created_at     :datetime         not null
#  updated_at     :datetime         not null
#

class InternalLiverExamination < ExaminationBase
  enum hardness: Settings.enums.hardness
  enum congestion: Settings.enums.three_scale_intensity, _prefix: true,
       i18n_key: :intensity
  enum steatosis: Settings.enums.five_scale_intensity, _prefix: true,
       i18n_key: :intensity

  has_one :gall_bladder, inverse_of: :internal_liver_examination

  accepts_nested_attributes_for :gall_bladder, update_only: true

  includes_in_json :gall_bladder
end
