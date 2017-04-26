module InjuriesHelper
  def setup_injury(injury)
    injury.build_body_area if injury.body_area.blank?
    if injury.body_area.in_body_orientation.blank?
      injury.body_area.build_in_body_orientation
    end
    injury.build_injury_size if injury.injury_size.blank?
    injury.build_injury_depth if injury.injury_depth.blank?
    injury
  end
end
