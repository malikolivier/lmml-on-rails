class CreateInternalThoracicAortaExaminations < ActiveRecord::Migration[5.0]
  def change
    create_table :internal_thoracic_aorta_examinations do |t|
      t.belongs_to :examination, required: true
      t.float :width
      t.integer :arteriosclerosis

      t.timestamps
    end
  end
end
