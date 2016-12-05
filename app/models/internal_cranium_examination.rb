require "lmml_on_rails/internal_head_examination.rb"

class InternalCraniumExamination < ApplicationRecord
  include LmmlOnRails::InternalHeadExamination

  belongs_to :examination, required: true
end
