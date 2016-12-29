class CreateTriageDrugResults < ActiveRecord::Migration[5.0]
  def change
    create_table :triage_drug_results do |t|
      t.belongs_to :analysis_triage, index: true
      t.belongs_to :drug, index: true
      t.integer :result

      t.timestamps
    end
  end
end
