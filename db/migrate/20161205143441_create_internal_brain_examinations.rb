class CreateInternalBrainExaminations < ActiveRecord::Migration[5.0]
  def change
    create_table :internal_brain_examinations do |t|
      t.belongs_to :examination, index: true
      t.float :weight
      t.integer :pia_congestion
      t.integer :blood_spots

      t.timestamps
    end
  end
end
