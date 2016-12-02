class CreateInstitutionTypes < ActiveRecord::Migration[5.0]
  def change
    create_table :institution_types do |t|
      t.text :name

      t.timestamps
    end
  end
end
