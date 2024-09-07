class CreateBookings < ActiveRecord::Migration[7.2]
  def change
    create_table :bookings do |t|
      t.belongs_to :flight
      t.integer :number_of_tickets

      t.timestamps
    end
  end
end
