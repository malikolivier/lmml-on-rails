class CreateAnalyses < ActiveRecord::Migration[5.0]
  def change
    create_table :analyses do |t|
      t.boolean :completed
      t.text :note
      t.belongs_to :autopsy, index: true, null: false
      t.belongs_to :analysis_type, index: true, null: false

      t.timestamps
    end
  end
end
