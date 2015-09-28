json.array!(@users) do |user|
  json.extract! user, :id, :OpenId, :mobile
  json.url user_url(user, format: :json)
end
