class ExternalFaceExaminationsController < ExaminationsController
  private

  def update_params
    params.require(:external_face_examination)
          .permit(:id, :congestion, :swelling, :nasal_cavity_content,
                  external_eye_examinations_attributes: eye_attributes,
                  external_mouth_examination_attributes: mouth_attributes,
                  examination_attributes: [:note])
  end

  def eye_attributes
    %i(id deixis closed aperture eyelid_congestion eyelid_petechia eyelid_note
       conjunctiva_congestion conjunctiva_petechia conjunctiva_note cornea
       pupil diameter)
  end

  def mouth_attributes
    [:id, :closed, :aperture, :petechia, :tongue_tip, :note,
     foreign_fluids_attributes: %i(id name color odor description),
     tooth_examinations_attributes: %i(id position rank condition note)]
  end
end
