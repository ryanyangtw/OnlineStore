object @product

attributes :id, :title, :description

node(:image) { |product| product.default_photo.image_url }
