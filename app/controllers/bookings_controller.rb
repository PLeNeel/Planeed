class BookingsController < ApplicationController

 def index
    @bookings = Booking.where(user_id: current_user.id) 
  end
  
  def new
    @booking = Booking.new
  end

  def create
    @booking = Booking.new(booking_params)
    @user = User.find(:user_id)
    @mission = Mission.find(:mission_id)
    @booking.user = @user
    @booking.mission = @mission
    if @booking.save
      redirect_to availabilities_path
    else
      render new
    end
  end
end
