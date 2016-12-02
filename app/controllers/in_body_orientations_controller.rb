class InBodyOrientationsController < ApplicationController
  before_action :set_in_body_orientation, only: [:show, :edit, :update, :destroy]

  # GET /in_body_orientations
  # GET /in_body_orientations.json
  def index
    @in_body_orientations = InBodyOrientation.all
  end

  # GET /in_body_orientations/1
  # GET /in_body_orientations/1.json
  def show
  end

  # GET /in_body_orientations/new
  def new
    @in_body_orientation = InBodyOrientation.new
  end

  # GET /in_body_orientations/1/edit
  def edit
  end

  # POST /in_body_orientations
  # POST /in_body_orientations.json
  def create
    @in_body_orientation = InBodyOrientation.new(in_body_orientation_params)

    respond_to do |format|
      if @in_body_orientation.save
        format.html { redirect_to @in_body_orientation, notice: 'In body orientation was successfully created.' }
        format.json { render :show, status: :created, location: @in_body_orientation }
      else
        format.html { render :new }
        format.json { render json: @in_body_orientation.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /in_body_orientations/1
  # PATCH/PUT /in_body_orientations/1.json
  def update
    respond_to do |format|
      if @in_body_orientation.update(in_body_orientation_params)
        format.html { redirect_to @in_body_orientation, notice: 'In body orientation was successfully updated.' }
        format.json { render :show, status: :ok, location: @in_body_orientation }
      else
        format.html { render :edit }
        format.json { render json: @in_body_orientation.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /in_body_orientations/1
  # DELETE /in_body_orientations/1.json
  def destroy
    @in_body_orientation.destroy
    respond_to do |format|
      format.html { redirect_to in_body_orientations_url, notice: 'In body orientation was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_in_body_orientation
      @in_body_orientation = InBodyOrientation.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def in_body_orientation_params
      params.require(:in_body_orientation).permit(:coordinate_system, :x, :y)
    end
end
