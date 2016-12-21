class CreateExaminationTypes < ActiveRecord::Migration[5.0]
  def change
    create_table :examination_types do |t|
      t.integer :category, null: false
      t.integer :placement, null: false
      t.integer :subdivision
      t.text :name

      t.timestamps
    end
  end
end
