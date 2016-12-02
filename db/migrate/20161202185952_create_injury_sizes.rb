class CreateInjurySizes < ActiveRecord::Migration[5.0]
  def change
    create_table :injury_sizes do |t|
      t.integer :shape
      t.float :length
      t.float :width
      t.belongs_to :in_body_orientation, index: true

      t.timestamps
    end
  end
end
