module SubstancesHelper
  def translated_substances
    Substance.all.map do |substance|
      [substance.name, substance.id]
    end
  end
end
