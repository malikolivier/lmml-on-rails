class ExternalTrunkExamination < ApplicationRecord
  belongs_to :examination, required: true
  enum abnominal_discoloration: [:no_discoloration, :discolored]
end
