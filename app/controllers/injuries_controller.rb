class InjuriesController < ApplicationController
  before_action :set_autopsy, only: %i[new index create]
  before_action :set_examination

  # GET /autopsies/:id/:examination_name/injuries/new
  def new
    @injury = Injury.new(examination: @examination)
    @injury.build_body_area
    @injury.body_area.build_in_body_orientation
    @injury.build_injury_depth
  end

  # GET /autopsies/:id/:examination_name/injuries
  def index
    @injuries = @examination.injuries
  end

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
end
