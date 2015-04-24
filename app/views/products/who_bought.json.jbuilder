json.title "Who bought #{@product.title}"

json.published_at @latest_order.try(:updated_at)

json.orders @product.orders do |order|
  json.id order.id
  json.name order.name
  json.email order.email
  json.address order.address
  json.pay_type order.pay_type
  json.total number_to_currency order.line_items.map(&:total_price).sum
  json.products order.line_items do |item|
    json.title item.product.title
    json.qty item.quantity
    json.price item.price
  end
end
