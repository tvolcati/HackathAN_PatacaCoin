class AddTokenFieldsToUsers < ActiveRecord::Migration[7.0]
  def change
    add_column :users, :unclaimed_tokens, :decimal
    add_column :users, :claimed_tokens, :decimal
    add_column :users, :wallet_address, :string
  end
end
