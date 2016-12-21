class CreateInternalLungsExaminations < ActiveRecord::Migration[5.0]
  def change
    create_table :internal_lungs_examinations do |t|
      t.belongs_to :examination, index: true
      t.integer :deixis, null: false
      t.float :weight
      t.integer :air_content
      t.integer :congestion

      t.timestamps
    end
  end
end
