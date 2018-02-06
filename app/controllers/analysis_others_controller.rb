class AnalysisOthersController < ApplicationController
  before_action :set_analysis_others, only: %i[new index]
  # GET /api/autopsies/:id/autopsy_photograph_others/new
  def new; end

  private

  def set_analysis_others
    @analysis_others = Autopsy.find(params[:id]).analysis_others
  end
end
