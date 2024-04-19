class CreateReviews < ActiveRecord::Migration[7.0]
  def change
    create_table :reviews do |t|
      t.references :user, null: false, foreign_key: true
      t.references :archive, null: false, foreign_key: true
      t.string :status
      t.boolean :validated

      t.timestamps
    end
  end
end
