module HeartChambersHelper
  def translated_heart_chamber_sizes
    HeartChamber.sizes.map do |size, _|
      [t("size.#{size}"), size]
    end
  end
end
