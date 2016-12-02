class BodyReferencesController < ApplicationController
  before_action :set_body_reference, only: [:show, :edit, :update, :destroy]

  # GET /body_references
  # GET /body_references.json
  def index
    @body_references = BodyReference.all
  end

  # GET /body_references/1
  # GET /body_references/1.json
  def show
  end

  # GET /body_references/new
  def new
    @body_reference = BodyReference.new
  end

  # GET /body_references/1/edit
  def edit
  end

  # POST /body_references
  # POST /body_references.json
  def create
    @body_reference = BodyReference.new(body_reference_params)

    respond_to do |format|
      if @body_reference.save
        format.html { redirect_to @body_reference, notice: 'Body reference was successfully created.' }
        format.json { render :show, status: :created, location: @body_reference }
      else
        format.html { render :new }
        format.json { render json: @body_reference.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /body_references/1
  # PATCH/PUT /body_references/1.json
  def update
    respond_to do |format|
      if @body_reference.update(body_reference_params)
        format.html { redirect_to @body_reference, notice: 'Body reference was successfully updated.' }
        format.json { render :show, status: :ok, location: @body_reference }
      else
        format.html { render :edit }
        format.json { render json: @body_reference.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /body_references/1
  # DELETE /body_references/1.json
  def destroy
    @body_reference.destroy
    respond_to do |format|
      format.html { redirect_to body_references_url, notice: 'Body reference was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_body_reference
      @body_reference = BodyReference.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def body_reference_params
      params.require(:body_reference).permit(:name)
    end
end
