json.extract! location, :id, :location_name, :location_description, :created_at, :updated_at
json.url location_url(location, format: :json)