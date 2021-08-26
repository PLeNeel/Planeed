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
    @booking = Booking.new(progress: false)
    @booking.user = current_user
    @booking.mission = Mission.find(params[:mission_id])
    if @booking.save
      redirect_to bookings_path
    else
      redirect :back
    end
  end

  private

  # def mission_params
  #   params.require(:mission).permit(:mission_id)
  # end
end
