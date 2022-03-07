class RenameHopToHops < ActiveRecord::Migration[7.0]
  def change
    change_table :craft_beers do |t|
      t.rename :hop, :hops
    end
  end
end
