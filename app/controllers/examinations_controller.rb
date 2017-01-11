class ExaminationsController < ApplicationController
  before_action :set_exam, only: [:update]

  # POST /autopsies/:autopsy_id/***_examinations.json
  def create
    @exam = new_examination
    if @exam.save
      render_success
    else
      render_failure
    end
  end

  # PUT /autopsies/:autopsy_id/***_examinations.json
  def update
    if @exam.update(update_params)
      render_success
    else
      render_failure
    end
  end

  protected

  def model_class
    controller_name.classify.constantize
  end

  def examination_category
    controller_name.split('_')[0]
  end

  def examination_name
    controller_name.split('_')[1]
  end

  private

  def set_exam
    exam_params = params[controller_name.singularize]
    if exam_params.present? && exam_params[:id].present?
      @exam = model_class.find(exam_params[:id])
      exam_params.delete(:id)
    else
      autopsy = Autopsy.find(params[:autopsy_id])
      @exam = model_class.joins(:examination)
                         .find_by(
                           examinations:
                             { autopsy_id: autopsy.id }
                         )
      @exam ||= new_examination
    end
    ActiveRecord::Associations::Preloader.new.preload(@exam, :examination)
  end

  def render_success
    template_file = "autopsies/#{examination_category}/_#{examination_name}"
    html_preview = render_to_string template_file, locals: { exam: @exam },
                                                   layout: false
    render json: {
      model: @exam,
      description: html_preview
    }
  end

  def render_failure
    render json: { errors: @exam.errors.full_messages }, status: 422
  end

  def new_examination
    autopsy = Autopsy.find(params[:autopsy_id])
    model_class.new(
      examination: Examination.create!(
        autopsy: autopsy,
        examination_type: ExaminationType
          .by_name(examination_name, examination_category)
      )
    )
  end
end
