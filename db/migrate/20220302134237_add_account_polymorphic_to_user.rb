class AddAccountPolymorphicToUser < ActiveRecord::Migration[7.0]
  def change
    change_table(:users, bulk: true) do |t|
      t.column :account_type, :string
      t.column :account_id, :bigint

      t.index %i[account_type account_id]
    end
  end
end
