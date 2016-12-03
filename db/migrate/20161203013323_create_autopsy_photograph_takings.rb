class CreateAutopsyPhotographTakings < ActiveRecord::Migration[5.0]
  def change
    create_table :autopsy_photograph_takings do |t|
      t.integer :category
      t.belongs_to :autopsy, index: true
      t.belongs_to :photograph, index: true

      t.timestamps
    end
  end
end
