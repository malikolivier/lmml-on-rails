class CreateInternalIntestinesExaminations < ActiveRecord::Migration[5.0]
  def change
    create_table :internal_intestines_examinations do |t|
      t.belongs_to :examination, index: true
      t.integer :appendix

      t.timestamps
    end
  end
end
