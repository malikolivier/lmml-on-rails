class CreateBodyAreas < ActiveRecord::Migration[5.0]
  def change
    create_table :body_areas do |t|
      t.belongs_to :body_reference, index: true
      t.belongs_to :in_body_orientation, index: true

      t.timestamps
    end
  end
end
