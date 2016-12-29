class CreateChemicalAnalysisMethodTranslations < ActiveRecord::Migration[5.0]
  def change
    create_table :chemical_analysis_method_translations do |t|
      t.integer :chemical_analysis_method_id
      t.string :language, index: true, limit: 5, null: false
      t.text :name

      t.timestamps
    end
    add_index :chemical_analysis_method_translations,
              :chemical_analysis_method_id,
              name: 'chemical_analysis_method_translation_index'
  end
end
