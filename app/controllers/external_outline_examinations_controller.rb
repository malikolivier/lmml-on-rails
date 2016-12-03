class ExternalOutlineExaminationsController < ApplicationController
  before_action :set_external_outline_examination, only: [:show, :edit, :update, :destroy]

  # GET /external_outline_examinations
  # GET /external_outline_examinations.json
  def index
    @external_outline_examinations = ExternalOutlineExamination.all
  end

  # GET /external_outline_examinations/1
  # GET /external_outline_examinations/1.json
  def show
  end

  # GET /external_outline_examinations/new
  def new
    @external_outline_examination = ExternalOutlineExamination.new
  end

  # GET /external_outline_examinations/1/edit
  def edit
  end

  # POST /external_outline_examinations
  # POST /external_outline_examinations.json
  def create
    @external_outline_examination = ExternalOutlineExamination.new(external_outline_examination_params)

    respond_to do |format|
      if @external_outline_examination.save
        format.html { redirect_to @external_outline_examination, notice: 'External outline examination was successfully created.' }
        format.json { render :show, status: :created, location: @external_outline_examination }
      else
        format.html { render :new }
        format.json { render json: @external_outline_examination.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /external_outline_examinations/1
  # PATCH/PUT /external_outline_examinations/1.json
  def update
    respond_to do |format|
      if @external_outline_examination.update(external_outline_examination_params)
        format.html { redirect_to @external_outline_examination, notice: 'External outline examination was successfully updated.' }
        format.json { render :show, status: :ok, location: @external_outline_examination }
      else
        format.html { render :edit }
        format.json { render json: @external_outline_examination.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /external_outline_examinations/1
  # DELETE /external_outline_examinations/1.json
  def destroy
    @external_outline_examination.destroy
    respond_to do |format|
      format.html { redirect_to external_outline_examinations_url, notice: 'External outline examination was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_external_outline_examination
      @external_outline_examination = ExternalOutlineExamination.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def external_outline_examination_params
      params.require(:external_outline_examination).permit(:sex, :height, :weight, :partial_body, :constitution)
    end
end
