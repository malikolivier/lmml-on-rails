class CreateInternalAbdominalAortaExaminations < ActiveRecord::Migration[5.0]
  def change
    create_table :internal_abdominal_aorta_examinations do |t|
      t.belongs_to :examination, index: true
      t.integer :arteriosclerosis

      t.timestamps
    end
  end
end
