class CreateBreweries < ActiveRecord::Migration[7.0]
  def change
    create_table :breweries, &:timestamps
  end
end
