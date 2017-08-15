class AnalysesController < ApplicationController
  before_action :set_exam, only: %i[update edit]
  decorates_assigned :exam, :analysis_type

  # GET /autopsies/:id/analysis_***/edit
  def edit; end

  private

  def analysis_name
    controller_name.match(/^analysis_(.+)$/)[1].singularize
  end

  # This method should be overriden if the analysis requires more params
  def update_params
    params.require(controller_name.singularize)
          .permit(analysis_attributes: [:note])
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
