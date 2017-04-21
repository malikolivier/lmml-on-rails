class CreateOrgans < ActiveRecord::Migration[5.0]
  def change
    create_table :organs do |t|
      t.text :name
      t.boolean :subject_to_histopathology_analysis, default: false

      t.timestamps
    end

    reversible do |dir|
      dir.up do
        Organ.create_translation_table! name: :text
      end
      dir.down do
        Organ.drop_translation_table!
      end
    end
  end
end
