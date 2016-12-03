class CreateRigoresMortis < ActiveRecord::Migration[5.0]
  def change
    create_table :rigores_mortis do |t|
      t.integer :joint, null: false
      t.integer :intensity
      t.integer :category
      t.belongs_to :external_outline_examination, index: true

      t.timestamps
    end
  end
end
