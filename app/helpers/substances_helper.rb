module SubstancesHelper
  def translated_substances
    Substance.with_translations(I18n.locale).map do |substance|
      [substance.name, substance.id]
    end
  end
end
