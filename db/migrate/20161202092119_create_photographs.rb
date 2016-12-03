class CreatePhotographs < ActiveRecord::Migration[5.0]
  def change
    create_table :photographs do |t|
      t.text :caption

      t.timestamps
    end
    add_attachment :photographs, :picture
  end
end
