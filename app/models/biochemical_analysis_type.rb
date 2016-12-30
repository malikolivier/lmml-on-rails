# == Schema Information
#
# Table name: biochemical_analysis_types
#
#  id         :integer          not null, primary key
#  placement  :integer
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class BiochemicalAnalysisType < ApplicationRecord
  has_many :biochemical_analysis_type_translations

  def translation
    biochemical_analysis_type_translations.language(I18n.locale).take!
  end
end
