json.name @sale_item.product.name
json.price @sale_item.product.price
json.quantity @sale_item.quantity
json.sub_total number_to_currency(@sale_item.sub_total)

json.num_items @sale_item.sale.products.size
json.total number_to_currency(@sale_item.sale.total)

