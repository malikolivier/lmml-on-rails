class CreateBodyReferences < ActiveRecord::Migration[5.0]
  def change
    create_table :body_references do |t|
      t.text :abbr

      t.timestamps
    end

    reversible do |dir|
      dir.up do
        BodyReference.create_translation_table! name: :text
      end
      dir.down do
        BodyReference.drop_translation_table!
      end
    end
  end
end
