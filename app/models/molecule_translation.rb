# == Schema Information
#
# Table name: molecule_translations
#
#  id          :integer          not null, primary key
#  molecule_id :integer
#  language    :string
#  name        :text
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#

class MoleculeTranslation < ApplicationRecord
  belongs_to :molecule, required: true

  validates :language, inclusion: { in: I18n.available_locales }

  scope :language, ->(locale) { where(language: locale) }
end
