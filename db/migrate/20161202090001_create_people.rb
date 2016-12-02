class CreatePeople < ActiveRecord::Migration[5.0]
  def change
    create_table :people do |t|
      t.text :name
      t.integer :sex
      t.integer :age
      t.text :title
      t.belongs_to :institution, index: true
      t.text :identification_number

      t.timestamps
    end
  end
end
