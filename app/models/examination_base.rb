class ExaminationBase < ApplicationRecord
  self.abstract_class = true

  belongs_to :examination, required: true

  accepts_nested_attributes_for :examination, update_only: true

  includes_in_json :examination
end
