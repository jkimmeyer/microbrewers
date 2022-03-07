class AddOriginalWortToCraftBeer < ActiveRecord::Migration[7.0]
  def change
    add_column :craft_beers, :original_wort, :decimal
  end
end
