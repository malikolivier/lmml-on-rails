# == Schema Information
#
# Table name: analysis_types
#
#  id         :integer          not null, primary key
#  placement  :integer          not null
#  name       :text
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class AnalysisType < ApplicationRecord
  default_scope { order(:placement) }

  validates :name, uniqueness: true
  validates :placement, uniqueness: true

  def this_analysis_model
    "analysis_#{name}".camelize.constantize
  end

  def other?
    name == 'other'
  end

  scope :by_name, ->(name) { find_by!(name: name) }

  class << self
    def all_names
      path = Rails.root.join('test', 'fixtures', 'analysis_types.yml')
      YAML.load_file(path)
          .reject { |_, info| info['name'] == 'other' }
          .map { |_, info| "analysis_#{info['name']}" }
    end
  end
end
