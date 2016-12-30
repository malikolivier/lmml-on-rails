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

  enum category: [:water_no_destruction, :water_with_destruction,
                  :left_lung, :right_lung]
  enum quantity: Settings.enums.five_scale_quantity, _prefix: true

  def translated_quantity
    I18n.t "quantity.#{quantity}"
  end

  def found?
    !(quantity_none? || quantity_unknown?)
  end

  def descriptive_quantity
    I18n.t "diatom_test.descriptive_quantity.#{quantity}"
  end
end
