json.array!(@orders) do |order|
  json.extract! order, :id, :UserId_id, :good, :goodnum, :price, :time, :AddressId_id
  json.url order_url(order, format: :json)
end
