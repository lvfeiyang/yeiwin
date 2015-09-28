json.array!(@addresses) do |address|
  json.extract! address, :id, :info
  json.url address_url(address, format: :json)
end
