class CreateInternalPancreasExaminations < ActiveRecord::Migration[5.0]
  def change
    create_table :internal_pancreas_examinations do |t|
      t.belongs_to :examination, index: true
      t.integer :hardness

      t.timestamps
    end
  end
end
