class ForeignFluidsController < ExaminationNestedModelsController

  def create
    @nested_model = ForeignFluid.create!(create_params)
    if params[:external_face_examination_id].present?
      exam = ExternalFaceExamination.find(params[:external_face_examination_id])
      exam.external_mouth_examination.foreign_fluids.push(@nested_model)
      exam.save!
    end
  end

  private

  def create_params
    # Only return the content empty content of foreign_fluid hash.
    # Currently, empty param is enough to create a foreign fluid.
    params[:foreign_fluid].permit
  end
end
