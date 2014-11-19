json.array!(@product_items) do |product_item|
  json.extract! product_item, :id, :product_id, :cart_id
  json.url product_item_url(product_item, format: :json)
end
