class CreateFlights < ActiveRecord::Migration[7.2]
  def change
    create_table :flights do |t|
      t.belongs_to :departure_airport
      t.belongs_to :arrival_airport
      t.datetime :start
      t.decimal :duration, precision: 1

      t.timestamps
    end
  end
end
