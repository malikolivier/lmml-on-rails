injuries_lmml_json = @injuries.map do |injury|
  setup_injury(injury).as_lmml_json
end
json.injuries injuries_lmml_json
