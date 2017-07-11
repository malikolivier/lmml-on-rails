class AnalysisCarbonMonoxidesController < AnalysesController
  private

  def update_params
    params.require(:analysis_carbon_monoxide)
          .permit(:left_heart_saturation, :right_heart_saturation,
                  :iliac_vein_saturation,
                  analysis_attributes: [:note])
  end
end
