json.array! autopsy.autopsy_photograph_takings do |taking|
  json.partial! 'photograph_taking', photograph_taking: taking
end
