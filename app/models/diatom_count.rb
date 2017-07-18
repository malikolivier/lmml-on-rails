# == Schema Information
#
# Table name: diatom_counts
#
#  id                      :integer          not null, primary key
#  analysis_diatom_test_id :integer
#  category                :integer
#  quantity                :integer
#  created_at              :datetime         not null
#  updated_at              :datetime         not null
#

class DiatomCount < ApplicationRecord
  belongs_to :analysis_diatom_test, required: true

  enum category: %i[water left_lung right_lung]
  enum quantity: Settings.enums.five_scale_quantity, _prefix: true

  def found?
    !(quantity_none? || quantity_unknown?)
  end
end
