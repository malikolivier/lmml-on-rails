# == Schema Information
#
# Table name: external_head_examinations
#
#  id                 :integer          not null, primary key
#  examination_id     :integer
#  hair_natural_color :integer
#  hair_dyed_color    :integer
#  top_hair_length    :float
#  side_hair_length   :float
#  created_at         :datetime         not null
#  updated_at         :datetime         not null
#

class ExternalHeadExamination < ExaminationBase
  enum hair_natural_color: [:black, :brown, :blond, :auburn, :red, :gray,
                            :white]
  enum hair_dyed_color: [:not_dyed, :false_blond, :false_red]

  has_many :external_ear_examinations, -> { order(:deixis) },
           inverse_of: :external_head_examination

  alias_method :ears, :external_ear_examinations

  accepts_nested_attributes_for :external_ear_examinations,
                                reject_if: :all_blank
end
