class CreateToothExaminations < ActiveRecord::Migration[5.0]
  def change
    create_table :tooth_examinations do |t|
      t.belongs_to :external_mouth_examination, index: true, null: false
      t.integer :position, null: false
      t.integer :rank, null: false
      t.integer :condition, default: 0
      t.text :note

      t.timestamps
    end
  end
end
