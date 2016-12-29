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
  has_many :drug_translations
  has_one :triage_supported_drug

  def translation
    drug_translations.language(I18n.locale).take!
  end

  # Define a method to get the name's translation
  def translated_name
    translation.name
  rescue ActiveRecord::RecordNotFound
    "No translation found for drug ##{id} #{abbr}'s name in #{I18n.locale}!"
  end

  # Fall back to name if long_name is not defined
  def translated_long_name
    translation.long_name.present? ? translation.long_name : translation.name
  rescue ActiveRecord::RecordNotFound
    "No translation found for drug ##{id} #{abbr}'s long_name in #{I18n.locale}!"
  end

  def triage_concentration_threshold
    triage_supported_drug.concentration_threshold
  end

  def description
    if abbr.present?
      "#{abbr}：#{translated_long_name}"
    else
      translated_long_name
    end
  end
end
