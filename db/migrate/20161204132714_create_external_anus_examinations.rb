class CreateExternalAnusExaminations < ActiveRecord::Migration[5.0]
  def change
    create_table :external_anus_examinations do |t|
      t.belongs_to :examination, index: true
      t.integer :closed
      t.integer :feces_quantity

      t.timestamps
    end
  end
end
