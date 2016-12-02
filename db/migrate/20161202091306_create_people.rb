class CreatePeople < ActiveRecord::Migration[5.0]
  def change
    create_table :people do |t|
      t.text :name
      t.text :sex
      t.integer :age
      t.text :title
      t.integer :institution_id
      t.text :identification_number
      t.integer :role_id

      t.timestamps
    end
  end
end
