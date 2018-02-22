class CreateChemicalAnalysisMethods < ActiveRecord::Migration[5.0]
  def change
    # rubocop:disable Rails/CreateTableWithTimestamps
    # TODO: rubocop bug fixed in https://github.com/bbatsov/rubocop/issues/5503
    create_table :chemical_analysis_methods, &:timestamps
    # rubocop:enable Rails/CreateTableWithTimestamps

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
