class Review < ApplicationRecord
  belongs_to :user
  belongs_to :archive

  validates :title, :date, :subject, :language, :description, presence: true
end
