class CreateInternalBladderExaminations < ActiveRecord::Migration[5.0]
  def change
    create_table :internal_bladder_examinations do |t|
      t.belongs_to :examination, index: true
      t.integer :urine_color
      t.float :urine_quantity
      t.integer :urine_transparency
      t.integer :membrane_color

      t.timestamps
    end
  end
end
