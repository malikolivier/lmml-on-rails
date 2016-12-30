class CreateBiochemicalAnalyses < ActiveRecord::Migration[5.0]
  def change
    create_table :biochemical_analyses do |t|
      t.belongs_to :analysis_biochemistry, index: true
      t.belongs_to :contract_institution, index: true
      t.belongs_to :biochemical_analysis_type, index: true
      t.date :date

      t.timestamps
    end
  end
end
