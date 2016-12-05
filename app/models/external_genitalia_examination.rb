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

class ExternalGenitaliaExamination < ApplicationRecord
  belongs_to :examination, required: true

  enum hair_color: [:black, :gray, :blond, :red]
  enum sex: Settings.enums.sex
end