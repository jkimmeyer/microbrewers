class CraftBeer < ApplicationRecord
  has_one_attached :product_image
  belongs_to :craft_beer_type
end
