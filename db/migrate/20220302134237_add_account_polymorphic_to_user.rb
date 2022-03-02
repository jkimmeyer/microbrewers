class AddAccountPolymorphicToUser < ActiveRecord::Migration[7.0]
  def change
    add_column :users, :account_type, :string
    add_column :users, :account_id, :bigint

    add_index :users, %i[account_type account_id]
  end
end
