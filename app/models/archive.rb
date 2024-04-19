# app/models/archive.rb
class Archive < ApplicationRecord
  has_one_attached :file
  has_many :reviews, dependent: :destroy


  validates :file, presence: true
  validates :file, size: { less_than: 10.megabytes }
  validates :file, content_type: ['application/pdf', 'image/png', 'image/jpg', 'image/jpeg', 'audio/mpeg', 'video/mp4', 'text/plain', 'application/msword', 'application/vnd.ms-excel', 'application/vnd.openxmlformats-officedocument.wordprocessingml.document', 'application/vnd.openxmlformats-officedocument.spreadsheetml.sheet', 'text/csv', 'application/zip']

  validates :title, presence: true
  validates :category, presence: true, inclusion: { in: ["Textual", "Sonoro", "Iconografico", "Cartografico", "Audio-Visual"] }
end
