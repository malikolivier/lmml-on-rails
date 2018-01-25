class CreateInternalNeckOrgansExaminations < ActiveRecord::Migration[5.0]
  def change
    create_table :internal_neck_organs_examinations do |t|
      t.belongs_to :examination, index: true
      t.integer :lymph_level
      t.integer :oesophagus_substance_id
      t.integer :oesophagus_substance_quantity
      t.integer :larynx_substance_id
      t.integer :larynx_substance_quantity
      t.integer :trachea_substance_id
      t.integer :trachea_substance_quantity
      t.integer :main_bronchi_substance_id
      t.integer :main_bronchi_substance_quantity

      t.timestamps
    end
    add_index :internal_neck_organs_examinations, :oesophagus_substance_id,
              name: 'in_oesophagus_substance'
    add_index :internal_neck_organs_examinations, :larynx_substance_id,
              name: 'in_larynx_substance'
    add_index :internal_neck_organs_examinations, :trachea_substance_id,
              name: 'in_trachea_substance'
    add_index :internal_neck_organs_examinations, :main_bronchi_substance_id,
              name: 'in_main_bronchi_substance'
  end
end
