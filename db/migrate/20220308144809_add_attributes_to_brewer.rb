class AddAttributesToBrewer < ActiveRecord::Migration[7.0]
  def change
    change_table :breweries do |t|
      t.string :description
      t.string :name
      t.string :ust_id
      t.json :address_data
    end
  end
end
