class CreateInBodyOrientations < ActiveRecord::Migration[5.0]
  def change
    create_table :in_body_orientations do |t|
      t.integer :coordinate_system, null: false
      t.float :x
      t.float :y

      t.timestamps
    end
  end
end
