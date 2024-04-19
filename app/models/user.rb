class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  has_many :reviews, dependent: :destroy

  validates :unclaimed_tokens, :claimed_tokens, numericality: { greater_than_or_equal_to: 0 }

  validates :type, inclusion: { in: ['Professional', 'Student', 'Admin'] }
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
end
