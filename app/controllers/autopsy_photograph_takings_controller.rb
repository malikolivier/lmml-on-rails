class AutopsyPhotographTakingsController < ApplicationController
  before_action :set_autopsy_no_preload, only: %i[new create]
  decorates_assigned :autopsy_photograph_taking, :autopsy

  # GET /autopsies/:id/autopsy_photograph_takings/new
  def new; end

  # GET /autopsies/:id/autopsy_photograph_takings
  def index
    @autopsy = Autopsy.includes(autopsy_photograph_takings: :photograph)
                      .find(params[:autopsy_id])
  end

  # POST /autopsies/:id/autopsy_photograph_takings
  def create
    @autopsy_photograph_taking = @autopsy.autopsy_photograph_takings
                                         .create!(create_params)
  end

  # PATCH /autopsy_photograph_takings/:id
  def update
    AutopsyPhotographTaking.find(params[:id]).update!(update_params)
  end

  # DELETE /autopsy_photograph_takings/:id
  def destroy
    AutopsyPhotographTaking.destroy(params[:id])
  end

  private

  def set_autopsy_no_preload
    @autopsy = Autopsy.find(params[:autopsy_id])
  end

  def create_params
    params.require(:autopsy_photograph_taking)
          .permit(:category, photograph_attributes: %i[caption picture])
  end

  def update_params
    params.require(:autopsy_photograph_taking)
          .permit(:category, photograph_attributes: %i[id caption])
  end
end
