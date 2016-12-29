# == Schema Information
#
# Table name: drug_translations
#
#  id         :integer          not null, primary key
#  drug_id    :integer
#  name       :text
#  long_name  :text
#  language   :string(5)
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class DrugTranslation < ApplicationRecord
  belongs_to :drug, required: true

  validates :status, inclusion: {in: I18n.available_locales}
  validates :language, presence: true

  scope :language, ->(locale) { where(language: locale) }
end
