# == Schema Information
#
# Table name: internal_bladder_examinations
#
#  id                 :integer          not null, primary key
#  examination_id     :integer
#  urine_color        :integer
#  urine_quantity     :float
#  urine_transparency :integer
#  membrane_color     :integer
#  created_at         :datetime         not null
#  updated_at         :datetime         not null
#

class InternalBladderExamination < ExaminationBase
  enum urine_color: %i[unknown yellowish yellow amber red
                       brown], _prefix: true, i18n_key: :color
  enum urine_transparency: %i[unknown transparent opaque], _prefix: 'urine',
       i18n_key: :transparency
  enum membrane_color: %i[unknown pale], _prefix: true, i18n_key: :color
end
