class CreateExplications < ActiveRecord::Migration[5.0]
  def change
    create_table :explications do |t|
      t.text :title
      t.text :content

      t.timestamps
    end
  end
end
