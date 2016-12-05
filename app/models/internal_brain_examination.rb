# == Schema Information
#
# Table name: internal_brain_examinations
#
#  id             :integer          not null, primary key
#  examination_id :integer
#  weight         :float
#  pia_congestion :integer
#  blood_spots    :integer
#  created_at     :datetime         not null
#  updated_at     :datetime         not null
#

require 'lmml_on_rails/internal_head_examination.rb'

class InternalBrainExamination < ApplicationRecord
  include LmmlOnRails::InternalHeadExamination

  belongs_to :examination, required: true

  enum pia_congestion: Settings.enums.three_scale_intensity, _prefix: true
  enum blood_spots: Settings.enums.five_scale_quantity, _prefix: true
end
