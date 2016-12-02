class CreatePhotographs < ActiveRecord::Migration[5.0]
  def change
    create_table :photographs do |t|
      t.integer :type
      t.string :caption

      t.timestamps
    end
    add_attachment :photographs, :picture
  end
end
