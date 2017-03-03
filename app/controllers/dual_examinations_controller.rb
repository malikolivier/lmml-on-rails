class DualExaminationsController < ExaminationsController
  protected

  def set_exam
    autopsy = Autopsy.find(params[:autopsy_id])
    @exam = DualExamination.new(model_class, autopsy)
    @examination_type = ExaminationType.by_name(examination_name,
                                                examination_category)
  end
end
