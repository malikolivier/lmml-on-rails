class CreateInternalKidneysExaminations < ActiveRecord::Migration[5.0]
  def change
    create_table :internal_kidneys_examinations do |t|
      t.belongs_to :examination, index: true
      t.integer :deixis, null: false
      t.float :weight
      t.integer :capsule_removal
      t.integer :capsule_congestion
      t.integer :pelvis_congestion
      t.integer :pelvis_petechia

      t.timestamps
    end
  end
end
