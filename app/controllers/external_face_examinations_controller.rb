class ExternalFaceExaminationsController < ExaminationsController
  private

  def update_params
    eye_attributes = [:id, :deixis, :closed, :aperture,
                      :eyelid_congestion, :eyelid_petechia, :eyelid_note,
                      :conjunctiva_congestion, :conjunctiva_petechia,
                      :conjunctiva_note,
                      :cornea, :pupil, :diameter]
    mouth_attributes = [:id, :closed, :aperture, :petechia, :tongue_tip, :note,
                        foreign_fluids_attributes: [:id, :name, :color, :odor,
                                                    :description],
                        tooth_examinations_attributes: [:id, :position, :rank,
                                                        :condition, :note]]
    params.require(:external_face_examination)
          .permit(:id, :congestion, :swelling, :nasal_cavity_content,
                  external_eye_examinations_attributes: eye_attributes,
                  external_mouth_examination_attributes: mouth_attributes,
                  examination_attributes: [:note])
  end
end
