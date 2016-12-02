class CreateTestBloodTypes < ActiveRecord::Migration[5.0]
  def change
    create_table :test_blood_types do |t|
      t.text :result
      t.text :note

      t.timestamps
    end
  end
end
