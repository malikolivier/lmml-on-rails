class CreateChemicalAnalysisMethods < ActiveRecord::Migration[5.0]
  def change
    create_table :chemical_analysis_methods, &:timestamps

    reversible do |dir|
      dir.up do
        ChemicalAnalysisMethod.create_translation_table! name: :text
      end
      dir.down do
        ChemicalAnalysisMethod.drop_translation_table!
      end
    end
  end
end
