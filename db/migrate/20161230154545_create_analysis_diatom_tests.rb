class CreateAnalysisDiatomTests < ActiveRecord::Migration[5.0]
  def change
    create_table :analysis_diatom_tests do |t|
      t.belongs_to :analysis, index: true
      t.integer :conclusion

      t.timestamps
    end
  end
end
