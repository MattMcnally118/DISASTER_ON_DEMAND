class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  enum role: { visitor: 0, owner: 1 }
  has_many :disasters, dependent: :destroy
  has_many :bookings, dependent: :destroy
end
