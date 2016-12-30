# == Schema Information
#
# Table name: biochemical_analysis_type_translations
#
#  id                           :integer          not null, primary key
#  biochemical_analysis_type_id :integer
#  language                     :string(5)        not null
#  title                        :text
#  experiment_description       :text
#  created_at                   :datetime         not null
#  updated_at                   :datetime         not null
#

class BiochemicalAnalysisTypeTranslation < ApplicationRecord
  belongs_to :biochemical_analysis_type, required: true

  validates :language, inclusion: { in: I18n.available_locales }

  scope :language, ->(locale) { where(language: locale) }
end
