json.array!(@presences) do |presence|
  json.extract! presence, :id, :user_id, :picture_id
  json.url presence_url(presence, format: :json)
end
