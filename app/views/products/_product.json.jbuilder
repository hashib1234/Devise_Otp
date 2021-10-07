json.extract! product, :id, :image_title, :image_desc, :main_image, :thumb_image, :price, :created_at, :updated_at
json.url product_url(product, format: :json)
