# db/migrate/[timestamp]_update_reviews.rb
class UpdateReviews < ActiveRecord::Migration[7.0]
  def change
    # Rename fields
    rename_column :reviews, :titulo, :title
    rename_column :reviews, :data, :date

    # Add new fields
    add_column :reviews, :subject, :string
    add_column :reviews, :language, :string
    add_column :reviews, :description, :text
  end
end
