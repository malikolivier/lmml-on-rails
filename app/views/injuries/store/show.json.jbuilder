@examination_types.each do |examination_type|
  json.set! examination_type.key_string do
    json.reachable_organs do
      json.array! examination_type.reachable_organs, :id, :name
    end
    json.body_references do
      json.array! examination_type.body_references, :id, :name
    end
  end
end
