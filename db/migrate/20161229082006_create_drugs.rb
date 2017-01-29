class CreateDrugs < ActiveRecord::Migration[5.0]
  def change
    create_table :drugs do |t|
      t.text :abbr

      t.timestamps
    end

    reversible do |dir|
      dir.up do
        Drug.create_translation_table! name: :text, long_name: :text
      end
      dir.down do
        Drug.drop_translation_table!
      end
    end
  end
end
