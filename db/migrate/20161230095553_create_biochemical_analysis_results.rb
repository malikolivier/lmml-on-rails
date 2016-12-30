class CreateBiochemicalAnalysisResults < ActiveRecord::Migration[5.0]
  def change
    create_table :biochemical_analysis_results do |t|
      t.integer :biochemical_analysis_id
      t.integer :molecule_id
      t.float :quantity
      t.boolean :approximate, default: false
      t.integer :unit

      t.timestamps
    end
  end
end
