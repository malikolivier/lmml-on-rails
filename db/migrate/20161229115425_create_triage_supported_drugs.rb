class CreateTriageSupportedDrugs < ActiveRecord::Migration[5.0]
  def change
    create_table :triage_supported_drugs do |t|
      t.belongs_to :drug, index: true
      t.float :concentration_threshold

      t.timestamps
    end
  end
end
