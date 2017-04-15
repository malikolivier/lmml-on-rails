class AutopsyPhotographTakingsController < AutopsiesController
  before_action :set_autopsy, except: :destroy

  # GET /autopsies/:id/autopsy_photograph_takings/new
  def new; end

  # POST /autopsies/:id/autopsy_photograph_takings
  def create
    @autopsy.autopsy_photograph_takings.create!(create_params)
  end

  # DELETE /autopsies/:id/
  #                    autopsy_photograph_takings/:autopsy_photograph_taking_id
  def destroy
    AutopsyPhotographTaking.destroy(params[:id])
  end

  private

  def set_autopsy
    @autopsy = Autopsy.find(params[:autopsy_id])
  end

  def create_params
    params.require(:autopsy_photograph_taking)
          .permit(:category, photograph_attributes: %i[caption picture])
  end
end
