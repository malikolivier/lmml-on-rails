class CreateOrganExaminations < ActiveRecord::Migration[5.0]
  def change
    create_table :organ_examinations do |t|
      t.belongs_to :organ, index: true
      t.belongs_to :examination_type, index: true

      t.timestamps
    end
  end
end
