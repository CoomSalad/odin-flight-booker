class Flight < ApplicationRecord
  validates :departure_airport, presence: true
  validates :arrival_airport, presence: true
  validates :start, presence: true
  validates :duration, presence: true, numericality: { in: 0..40 }

  belongs_to :departure_airport, class_name: "Airport"
  belongs_to :arrival_airport, class_name: "Airport"

  has_many :bookings, dependent: :destroy
  has_many :passengers, through: :bookings
end
