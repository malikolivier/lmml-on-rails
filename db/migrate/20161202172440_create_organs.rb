class CreateOrgans < ActiveRecord::Migration[5.0]
  def change
    create_table :organs do |t|
      t.text :name

      t.timestamps
    end
  end
end
