class Api::AnalysisOthersController < AnalysisOthersController
  # GET /api/autopsies/:id/analysis_others
  def index; end

  # POST /api/autopsies/:id/analysis_others
  def create
    @analysis_other = @autopsy.analysis_others.create!(create_params)
  end

  # PATCH /api/analysis_others/:id
  def update
    AnalysisOther.find(params[:id]).update!(update_params)
  end

  # DELETE /api/analysis_others/:id
  def destroy
    AnalysisOther.destroy(params[:id])
  end

  private

  def create_params
    return if params[:analysis_other].blank?
    update_params
  end

  def update_params
    params.require(:analysis_other)
          .permit(:title, :content, :placement)
  end
end
