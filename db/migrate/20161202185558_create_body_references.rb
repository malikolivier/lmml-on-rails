class CreateBodyReferences < ActiveRecord::Migration[5.0]
  def change
    create_table :body_references do |t|
      t.text :name

      t.timestamps
    end
  end
end
