class CreateSubstances < ActiveRecord::Migration[5.0]
  def change
    create_table :substances do |t|
      t.text :name
      t.text :description

      t.timestamps
    end
  end
end
