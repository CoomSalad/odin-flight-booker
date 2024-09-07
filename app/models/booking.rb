class Booking < ApplicationRecord
  validates :flight_id, presence: true
  validates :number_of_tickets, presence: true, numericality: { only_integer: true, in: 1..4 }

  belongs_to :flight

  has_many :passengers, dependent: :destroy

  accepts_nested_attributes_for :passengers
end
