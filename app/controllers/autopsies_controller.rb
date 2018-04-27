class AutopsiesController < ApplicationController
  before_action :set_autopsy, only: %i[show update edit_external
                                       edit_internal edit_analyses destroy]
  before_action :set_default_request_format, only: :update

  decorates_assigned :autopsy

  # GET /autopsies
  def index
    filter_params = params.slice(:number, :examiner_id, :police_inspector_id,
                                 :order)
    @autopsies = Autopsy.filter(filter_params).find_by_sql("
      select  *,suspect.name as suspect_name,victim.name as victim_name,
              place.name as place_name,policeStation.name as police_station_name,
              police.name as police_name,court.name as court_name,judge.name as judge_name
      from autopsies
      join People        as suspect        on autopsies.suspect_id           =suspect.id
      join People        as victim         on autopsies.victim_id            =victim.id
      join institutions  as place          on autopsies.place_id             =place.id
      join people        as police         on autopsies.police_inspector_id  =police.id
      join institutions  as policeStation  on autopsies.police_station_id    = policeStation.id
      join institutions  as court          on autopsies.court_id             =court.id
      join people        as judge          on autopsies.judge_id             =judge.id
      ")
  end

  # GET /autopsies/1
  def show; end

  # GET /autopsies/new
  def new
    @autopsy = Autopsy.new
  end

  # GET /autopsies/1/edit_external
  def edit_external; end

  # GET /autopsies/1/edit_internal
  def edit_internal; end

  # GET /autopsies/1/edit_analyses
  def edit_analyses; end

  # POST /autopsies
  def create
    @autopsy = Autopsy.new(autopsy_params)
    if @autopsy.save
      redirect_to action: :edit_external, id: @autopsy.id,
                  locale: I18n.locale
    else
      render :new
    end
  end

  # DELETE /autopsies/1
  def destroy
    @autopsy.destroy!
    redirect_to autopsies_url(locale: I18n.locale),
                notice: 'Autopsy was successfully destroyed.'
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_autopsy
    @autopsy = Autopsy.find(params[:id])
  end

  # Never trust parameters from the scary internet, only allow the white list
  # through.
  def autopsy_params # rubocop:disable MethodLength
    params.require(:autopsy)
          .permit(:completed, :number, :conclusion,
                  :suspect_id, :victim_id, :place_id,
                  :autopsy_date, :starting_time, :ending_time,
                  :police_station_id, :police_inspector_id,
                  :court_id, :judge_id, :examiner_id,
                  :autopsy_type_id,
                  suspect_attributes: %i[id name],
                  victim_attributes: %i[id name death_age sex],
                  place_attributes: %i[name address autopsy_room],
                  examiner_attributes: [:name],
                  police_inspector_attributes: [:name],
                  police_station_attributes: [:name],
                  court_attributes: [:name],
                  judge_attributes: [:name],
                  participations_attributes: %i[id role person_id])
  end
end
