class AddContactPersonAttributesToBreweries < ActiveRecord::Migration[7.0]
  def change
    add_column :breweries, :first_name, :string
    add_column :breweries, :last_name, :string
    add_column :breweries, :phone, :string
  end
end
