class AddUniqueIndexToColumns < ActiveRecord::Migration[7.0]
  def change
    change_table :craft_beers do |t|
      t.index :name, unique: true
    end

    change_table :craft_beer_types do |t|
      t.index :name, unique: true
    end
  end
end
