class CreateInjuries < ActiveRecord::Migration[5.0]
  def change
    create_table :injuries do |t|
      t.belongs_to :examination, index: true
      t.text :description
      t.belongs_to :body_area, index: true
      t.belongs_to :injury_size, index: true
      t.belongs_to :injury_depth, index: true
      t.integer :injury_type, index: true
      t.integer :time_sustained
      t.belongs_to :parent_injury, index: true
      t.text :note

      t.timestamps
    end
  end
end
