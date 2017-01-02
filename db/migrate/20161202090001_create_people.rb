class CreatePeople < ActiveRecord::Migration[5.0]
  def change
    create_table :people do |t|
      t.text :name
      t.integer :sex
      t.integer :death_age
      t.date :dob
      t.text :title
      t.belongs_to :institution, index: true
      t.text :identification_number
      t.integer :autopsies_examiner_count, default: 0
      t.integer :autopsies_suspect_count, default: 0
      t.integer :autopsies_victim_count, default: 0
      t.integer :autopsies_police_inspector_count, default: 0
      t.integer :autopsies_judge_count, default: 0

      t.timestamps
    end
  end
end
