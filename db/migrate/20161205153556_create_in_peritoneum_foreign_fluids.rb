class CreateInPeritoneumForeignFluids < ActiveRecord::Migration[5.0]
  def change
    create_table :in_peritoneum_foreign_fluids do |t|
      t.integer :internal_abdominal_wall_examination_id, null: false
      t.belongs_to :foreign_fluid, index: true, null: false

      t.timestamps
    end
    add_index :in_peritoneum_foreign_fluids,
              :internal_abdominal_wall_examination_id,
              name: 'fluids_in_peritoneum'
  end
end
