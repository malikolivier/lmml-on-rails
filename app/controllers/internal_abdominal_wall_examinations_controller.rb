class InternalAbdominalWallExaminationsController < ExaminationsController
  private

  def update_params
    fluids_attributes = %i(id name color odor description)
    params.require(:internal_abdominal_wall_examination)
          .permit(:id, :subcutaneous_fat_level, :subcutaneous_fat_thickness,
                  :diaphragm_height_left, :diaphragm_height_right,
                  :pleura_adhesion, :air_in_digestive_track,
                  :peritoneum_adhesion,
                  pleura_foreign_fluids_attributes: fluids_attributes,
                  peritoneum_foreign_fluids_attributes: fluids_attributes,
                  examination_attributes: [:note])
  end
end
