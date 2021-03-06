# == Schema Information
#
# Table name: external_anus_examinations
#
#  id             :integer          not null, primary key
#  examination_id :integer
#  closed         :integer
#  feces_quantity :integer
#  created_at     :datetime         not null
#  updated_at     :datetime         not null
#

class ExternalAnusExamination < ExaminationBase
  enum closed: Settings.enums.closedness, _prefix: true
  enum feces_quantity: Settings.enums.five_scale_mass_quantity, _prefix: true,
       i18n_key: :mass_quantity
end
