class CreateExternalGenitaliaExaminations < ActiveRecord::Migration[5.0]
  def change
    create_table :external_genitalia_examinations do |t|
      t.belongs_to :examination, index: true
      t.integer :hair_color
      t.float :hair_length
      t.integer :sex

      t.timestamps
    end
  end
end
