class InjuriesController < ApplicationController
  skip_before_action :verify_authenticity_token
  before_action :set_autopsy, :set_examination, only: %i[new index create]
  before_action :set_injury, only: %i[show edit update destroy]

  QUERY_PRELOAD = [:injury_size, :injury_depth, :photographs,
                   body_area: :in_body_orientation].freeze

  # GET /autopsies/:id/:examination_name/injuries/new
  def new
    @injury = Injury.new(examination: @examination)
  end

  # GET /injuries/:id/edit
  def edit; end

  private

  def set_autopsy
    @autopsy = Autopsy.find(params[:id])
  end

  FIND_EXAMINATION_TYPE_REGEX =
    %r{^(?:/api)?/autopsies/\d+/(external|internal)_(\w+)_examination/injuries}

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
    @injury = Injury.includes(QUERY_PRELOAD).find(params[:id])
  end
end
