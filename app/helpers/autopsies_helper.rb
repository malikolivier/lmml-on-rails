module AutopsiesHelper
  # rubocop:disable MethodLength, AbcSize
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
    autopsy.participations.build
    autopsy
  end

  def translated_sexes
    Person.sexes.map do |sex, _|
      [t("sex.#{sex}"), sex]
    end
  end
end
