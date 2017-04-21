json.array! @injuries do |injury|
  json.partial! 'injury', injury: injury
end
