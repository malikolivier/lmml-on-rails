class CreateInternalPericardiumExaminations < ActiveRecord::Migration[5.0]
  def change
    create_table :internal_pericardium_examinations do |t|
      t.belongs_to :examination, index: true
      t.integer :congestion
      t.integer :petechia

      t.timestamps
    end
  end
end
