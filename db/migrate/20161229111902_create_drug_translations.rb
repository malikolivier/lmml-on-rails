class CreateDrugTranslations < ActiveRecord::Migration[5.0]
  def change
    create_table :drug_translations do |t|
      t.belongs_to :drug, index: true
      t.text :name
      t.text :long_name
      t.string :language, index: true, limit: 5, null: false

      t.timestamps
    end
  end
end
