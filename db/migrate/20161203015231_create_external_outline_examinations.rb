class CreateExternalOutlineExaminations < ActiveRecord::Migration[5.0]
  def change
    create_table :external_outline_examinations do |t|
      t.belongs_to :examination, index: true
      t.integer :sex
      t.float :height
      t.float :weight
      t.boolean :partial_body, default: false
      t.integer :constitution
      t.text :livor_mortis_note
      t.text :rigor_mortis_note
      t.float :rectal_temperature
      t.float :room_temperature

      t.timestamps
    end
  end
end
