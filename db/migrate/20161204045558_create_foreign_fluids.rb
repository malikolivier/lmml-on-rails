class CreateForeignFluids < ActiveRecord::Migration[5.0]
  def change
    create_table :foreign_fluids do |t|
      t.integer :color
      t.text :name
      t.text :description
      t.integer :odor

      t.timestamps
    end
  end
end
