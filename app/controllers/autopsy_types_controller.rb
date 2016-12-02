class AutopsyTypesController < ApplicationController
  before_action :set_autopsy_type, only: [:show, :edit, :update, :destroy]

  # GET /autopsy_types
  # GET /autopsy_types.json
  def index
    @autopsy_types = AutopsyType.all
  end

  # GET /autopsy_types/1
  # GET /autopsy_types/1.json
  def show
  end

  # GET /autopsy_types/new
  def new
    @autopsy_type = AutopsyType.new
  end

  # GET /autopsy_types/1/edit
  def edit
  end

  # POST /autopsy_types
  # POST /autopsy_types.json
  def create
    @autopsy_type = AutopsyType.new(autopsy_type_params)

    respond_to do |format|
      if @autopsy_type.save
        format.html { redirect_to @autopsy_type, notice: 'Autopsy type was successfully created.' }
        format.json { render :show, status: :created, location: @autopsy_type }
      else
        format.html { render :new }
        format.json { render json: @autopsy_type.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /autopsy_types/1
  # PATCH/PUT /autopsy_types/1.json
  def update
    respond_to do |format|
      if @autopsy_type.update(autopsy_type_params)
        format.html { redirect_to @autopsy_type, notice: 'Autopsy type was successfully updated.' }
        format.json { render :show, status: :ok, location: @autopsy_type }
      else
        format.html { render :edit }
        format.json { render json: @autopsy_type.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /autopsy_types/1
  # DELETE /autopsy_types/1.json
  def destroy
    @autopsy_type.destroy
    respond_to do |format|
      format.html { redirect_to autopsy_types_url, notice: 'Autopsy type was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_autopsy_type
      @autopsy_type = AutopsyType.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def autopsy_type_params
      params.require(:autopsy_type).permit(:name, :law)
    end
end
