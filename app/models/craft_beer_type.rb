class CraftBeerType < ApplicationRecord
  has_many :craft_beers, dependent: :destroy
  validates :name, presence: true
  validates :name, uniqueness: true
end
