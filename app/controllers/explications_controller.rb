class ExplicationsController < ApplicationController
  before_action :set_explication, only: [:show, :edit, :update, :destroy]

  # GET /explications
  # GET /explications.json
  def index
    @explications = Explication.all
  end

  # GET /explications/1
  # GET /explications/1.json
  def show
  end

  # GET /explications/new
  def new
    @explication = Explication.new
  end

  # GET /explications/1/edit
  def edit
  end

  # POST /explications
  # POST /explications.json
  def create
    @explication = Explication.new(explication_params)

    respond_to do |format|
      if @explication.save
        format.html { redirect_to @explication, notice: 'Explication was successfully created.' }
        format.json { render :show, status: :created, location: @explication }
      else
        format.html { render :new }
        format.json { render json: @explication.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /explications/1
  # PATCH/PUT /explications/1.json
  def update
    respond_to do |format|
      if @explication.update(explication_params)
        format.html { redirect_to @explication, notice: 'Explication was successfully updated.' }
        format.json { render :show, status: :ok, location: @explication }
      else
        format.html { render :edit }
        format.json { render json: @explication.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /explications/1
  # DELETE /explications/1.json
  def destroy
    @explication.destroy
    respond_to do |format|
      format.html { redirect_to explications_url, notice: 'Explication was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_explication
      @explication = Explication.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def explication_params
      params.require(:explication).permit(:title, :content)
    end
end
