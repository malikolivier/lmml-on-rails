class CreateFromReferenceReachableOrgans < ActiveRecord::Migration[5.0]
  def change
    create_table :from_reference_reachable_organs do |t|
      t.belongs_to :body_reference, index: true
      t.belongs_to :organ, index: true

      t.timestamps
    end
  end
end
