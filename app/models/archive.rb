# app/models/archive.rb
class Archive < ApplicationRecord
  has_one_attached :file
  # Add validations as necessary, for example:
  validates :file, presence: true, blob: { content_type: ['application/pdf', 'image/png', 'image/jpg', 'image/jpeg'], size_range: 1..(10.megabytes) }
end
