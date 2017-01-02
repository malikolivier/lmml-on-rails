class CreateInstitutions < ActiveRecord::Migration[5.0]
  def change
    create_table :institutions do |t|
      t.text :name
      t.text :address
      t.integer :autopsies_place_count, default: 0
      t.integer :autopsies_police_station_count, default: 0
      t.integer :autopsies_court_count, default: 0
      t.belongs_to :institution_type, index: true

      t.timestamps
    end
  end
end
