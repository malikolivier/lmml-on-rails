module InjuriesHelper
  def setup_injury(injury)
    injury.build_body_area
    injury.body_area.build_in_body_orientation
    injury.build_injury_size
    injury.build_injury_depth
    injury
  end
end
