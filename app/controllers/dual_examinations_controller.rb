class DualExaminationsController < ExaminationsController
  protected

  def set_exam
    autopsy = Autopsy.find(params[:autopsy_id])
    @exam = model_class.joins(:examination)
                       .where(
                         examinations:
                           { autopsy_id: autopsy.id }
                       )
    @exam ||= new_examination
  end

  def new_examination
    super
  end
end
