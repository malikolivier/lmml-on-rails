json.partial! 'foreign_fluid', foreign_fluid: @nested_model
if @external_mouth_examination
  json.external_mouth_examination_id @external_mouth_examination.id
end
