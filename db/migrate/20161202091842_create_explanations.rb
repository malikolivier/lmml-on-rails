class CreateExplanations < ActiveRecord::Migration[5.0]
  def change
    create_table :explanations do |t|
      t.text :title
      t.text :content
      t.belongs_to :autopsy, index: true

      t.timestamps
    end
  end
end
