json.extract! body_reference, :id, :name, :created_at, :updated_at
json.url body_reference_url(body_reference, format: :json)