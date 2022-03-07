class CraftBeerType < ApplicationRecord
  has_many :craft_beers, dependent: :destroy
  validates_presence_of :name
  validates_uniqueness_of :name
end
