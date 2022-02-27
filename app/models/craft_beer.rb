class CraftBeer < ApplicationRecord
  has_one_attached :craft_beer_image
  belongs_to :craft_beer_type
end
