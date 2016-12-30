class CreateAnalysisUropapers < ActiveRecord::Migration[5.0]
  def change
    create_table :analysis_uropapers do |t|
      t.integer :analysis_id
      t.float :ph

      t.timestamps
    end
  end
end
