class CreateAutopsies < ActiveRecord::Migration[5.0]
  def change
    create_table :autopsies do |t|
      t.boolean :completed, default: false
      t.text :number
      t.belongs_to :autopsy_type, index: true
      t.belongs_to :suspect, index: true
      t.belongs_to :victim, index: true
      t.belongs_to :place, index: true
      t.date :autopsy_date
      t.datetime :starting_time
      t.datetime :ending_time
      t.belongs_to :police_station, index: true
      t.belongs_to :police_inspector, index: true
      t.belongs_to :court, index: true
      t.belongs_to :judge, index: true

      t.timestamps
    end
  end
end
