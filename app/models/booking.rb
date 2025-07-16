class Booking < ApplicationRecord
  belongs_to :user
  belongs_to :disaster
  has_many :reviews
end
