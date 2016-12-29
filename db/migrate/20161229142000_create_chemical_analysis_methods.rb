class CreateChemicalAnalysisMethods < ActiveRecord::Migration[5.0]
  def change
    create_table :chemical_analysis_methods do |t|

      t.timestamps
    end
  end
end
