class CreateAutopsyTypes < ActiveRecord::Migration[5.0]
  def change
    create_table :autopsy_types do |t|
      t.text :name, null: false
      t.text :law

      t.timestamps
    end
  end
end
