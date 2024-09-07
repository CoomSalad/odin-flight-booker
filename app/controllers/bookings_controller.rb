class BookingsController < ApplicationController
  def show
    @booking = Booking.find(params[:id])
  end

  def new
    @booking = Booking.new
    @flight = Flight.find(params[:flight_id].to_i)
    @passengers = Array.new(params[:number_of_tickets].to_i, Passenger.new)
  end

  def create
    @booking = Booking.new(flight_id: booking_params[:flight_id].to_i, number_of_tickets: booking_params[:number_of_tickets].to_i)
    if @booking.save
      @passengers = Array.new(booking_params[:number_of_tickets].to_i, nil)
      i = 0
      @passengers.each do |passenger|
        @passengers[i] = @booking.passengers.build
        @passengers[i].name = booking_params[:passenger]["#{i}".to_sym][:name]
        @passengers[i].email = booking_params[:passenger]["#{i}".to_sym][:email]
        i += 1
      end
      if @passengers.all? { |p| p.valid? }
        @passengers.each do |p|
          p.save
        end
        redirect_to @booking
      else
        render :new, status: :unprocessable_entity
      end
    else
      render :new, status: :unprocessable_entity
    end
  end

  private
  def booking_params
    params.require(:booking).permit(:flight_id, :number_of_tickets, passenger: [ :name, :email ])
  end
end
