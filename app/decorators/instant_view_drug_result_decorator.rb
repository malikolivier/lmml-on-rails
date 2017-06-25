class InstantViewDrugResultDecorator < ApplicationDecorator
  def drug_name
    object.drug.name
  end
end
