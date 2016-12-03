class CreateExternalOutlineExaminations < ActiveRecord::Migration[5.0]
  def change
    create_table :external_outline_examinations do |t|
      t.integer :sex
      t.float :height
      t.float :weight
      t.boolean :partial_body
      t.string :constitution

      t.timestamps
    end
  end
end
