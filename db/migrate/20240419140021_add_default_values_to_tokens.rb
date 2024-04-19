class AddDefaultValuesToTokens < ActiveRecord::Migration[7.0]
  def change
    change_column_default :users, :unclaimed_tokens, from: nil, to: 0.0
    change_column_default :users, :claimed_tokens, from: nil, to: 0.0
  end
end
