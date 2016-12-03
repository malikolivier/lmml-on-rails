class CreateExaminations < ActiveRecord::Migration[5.0]
  def change
    create_table :examinations do |t|
      t.boolean :completed, default: false
      t.text :note
      t.belongs_to :autopsy, index: true, null: false
      t.belongs_to :examination_type, index: true, null: false

      t.timestamps
    end
  end
end
