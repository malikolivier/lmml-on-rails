class CreateOrganBodyReferences < ActiveRecord::Migration[5.0]
  def change
    create_table :organ_body_references do |t|
      t.belongs_to :organ, index: true
      t.belongs_to :body_reference, index: true

      t.timestamps
    end
  end
end
