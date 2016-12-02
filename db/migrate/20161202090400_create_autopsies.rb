class CreateAutopsies < ActiveRecord::Migration[5.0]
  def change
    create_table :autopsies do |t|
      t.boolean :completed
      t.text :number
      t.text :conclusion
      t.integer :suspect_id
      t.integer :victim_id
      t.integer :place_id
      t.date :autopsy_date
      t.datetime :starting_time
      t.datetime :ending_time
      t.integer :police_station_id
      t.integer :police_inspector_id
      t.integer :court_id
      t.integer :judge_id

      t.timestamps
    end
  end
end
