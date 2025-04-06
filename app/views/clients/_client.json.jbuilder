json.extract! client, :id, :name, :address, :insurance, :addition, :memo, :created_at, :updated_at
json.url client_url(client, format: :json)
