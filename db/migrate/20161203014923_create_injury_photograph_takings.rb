class CreateInjuryPhotographTakings < ActiveRecord::Migration[5.0]
  def change
    create_table :injury_photograph_takings do |t|
      t.belongs_to :injury, index: true
      t.belongs_to :photograph, index: true

      t.timestamps
    end
  end
end
