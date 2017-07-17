# == Schema Information
#
# Table name: uropaper_results
#
#  id                   :integer          not null, primary key
#  analysis_uropaper_id :integer
#  category             :integer          not null
#  result               :integer
#  created_at           :datetime         not null
#  updated_at           :datetime         not null
#

class UropaperResult < ApplicationRecord
  default_scope -> { order(:category) }

  belongs_to :analysis_uropaper, required: true

  enum category: Settings.uropaper_categories.keys
  validates :category, uniqueness: { scope: :analysis_uropaper }

  def qualitative_result
    return if result.blank?
    Settings.uropaper_categories[category].values.keys[result]
  end

  def descriptive_result
    value = Settings.uropaper_categories[category].values[qualitative_result]
    if value.nil?
      printable_qualitative_result
    elsif unit.present?
      "#{value} #{unit}"
    else
      value.to_s
    end
  end

  def unit
    Settings.uropaper_categories[category].unit
  end

  class << self
    def category_select_choices(category)
      Settings.uropaper_categories[category]
              .values.each_with_index.map { |v, i| [v[0], i] }
    end
  end

  private

  def printable_qualitative_result
    string = qualitative_result.to_s
    if string.match?(/^(\+|\-)+$/)
      # Return strings that only have '+' or '-' as is
      string
    else
      I18n.t("uropapers.category.#{category}.#{string}")
    end
  end
end
