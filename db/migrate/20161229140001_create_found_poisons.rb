class CreateFoundPoisons < ActiveRecord::Migration[5.0]
  def change
    create_table :found_poisons do |t|
      t.belongs_to :analysis_poisoning, index: true
      t.belongs_to :drug, index: true
      t.belongs_to :chemical_analysis_method, index: true
      t.integer :unit
      t.float :quantitative_concentration
      t.integer :qualitative_concentration

      t.timestamps
    end
  end
end
