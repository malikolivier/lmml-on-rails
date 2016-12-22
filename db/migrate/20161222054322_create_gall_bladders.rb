class CreateGallBladders < ActiveRecord::Migration[5.0]
  def change
    create_table :gall_bladders do |t|
      t.belongs_to :internal_liver_examination, index: true
      t.integer :bile_color
      t.integer :bile_quantity
      t.integer :gallstones_quantity
      t.integer :gallstones_color
      t.integer :gallstones_size

      t.timestamps
    end
  end
end
