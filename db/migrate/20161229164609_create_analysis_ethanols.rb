class CreateAnalysisEthanols < ActiveRecord::Migration[5.0]
  def change
    create_table :analysis_ethanols do |t|
      t.belongs_to :analysis, index: true
      t.belongs_to :contract_institution, index: true
      t.boolean :found, null: false
      t.date :date
      t.float :heart_concentration
      t.float :iliac_vein_concentration

      t.timestamps
    end
  end
end
