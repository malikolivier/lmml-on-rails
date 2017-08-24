class Api::DualExaminationsController < Api::ExaminationsController
  before_action :deixis!, only: %i[update create]

  # POST /api/autopsies/:id/***_examinations.json
  def create
    @exam = new_examination!
    render_success
  rescue ActiveRecord::ActiveRecordError
    render_failure
  end

  private

  def set_exam
    autopsy = Autopsy.find(params[:id])
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

  def new_examination!
    autopsy = Autopsy.find(params[:id])
    model_class.create!(
      deixis: deixis!,
      examination: Examination.create!(
        autopsy: autopsy,
        examination_type: ExaminationType
          .by_name(examination_name, examination_category)
      )
    )
    DualExamination.new(model_class, autopsy)
  end
end
