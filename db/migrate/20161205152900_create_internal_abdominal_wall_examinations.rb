class CreateInternalAbdominalWallExaminations < ActiveRecord::Migration[5.0]
  def change
    create_table :internal_abdominal_wall_examinations do |t|
      t.belongs_to :examination, index: true
      t.integer :subcutaneous_fat_level
      t.float :subcutaneous_fat_thickness
      t.float :diaphragm_height_left
      t.float :diaphragm_height_right
      t.integer :pleura_adhesion
      t.integer :air_in_digestive_track
      t.integer :peritoneum_adhesion

      t.timestamps
    end
  end
end
