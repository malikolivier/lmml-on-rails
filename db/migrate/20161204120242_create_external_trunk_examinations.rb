class CreateExternalTrunkExaminations < ActiveRecord::Migration[5.0]
  def change
    create_table :external_trunk_examinations do |t|
      t.belongs_to :examination, index: true
      t.integer :abnominal_discoloration

      t.timestamps
    end
  end
end
