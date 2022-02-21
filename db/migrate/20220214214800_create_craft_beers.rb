class CreateCraftBeers < ActiveRecord::Migration[7.0]
  def change
    create_table :craft_beers do |t|
      t.string :name
      t.string :description
      t.integer :international_bitterness_unit
      t.decimal :alcohol_volume
      t.decimal :price
      t.string :flavor
      t.string :color
      t.string :hop

      t.timestamps
    end
  end
end
