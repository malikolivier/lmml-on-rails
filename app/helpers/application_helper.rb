module ApplicationHelper
  def form_to_vue(object_name, method)
    match = object_name.match(/^\w*\[(.*)\]$/)
    if match
      "#{match.captures.join('.')}.#{method}_attributes"
    else
      "#{method}_attributes"
    end
  end
end
