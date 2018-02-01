class Api::ExaminationsController < ExaminationsController
  # POST /api/autopsies/:id/***_examinations.json
  def create
    @exam = new_examination
    if @exam.save
      render_success
    else
      render_failure
    end
  end

  # PUT /api/autopsies/:id/***_examinations.json
  def update
    if @exam.update(update_params)
      render_success
    else
      render_failure
    end
  end

  private

  # This method should be overriden if the examination requires more params
  def update_params
    params.require(controller_name.singularize)
          .permit(examination_attributes: [:note])
  end

  def render_success
    template_file = "autopsies/#{examination_category}/_#{examination_name}"
    html_preview = render_to_string template_file, locals: { exam: exam },
                                                   layout: false
    render json: {
      model: @exam.as_lmml_json,
      description: html_preview + exam.examination_note
    }
  end

  def render_failure
    render json: { errors: @exam.errors.full_messages }, status: 422
  end
end
