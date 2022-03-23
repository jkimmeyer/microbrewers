class CreateCrowdBrews < ActiveRecord::Migration[7.0]
  def change
    create_table :crowd_brews do |t|
      t.date :producing_at
      t.date :crowd_brew_until
      t.date :crowd_brew_from
      t.date :estimated_delivery_date
      t.integer :amount

      t.timestamps
    end
  end
end
