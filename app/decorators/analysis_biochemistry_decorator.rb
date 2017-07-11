class AnalysisBiochemistryDecorator < AnalysisBaseDecorator
  def each_biochemical_analyses
    object.biochemical_analyses
          .includes(:contract_institution,
                    biochemical_analysis_type: :translations,
                    biochemical_analysis_results: { molecule: :translations })
          .each_with_index do |analysis, i|
      yield(analysis.decorate, i + 1)
    end
  end
end
