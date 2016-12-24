class CreateAnalysisBloodTypes < ActiveRecord::Migration[5.0]
  def change
    create_table :analysis_blood_types do |t|
      t.belongs_to :analysis, index: true

      t.timestamps
    end
  end
end
