class CreateExternalFaceExaminations < ActiveRecord::Migration[5.0]
  def change
    create_table :external_face_examinations do |t|
      t.belongs_to :examination, index: true
      t.integer :congestion
      t.integer :swelling
      t.text :nasal_cavity_content

      t.timestamps
    end
  end
end
