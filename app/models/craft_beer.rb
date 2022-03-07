class CraftBeer < ApplicationRecord
  has_one_attached :craft_beer_image
  belongs_to :craft_beer_type

  validates_presence_of :name, :price, :description, :craft_beer_type
  validates_uniqueness_of :name
end
