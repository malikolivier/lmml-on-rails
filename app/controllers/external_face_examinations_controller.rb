class ExternalFaceExaminationsController < ExaminationsController
  protected

  def json_includes
    [:external_eye_examinations]
  end

  private

  def update_params
    params.require(:external_face_examination)
          .permit(:id, :congestion, :swelling, :nasal_cavity_content,
                  external_eye_examinations_attributes: [:id, :closed,
                                                         :aperture,
                                                         :eyelid_congestion,
                                                         :eyelid_petechia,
                                                         :eyelid_note,
                                                         :conjunctiva_congestion,
                                                         :conjunctiva_petechia,
                                                         :conjunctiva_note,
                                                         :cornea,
                                                         :pupil,
                                                         :diameter],
                  external_mouth_examination_attributes: [:id, :closed,
                                                          :petechia,
                                                          :tongue_tip,
                                                          :note],
                  examination_attributes: [:note])
  end
end
