# == Schema Information
#
# Table name: chemical_analysis_method_translations
#
#  id                          :integer          not null, primary key
#  chemical_analysis_method_id :integer
#  language                    :string(5)        not null
#  name                        :text
#  created_at                  :datetime         not null
#  updated_at                  :datetime         not null
#

class ChemicalAnalysisMethodTranslation < ApplicationRecord
  belongs_to :chemical_analysis_method, required: true

  validates :language, inclusion: { in: I18n.available_locales }

  scope :language, ->(locale) { where(language: locale) }
end
