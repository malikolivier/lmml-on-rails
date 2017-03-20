class DualExaminationsController < ExaminationsController
  before_action :deixis!, only: [:update]

  protected

  def set_exam
    autopsy = Autopsy.find(params[:autopsy_id])
    @exam = DualExamination.new(model_class, autopsy)
    @examination_type = ExaminationType.by_name(examination_name,
                                                examination_category)
  end

  def deixis!
    params.require(controller_name.singularize).require(:deixis)
  end

  def render_success
    template_file = "autopsies/#{examination_category}/_#{examination_name}"
    html_preview = render_to_string template_file, locals: { exam: @exam },
                                                   layout: false
    render json: {
      model: @exam.send(deixis!).take.as_lmml_json,
      description: html_preview + @exam.first.try(:examination).try(:note)
    }
  end
end
