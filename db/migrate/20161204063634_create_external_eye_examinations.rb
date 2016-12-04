class CreateExternalEyeExaminations < ActiveRecord::Migration[5.0]
  def change
    create_table :external_eye_examinations do |t|
      t.integer :external_face_examination_id, null: false
      t.integer :deixis, null: false
      t.integer :closed
      t.float :aperture
      t.integer :eyelid_congestion
      t.integer :eyelid_petechia
      t.text :eyelid_note
      t.integer :conjunctiva_congestion
      t.integer :conjunctiva_petechia
      t.text :conjunctiva_note
      t.text :cornea
      t.text :pupil
      t.float :diameter

      t.timestamps
    end
    add_index :external_eye_examinations, :external_face_examination_id, name: 'eye_on_face'
  end
end
