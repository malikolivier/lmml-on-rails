class CreateAnalysisPoisonings < ActiveRecord::Migration[5.0]
  def change
    create_table :analysis_poisonings do |t|
      t.belongs_to :analysis, index: true
      t.belongs_to :contract_institution, index: true
      t.date :date

      t.timestamps
    end
  end
end
