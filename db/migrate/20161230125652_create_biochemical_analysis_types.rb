class CreateBiochemicalAnalysisTypes < ActiveRecord::Migration[5.0]
  def change
    create_table :biochemical_analysis_types do |t|
      t.integer :placement

      t.timestamps
    end

    reversible do |dir|
      dir.up do
        BiochemicalAnalysisType
          .create_translation_table! title: :text, experiment_description: :text
      end
      dir.down do
        BiochemicalAnalysisType.drop_translation_table!
      end
    end
  end
end
