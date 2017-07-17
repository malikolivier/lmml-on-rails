class BiochemicalAnalysesController < ApplicationController
  before_action :set_biochemical_analysis

  def show; end

  def update
    @biochemical_analysis.update(update_params)
  end

  private

  def set_biochemical_analysis
    @biochemical_analysis = BiochemicalAnalysis.find(params[:id])
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
