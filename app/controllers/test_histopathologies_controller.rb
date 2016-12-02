class TestHistopathologiesController < ApplicationController
  before_action :set_test_histopathology, only: [:show, :edit, :update, :destroy]

  # GET /test_histopathologies
  # GET /test_histopathologies.json
  def index
    @test_histopathologies = TestHistopathology.all
  end

  # GET /test_histopathologies/1
  # GET /test_histopathologies/1.json
  def show
  end

  # GET /test_histopathologies/new
  def new
    @test_histopathology = TestHistopathology.new
  end

  # GET /test_histopathologies/1/edit
  def edit
  end

  # POST /test_histopathologies
  # POST /test_histopathologies.json
  def create
    @test_histopathology = TestHistopathology.new(test_histopathology_params)

    respond_to do |format|
      if @test_histopathology.save
        format.html { redirect_to @test_histopathology, notice: 'Test histopathology was successfully created.' }
        format.json { render :show, status: :created, location: @test_histopathology }
      else
        format.html { render :new }
        format.json { render json: @test_histopathology.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /test_histopathologies/1
  # PATCH/PUT /test_histopathologies/1.json
  def update
    respond_to do |format|
      if @test_histopathology.update(test_histopathology_params)
        format.html { redirect_to @test_histopathology, notice: 'Test histopathology was successfully updated.' }
        format.json { render :show, status: :ok, location: @test_histopathology }
      else
        format.html { render :edit }
        format.json { render json: @test_histopathology.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /test_histopathologies/1
  # DELETE /test_histopathologies/1.json
  def destroy
    @test_histopathology.destroy
    respond_to do |format|
      format.html { redirect_to test_histopathologies_url, notice: 'Test histopathology was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_test_histopathology
      @test_histopathology = TestHistopathology.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def test_histopathology_params
      params.require(:test_histopathology).permit(:note)
    end
end
