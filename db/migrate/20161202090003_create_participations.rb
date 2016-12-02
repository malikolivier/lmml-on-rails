class CreateParticipations < ActiveRecord::Migration[5.0]
  def change
    create_table :participations do |t|
      t.belongs_to :person, index: true
      t.belongs_to :autopsy, index: true
      t.belongs_to :role, index: true

      t.timestamps
    end
  end
end
