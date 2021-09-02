class ScansController < ApplicationController
  def new
    unless current_user.bookings.empty?
      @service = current_user.bookings.last.mission.service
    end
  end

  def create
    @toxic = Toxic.find_by(scan_params)
    if @toxic
      redirect_to toxic_path(@toxic)
    else
      flash[:notice] = "Produit inconnu"
      render :new
    end
  end

  private

  def scan_params
    params.require(:scan).permit(:barcode)
  end
end
