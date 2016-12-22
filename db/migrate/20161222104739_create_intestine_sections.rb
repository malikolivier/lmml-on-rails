class CreateIntestineSections < ActiveRecord::Migration[5.0]
  def change
    create_table :intestine_sections do |t|
      t.belongs_to :internal_intestines_examination, index: true
      t.integer :category, null: false
      t.integer :color
      t.integer :quantity

      t.timestamps
    end
  end
end
