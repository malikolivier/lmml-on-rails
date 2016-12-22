class CreateInternalStomachExaminations < ActiveRecord::Migration[5.0]
  def change
    create_table :internal_stomach_examinations do |t|
      t.belongs_to :examination, index: true
      t.integer :content_color
      t.integer :content_smell
      t.integer :content_aspect
      t.float :content_quantity
      t.integer :content_digestion
      t.integer :rugae

      t.timestamps
    end
  end
end
