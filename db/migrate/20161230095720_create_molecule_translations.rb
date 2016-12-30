class CreateMoleculeTranslations < ActiveRecord::Migration[5.0]
  def change
    create_table :molecule_translations do |t|
      t.integer :molecule_id
      t.string :language
      t.text :name

      t.timestamps
    end
  end
end
