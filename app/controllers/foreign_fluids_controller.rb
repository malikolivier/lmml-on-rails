class ForeignFluidsController < ExaminationNestedModelsController
  def create
    super
    create_face_foreign_fluids
    create_lungs_foreign_fluids
  end

  private

  def create_params
    # Only return the content empty content of foreign_fluid hash.
    # Currently, empty param is enough to create a foreign fluid.
    params[:foreign_fluid].permit
  end

  def create_face_foreign_fluids
    return unless params[:external_face_examination_id].present?
    exam = ExternalFaceExamination.find(params[:external_face_examination_id])
    if exam.external_mouth_examination.blank?
      @external_mouth_examination = exam.create_external_mouth_examination!
    end
    exam.external_mouth_examination.foreign_fluids.push(@nested_model)
  end

  def create_lungs_foreign_fluids
    return unless params[:internal_lungs_examination_id].present?
    exam = InternalLungsExamination.find(params[:internal_lungs_examination_id])
    exam.foreign_fluids.push(@nested_model)
  end
end
