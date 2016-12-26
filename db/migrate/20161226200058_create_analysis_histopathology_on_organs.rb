class CreateAnalysisHistopathologyOnOrgans < ActiveRecord::Migration[5.0]
  def change
    create_table :analysis_histopathology_on_organs do |t|
      t.belongs_to :organ, index: true
      t.integer :analysis_histopathology_id, null: false
      t.text :result
      t.text :other_organ

      t.timestamps
    end
    add_index :analysis_histopathology_on_organs, :analysis_histopathology_id,
              name: 'organ_histopathology_analysis'
  end
end
