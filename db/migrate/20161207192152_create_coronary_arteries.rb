class CreateCoronaryArteries < ActiveRecord::Migration[5.0]
  def change
    create_table :coronary_arteries do |t|
      t.belongs_to :internal_heart_examination, index: true
      t.integer :category, null: false
      t.float :stenosis

      t.timestamps
    end
  end
end
