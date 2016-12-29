class CreateDrugs < ActiveRecord::Migration[5.0]
  def change
    create_table :drugs do |t|
      t.text :abbr

      t.timestamps
    end
  end
end
