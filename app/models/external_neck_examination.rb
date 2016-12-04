class ExternalNeckExamination < ApplicationRecord
  belongs_to :examination, required: true
end
