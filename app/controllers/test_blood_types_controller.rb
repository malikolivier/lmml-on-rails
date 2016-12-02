class TestBloodTypesController < ApplicationController
  before_action :set_test_blood_type, only: [:show, :edit, :update, :destroy]

  # GET /test_blood_types
  # GET /test_blood_types.json
  def index
    @test_blood_types = TestBloodType.all
  end

  # GET /test_blood_types/1
  # GET /test_blood_types/1.json
  def show
  end

  # GET /test_blood_types/new
  def new
    @test_blood_type = TestBloodType.new
  end

  # GET /test_blood_types/1/edit
  def edit
  end

  # POST /test_blood_types
  # POST /test_blood_types.json
  def create
    @test_blood_type = TestBloodType.new(test_blood_type_params)

    respond_to do |format|
      if @test_blood_type.save
        format.html { redirect_to @test_blood_type, notice: 'Test blood type was successfully created.' }
        format.json { render :show, status: :created, location: @test_blood_type }
      else
        format.html { render :new }
        format.json { render json: @test_blood_type.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /test_blood_types/1
  # PATCH/PUT /test_blood_types/1.json
  def update
    respond_to do |format|
      if @test_blood_type.update(test_blood_type_params)
        format.html { redirect_to @test_blood_type, notice: 'Test blood type was successfully updated.' }
        format.json { render :show, status: :ok, location: @test_blood_type }
      else
        format.html { render :edit }
        format.json { render json: @test_blood_type.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /test_blood_types/1
  # DELETE /test_blood_types/1.json
  def destroy
    @test_blood_type.destroy
    respond_to do |format|
      format.html { redirect_to test_blood_types_url, notice: 'Test blood type was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_test_blood_type
      @test_blood_type = TestBloodType.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def test_blood_type_params
      params.require(:test_blood_type).permit(:result, :note)
    end
end
