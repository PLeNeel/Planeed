class BookingsController < ApplicationController

  def index
    if current_user.admin == false
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
    else
      @bookings = Booking.where(progress: "En attente")
    end
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

  def edit
    @booking = Booking.find(params[:id])
  end

  def update
    @booking = Booking.find(params[:id])
    @booking.update(booking_params)
    redirect_to booking_path(@booking)
  end

  def destroy
    @booking = Booking.find(params[:id])
    @booking.destroy
    redirect_to bookings_path
  end

  private

  def booking_params
    params.require(:booking).permit(:booking_id, :progress, :user_id)
  end
end
