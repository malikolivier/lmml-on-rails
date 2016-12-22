class CreateInternalSpleenExaminations < ActiveRecord::Migration[5.0]
  def change
    create_table :internal_spleen_examinations do |t|
      t.belongs_to :examination, index: true
      t.float :weight
      t.integer :hardness
      t.integer :congestion
      t.integer :pulp_distinct

      t.timestamps
    end
  end
end
