class TestTriagesController < ApplicationController
  before_action :set_test_triage, only: [:show, :edit, :update, :destroy]

  # GET /test_triages
  # GET /test_triages.json
  def index
    @test_triages = TestTriage.all
  end

  # GET /test_triages/1
  # GET /test_triages/1.json
  def show
  end

  # GET /test_triages/new
  def new
    @test_triage = TestTriage.new
  end

  # GET /test_triages/1/edit
  def edit
  end

  # POST /test_triages
  # POST /test_triages.json
  def create
    @test_triage = TestTriage.new(test_triage_params)

    respond_to do |format|
      if @test_triage.save
        format.html { redirect_to @test_triage, notice: 'Test triage was successfully created.' }
        format.json { render :show, status: :created, location: @test_triage }
      else
        format.html { render :new }
        format.json { render json: @test_triage.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /test_triages/1
  # PATCH/PUT /test_triages/1.json
  def update
    respond_to do |format|
      if @test_triage.update(test_triage_params)
        format.html { redirect_to @test_triage, notice: 'Test triage was successfully updated.' }
        format.json { render :show, status: :ok, location: @test_triage }
      else
        format.html { render :edit }
        format.json { render json: @test_triage.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /test_triages/1
  # DELETE /test_triages/1.json
  def destroy
    @test_triage.destroy
    respond_to do |format|
      format.html { redirect_to test_triages_url, notice: 'Test triage was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_test_triage
      @test_triage = TestTriage.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def test_triage_params
      params.require(:test_triage).permit(:note)
    end
end
