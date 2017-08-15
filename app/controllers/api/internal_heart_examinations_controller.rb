class Api::InternalHeartExaminationsController < Api::ExaminationsController
  private

  def update_params
    params.require(:internal_heart_examination)
          .permit(:id, :weight, :rigor_mortis, :epicardial_lipomatosis,
                  :epicardial_petechia, :extracted_blood_quantity,
                  :extracted_blood_color, :extracted_blood_coagulation,
                  :thickness_left, :thickness_right, :scar_left, :scar_right,
                  :pulmonary_artery_width, :pulmonary_artery_thrombus,
                  coronary_arteries_attributes: %i[id category stenosis],
                  heart_chambers_attributes: %i[id category size],
                  examination_attributes: [:note])
  end
end
