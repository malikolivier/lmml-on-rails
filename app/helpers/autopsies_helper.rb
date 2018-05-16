module AutopsiesHelper
  # rubocop:disable MethodLength, AbcSize
  def setup_autopsy(autopsy)
    autopsy.autopsy_date ||= Date.current
    autopsy.starting_time ||= Time.current
    autopsy.place ||= Institution.new
    autopsy.suspect ||= Person.new
    autopsy.victim ||= Person.new
    autopsy.police_station ||= Institution.new
    autopsy.police_inspector ||= Person.new
    autopsy.court ||= Institution.new
    autopsy.judge ||= Person.new
    autopsy.examiner ||= Person.new
    autopsy.participations.build if autopsy.participations.empty?
    autopsy
  end
  # rubocop:enable MethodLength, AbcSize

  def translated_sexes
    Person.sexes.map do |sex, _|
      [t("sex.#{sex}"), sex]
    end
  end

  # rubocop:disable MethodLength,AbcSize
  def autopsy_header(query_params, key, sort_key)
    @display_name = I18n.t("activerecord.attributes.autopsy.#{key}")
    if request.url.index("#{sort_key}+DESC").nil?
      link_to "#{@display_name}#{t '.descending'}",
              api_autopsies_url(
                order: "#{sort_key} DESC",
                number: query_params['number'],
                examiner_filter: query_params['examiner_filter'],
                police_inspector_filter: query_params['police_inspector_filter']
              )
    else
      link_to "#{@display_name}#{t '.ascending'}",
              api_autopsies_url(
                order: sort_key.to_s,
                number: query_params['number'],
                examiner_filter: query_params['examiner_filter'],
                police_inspector_filter: query_params['police_inspector_filter']
              )
    end
  end
  # rubocop:enable MethodLength, AbcSize
end
