# == Schema Information
#
# Table name: examination_types
#
#  id          :integer          not null, primary key
#  category    :integer          not null
#  placement   :integer          not null
#  subdivision :integer
#  name        :text
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#

class ExaminationType < ApplicationRecord
  default_scope { order(:placement) }

  enum category: %i(internal external)
  enum subdivision: %i(head torso)
  has_many :organ_examinations
  has_many :organs, through: :organ_examinations
  has_many :examinations

  validates :name, uniqueness: { scope: :category }
  validates :placement, uniqueness: true

  def this_examination_model
    key_string.camelize.constantize
  end

  def key_string
    "#{category}_#{name}_examination"
  end

  class << self
    def by_name(name, category)
      find_by!(name: name, category: category)
    end

    def all_names
      path = Rails.root.join('test', 'fixtures', 'examination_types.yml')
      YAML.load_file(path).map do |_, info|
        "#{info['category']}_#{info['name']}_examination"
      end
    end
  end

  includes_in_json :organs
end
