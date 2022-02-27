class CreateCraftBeerTypes < ActiveRecord::Migration[7.0]
  def change
    create_table :craft_beer_types do |t|
      t.string :name

      t.timestamps
    end
  end
end
