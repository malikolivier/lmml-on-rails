class CreateSubstances < ActiveRecord::Migration[5.0]
  def change
    create_table :substances do |t|
      t.timestamps
    end

    reversible do |dir|
      dir.up do
        Substance.create_translation_table! name: :text, description: :text
      end
      dir.down do
        Substance.drop_translation_table!
      end
    end
  end
end
