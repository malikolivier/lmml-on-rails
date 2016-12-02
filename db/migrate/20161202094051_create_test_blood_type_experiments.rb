class CreateTestBloodTypeExperiments < ActiveRecord::Migration[5.0]
  def change
    create_table :test_blood_type_experiments do |t|
      t.text :serum
      t.text :reaction

      t.timestamps
    end
  end
end
