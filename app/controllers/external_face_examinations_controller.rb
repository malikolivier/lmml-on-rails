class ExternalFaceExaminationsController < ExaminationsController
  protected

  def json_includes
    [:external_eye_examinations]
  end

  private

  def update_params
    eye_attributes = [:id, :deixis, :closed, :aperture,
                      :eyelid_congestion, :eyelid_petechia, :eyelid_note,
                      :conjunctiva_congestion, :conjunctiva_petechia,
                      :conjunctiva_note,
                      :cornea, :pupil, :diameter]
    params.require(:external_face_examination)
          .permit(:id, :congestion, :swelling, :nasal_cavity_content,
                  external_eye_examinations_attributes: eye_attributes,
                  external_mouth_examination_attributes: [:id, :closed,
                                                          :petechia,
                                                          :tongue_tip,
                                                          :note],
                  examination_attributes: [:note])
  end
end
