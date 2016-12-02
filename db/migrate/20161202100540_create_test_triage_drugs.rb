class CreateTestTriageDrugs < ActiveRecord::Migration[5.0]
  def change
    create_table :test_triage_drugs do |t|
      t.float :concentration
      t.integer :reaction
      t.text :description

      t.timestamps
    end
  end
end
