class CreateTestHistopathologyOrgans < ActiveRecord::Migration[5.0]
  def change
    create_table :test_histopathology_organs do |t|
      t.integer :test_histopathology_id
      t.integer :organ_id

      t.timestamps
    end
  end
end
