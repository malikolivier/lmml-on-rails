class ExaminationsController < ApplicationController
  before_action :set_exam, only: %i(update edit)

  # POST /autopsies/:id/***_examinations.json
  def create
    @exam = new_examination
    if @exam.save
      render_success
    else
      render_failure
    end
  end

  # PUT /autopsies/:id/***_examinations.json
  def update
    if @exam.update(update_params)
      render_success
    else
      render_failure
    end
  end

  # GET /autopsies/:id/***_examinations/edit
  def edit; end

  # GET /autopsies/:id/***_examinations/new
  def new
    examination_type = ExaminationType.by_name(examination_name,
                                               examination_category)
    @exam_base = Examination.new(examination_type: examination_type)
  end

  private

  def examination_category
    controller_name.split('_')[0]
  end

  def examination_name
    controller_name.match(/^[a-z]+_(.+)_examinations$/)[1]
  end

  # This method should be overriden if the examination requires more params
  def update_params
    params.require(controller_name.singularize)
          .permit(examination_attributes: [:note])
  end

  def set_exam # rubocop:disable MethodLength, AbcSize # TODO
    exam_params = params[controller_name.singularize]
    if exam_params.present? && exam_params[:id].present?
      @exam = model_class.find(exam_params[:id])
      exam_params.delete(:id)
    else
      autopsy = Autopsy.find(params[:id])
      @exam = model_class.joins(:examination)
                         .find_by(
                           examinations:
                             { autopsy_id: autopsy.id }
                         )
      @exam ||= new_examination
    end
    ActiveRecord::Associations::Preloader.new.preload(@exam, :examination)
    @examination_type = ExaminationType.by_name(examination_name,
                                                examination_category)
  end

  private

  def render_success
    template_file = "autopsies/#{examination_category}/_#{examination_name}"
    html_preview = render_to_string template_file, locals: { exam: @exam },
                                                   layout: false
    render json: {
      model: @exam.as_lmml_json,
      description: html_preview + @exam.examination.note
    }
  end

  def render_failure
    render json: { errors: @exam.errors.full_messages }, status: 422
  end

  def new_examination
    autopsy = Autopsy.find(params[:id])
    model_class.new(
      examination: Examination.create!(
        autopsy: autopsy,
        examination_type: ExaminationType
          .by_name(examination_name, examination_category)
      )
    )
  end
end
