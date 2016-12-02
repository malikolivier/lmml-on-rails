json.extract! person, :id, :name, :sex, :age, :title, :institution_id, :identification_number, :role_id, :created_at, :updated_at
json.url person_url(person, format: :json)