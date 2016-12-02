class CreateConclusions < ActiveRecord::Migration[5.0]
  def change
    create_table :conclusions do |t|
      t.text :content
      t.belongs_to :autopsy, index: true

      t.timestamps
    end
  end
end
