class CraftBeerType < ApplicationRecord
  has_many :craft_beers, dependent: :destroy
end
