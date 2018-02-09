class AnalysisOthersController < ApplicationController
  before_action :set_analysis_others, only: %i[new index]
  before_action :set_autopsy_no_preload, only: :create
  # GET /api/autopsies/:id/autopsy_photograph_others/new
  def new; end

  private

  def set_autopsy_no_preload
    @autopsy = Autopsy.find(params[:id])
  end

  def set_analysis_others
    @analysis_others = Autopsy.find(params[:id]).analysis_others
  end
end
