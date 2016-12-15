class CreateInternalHeartExaminations < ActiveRecord::Migration[5.0]
  def change
    create_table :internal_heart_examinations do |t|
      t.belongs_to :examination, required: true
      t.float :weight
      t.integer :rigor_mortis
      t.integer :epicardial_lipomatosis
      t.integer :epicardial_petechia
      t.float :extracted_blood_quantity
      t.integer :extracted_blood_color
      t.integer :extracted_blood_coagulation
      t.float :thickness_left
      t.float :thickness_right
      t.integer :scar_left
      t.integer :scar_right
      t.float :pulmonary_artery_width
      t.integer :pulmonary_artery_thrombus

      t.timestamps
    end
  end
end
