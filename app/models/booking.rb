class Booking < ApplicationRecord
  # Associations
  belongs_to :user
  belongs_to :disaster
  has_many :reviews, dependent: :destroy
  before_save :set_total_price

  private

  def set_total_price
    if start_date && end_date && disaster
      duration = (end_date - start_date).to_i
      self.total_price = duration * disaster.price
    end
  end
end
