class CreateMolecules < ActiveRecord::Migration[5.0]
  def change
    create_table :molecules do |t|
      t.float :standard_quantity_min
      t.float :standard_quantity_max
      t.integer :unit

      t.timestamps
    end
  end
end
