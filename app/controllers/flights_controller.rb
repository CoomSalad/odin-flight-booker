class FlightsController < ApplicationController
  def index
    @airport_options = Airport.all.map { |a| [ a.code, a.id ] }
    @start_date_options = Flight.select(:start).distinct.order("start").map { |g| [ g.start.to_date.strftime("%a %d %b %Y"), g.start.to_date ] }.uniq

    if submitted_query?
      # validate_ticket_number
      @matching_flights = Flight.where(departure_airport: params[:departure_code], arrival_airport: params[:arrival_code], start: Date.parse(params[:date])..Date.parse(params[:date])+1).order("start")
    else
      @matching_flights = nil
    end
  end

  private
  def submitted_query?
    params.has_key?(:departure_code) && params.has_key?(:arrival_code) && params.has_key?(:passengers_number) && params.has_key?(:date)
  end

  def validate_ticket_number
    # does not work
    params[:passengers_number] = params[:passengers_number].clamp(1, 4)
  end
end
