class CreateExternalHeadExaminations < ActiveRecord::Migration[5.0]
  def change
    create_table :external_head_examinations do |t|
      t.belongs_to :examination, index: true
      t.integer :hair_natural_color
      t.integer :hair_dyed_color
      t.float :top_hair_length
      t.float :side_hair_length

      t.timestamps
    end
  end
end
