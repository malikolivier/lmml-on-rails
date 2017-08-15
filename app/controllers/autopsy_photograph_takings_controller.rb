class AutopsyPhotographTakingsController < ApplicationController
  before_action :set_autopsy_no_preload, only: %i[new create]
  decorates_assigned :autopsy_photograph_taking, :autopsy

  # GET /autopsies/:id/autopsy_photograph_takings/new
  def new; end

  private

  def set_autopsy_no_preload
    @autopsy = Autopsy.find(params[:autopsy_id])
  end
end
