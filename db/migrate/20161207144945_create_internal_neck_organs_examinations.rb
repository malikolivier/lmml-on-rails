class CreateInternalNeckOrgansExaminations < ActiveRecord::Migration[5.0]
  def change
    create_table :internal_neck_organs_examinations do |t|
      t.belongs_to :examination, index: true
      t.integer :lymph_level
      t.integer :oesophagus_substance
      t.integer :oesophagus_substance_quantity
      t.integer :larynx_substance
      t.integer :larynx_substance_quantity
      t.integer :trachea_substance
      t.integer :trachea_substance_quantity
      t.integer :main_bronchi_substance
      t.integer :main_bronchi_substance_quantity

      t.timestamps
    end
  end
end
