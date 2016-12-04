class CreateInMouthForeignFluids < ActiveRecord::Migration[5.0]
  def change
    create_table :in_mouth_foreign_fluids do |t|
      t.belongs_to :external_mouth_examination, index: true
      t.belongs_to :foreign_fluid, index: true

      t.timestamps
    end
  end
end
