class AddBreweryReferenceToCraftBeer < ActiveRecord::Migration[7.0]
  def change
    add_reference :craft_beers, :brewery, foreign_key: true
  end
end
