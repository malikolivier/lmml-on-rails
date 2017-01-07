class CreateLivoresMortis < ActiveRecord::Migration[5.0]
  def change
    create_table :livores_mortis do |t|
      t.integer :color
      t.integer :position
      t.integer :intensity
      t.integer :on_finger_pressure
      t.belongs_to :external_outline_examination, index: true

      t.timestamps
    end
  end
end
