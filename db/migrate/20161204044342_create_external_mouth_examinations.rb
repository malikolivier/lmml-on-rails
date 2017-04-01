class CreateExternalMouthExaminations < ActiveRecord::Migration[5.0]
  def change
    create_table :external_mouth_examinations do |t|
      t.integer :closed
      t.float :aperture
      t.integer :petechia
      t.integer :tongue_tip
      t.text :note
      t.integer :external_face_examination_id, null: false

      t.timestamps
    end
    add_index :external_mouth_examinations, :external_face_examination_id,
              name: 'face'
  end
end
