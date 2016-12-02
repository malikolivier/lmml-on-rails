class BodyAreasController < ApplicationController
  before_action :set_body_area, only: [:show, :edit, :update, :destroy]

  # GET /body_areas
  # GET /body_areas.json
  def index
    @body_areas = BodyArea.all
  end

  # GET /body_areas/1
  # GET /body_areas/1.json
  def show
  end

  # GET /body_areas/new
  def new
    @body_area = BodyArea.new
  end

  # GET /body_areas/1/edit
  def edit
  end

  # POST /body_areas
  # POST /body_areas.json
  def create
    @body_area = BodyArea.new(body_area_params)

    respond_to do |format|
      if @body_area.save
        format.html { redirect_to @body_area, notice: 'Body area was successfully created.' }
        format.json { render :show, status: :created, location: @body_area }
      else
        format.html { render :new }
        format.json { render json: @body_area.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /body_areas/1
  # PATCH/PUT /body_areas/1.json
  def update
    respond_to do |format|
      if @body_area.update(body_area_params)
        format.html { redirect_to @body_area, notice: 'Body area was successfully updated.' }
        format.json { render :show, status: :ok, location: @body_area }
      else
        format.html { render :edit }
        format.json { render json: @body_area.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /body_areas/1
  # DELETE /body_areas/1.json
  def destroy
    @body_area.destroy
    respond_to do |format|
      format.html { redirect_to body_areas_url, notice: 'Body area was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_body_area
      @body_area = BodyArea.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def body_area_params
      params.require(:body_area).permit(:distance)
    end
end
