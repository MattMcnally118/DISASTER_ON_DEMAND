class Booking < ApplicationRecord
  # Associations
  belongs_to :user
  belongs_to :disaster
  has_many :reviews, dependent: :destroy
end
