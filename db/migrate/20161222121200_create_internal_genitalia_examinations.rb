class CreateInternalGenitaliaExaminations < ActiveRecord::Migration[5.0]
  def change
    create_table :internal_genitalia_examinations do |t|
      t.belongs_to :examination, index: true
      t.float :length
      t.float :fundal_width
      t.float :cervical_width
      t.integer :endometrium_color
      t.integer :ovaries_presence
      t.float :ovaries_distance

      t.timestamps
    end
  end
end
