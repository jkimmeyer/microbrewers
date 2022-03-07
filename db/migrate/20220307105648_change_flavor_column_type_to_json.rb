class ChangeFlavorColumnTypeToJson < ActiveRecord::Migration[7.0]
  def change
    change_table :craft_beers do |t|
      t.remove :flavors
      t.column :flavors_data, :json
    end
  end
end
