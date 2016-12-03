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

class ExternalHeadExamination < ApplicationRecord
  enum hair_natural_color: [:black, :brown, :blond, :auburn, :red, :gray, :white]
  enum hair_dyed_color: [:not_dyed, :blond]

  belongs_to :examination, required: true

  has_many :external_ear_examinations
end
