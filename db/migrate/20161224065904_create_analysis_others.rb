class CreateAnalysisOthers < ActiveRecord::Migration[5.0]
  def change
    create_table :analysis_others do |t|
      t.belongs_to :autopsy, index: true
      t.text :title
      t.text :content
      t.integer :placement

      t.timestamps
    end
  end
end
