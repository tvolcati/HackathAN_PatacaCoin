class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  validates :type, inclusion: { in: ['Professional', 'Student', 'Admin'] }
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
end
