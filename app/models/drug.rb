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

  # Define a method to get each of the translatable column
  [:name, :long_name].each do |column|
    define_method "translated_#{column}" do
      begin
        translation.send(column)
      rescue ActiveRecord::RecordNotFound
        "No translation found for drug ##{id} #{abbr}'s #{column} in #{I18n.locale}!"
      end
    end
  end

  def triage_concentration_threshold
    triage_supported_drug.concentration_threshold
  end
end
