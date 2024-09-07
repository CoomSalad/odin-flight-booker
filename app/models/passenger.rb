class Passenger < ApplicationRecord
  validates :name, presence: true, length: { in: 1..30 }
  validates :email, format: { with: /\A[\w._%+-]+@[\w.-]+\.[a-zA-Z]{2,4}\z/,
  message: "please input valid email" }
  validates :booking_id, presence: true

  belongs_to :booking
end
