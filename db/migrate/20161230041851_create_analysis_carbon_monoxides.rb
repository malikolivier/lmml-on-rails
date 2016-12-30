class CreateAnalysisCarbonMonoxides < ActiveRecord::Migration[5.0]
  def change
    create_table :analysis_carbon_monoxides do |t|
      t.belongs_to :analysis, index: true
      t.float :left_heart_saturation
      t.float :right_heart_saturation
      t.float :iliac_vein_saturation

      t.timestamps
    end
  end
end
