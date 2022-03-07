class ChangeHopsColumnTypeToJson < ActiveRecord::Migration[7.0]
  def change
    change_table :craft_beers do |t|
      t.remove :hops
      t.column :hops_data, :json
    end
  end
end
