class InjuryDepthsController < ApplicationController
  before_action :set_injury_depth, only: [:show, :edit, :update, :destroy]

  # GET /injury_depths
  # GET /injury_depths.json
  def index
    @injury_depths = InjuryDepth.all
  end

  # GET /injury_depths/1
  # GET /injury_depths/1.json
  def show
  end

  # GET /injury_depths/new
  def new
    @injury_depth = InjuryDepth.new
  end

  # GET /injury_depths/1/edit
  def edit
  end

  # POST /injury_depths
  # POST /injury_depths.json
  def create
    @injury_depth = InjuryDepth.new(injury_depth_params)

    respond_to do |format|
      if @injury_depth.save
        format.html { redirect_to @injury_depth, notice: 'Injury depth was successfully created.' }
        format.json { render :show, status: :created, location: @injury_depth }
      else
        format.html { render :new }
        format.json { render json: @injury_depth.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /injury_depths/1
  # PATCH/PUT /injury_depths/1.json
  def update
    respond_to do |format|
      if @injury_depth.update(injury_depth_params)
        format.html { redirect_to @injury_depth, notice: 'Injury depth was successfully updated.' }
        format.json { render :show, status: :ok, location: @injury_depth }
      else
        format.html { render :edit }
        format.json { render json: @injury_depth.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /injury_depths/1
  # DELETE /injury_depths/1.json
  def destroy
    @injury_depth.destroy
    respond_to do |format|
      format.html { redirect_to injury_depths_url, notice: 'Injury depth was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_injury_depth
      @injury_depth = InjuryDepth.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def injury_depth_params
      params.require(:injury_depth).permit(:depth)
    end
end
