class InjurySizesController < ApplicationController
  before_action :set_injury_size, only: [:show, :edit, :update, :destroy]

  # GET /injury_sizes
  # GET /injury_sizes.json
  def index
    @injury_sizes = InjurySize.all
  end

  # GET /injury_sizes/1
  # GET /injury_sizes/1.json
  def show
  end

  # GET /injury_sizes/new
  def new
    @injury_size = InjurySize.new
  end

  # GET /injury_sizes/1/edit
  def edit
  end

  # POST /injury_sizes
  # POST /injury_sizes.json
  def create
    @injury_size = InjurySize.new(injury_size_params)

    respond_to do |format|
      if @injury_size.save
        format.html { redirect_to @injury_size, notice: 'Injury size was successfully created.' }
        format.json { render :show, status: :created, location: @injury_size }
      else
        format.html { render :new }
        format.json { render json: @injury_size.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /injury_sizes/1
  # PATCH/PUT /injury_sizes/1.json
  def update
    respond_to do |format|
      if @injury_size.update(injury_size_params)
        format.html { redirect_to @injury_size, notice: 'Injury size was successfully updated.' }
        format.json { render :show, status: :ok, location: @injury_size }
      else
        format.html { render :edit }
        format.json { render json: @injury_size.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /injury_sizes/1
  # DELETE /injury_sizes/1.json
  def destroy
    @injury_size.destroy
    respond_to do |format|
      format.html { redirect_to injury_sizes_url, notice: 'Injury size was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_injury_size
      @injury_size = InjurySize.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def injury_size_params
      params.require(:injury_size).permit(:shape, :length, :width)
    end
end
