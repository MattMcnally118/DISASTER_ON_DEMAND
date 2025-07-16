class Disaster < ApplicationRecord
  # Geocoding getting the coordinates from the location
  geocoded_by :location
  after_validation :geocode, if: :will_save_change_to_location?
  # Associations
  belongs_to :user
  has_many :bookings, dependent: :destroy
  has_many :reviews, through: :bookings, dependent: :destroy
end
