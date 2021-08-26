class BookingsController < ApplicationController

  def index
    @bookings = Booking.where(user_id: current_user.id)
    @bookings.each do |booking|
      @books << booking if booking.progress == "Validé"
      @books_futur << booking if booking.progress == "Venir"
      @books_passé << booking if booking.progress == "Passé"
    end

    return {
      now: @books,
      futur: @books_futur,
      past: @books_passé
    }
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
      render 'missions/index'
    end
  end

  private

  def booking_params
    params.require(:booking).permit(:progress, :user_id, :mission_id)
  end
end
