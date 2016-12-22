class CreateInternalAdrenalGlandsExaminations < ActiveRecord::Migration[5.0]
  def change
    create_table :internal_adrenal_glands_examinations do |t|
      t.belongs_to :examination, index: true
      t.integer :deixis
      t.integer :cortex_thickness
      t.integer :medulla_thickness

      t.timestamps
    end
  end
end
