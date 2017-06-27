class AnalysisPoisoningsController < AnalysesController
  private

  def update_params
    params.require(:analysis_poisoning)
          .permit(:contract_institution_id, :date,
                  found_poisons_attributes: %i[id drug_id unit
                                               chemical_analysis_method_id
                                               quantitative_concentration
                                               qualitative_concentration],
                  analysis_attributes: [:note])
  end
end
