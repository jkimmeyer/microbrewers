class RenameFlavorToFlavors < ActiveRecord::Migration[7.0]
  def change
    change_table :craft_beers do |t|
      t.rename :flavor, :flavors
    end
  end
end
