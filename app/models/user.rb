class User < ApplicationRecord
  # This was from the devise authorization
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  # This is an attribute that I used to make the toggle switch changing the role of the user
  enum role: { visitor: 0, owner: 1 }
  # Associations
  has_many :disasters, dependent: :destroy
  has_many :bookings, dependent: :destroy
  has_many :reviews, through: :bookings, dependent: :destroy
  has_one_attached :photo
end
