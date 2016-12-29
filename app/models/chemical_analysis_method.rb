# == Schema Information
#
# Table name: chemical_analysis_methods
#
#  id         :integer          not null, primary key
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class ChemicalAnalysisMethod < ApplicationRecord
  has_many :chemical_analysis_method_translations

  def translation
    chemical_analysis_method_translations.language(I18n.locale).take!
  end

  def translated_name
    translation.name
  rescue ActiveRecord::RecordNotFound
    "No translation found for drug ##{id} #{abbr}'s name in #{I18n.locale}!"
  end
end
