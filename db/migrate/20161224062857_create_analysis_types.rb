class CreateAnalysisTypes < ActiveRecord::Migration[5.0]
  def change
    create_table :analysis_types do |t|
      t.integer :placement, null: false
      t.text :name

      t.timestamps
    end
  end
end
