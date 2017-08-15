class Api::AnalysisBloodTypesController < Api::AnalysesController
  private

  def update_params
    params.require(:analysis_blood_type)
          .permit(:anti_a, :anti_b, :anti_h, :blood_type,
                  analysis_attributes: [:note])
  end
end
