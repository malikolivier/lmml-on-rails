class CreateHeartChambers < ActiveRecord::Migration[5.0]
  def change
    create_table :heart_chambers do |t|
      t.belongs_to :internal_heart_examination, index: true
      t.integer :category, null: false
      t.integer :size

      t.timestamps
    end
  end
end
