class CreateInternalLiverExaminations < ActiveRecord::Migration[5.0]
  def change
    create_table :internal_liver_examinations do |t|
      t.integer :examination_id
      t.float :weight
      t.integer :hardness
      t.integer :congestion
      t.integer :steatosis

      t.timestamps
    end
  end
end
