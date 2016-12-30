class CreateDiatomCounts < ActiveRecord::Migration[5.0]
  def change
    create_table :diatom_counts do |t|
      t.belongs_to :analysis_diatom_test, index: true
      t.integer :category
      t.integer :quantity

      t.timestamps
    end
  end
end
