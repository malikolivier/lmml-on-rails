class CreateAnalysisBloodTypes < ActiveRecord::Migration[5.0]
  def change
    create_table :analysis_blood_types do |t|
      t.belongs_to :analysis, index: true
      t.integer :anti_a
      t.integer :anti_b
      t.integer :anti_h
      t.integer :blood_type

      t.timestamps
    end
  end
end
