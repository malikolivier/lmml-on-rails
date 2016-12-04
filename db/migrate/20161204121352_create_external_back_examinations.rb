class CreateExternalBackExaminations < ActiveRecord::Migration[5.0]
  def change
    create_table :external_back_examinations do |t|
      t.belongs_to :examination, index: true

      t.timestamps
    end
  end
end
