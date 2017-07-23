class Api::AnalysesController < AnalysesController
  # POST /api/autopsies/:id/analysis_***
  def create
    @exam = new_analysis
    if @exam.save
      render_success
    else
      render_failure
    end
  end

  # PATCH /api/autopsies/:id/analysis_***
  def update
    if @exam.update(update_params)
      render_success
    else
      render_failure
    end
  end

  private

  def render_success # rubocop:disable MethodLength
    template_file = "autopsies/analyses/_#{analysis_name}"
    begin
      html_preview = render_to_string template_file, locals: { exam: exam },
                                                     layout: false
    rescue => e # TODO: Falls back to deprecated implementation. Remove this
      html_preview = render_to_string(template_file, locals: { exam: @exam },
                                                     layout: false) + e
    end
    render json: {
      model: @exam.as_lmml_json,
      description: html_preview + exam.analysis_note
    }
  end

  def render_failure
    render json: { errors: @exam.errors.full_messages }, status: 422
  end
end
