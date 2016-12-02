class TestBloodTypeExperimentsController < ApplicationController
  before_action :set_test_blood_type_experiment, only: [:show, :edit, :update, :destroy]

  # GET /test_blood_type_experiments
  # GET /test_blood_type_experiments.json
  def index
    @test_blood_type_experiments = TestBloodTypeExperiment.all
  end

  # GET /test_blood_type_experiments/1
  # GET /test_blood_type_experiments/1.json
  def show
  end

  # GET /test_blood_type_experiments/new
  def new
    @test_blood_type_experiment = TestBloodTypeExperiment.new
  end

  # GET /test_blood_type_experiments/1/edit
  def edit
  end

  # POST /test_blood_type_experiments
  # POST /test_blood_type_experiments.json
  def create
    @test_blood_type_experiment = TestBloodTypeExperiment.new(test_blood_type_experiment_params)

    respond_to do |format|
      if @test_blood_type_experiment.save
        format.html { redirect_to @test_blood_type_experiment, notice: 'Test blood type experiment was successfully created.' }
        format.json { render :show, status: :created, location: @test_blood_type_experiment }
      else
        format.html { render :new }
        format.json { render json: @test_blood_type_experiment.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /test_blood_type_experiments/1
  # PATCH/PUT /test_blood_type_experiments/1.json
  def update
    respond_to do |format|
      if @test_blood_type_experiment.update(test_blood_type_experiment_params)
        format.html { redirect_to @test_blood_type_experiment, notice: 'Test blood type experiment was successfully updated.' }
        format.json { render :show, status: :ok, location: @test_blood_type_experiment }
      else
        format.html { render :edit }
        format.json { render json: @test_blood_type_experiment.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /test_blood_type_experiments/1
  # DELETE /test_blood_type_experiments/1.json
  def destroy
    @test_blood_type_experiment.destroy
    respond_to do |format|
      format.html { redirect_to test_blood_type_experiments_url, notice: 'Test blood type experiment was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_test_blood_type_experiment
      @test_blood_type_experiment = TestBloodTypeExperiment.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def test_blood_type_experiment_params
      params.require(:test_blood_type_experiment).permit(:serum, :reaction)
    end
end
