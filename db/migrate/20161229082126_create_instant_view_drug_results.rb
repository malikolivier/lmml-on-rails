class CreateInstantViewDrugResults < ActiveRecord::Migration[5.0]
  def change
    create_table :instant_view_drug_results do |t|
      t.belongs_to :analysis_instant_view, index: true
      t.belongs_to :drug, index: true
      t.integer :result

      t.timestamps
    end
  end
end
