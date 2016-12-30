class CreateUropaperResults < ActiveRecord::Migration[5.0]
  def change
    create_table :uropaper_results do |t|
      t.belongs_to :analysis_uropaper, index: true
      t.integer :category, null: false
      t.integer :result

      t.timestamps
    end
  end
end
