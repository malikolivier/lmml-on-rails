json.injuries @injuries.map do |injury|
  setup_injury(injury).as_lmml_json
end
