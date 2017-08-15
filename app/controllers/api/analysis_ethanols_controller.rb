class Api::AnalysisEthanolsController < Api::AnalysesController
  private

  def update_params
    params.require(:analysis_ethanol)
          .permit(:contract_institution_id, :date,
                  :heart_concentration, :iliac_vein_concentration,
                  analysis_attributes: [:note])
  end
end
