module AutopsiesHelper
  def setup_autopsy(autopsy)
    autopsy.autopsy_date ||= DateTime.current
    autopsy.starting_time ||= DateTime.current
    autopsy.build_place
    autopsy.build_suspect
    autopsy.build_victim
    autopsy
  end
end
