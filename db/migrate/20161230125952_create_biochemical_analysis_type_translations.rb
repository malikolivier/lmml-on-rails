class CreateBiochemicalAnalysisTypeTranslations < ActiveRecord::Migration[5.0]
  def change
    create_table :biochemical_analysis_type_translations do |t|
      t.integer :biochemical_analysis_type_id
      t.string :language, limit: 5, null: false
      t.text :title
      t.text :experiment_description

      t.timestamps
    end
    add_index :biochemical_analysis_type_translations,
              :biochemical_analysis_type,
              name: 'biochemical_analysis_type_translation_index'
  end
end
