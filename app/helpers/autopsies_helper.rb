module AutopsiesHelper
  def setup_autopsy(autopsy)
    autopsy.autopsy_date ||= DateTime.current
    autopsy.starting_time ||= DateTime.current
    autopsy.place ||= Institution.new
    autopsy.suspect ||= Person.new
    autopsy.victim ||= Person.new
    autopsy.police_station ||= Institution.new
    autopsy.police_inspector ||= Person.new
    autopsy.court ||= Institution.new
    autopsy.judge ||= Person.new
    autopsy.examiner ||= Person.new
    autopsy
  end
end
