class CreateInjuryDepths < ActiveRecord::Migration[5.0]
  def change
    create_table :injury_depths do |t|
      t.float :depth
      t.belongs_to :reached_organ, index: true

      t.timestamps
    end
  end
end
