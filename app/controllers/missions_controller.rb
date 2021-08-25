class MissionsController < ApplicationController

  def index
    @mission = Mission.where(service_id: service.id)
    @booking = Booking.new
  end

end
