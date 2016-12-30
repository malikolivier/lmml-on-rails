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
  belongs_to :analysis_uropaper, required: true

  enum category: Settings.uropaper_categories.keys

  def qualitative_result
    Settings.uropaper_categories[category].values.keys[result] if result.present?
  end

  def descriptive_result
    value = Settings.uropaper_categories[category].values[qualitative_result]
    if value.nil?
      string = qualitative_result.to_s
      if string =~ /^(\+|\-)+$/
        # Return strings that only have '+' or '-' as is
        string
      else
        I18n.t "uropapers.category.#{category}.#{string}"
      end
    elsif unit.present?
      "#{value} #{unit}"
    else
      value.to_s
    end
  end

  def unit
    Settings.uropaper_categories[category].unit
  end
end
