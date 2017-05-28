class AnalysesController < ApplicationController
  before_action :set_exam, only: %i[update edit]
  decorates_assigned :exam, :analysis_type

  # POST /autopsies/:id/analysis_***
  def create
    @exam = new_analysis
    if @exam.save
      render_success
    else
      render_failure
    end
  end

  # PATCH /autopsies/:id/analysis_***
  def update
    if @exam.update(update_params)
      render_success
    else
      render_failure
    end
  end

  private

  def analysis_name
    controller_name.match(/^analysis_(.+)$/)[1].singularize
  end

  # This method should be overriden if the examination requires more params
  def update_params
    params.require(controller_name.singularize)
          .permit(analysis_attributes: [:note])
  end

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
      description: html_preview + @exam.analysis.note
    }
  end

  def render_failure
    render json: { errors: @exam.errors.full_messages }, status: 422
  end

  def set_exam # rubocop:disable MethodLength, AbcSize # TODO
    exam_params = params[controller_name.singularize]
    if exam_params.present? && exam_params[:id].present?
      @exam = model_class.find(exam_params[:id])
      exam_params.delete(:id)
    else
      autopsy = Autopsy.find(params[:id])
      @exam = model_class.joins(:analysis)
                         .find_by(
                           analyses:
                             { autopsy_id: autopsy.id }
                         )
      @exam ||= new_analysis
    end
    ActiveRecord::Associations::Preloader.new.preload(@exam, :analysis)
    @analysis_type = AnalysisType.by_name(analysis_name)
  end

  def new_analysis
    autopsy = Autopsy.find(params[:id])
    model_class.new(
      analysis: Analysis.create!(
        autopsy: autopsy,
        analysis_type: AnalysisType.by_name(analysis_name)
      )
    )
  end
end
