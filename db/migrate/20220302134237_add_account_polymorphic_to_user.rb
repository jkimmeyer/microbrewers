class AddAccountPolymorphicToUser < ActiveRecord::Migration[7.0]
  def change
    change_table(:users, bulk: true) do |t|
      t.add_column :account_type, :string
      t.add_coumn  :account_id, :bigint

      t.add_index %i[account_type account_id]
    end
  end
end
