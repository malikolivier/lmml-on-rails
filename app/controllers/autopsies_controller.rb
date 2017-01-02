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

    respond_to do |format|
      if @autopsy.save
        format.html do
          redirect_to @autopsy, notice: 'Autopsy was successfully created.'
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
    respond_to do |format|
      if @autopsy.update(autopsy_params)
        format.html do
          redirect_to @autopsy, notice: 'Autopsy was successfully updated.'
        end
        format.json { render :show, status: :ok, location: @autopsy }
      else
        format.html { render :edit }
        format.json do
          render json: @autopsy.errors, status: :unprocessable_entity
        end
      end
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
    render layout: false
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_autopsy
    @autopsy = Autopsy.find(params[:id])
  end

  # Never trust parameters from the scary internet, only allow the white list
  # through.
  def autopsy_params
    params.require(:autopsy).permit(:completed, :number, :conclusion,
                                    :suspect_id, :victim_id, :place_id,
                                    :autopsy_date, :starting_time, :ending_time,
                                    :police_station_id, :police_inspector_id,
                                    :court_id, :judge_id,
                                    suspect_attributes: :name,
                                    victim_attributes: [:name, :age],
                                    place_attributes: [:address])
  end
end
