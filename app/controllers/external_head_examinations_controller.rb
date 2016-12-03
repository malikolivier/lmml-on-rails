class ExternalHeadExaminationsController < ApplicationController
  before_action :set_external_head_examination, only: [:show, :edit, :update, :destroy]

  # GET /external_head_examinations
  # GET /external_head_examinations.json
  def index
    @external_head_examinations = ExternalHeadExamination.all
  end

  # GET /external_head_examinations/1
  # GET /external_head_examinations/1.json
  def show
  end

  # GET /external_head_examinations/new
  def new
    @external_head_examination = ExternalHeadExamination.new
  end

  # GET /external_head_examinations/1/edit
  def edit
  end

  # POST /external_head_examinations
  # POST /external_head_examinations.json
  def create
    @external_head_examination = ExternalHeadExamination.new(external_head_examination_params)

    respond_to do |format|
      if @external_head_examination.save
        format.html { redirect_to @external_head_examination, notice: 'External head examination was successfully created.' }
        format.json { render :show, status: :created, location: @external_head_examination }
      else
        format.html { render :new }
        format.json { render json: @external_head_examination.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /external_head_examinations/1
  # PATCH/PUT /external_head_examinations/1.json
  def update
    respond_to do |format|
      if @external_head_examination.update(external_head_examination_params)
        format.html { redirect_to @external_head_examination, notice: 'External head examination was successfully updated.' }
        format.json { render :show, status: :ok, location: @external_head_examination }
      else
        format.html { render :edit }
        format.json { render json: @external_head_examination.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /external_head_examinations/1
  # DELETE /external_head_examinations/1.json
  def destroy
    @external_head_examination.destroy
    respond_to do |format|
      format.html { redirect_to external_head_examinations_url, notice: 'External head examination was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_external_head_examination
      @external_head_examination = ExternalHeadExamination.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def external_head_examination_params
      params.require(:external_head_examination).permit(:hair_natural_color, :hair_dyed_color, :top_hair_length, :side_hair_length)
    end
end
