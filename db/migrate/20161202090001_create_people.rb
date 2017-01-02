class CreatePeople < ActiveRecord::Migration[5.0]
  def change
    create_table :people do |t|
      t.text :name
      t.integer :sex
      t.integer :death_age
      t.date :dob
      t.text :title
      t.text :affiliation
      t.belongs_to :institution, index: true
      t.text :identification_number
      t.integer :autopsies_examiners_count, default: 0
      t.integer :autopsies_suspects_count, default: 0
      t.integer :autopsies_victims_count, default: 0
      t.integer :autopsies_police_inspectors_count, default: 0
      t.integer :autopsies_judges_count, default: 0

      t.timestamps
    end
  end
end
