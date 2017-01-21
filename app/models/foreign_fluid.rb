# == Schema Information
#
# Table name: foreign_fluids
#
#  id          :integer          not null, primary key
#  color       :integer
#  name        :text
#  description :text
#  odor        :integer
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#

class ForeignFluid < ApplicationRecord
  enum color: [:no_color, :green, :white]
  enum odor: [:no_odor, :rot]

  def explanation
    expl = name.present? ? name : '不明な異液'
    odor_expl = I18n.t "odors.#{odor}" if odor.present?
    odor_expl = '' if odor.blank?
    color_expl = I18n.t "colors.#{color}" if color.present?
    color_expl = '' if color.blank?
    "#{[odor_expl, color_expl].join('、')}の#{expl}"
  end

  def self.explanation_of_array(foreign_fluids)
    explanations = []
    foreign_fluids.each do |fluid|
      explanations.push(fluid.explanation)
    end
    explanations.join('、')
  end
end
