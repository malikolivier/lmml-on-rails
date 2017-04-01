class CreateExternalEarExaminations < ActiveRecord::Migration[5.0]
  def change
    create_table :external_ear_examinations do |t|
      t.integer :deixis, null: false
      t.boolean :bleeding, default: false
      t.belongs_to :injury, index: true
      t.integer :external_head_examination_id, null: false

      t.timestamps
    end
    add_index :external_ear_examinations, :external_head_examination_id,
              name: 'ear'
  end
end
