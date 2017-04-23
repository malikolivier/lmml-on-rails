class InjuriesController < ApplicationController
  before_action :set_autopsy, :set_examination, only: %i[new index create]
  before_action :set_injury, only: %i[show edit update destroy]

  # GET /autopsies/:id/:examination_name/injuries/new
  def new
    @injury = Injury.new(examination: @examination)
  end

  # GET /injuries/:id
  def show; end

  # GET /autopsies/:id/:examination_name/injuries
  def index
    @injuries = @examination.injuries
  end

  # POST /autopsies/:id/:examination_name/injuries
  def create
    @injury = @examination.injuries.create!(injury_params)
  end

  # PATCH /injuries/:id
  def update
    @injury.update!(injury_params)
  end

  # GET /injuries/:id/edit
  def edit; end

  private

  def set_autopsy
    @autopsy = Autopsy.find(params[:id])
  end

  FIND_EXAMINATION_TYPE_REGEX =
    %r{^/autopsies/\d+/(external|internal)_(\w+)_examination/injuries}

  def set_examination
    match_data = request.path.match(FIND_EXAMINATION_TYPE_REGEX)
    if match_data
      examination_type = ExaminationType.by_name(match_data[2], match_data[1])
      @examination = @autopsy.examination(examination_type)
    else
      raise ActionController::RoutingError, 'Did not found examination type ' \
                                            'in URL!'
    end
  end

  def set_injury
    @injury = Injury.find(params[:id])
  end

  def injury_params
    body_area = [:id, :body_reference_id,
                 in_body_orientation_attributes: %i[id coordinate_system x y
                                                    distance angle]]
    params.require(:injury)
          .permit(:time_sustained, :injury_type,
                  body_area_attributes: body_area,
                  injury_depth_attributes: %i[id depth reached_organ_id])
  end
end
