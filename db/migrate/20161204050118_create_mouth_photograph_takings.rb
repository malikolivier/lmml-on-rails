class CreateMouthPhotographTakings < ActiveRecord::Migration[5.0]
  def change
    create_table :mouth_photograph_takings do |t|
      t.integer :external_mouth_examination_id, null: false
      t.belongs_to :photograph, index: true

      t.timestamps
    end
    add_index :mouth_photograph_takings, :external_mouth_examination_id,
              name: 'mouth_has_photograph'
  end
end
