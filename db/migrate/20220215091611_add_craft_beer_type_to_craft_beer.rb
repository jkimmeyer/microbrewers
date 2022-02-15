class AddCraftBeerTypeToCraftBeer < ActiveRecord::Migration[7.0]
  def change
    add_reference :craft_beers, :craft_beer_type, foreign_key: true
  end
end