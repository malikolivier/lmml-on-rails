class CreateAnalysisBiochemistries < ActiveRecord::Migration[5.0]
  def change
    create_table :analysis_biochemistries do |t|
      t.belongs_to :analysis, index: true

      t.timestamps
    end
  end
end
