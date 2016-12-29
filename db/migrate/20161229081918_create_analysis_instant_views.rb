class CreateAnalysisInstantViews < ActiveRecord::Migration[5.0]
  def change
    create_table :analysis_instant_views do |t|
      t.belongs_to :analysis, index: true

      t.timestamps
    end
  end
end
