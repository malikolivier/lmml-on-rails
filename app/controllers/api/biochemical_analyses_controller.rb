class Api::BiochemicalAnalysesController < ApplicationController
  before_action :set_biochemical_analysis, only: %i[show update destroy]

  def create
    @biochemical_analysis = BiochemicalAnalysis.create!(create_params)
  end

  def show; end

  def update
    @biochemical_analysis.update(update_params)
  end

  def destroy
    @biochemical_analysis.destroy!
  end

  private

  def set_biochemical_analysis
    @biochemical_analysis = BiochemicalAnalysis.find(params[:id])
  end

  def create_params
    params.require(:biochemical_analysis)
          .permit(:analysis_biochemistry_id)
  end

  def update_params
    params.require(:biochemical_analysis)
          .permit(:id, :contract_institution_id, :biochemical_analysis_type_id,
                  :date,
                  biochemical_analysis_results_attributes: %i[id molecule_id
                                                              quantity unit
                                                              approximate])
  end
end
