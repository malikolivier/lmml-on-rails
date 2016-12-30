class CreateBiochemicalAnalysisResults < ActiveRecord::Migration[5.0]
  def change
    create_table :biochemical_analysis_results do |t|
      t.belongs_to :biochemical_analysis, index: true
      t.belongs_to :molecule, index: true
      t.float :quantity
      t.boolean :approximate, default: false
      t.integer :unit

      t.timestamps
    end
  end
end
