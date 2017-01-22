class ForeignFluidsController < ExaminationNestedModelsController
  def create
    super
    # rubocop:disable GuardClause (fix when add other relationships)
    if params[:external_face_examination_id].present?
      exam = ExternalFaceExamination.find(params[:external_face_examination_id])
      # assume external mouth examination is already created
      if exam.external_mouth_examination.blank?
        @external_mouth_examination = exam.create_external_mouth_examination!
      end
      exam.external_mouth_examination.foreign_fluids.push(@nested_model)
    end
    # TODO: Add other relationships (lung, peritoneum and pleura)
  end

  private

  def create_params
    # Only return the content empty content of foreign_fluid hash.
    # Currently, empty param is enough to create a foreign fluid.
    params[:foreign_fluid].permit
  end
end
