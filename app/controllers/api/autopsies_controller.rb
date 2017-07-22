class Api::AutopsiesController < AutopsiesController
  # GET /api/autopsies
  def index
    @autopsies = Autopsy.all
  end

  # GET /api/autopsies/:id
  def show; end

  # POST /api/autopsies
  def create
    @autopsy = Autopsy.new(autopsy_params)
    if @autopsy.save
      render :show, status: :created, location: @autopsy
    else
      render json: @autopsy.errors, status: :unprocessable_entity
    end
  end

  # PATCH /api/autopsies/:id
  def update
    return if @autopsy.update(autopsy_params)
    render json: { errors: @autopsy.errors.full_messages },
           status: :unprocessable_entity
  end

  # DELETE /api/autopsies/:id
  def destroy
    @autopsy.destroy!
    head :no_content
  end
end
