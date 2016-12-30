class CreateBiochemicalAnalysisTypes < ActiveRecord::Migration[5.0]
  def change
    create_table :biochemical_analysis_types do |t|
      t.integer :placement

      t.timestamps
    end
  end
end
