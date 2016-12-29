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

  def translated_name
    begin
      record = drug_translations.language(I18n.locale).take!
      record.name
    rescue ActiveRecord::RecordNotFound
      "No translation found for drug #{abbr} ##{id} in #{I18n.locale}!"
    end
  end
end
