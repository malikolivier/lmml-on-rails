module GallBladdersHelper
  def translated_gall_bladder_bile_colors
    GallBladder.bile_colors.map do |color, _|
      [t("colors.#{color}"), color]
    end
  end

  def translated_gall_bladder_bile_quantities
    GallBladder.bile_quantities.map do |quantity, _|
      [t("mass_quantity.#{quantity}"), quantity]
    end
  end

  def translated_gall_bladder_gallstones_quantities
    GallBladder.gallstones_quantities.map do |quantity, _|
      [t("quantity.#{quantity}"), quantity]
    end
  end

  def translated_gall_bladder_gallstones_colors
    GallBladder.gallstones_colors.map do |color, _|
      [t("colors.#{color}"), color]
    end
  end

  def translated_gall_bladder_gallstones_sizes
    GallBladder.gallstones_sizes.map do |size, _|
      [t("size.#{size}"), size]
    end
  end
end
