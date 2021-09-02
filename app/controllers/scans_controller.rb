class ScansController < ApplicationController
  def new
  end

  def create
    @toxic = Toxic.find_by(scan_params)
    if @toxic
      redirect_to toxic_path(@toxic)
    else
      flash[:notice] = "No match found"
      render :new
    end
  end

  private

  def scan_params
    params.require(:scan).permit(:barcode)
  end
end
