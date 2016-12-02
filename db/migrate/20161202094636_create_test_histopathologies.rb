class CreateTestHistopathologies < ActiveRecord::Migration[5.0]
  def change
    create_table :test_histopathologies do |t|
      t.text :note

      t.timestamps
    end
  end
end
