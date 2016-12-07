class CreateInternalNeckOrgansExaminations < ActiveRecord::Migration[5.0]
  def change
    create_table :internal_neck_organs_examinations do |t|
      t.integer :lymph_level

      t.timestamps
    end
  end
end
