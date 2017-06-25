# == Schema Information
#
# Table name: drugs
#
#  id         :integer          not null, primary key
#  abbr       :text
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Drug < ApplicationRecord
  translates :name, :long_name
  has_one :triage_supported_drug

  def triage_concentration_threshold
    triage_supported_drug.concentration_threshold
  end

  scope :triage_supported, -> { joins(:triage_supported_drug) }

  def description
    if abbr.present?
      "#{abbr}：#{long_name}"
    else
      long_name
    end
  end
end
