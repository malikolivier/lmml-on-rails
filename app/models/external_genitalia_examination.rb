# == Schema Information
#
# Table name: external_genitalia_examinations
#
#  id             :integer          not null, primary key
#  examination_id :integer
#  hair_color     :integer
#  hair_length    :float
#  sex            :integer
#  created_at     :datetime         not null
#  updated_at     :datetime         not null
#

class ExternalGenitaliaExamination < ExaminationBase
  enum hair_color: %i(black gray blond red no_hair unknown)
  enum sex: Settings.enums.sex
end
