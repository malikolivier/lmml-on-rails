class AutopsiesController < ApplicationController
  before_action :set_autopsy, only: [:show, :edit, :update, :destroy]

  # GET /autopsies
  # GET /autopsies.json
  def index
    @autopsies = Autopsy.all
  end

  # GET /autopsies/1
  # GET /autopsies/1.json
  def show; end

  # GET /autopsies/new
  def new
    @autopsy = Autopsy.new
  end

  # GET /autopsies/1/edit
  def edit; end

  # POST /autopsies
  # POST /autopsies.json
  def create
    @autopsy = Autopsy.new(autopsy_params)
    setup_autopsy

    respond_to do |format|
      if @autopsy.save
        format.html do
          redirect_to action: :edit, id: @autopsy.id
        end
        format.json { render :show, status: :created, location: @autopsy }
      else
        format.html { render :new }
        format.json do
          render json: @autopsy.errors, status: :unprocessable_entity
        end
      end
    end
  end

  # PATCH/PUT /autopsies/1
  # PATCH/PUT /autopsies/1.json
  def update
    if @autopsy.update(autopsy_params)
      render 'preview'
    else
      render json: { errors: @autopsy.errors.full_messages }, status: 422
    end
  end

  # DELETE /autopsies/1
  # DELETE /autopsies/1.json
  def destroy
    @autopsy.destroy
    respond_to do |format|
      format.html do
        redirect_to autopsies_url, notice: 'Autopsy was successfully destroyed.'
      end
      format.json { head :no_content }
    end
  end

  # GET /autopsies/:autopsy_id/browse
  def browse
    @autopsy = Autopsy.includes(:conclusions)
                      .find(params[:autopsy_id])
    respond_to do |format|
      format.html
      format.pdf do
        render pdf: 'autopsy', template: 'autopsies/browse.html.erb'
      end
      format.docx do
        render docx: 'autopsy', template: 'autopsies/browse.html.erb'
      end
    end
  end

  # POST /autopsies/preview
  def preview
    @autopsy = Autopsy.new(autopsy_params)
    setup_autopsy
    render layout: false
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_autopsy
    @autopsy = Autopsy.find(params[:id] || params[:autopsy_id])
  end

  # Never trust parameters from the scary internet, only allow the white list
  # through.
  def autopsy_params
    params.require(:autopsy)
          .permit(:completed, :number, :conclusion,
                  :suspect_id, :victim_id, :place_id,
                  :autopsy_date, :starting_time, :ending_time,
                  :police_station_id, :police_inspector_id,
                  :court_id, :judge_id, :examiner_id,
                  :autopsy_type_id,
                  suspect_attributes: [:id, :name],
                  victim_attributes: [:id, :name, :death_age, :sex],
                  place_attributes: [:name, :address, :autopsy_room],
                  examiner_attributes: [:name],
                  police_inspector_attributes: [:name],
                  police_station_attributes: [:name],
                  court_attributes: [:name],
                  judge_attributes: [:name])
  end

  def setup_autopsy
    @autopsy.court ||= @autopsy.judge.institution if @autopsy.judge.present?
    return unless @autopsy.police_inspector.present?
    @autopsy.police_station ||= @autopsy.police_inspector.institution
  end
end
