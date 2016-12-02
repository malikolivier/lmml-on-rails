class CreateTestTriages < ActiveRecord::Migration[5.0]
  def change
    create_table :test_triages do |t|
      t.string :note

      t.timestamps
    end
  end
end
