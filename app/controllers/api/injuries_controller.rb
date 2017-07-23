class Api::InjuriesController < InjuriesController
  # GET /api/injuries/:id
  def show; end

  # GET /api/autopsies/:id/:examination_name/injuries
  def index
    @injuries = @examination.injuries.includes(QUERY_PRELOAD)
  end

  # POST /api/autopsies/:id/:examination_name/injuries
  def create
    @injury = @examination.injuries.create!(injury_params)
  end

  # PATCH /api/injuries/:id
  def update
    @injury.update!(injury_params)
  end

  # DELETE /api/injuries/:id
  def destroy
    @injury.destroy!
  end

  private

  BODY_AREA = [:id, :body_reference_id,
               in_body_orientation_attributes: %i[id coordinate_system x y
                                                  distance angle]].freeze

  def injury_params
    return {} if params[:injury].blank?
    params.require(:injury)
          .permit(:time_sustained, :injury_type, :description, :note,
                  body_area_attributes: BODY_AREA,
                  injury_size_attributes: %i[id shape length width
                                             coordinate_system angle],
                  injury_depth_attributes: %i[id depth reached_organ_id],
                  photographs_attributes: %i[id picture caption])
  end
end
